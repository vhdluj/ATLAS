library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity ClusterSort is
 generic (output_width        : integer:=  5; --width of the sort output 
          input_chan_width    : integer:= 20; --number of input channels for each module of the 1st sorting stage
          input_tobs          : integer:= 120  --number of TOBs to be sorted 
         );
    Port (clk40            : in std_logic;
          Iso_Mask         : in std_logic_vector (4 downto 0);
          InputArr         : in  ClusterArray (input_tobs-1     downto 0);
          OutputArr        : out TOBArray (output_width-1 downto 0) 
         );
end ClusterSort;

architecture Behavioral of ClusterSort is
--attribute dont_touch : string;
attribute S : string;

component tob_sort is
 generic (output_width: integer;
          input_width: integer;
          do_presort : integer);				  
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
signal empty_tob : GenericTOB;

--attribute dont_touch of out_1stStage : signal is "true"; 
attribute S of out_1stStage: signal is "true";
attribute S of reg_out_1stStage: signal is "true";

begin

empty_tob.Et <= (others => '0');
empty_tob.eta <= (others => '0');
empty_tob.phi <= (others => '0');

-- Select the TOBs to be sorted by their isolation criteria. If Iso_Mask is
-- zero, then all TOBs are used (no isolation). Otherwise the isolation bits
-- are ANDed with Iso_Mask.

sel_iso: process (Iso_Mask, InputArr) 
    begin
        for i in 0 to input_tobs-1 loop
            if (Iso_Mask = "00000" or ((InputArr(i).isol and Iso_Mask) /= "00000")) then
                generic_in(i).Et <= "00" & InputArr(i).Et;
                generic_in(i).eta <= InputArr(i).eta;
                generic_in(i).phi <= InputArr(i).phi;
            else
                generic_in(i) <= empty_tob;
            end if;    
        end loop;
    end process;

-- Sort the input cluster TOBs in groups of input_chan_width
    
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

-- Register the output of the first stage
             
reg_1st_stage:TOB_register 
generic map(num_TOBs=>(input_tobs/input_chan_width)*output_width
           )
   Port map(clk     => clk40,
            enable  => one,
            reg_in  => out_1stStage,
            reg_out => reg_out_1stStage
           );

-- Second stage. Sort the first-stage outputs
             
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
