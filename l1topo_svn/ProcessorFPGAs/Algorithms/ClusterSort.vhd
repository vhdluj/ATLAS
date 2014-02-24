library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity ClusterSort is
 generic (InputWidth         : integer:= 120; --number of TOBs to be sorted 
          InputWidth1stStage : integer:= 20;  --number of input channels for each module of the 1st sorting stage
		  OutputWidth        : integer:= 6    --number of input channels for each module of the 1st sorting stage
		 );
    Port (ClockBus        : in  std_logic_vector(2 downto 0);
          Parameters      : in  ParameterArray;
          ClusterTobArray : in  ClusterArray (InputWidth-1 downto 0);
          TobArrayOut     : out TOBArray (OutputWidth-1 downto 0) 
         );
end ClusterSort;

architecture Behavioral of ClusterSort is
--attribute dont_touch : string;
attribute S : string;

component TobSort is
 generic (InputWidth  : integer;
          OutputWidth : integer;
          DoPresort   : integer);				  
    port (Tobs        : in  TOBArray (InputWidth-1 downto 0);
          TobArrayOut : out TOBArray (OutputWidth-1 downto 0)
         );
end component TobSort;

component TobRegister 
generic(InputWidth : integer:=16
       );
   Port(clk        : in  std_logic;
        enable     : in  std_logic;
        reg_in     : in  TOBArray(InputWidth-1 downto 0);
        reg_out    : out TOBArray(InputWidth-1 downto 0)
       );
end component;

signal generic_in       : TOBArray(InputWidth-1 downto 0);
signal out_1stStage     : TOBArray((InputWidth/InputWidth1stStage)*OutputWidth-1 downto 0);
signal reg_out_1stStage : TOBArray((InputWidth/InputWidth1stStage)*OutputWidth-1 downto 0);
signal out_2ndStage     : TOBArray(OutputWidth-1 downto 0);

constant one : std_logic := '1';

signal IsoMask : std_logic_vector(4 downto 0);

signal empty_tob : GenericTOB;

--attribute dont_touch of out_1stStage : signal is "true"; 
attribute S of out_1stStage: signal is "true";
attribute S of reg_out_1stStage: signal is "true";

begin

IsoMask <= Parameters(0)(4 downto 0);

empty_tob.Et  <= (others => '0');
empty_tob.eta <= (others => '0');
empty_tob.phi <= (others => '0');

-- Select the TOBs to be sorted by their isolation criteria. If IsoMask is
-- zero, then all TOBs are used (no isolation). Otherwise the isolation bits
-- are ANDed with IsoMask.

sel_iso: process (IsoMask, ClusterTobArray, empty_tob) 
    begin
        for i in 0 to InputWidth-1 loop
            if (IsoMask = "00000" or ((ClusterTobArray(i).isol and IsoMask) /= "00000")) then
                generic_in(i).Et <= "00" & ClusterTobArray(i).Et;
                generic_in(i).eta <= ClusterTobArray(i).eta;
                generic_in(i).phi <= ClusterTobArray(i).phi;
            else
                generic_in(i) <= empty_tob;
            end if;    
        end loop;
    end process;

-- Sort the input cluster TOBs in groups of InputWidth1stStage
    
gen1stStage: for i in 0 to InputWidth/InputWidth1stStage-1 generate
  Sort1stStage:	TobSort
   generic map (OutputWidth => OutputWidth,
  		        InputWidth => InputWidth1stStage,
  		        DoPresort   => 1
      		   )
      port map (
      			Tobs        => generic_in((i+1)*InputWidth1stStage-1 downto i*InputWidth1stStage),
                TobArrayOut => out_1stStage((i+1)*OutputWidth-1 downto i*OutputWidth)
               );
      
end generate;

-- Register the output of the first stage
             
reg_1st_stage: TobRegister 
generic map(InputWidth => (InputWidth/InputWidth1stStage)*OutputWidth
           )
   Port map(clk        => ClockBus(0),
            enable     => one,
            reg_in     => out_1stStage,
            reg_out    => reg_out_1stStage
           );

-- Second stage. Sort the first-stage outputs
             
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
