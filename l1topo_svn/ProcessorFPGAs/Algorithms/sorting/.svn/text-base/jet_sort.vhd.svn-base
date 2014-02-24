library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity jet_sort is
 generic (leadingnr  : integer:=  2; --number of leading TOBs
		  inchn      : integer:=120; --total length of 1 JetTOB
		  do_presort : integer:=  1 --if do_presort is 1 every input channel will be compared to each other, if it is 0 the inputs from another sorting module will be 
		 );                         --assumed as being sorted
    Port (JetTOBarr    : in  JetArray (inchn-1     downto 0);
          leadingTOBarr : out JetArray (leadingnr-1 downto 0)
		 );
end jet_sort;

architecture Behavioral of jet_sort is

constant fullscale : std_logic_vector(inchn-2 downto 0):=(others=>'1'); 

type resarr is array (integer range <>) of std_logic_vector (inchn-2 downto 0); --comparison matrix

type maxarr     is array (integer range <>) of JetArray     (2*inchn-2 downto 0); --array of possible outputs for each of the leading TOBs
type leadingarr is array (integer range <>) of resarr           (inchn-1   downto 0); --array of comparison matrixes to find the leading TOBs 
type maxiarr    is array (integer range <>) of std_logic_vector (inchn-1   downto 0); --array of information if a line in the comparison matrix is completely filled

signal leading : leadingarr (leadingnr-1 downto 0);
signal maxa    : maxarr     (leadingnr-1 downto 0);
signal maxi    : maxiarr    (leadingnr-2 downto 0);

signal dummyTOB : JetTOB; 

begin

dummyTOB.Et1<="000000000";
dummyTOB.Et2<="0000000000";
dummyTOB.eta<="00000";
dummyTOB.phi<="00000";

gen1: for i in 0 to inchn-1 generate --generate a comparison matrix

 gen2: for j in 0 to inchn-1 generate
  gen3: if j<i generate -- generate 1st half
	gen3a: if (i mod leadingnr > j mod leadingnr) and (i-j < leadingnr) and (do_presort=0) generate --presorted inputs don't have to be compared again  
	 leading(0)(i)(j)<='1';
	end generate;
    gen3b: if not((i mod leadingnr > j mod leadingnr) and (i-j < leadingnr) and (do_presort=0)) generate --compare every TOB which isn't presorted 
     leading(0)(i)(j)<='1' when JetTOBarr(i).Et2 >= JetTOBarr(j).Et2 else '0';
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
  maxa(k)(i)<=JetTOBarr(i) when leading(k)(i)=fullscale else (dummyTOB); -- assign the k largest TOB to the according temporary output
 end generate;

 maxa(leadingnr-1)(i)<=JetTOBarr(i) when leading(leadingnr-1)(i)=fullscale else (dummyTOB); -- assign the largest TOB to the according temporary output
 
end generate;

genTmpOut: for k in 0 to leadingnr-1 generate
 genx: for i in 0 to inchn-2 generate
  maxa(k)(inchn+i).Et1<=maxa(k)(2*i).Et1 or maxa(k)(2*i+1).Et1; -- connect every possible temporary output for the k largest TOB with an OR-tree
  maxa(k)(inchn+i).Et2<=maxa(k)(2*i).Et2 or maxa(k)(2*i+1).Et2;
  maxa(k)(inchn+i).eta<=maxa(k)(2*i).eta or maxa(k)(2*i+1).eta;
  maxa(k)(inchn+i).phi<=maxa(k)(2*i).phi or maxa(k)(2*i+1).phi;
 end generate;
end generate;


genOut: for i in 0 to leadingnr-1 generate
 leadingTOBarr(i)<= maxa((leadingnr-1)-i)(2*inchn-2) ; -- assign the temporary outputs to the module outputs
end generate;
			  
end Behavioral;