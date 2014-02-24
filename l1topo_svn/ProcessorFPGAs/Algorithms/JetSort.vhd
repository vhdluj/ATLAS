library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity JetSort is
 generic (InputWidth         : integer:= 64; --number of input Jet TOBs to be sorted 
		  InputWidth1stStage : integer:= 16; --number of input channels for each module of the 1st sorting stage
		  OutputWidth        : integer:= 10; --width of the sort output 
          jet_size           : integer:=  2  -- which jet size to choose (1 or 2)
         );
    Port (ClockBus           : in  std_logic_vector(2 downto 0);
          JetTobArray        : in  JetArray(InputWidth-1 downto 0);
          TobArrayOut        : out TOBArray(OutputWidth-1 downto 0) 
         );
end JetSort;

architecture Behavioral of JetSort is
--attribute dont_touch : string;
--attribute S : string;

component TobSort is
 generic (InputWidth  : integer; -- input width of the sort block
          OutputWidth : integer; -- width of the sort output
          DoPresort   : integer  -- 1 for the first stage, 0 for the second.
		 );        
    port (Tobs        : in  TOBArray (InputWidth-1 downto 0);
          TobArrayOut : out TOBArray (OutputWidth-1 downto 0)
         );
end component TobSort;

component TobRegister 
generic(InputWidth : integer:=16
       );
   Port(clk    : in  std_logic;
        enable : in  std_logic;
        reg_in : in  TOBArray(InputWidth-1 downto 0);
        reg_out: out TOBArray(InputWidth-1 downto 0)
       );
end component;

signal generic_in       : TOBArray(InputWidth-1 downto 0);
signal out_1stStage     : TOBArray((InputWidth/InputWidth1stStage)*OutputWidth-1 downto 0);
signal reg_out_1stStage : TOBArray((InputWidth/InputWidth1stStage)*OutputWidth-1 downto 0);
signal out_2ndStage     : TOBArray(OutputWidth-1 downto 0);

constant one : std_logic := '1';

--attribute dont_touch of out_1stStage : signal is "true"; 
--attribute S of out_1stStage: signal is "true";

begin

-- Select jet size 1 or 2 to be used in the sort
  
sel_jet_size: for i in 0 to InputWidth-1 generate
    generic_in(i).eta <= JetTobArray(i).eta & '0';
    generic_in(i).phi <= JetTobArray(i).phi & '0';   
    size1: if jet_size = 1 generate
        generic_in(i).Et <= '0' & JetTobArray(i).Et1;
    end generate;
    size2: if jet_size /= 1 generate
        generic_in(i).Et <= JetTobArray(i).Et2;
    end generate;
end generate;

-- Sort the input TOBs in groups of InputWidth1stStage
              
gen1stStage: for i in 0 to InputWidth/InputWidth1stStage-1 generate
  sort1stStage:	TobSort
   generic map (OutputWidth => OutputWidth,
  		        InputWidth  => InputWidth1stStage,
  		        DoPresort   => 1
      		   )
      port map (
      			Tobs        => generic_in((i+1)*InputWidth1stStage-1 downto i*InputWidth1stStage),
                TobArrayOut => out_1stStage((i+1)*OutputWidth-1 downto i*OutputWidth)
               );
      
end generate;

-- Hold the output of the first stage in registers
             
reg_1st_stage:TobRegister 
generic map(InputWidth => (InputWidth/InputWidth1stStage)*OutputWidth
           )
   Port map(clk        => ClockBus(0),
            enable     => one,
            reg_in     => out_1stStage,
            reg_out    => reg_out_1stStage
           );

-- Sort the first-stage outputs

sort2ndStage: TobSort
 generic map (OutputWidth => OutputWidth,
		      InputWidth => (InputWidth/InputWidth1stStage)*OutputWidth,
		      DoPresort   => 0
              )
    port map (Tobs        => reg_out_1stStage,
              TobArrayOut => out_2ndStage
             );


TobArrayOut <= out_2ndStage;

             
end Behavioral;