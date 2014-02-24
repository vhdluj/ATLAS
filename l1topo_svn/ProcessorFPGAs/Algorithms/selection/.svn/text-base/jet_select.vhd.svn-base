library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity jet_select is
generic(selectnum : integer:=  3; --number of selected TOBs
	    inchn     : integer:= 10; --number of input channels
	    do_presel : integer:=  1  --preselection
	   );                         
   Port(threshold   : in  std_logic_vector(      9 downto 0);
        pre_cmp_res : in  std_logic_vector(inchn-1 downto 0); --threshold flags of the previous stage
        JetTOBarr   : in  JetArray (inchn-1     downto 0); --input TOBs
        selTOBarr   : out JetArray (selectnum-1 downto 0); --selected TOBs
        end_cmp_res : out std_logic_vector(selectnum-1 downto 0) --threshold flags for the next stage
	 );
end jet_select;

architecture Behavioral of jet_select is

constant fullscale : std_logic_vector(inchn-1 downto 0):=(others=>'1'); 

type resarr is array (integer range <>) of std_logic_vector (inchn-1 downto 0); --comparison matrix

type maxarr    is array (integer range <>) of JetArray         (2*inchn-2 downto 0); --array of possible outputs for each of the selected TOBs
type selectarr is array (integer range <>) of resarr           (inchn-1   downto 0); --array of selection matrixes to select the TOBs 
type maxiarr   is array (integer range <>) of std_logic_vector (inchn-1   downto 0); --array of information if a line in the selection matrix is completely filled
                                                                                     --with 1's for each select TOB
type cmparr    is array (integer range <>) of std_logic_vector (2*inchn-2 downto 0); --threshold flags
                                                                                      
signal selection       : selectarr (selectnum-1 downto 0);
signal maxa            : maxarr    (selectnum-1 downto 0);
signal maxi            : maxiarr   (selectnum-2 downto 0);
signal end_cmp_res_tmp : cmparr    (selectnum-1 downto 0);

signal dummyTOB : JetTOB; 

signal cmp_res         : std_logic_vector(inchn-1 downto 0);

begin

dummyTOB.Et1<="000000000";
dummyTOB.Et2<="0000000000";
dummyTOB.eta<="00000";
dummyTOB.phi<="00000";

gen_cmp_res1: for i in 0 to inchn-1 generate --flag every TOB greater than the threshold
 gen_cmp_res2a: if do_presel = 1 generate
  cmp_res(i) <= '1' when JetTOBarr(i).Et2>threshold else '0';
 end generate;
end generate;

gen1: for i in 0 to inchn-1 generate --generate a selection matrix
 gen2: for j in 0 to inchn-1 generate
  gen3: if i>j generate -- generate 1st half
	gen3a: if (do_presel=0) generate --fill the selection matrix in regard of the flags of the previous stage
	 selection(0)(i)(j)<='1' when pre_cmp_res(i)>pre_cmp_res(j) else '0';
	end generate;
    gen3b: if (do_presel=1) generate --fill the selection matrix in regard of the flags
     selection(0)(i)(j)<='1' when cmp_res(i) > cmp_res(j) else '0';
	end generate;
    gen4: for k in 1 to selectnum-1 generate
	 selection(k)(i)(j)<=selection(k-1)(i)(j) xor maxi(k-1)(i) xor maxi(k-1)(j); --generate additional selection matrixes for additional selected TOBs
	end generate;
  end generate;
  
  gen7: if i=j generate -- fill the diagonal of the selection matrix
   gen4: for k in 1 to selectnum-1 generate
    gen10a:if i=0 and j=0 and k=1 generate
     selection(1)(i)(j)<='0';
    end generate;
    gen10b:if (i>0 and j>0) or k>1 generate
  	 selection(k)(i)(j)<=selection(k-1)(i)(j) xor maxi(k-1)(i) xor maxi(k-1)(j); --generate additional selection matrixes for additional selected TOBs
    end generate;
   end generate;
    gen9a: if (do_presel=0) generate --fill the selection matrix in regard of the flags of the previous stage 
     selection(0)(i)(j) <= '1' when pre_cmp_res(i) = '1' else '0';
    end generate;
    gen9b: if (do_presel=1) generate --fill the selection matrix in regard of the flags 
     selection(0)(i)(j) <= '1' when cmp_res(i) = '1' else '0';
    end generate;
  end generate;
  
  gen5: if j>i generate --fill 2nd half with 1s
   gen6: for k in 0 to selectnum-1 generate
	selection(k)(i)(j)<='1';	
   end generate;
  end generate;
 end generate;
 
 genmaxi: for k in 0 to selectnum-2 generate
  maxi(k)(i)<='1' when selection(k)(i)=fullscale else '0';   
  maxa(k)(i)<=JetTOBarr(i) when selection(k)(i)=fullscale else (dummyTOB); -- assign the the first k TOBs to the according temporary output
  genmaxi2a: if do_presel=1 generate
   end_cmp_res_tmp(k)(i)<=cmp_res(i) when selection(k)(i)=fullscale else '0';
  end generate;
  genmaxi2b: if do_presel=0 generate
   end_cmp_res_tmp(k)(i)<=pre_cmp_res(i) when selection(k)(i)=fullscale else '0';
  end generate;
 end generate;

 maxa(selectnum-1)(i)<=JetTOBarr(i) when selection(selectnum-1)(i)=fullscale else (dummyTOB); -- assign the last selected TOB to the according temporary output
 
 genmaxi3a: if do_presel=1 generate
  end_cmp_res_tmp(selectnum-1)(i)<=cmp_res(i) when selection(selectnum-1)(i)=fullscale else '0'; -- assign the threshold flags to the temporary output for the next stage
 end generate;
 genmaxi3b: if do_presel=0 generate
  end_cmp_res_tmp(selectnum-1)(i)<=pre_cmp_res(i) when selection(selectnum-1)(i)=fullscale else '0'; --assign the previous threshold flags to the temporary output for the next stage
 end generate;

end generate;

genTmpOut: for k in 0 to selectnum-1 generate  -- connect every possible temporary output for the k selected TOBs with an OR-tree
 genx: for i in 0 to inchn-2 generate
  maxa(k)(inchn+i).Et1<=maxa(k)(2*i).Et1 or maxa(k)(2*i+1).Et1;
  maxa(k)(inchn+i).Et2<=maxa(k)(2*i).Et2 or maxa(k)(2*i+1).Et2; 
  maxa(k)(inchn+i).eta<=maxa(k)(2*i).eta or maxa(k)(2*i+1).eta;
  maxa(k)(inchn+i).phi<=maxa(k)(2*i).phi or maxa(k)(2*i+1).phi;
  end_cmp_res_tmp(k)(inchn+i)<=end_cmp_res_tmp(k)(2*i) or end_cmp_res_tmp(k)(2*i+1);
 end generate;
end generate;

genOut0: if do_presel = 0 generate -- assign the temporary outputs to the module outputs
  genOut: for i in 0 to selectnum-1 generate
   selTOBarr(i)<= maxa((selectnum-1)-i)(2*inchn-2); 
   end_cmp_res(i)<= pre_cmp_res((selectnum-1)-i);
  end generate;
end generate;

genOut1: if do_presel = 1 generate -- assign the temporary outputs to the module outputs
 genOut: for i in 0 to selectnum-1 generate
  selTOBarr(i)<= maxa((selectnum-1)-i)(2*inchn-2); 
  end_cmp_res(i)<= end_cmp_res_tmp((selectnum-1)-i)(2*inchn-2);
 end generate;
end generate;

end Behavioral;