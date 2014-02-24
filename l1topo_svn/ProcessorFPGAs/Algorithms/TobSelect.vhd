library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity TobSelect is
generic(InputWidth  : integer:= 5; --number of input channels
        OutputWidth : integer:= 2  --number of selected TOBs
	   );                         
   Port(threshold   : in  std_logic_vector(9 downto 0);
        Tobs        : in  TOBArray (InputWidth-1 downto 0); --input TOBs
        selTobs     : out TOBArray (OutputWidth-1 downto 0); --selected TOBs
        end_cmp_res : out std_logic_vector(OutputWidth-1 downto 0) --threshold flags for the next stage
	 );
end TobSelect;

architecture Behavioral of TobSelect is

constant fullscale : std_logic_vector(InputWidth-1 downto 0):=(others=>'1'); 

type resarr is array (integer range <>) of std_logic_vector (InputWidth-1 downto 0); --comparison matrix

type maxarr    is array (integer range <>) of TOBArray         (2*InputWidth-2 downto 0); --array of possible outputs for each of the selected TOBs
type selectarr is array (integer range <>) of resarr           (InputWidth-1   downto 0); --array of selection matrixes to select the TOBs 
type maxiarr   is array (integer range <>) of std_logic_vector (InputWidth-1   downto 0); --array of information if a line in the selection matrix is completely filled
                                                                                     --with 1's for each select TOB
type cmparr    is array (integer range <>) of std_logic_vector (2*InputWidth-2 downto 0); --threshold flags
                                                                                      
signal selection       : selectarr (OutputWidth-1 downto 0);
signal maxa            : maxarr    (OutputWidth-1 downto 0);
signal maxi            : maxiarr   (OutputWidth-2 downto 0);
signal end_cmp_res_tmp : cmparr    (OutputWidth-1 downto 0);

signal dummyTOB : GenericTOB; 

signal cmp_res : std_logic_vector(InputWidth-1 downto 0);

begin

dummyTOB.Et <=(others =>'0');
dummyTOB.eta<=(others =>'0');
dummyTOB.phi<=(others =>'0');

gen_cmp_res1: for i in 0 to InputWidth-1 generate --flag every TOB greater than the threshold
  cmp_res(i) <= '1' when Tobs(i).Et>threshold else '0';
end generate;

gen1: for i in 0 to InputWidth-1 generate --generate a selection matrix
 gen2: for j in 0 to InputWidth-1 generate
  gen3: if i>j generate -- generate 1st half
    selection(0)(i)(j)<='1' when cmp_res(i) > cmp_res(j) else '0';
	gen4: for k in 1 to OutputWidth-1 generate
	 selection(k)(i)(j)<=selection(k-1)(i)(j) xor maxi(k-1)(i) xor maxi(k-1)(j); --generate additional selection matrixes for additional selected TOBs
	end generate;
  end generate;
  
  gen7: if i=j generate -- fill the diagonal of the selection matrix
   gen4: for k in 1 to OutputWidth-1 generate
    gen10a:if i=0 and j=0 and k=1 generate
     selection(1)(i)(j)<='0';
    end generate;
    gen10b:if (i>0 and j>0) or k>1 generate
  	 selection(k)(i)(j)<=selection(k-1)(i)(j) xor maxi(k-1)(i) xor maxi(k-1)(j); --generate additional selection matrixes for additional selected TOBs
    end generate;
   end generate;
   selection(0)(i)(j) <= '1' when cmp_res(i) = '1' else '0';
  end generate;
  
  gen5: if j>i generate --fill 2nd half with 1s
   gen6: for k in 0 to OutputWidth-1 generate
	selection(k)(i)(j)<='1';	
   end generate;
  end generate;
 end generate;
 
 genmaxi: for k in 0 to OutputWidth-2 generate
  maxi(k)(i)<='1' when selection(k)(i)=fullscale else '0';   
  maxa(k)(i)<=Tobs(i) when selection(k)(i)=fullscale else (dummyTOB); -- assign the the first k TOBs to the according temporary output
  end_cmp_res_tmp(k)(i)<=cmp_res(i) when selection(k)(i)=fullscale else '0';
 end generate;

 maxa(OutputWidth-1)(i)<=Tobs(i) when selection(OutputWidth-1)(i)=fullscale else (dummyTOB); -- assign the last selected TOB to the according temporary output

 end_cmp_res_tmp(OutputWidth-1)(i)<=cmp_res(i) when selection(OutputWidth-1)(i)=fullscale else '0'; -- assign the threshold flags to the temporary output for the next stage

end generate;

genTmpOut: for k in 0 to OutputWidth-1 generate  -- connect every possible temporary output for the k selected TOBs with an OR-tree
 genx: for i in 0 to InputWidth-2 generate
  maxa(k)(InputWidth+i).Et<=maxa(k)(2*i).Et or maxa(k)(2*i+1).Et;
  maxa(k)(InputWidth+i).eta<=maxa(k)(2*i).eta or maxa(k)(2*i+1).eta;
  maxa(k)(InputWidth+i).phi<=maxa(k)(2*i).phi or maxa(k)(2*i+1).phi;
  end_cmp_res_tmp(k)(InputWidth+i)<=end_cmp_res_tmp(k)(2*i) or end_cmp_res_tmp(k)(2*i+1);
 end generate;
end generate;

genOut: for i in 0 to OutputWidth-1 generate
 selTobs(i)<= maxa((OutputWidth-1)-i)(2*InputWidth-2); 
 end_cmp_res(i)<= end_cmp_res_tmp((OutputWidth-1)-i)(2*InputWidth-2);
end generate;


end Behavioral;