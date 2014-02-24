library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity tob_sort is
 generic (output_width  : integer:=  8; --number of leading output TOBs
          input_width: integer:=120; --total length of 1 JetTOB
          do_presort : integer:=  1 --if 1 every input channel will be compared to each other,
                                    --if 0 inputs from another sorting module will be 
		 );                         -- assumed as being sorted
    Port (InputArr  : in  TOBArray (input_width-1 downto 0);
          OutputArr : out TOBArray (output_width-1 downto 0)
		 );
end tob_sort;

architecture Behavioral of tob_sort is

constant fullscale : std_logic_vector(input_width-2 downto 0):=(others=>'1'); 

type resarr is array (integer range <>) of std_logic_vector (input_width-2 downto 0); --comparison matrix
type maxarr     is array (integer range <>) of TOBArray (2*input_width-2 downto 0); --array of possible outputs for each of the leading TOBs
type leadingarr is array (integer range <>) of resarr (input_width-1 downto 0); --array of comparison matrixes to find the leading TOBs 
type maxiarr    is array (integer range <>) of std_logic_vector (input_width-1 downto 0); --array of information if a line in the comparison matrix is completely filled

signal leading : leadingarr (output_width-1 downto 0);
signal maxa    : maxarr     (output_width-1 downto 0);
signal maxi    : maxiarr    (output_width-2 downto 0);

signal dummyTOB : GenericTOB; 

begin

dummyTOB.Et<=(others => '0');
dummyTOB.eta<="000000";
dummyTOB.phi<="000000";

gen1: for i in 0 to input_width-1 generate --generate a comparison matrix

 gen2: for j in 0 to input_width-1 generate
  gen3: if j<i generate -- generate 1st half
	gen3a: if (i mod output_width > j mod output_width) and (i-j < output_width) and (do_presort=0) generate --presorted inputs don't have to be compared again  
	 leading(0)(i)(j)<='1';
	end generate;
    gen3b: if not((i mod output_width > j mod output_width) and (i-j < output_width) and (do_presort=0)) generate --compare every TOB which isn't presorted 
     leading(0)(i)(j)<='1' when InputArr(i).Et >= InputArr(j).Et else '0';
	end generate;
	gen4: for k in 1 to output_width-1 generate
	 leading(k)(i)(j)<=leading(k-1)(i)(j) xor maxi(k-1)(i) xor maxi(k-1)(j); --generate additional comparison matrixes for additional leading TOBs
	end generate;
  end generate;
  gen5: if j>i generate --derive 2nd half from 1st
   gen6: for k in 0 to output_width-1 generate
	 leading(k)(i)(j-1)<=not leading(k)(j)(i);	
	end generate;
  end generate;
 end generate;
 
 genmaxi: for k in 0 to output_width-2 generate
  maxi(k)(i)<='1' when leading(k)(i)=fullscale else '0';   
  maxa(k)(i)<=InputArr(i) when leading(k)(i)=fullscale else (dummyTOB); -- assign the k largest TOB to the according temporary output
 end generate;

 maxa(output_width-1)(i)<=InputArr(i) when leading(output_width-1)(i)=fullscale else (dummyTOB); -- assign the largest TOB to the according temporary output
 
end generate;

genTmpOut: for k in 0 to output_width-1 generate
 genx: for i in 0 to input_width-2 generate
  maxa(k)(input_width+i).Et<=maxa(k)(2*i).Et or maxa(k)(2*i+1).Et; -- connect every possible temporary output for the k largest TOB with an OR-tree
  maxa(k)(input_width+i).eta<=maxa(k)(2*i).eta or maxa(k)(2*i+1).eta;
  maxa(k)(input_width+i).phi<=maxa(k)(2*i).phi or maxa(k)(2*i+1).phi;
 end generate;
end generate;


genOut: for i in 0 to output_width-1 generate
 OutputArr(i)<= maxa((output_width-1)-i)(2*input_width-2) ; -- assign the temporary outputs to the module outputs
end generate;
			  
end Behavioral;
