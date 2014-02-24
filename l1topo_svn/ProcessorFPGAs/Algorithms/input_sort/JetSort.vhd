library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity JetSort is
 generic (output_width        : integer:=  8; --width of the sort output 
          input_chan_width    : integer:= 16; --number of input channels for each module of the 1st sorting stage
          input_tobs          : integer:= 48; --number of input Jet TOBs to be sorted 
          jet_size            : integer:= 1   -- which jet size to choose (1 or 2)
         );
    Port (clk40            : in std_logic;
          InputArr         : in  JetArray (input_tobs-1 downto 0);
          OutputArr        : out TOBArray (output_width-1 downto 0) 
         );
end JetSort;

architecture Behavioral of JetSort is
--attribute dont_touch : string;
--attribute S : string;

component tob_sort is
 generic (output_width: integer;        -- width of the sort output
          input_width: integer;         -- input width of the sort block
          do_presort : integer);        -- 1 for the first stage, 0 for the second.
    port (InputArr : in  TOBArray (input_width-1 downto 0);
          OutputArr : out TOBArray (output_width-1 downto 0)
         );
end component tob_sort;

component TOB_register 
generic(num_TOBs : integer:=16
       );
   Port(clk    : in  std_logic;
        enable : in  std_logic;
        reg_in : in  TOBArray(num_TOBs-1 downto 0);
        reg_out: out TOBArray(num_TOBs-1 downto 0)
       );
end component;

signal generic_in       : TOBArray(input_tobs-1 downto 0);
signal out_1stStage     : TOBArray((input_tobs/input_chan_width)*output_width-1 downto 0);
signal reg_out_1stStage : TOBArray((input_tobs/input_chan_width)*output_width-1 downto 0);
signal out_2ndStage     : TOBArray(output_width-1 downto 0);

constant one : std_logic := '1';

--attribute dont_touch of out_1stStage : signal is "true"; 
--attribute S of out_1stStage: signal is "true";

begin

-- Select jet size 1 or 2 to be used in the sort
  
sel_jet_size: for i in 0 to input_tobs-1 generate
    generic_in(i).eta <= InputArr(i).eta & '0';
    generic_in(i).phi <= InputArr(i).phi & '0';   
    size1: if jet_size = 1 generate
        generic_in(i).Et <= '0' & InputArr(i).Et1;
    end generate;
    size2: if jet_size /= 1 generate
        generic_in(i).Et <= InputArr(i).Et2;
    end generate;
end generate;

-- Sort the input TOBs in groups of input_chan_width
              
gen1stStage: for i in 0 to input_tobs/input_chan_width-1 generate
  sort1stStage:	tob_sort
   generic map (output_width  => output_width,
  		        input_width   => input_chan_width,
  		        do_presort => 1
      		   )
      port map (
      			InputArr     => generic_in((i+1)*input_chan_width-1 downto i*input_chan_width),
                OutputArr    => out_1stStage((i+1)*output_width-1 downto i*output_width)
               );
      
end generate;

-- Hold the output of the first stage in registers
             
reg_1st_stage:TOB_register 
generic map(num_TOBs=>(input_tobs/input_chan_width)*output_width
           )
   Port map(clk     => clk40,
            enable  => one,
            reg_in  => out_1stStage,
            reg_out => reg_out_1stStage
           );

-- Sort the first-stage outputs

sort2ndStage: tob_sort
 generic map (output_width  => output_width,
		      input_width   => (input_tobs/input_chan_width)*output_width,
		      do_presort => 0
              )
    port map (InputArr     => reg_out_1stStage,
              OutputArr    => out_2ndStage
             );


OutputArr <= out_2ndStage;

             
end Behavioral;
