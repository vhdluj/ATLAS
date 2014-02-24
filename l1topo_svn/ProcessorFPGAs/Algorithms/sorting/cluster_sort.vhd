library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use work.L1TopoDataTypes.all;

entity cluster_sort is
 generic (leadingnr  : integer:=  2; --number of leading TOBs
		  inchn      : integer:=120; --total length of 1 JetTOB
		  do_presort : integer:=  1  --if do_presort is 1 every input channel will be compared to each other, if it is 0 the inputs from another sorting module will be 
		  );                         --assumed as being sorted
    Port (ClusterTOBarr : in  ClusterArray (inchn-1     downto 0);
          leadingTOBarr : out ClusterArray (leadingnr-1 downto 0)
		 );
end cluster_sort;

architecture Behavioral of cluster_sort is

constant fullscale : std_logic_vector(inchn-2 downto 0):=(others=>'1'); 

type resarr is array (integer range <>) of std_logic_vector (inchn-2 downto 0); --comparison matrix

type maxarr     is array (integer range <>) of ClusterArray     (2*inchn-2 downto 0); --array of possible outputs for each of the leading TOBs
type leadingarr is array (integer range <>) of resarr           (inchn-1   downto 0); --array of comparison matrixes to find the leading TOBs 
type maxiarr    is array (integer range <>) of std_logic_vector (inchn-1   downto 0); --array of information if a line in the comparison matrix is completely filled
                                                                                      --with 1's for each leading TOB
signal leading : leadingarr (leadingnr-1 downto 0);
signal maxa    : maxarr     (leadingnr-1 downto 0);
signal maxi    : maxiarr    (leadingnr-2 downto 0);

signal dummyTOB : ClusterTOB; 

begin

dummyTOB.Et<="00000000";
dummyTOB.eta<="000000";
dummyTOB.phi<="000000";

gen1: for i in 0 to inchn-1 generate --generate a comparison matrix
 gen2: for j in 0 to inchn-1 generate
  gen3: if j<i generate -- generate 1st half
	gen3a: if (i mod leadingnr > j mod leadingnr) and (i-j < leadingnr) and (do_presort=0) generate --presorted inputs don't have to be compared again  
	 leading(0)(i)(j)<='1';
	end generate;
    gen3b: if not((i mod leadingnr > j mod leadingnr) and (i-j < leadingnr) and (do_presort=0)) generate --compare every TOB which isn't presorted 
     leading(0)(i)(j)<='1' when ClusterTOBarr(i).Et >= ClusterTOBarr(j).Et else '0';
	end generate;
	gen4: for k in 1 to leadingnr-1 generate
	 leading(k)(i)(j)<=leading(k-1)(i)(j) xor maxi(k-1)(i) xor maxi(k-1)(j); --generate additional comparison matrixes for additional leading TOBs
	end generate;
  end generate;
  gen5: if j>i generate --derive 2nd half from 1st
   gen6: for k in 0 to leadingnr-1 generate
	 leading(k)(i)(j-1)<=not leading(k)(j)(i);	
	end generate;
  end generate;
 end generate;
 
 genmaxi: for k in 0 to leadingnr-2 generate
  maxi(k)(i)<='1' when leading(k)(i)=fullscale else '0';   
  maxa(k)(i)<=ClusterTOBarr(i) when leading(k)(i)=fullscale else (dummyTOB); -- assign the k largest TOB to the according temporary output
 end generate;

 maxa(leadingnr-1)(i)<=ClusterTOBarr(i) when leading(leadingnr-1)(i)=fullscale else (dummyTOB); -- assign the largest TOB to the according temporary output
 
end generate;

genTmpOut: for k in 0 to leadingnr-1 generate
 genx: for i in 0 to inchn-2 generate
  maxa(k)(inchn+i).Et <=maxa(k)(2*i).Et  or maxa(k)(2*i+1).Et; -- connect every possible temporary output for the k largest TOB with an OR-tree
  maxa(k)(inchn+i).eta<=maxa(k)(2*i).eta or maxa(k)(2*i+1).eta;
  maxa(k)(inchn+i).phi<=maxa(k)(2*i).phi or maxa(k)(2*i+1).phi;
 end generate;
end generate;


genOut: for i in 0 to leadingnr-1 generate
 leadingTOBarr(i)<= maxa((leadingnr-1)-i)(2*inchn-2) ; -- assign the temporary outputs to the module outputs
end generate;
			  
end Behavioral;