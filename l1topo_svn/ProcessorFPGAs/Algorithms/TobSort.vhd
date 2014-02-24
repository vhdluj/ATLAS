library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity TobSort is
 generic (InputWidth  : integer:=120; --total length of 1 JetTOB
		  OutputWidth : integer:=  8; --number of leading output TOBs
          DoPresort   : integer:=  1 --if 1 every input channel will be compared to each other,
                                    --if 0 inputs from another sorting module will be 
		 );                         -- assumed as being sorted
    Port (Tobs        : in  TOBArray(InputWidth-1 downto 0);
          TobArrayOut : out TOBArray(OutputWidth-1 downto 0)
		 );
end TobSort;

architecture Behavioral of TobSort is

constant fullscale : std_logic_vector(InputWidth-2 downto 0):=(others=>'1'); 

type resarr     is array (integer range <>) of std_logic_vector (InputWidth-2 downto 0); --comparison matrix
type maxarr     is array (integer range <>) of TOBArray (2*InputWidth-2 downto 0); --array of possible outputs for each of the leading TOBs
type leadingarr is array (integer range <>) of resarr (InputWidth-1 downto 0); --array of comparison matrixes to find the leading TOBs 
type maxiarr    is array (integer range <>) of std_logic_vector (InputWidth-1 downto 0); --array of information if a line in the comparison matrix is completely filled

signal leading : leadingarr (OutputWidth-1 downto 0);
signal maxa    : maxarr     (OutputWidth-1 downto 0);
signal maxi    : maxiarr    (OutputWidth-2 downto 0);

signal dummyTOB : GenericTOB; 

begin

dummyTOB.Et <= (others => '0');
dummyTOB.eta<= (others => '0');
dummyTOB.phi<= (others => '0');

gen1: for i in 0 to InputWidth-1 generate --generate a comparison matrix

 gen2: for j in 0 to InputWidth-1 generate
  gen3: if j<i generate -- generate 1st half
	gen3a: if (i mod OutputWidth > j mod OutputWidth) and (i-j < OutputWidth) and (DoPresort=0) generate --presorted inputs don't have to be compared again  
	 leading(0)(i)(j)<='1';
	end generate;
    gen3b: if not((i mod OutputWidth > j mod OutputWidth) and (i-j < OutputWidth) and (DoPresort=0)) generate --compare every TOB which isn't presorted 
     leading(0)(i)(j)<='1' when Tobs(i).Et >= Tobs(j).Et else '0';
	end generate;
	gen4: for k in 1 to OutputWidth-1 generate
	 leading(k)(i)(j)<=leading(k-1)(i)(j) xor maxi(k-1)(i) xor maxi(k-1)(j); --generate additional comparison matrixes for additional leading TOBs
	end generate;
  end generate;
  gen5: if j>i generate --derive 2nd half from 1st
   gen6: for k in 0 to OutputWidth-1 generate
	 leading(k)(i)(j-1)<=not leading(k)(j)(i);	
	end generate;
  end generate;
 end generate;
 
 genmaxi: for k in 0 to OutputWidth-2 generate
  maxi(k)(i)<='1' when leading(k)(i)=fullscale else '0';   
  maxa(k)(i)<=Tobs(i) when leading(k)(i)=fullscale else (dummyTOB); -- assign the k largest TOB to the according temporary output
 end generate;

 maxa(OutputWidth-1)(i)<=Tobs(i) when leading(OutputWidth-1)(i)=fullscale else (dummyTOB); -- assign the largest TOB to the according temporary output
 
end generate;

genTmpOut: for k in 0 to OutputWidth-1 generate
 genx: for i in 0 to InputWidth-2 generate
  maxa(k)(InputWidth+i).Et<=maxa(k)(2*i).Et or maxa(k)(2*i+1).Et; -- connect every possible temporary output for the k largest TOB with an OR-tree
  maxa(k)(InputWidth+i).eta<=maxa(k)(2*i).eta or maxa(k)(2*i+1).eta;
  maxa(k)(InputWidth+i).phi<=maxa(k)(2*i).phi or maxa(k)(2*i+1).phi;
 end generate;
end generate;


genOut: for i in 0 to OutputWidth-1 generate
 TobArrayOut(i)<= maxa((OutputWidth-1)-i)(2*InputWidth-2) ; -- assign the temporary outputs to the module outputs
end generate;
			  
end Behavioral;