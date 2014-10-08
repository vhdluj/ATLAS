----------------------------
-- Cluster Sort Algorithm --
----------------------------

--------------
-- includes --
--------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.L1TopoDataTypes.all;
use work.L1TopoFunctions.all;

------------------------
-- entity declaration --
------------------------

entity ClusterSort is
	generic(InputWidth         : integer := InputWidthEM;             --number of input TOBs
		    InputWidth1stStage : integer := InputWidth1stStageSortEM; --number of TOBs in 1st stage
		    OutputWidth        : integer := OutputWidthSortEM         --number of sorted output TOBs
	);
	Port(ClockBus        : in  std_logic_vector(2 downto 0);
		 Parameters      : in  ParameterArray;
		 ClusterTobArray : in  ClusterArray(InputWidth - 1 downto 0);
		 TOBArrayOut     : out TOBArray(OutputWidth - 1 downto 0)
	);
end ClusterSort;

-----------------------------------------
-- behavioral description of algorithm --
-----------------------------------------

architecture Behavioral of ClusterSort is

	-------------
	-- signals --
	-------------
	-- parameters:
--	signal threshold        : std_logic_vector(GenericEtBitWidth-1 downto 0); --TODO: unused - include!
	signal IsoMask          : std_logic_vector(ClusterIsolBitWidth-1 downto 0);
	signal min_eta          : std_logic_vector(ClusterEtaBitWidth-1 downto 0);
	signal max_eta          : std_logic_vector(ClusterEtaBitWidth-1 downto 0);
	-- selected input TOBs (Eta & isolation):
	signal generic_in       : TOBArray(InputWidth - 1 downto 0);
	-- sorted TOBs after first stage (Et):
	signal out_1stStage     : TOBArray((InputWidth / InputWidth1stStage) * OutputWidth - 1 downto 0);
	signal reg_out_1stStage : TOBArray((InputWidth / InputWidth1stStage) * OutputWidth - 1 downto 0);
	
	----------------
	-- Attributes --
	----------------
	-- preserve the hierarchy of instances/signals
	attribute DONT_TOUCH : string;
	attribute DONT_TOUCH of out_1stStage : signal is "TRUE";
	attribute DONT_TOUCH of reg_out_1stStage : signal is "TRUE";

begin
	
	-- read parameters
--	threshold <= Parameters(0)(GenericEtBitWidth-1 downto 0); --TODO: unused - include!
	IsoMask   <= Parameters(1)(ClusterIsolBitWidth-1 downto 0);
	min_eta   <= Parameters(2)(ClusterEtaBitWidth-1 downto 0);
	max_eta   <= Parameters(3)(ClusterEtaBitWidth-1 downto 0);
	
	---------------------------------------------------------------------------
	-- select TOBs (Eta range & isolation mask) and translate to generic TOB --
	---------------------------------------------------------------------------
	-- If IsoMask is zero, then all TOBs are used (no isolation).
	-- Otherwise the isolation bits are ANDed with IsoMask.
	sel_eta_iso : process(IsoMask, min_eta, max_eta, ClusterTobArray)
	begin
		for i in 0 to InputWidth - 1 loop
			if ( (signed(max_eta) >= abs (signed(ClusterTobArray(i).Eta))) and                    -- <= max_eta
				 (abs (signed(ClusterTobArray(i).Eta)) >= signed(min_eta)) and                    -- >= min_eta
				 (IsoMask = "00000" or ((ClusterTobArray(i).Isol and IsoMask) /= "00000")) ) then -- Isolation
				-- translate to generic TOB
				generic_in(i) <= to_GenericTOB(ClusterTobArray(i));
			else
				-- replace by empty dummy TOB if not matching selection criteria
				generic_in(i) <= empty_tob;
			end if;
		end loop;
	end process;

	----------------------------------------------------------------------
	-- first stage: sort the input TOBs in groups of InputWidth1stStage --
	----------------------------------------------------------------------
	
	gen1stStage : for i in 0 to InputWidth / InputWidth1stStage - 1 generate
		sort1stStage : entity work.TobSort
			generic map(OutputWidth => OutputWidth,
				        InputWidth  => InputWidth1stStage,
				        DoPresort   => 1
			)
			port map(
				Tobs        => generic_in((i + 1) * InputWidth1stStage - 1 downto i * InputWidth1stStage),
				TOBArrayOut => out_1stStage((i + 1) * OutputWidth - 1 downto i * OutputWidth)
			);
	end generate;

	--------------------------------------------
	-- register the output of the first stage --
	--------------------------------------------
	
	reg_1st_stage : entity work.TobRegister
		generic map(InputWidth => (InputWidth / InputWidth1stStage) * OutputWidth
		)
		Port map(clk     => ClockBus(0),
			     enable  => '1',
			     reg_in  => out_1stStage,
			     reg_out => reg_out_1stStage
		);

	------------------------------------------------
	-- second stage: sort the first-stage outputs --
	------------------------------------------------
	
	sort2ndStage : entity work.TobSort
		generic map(OutputWidth => OutputWidth,
			        InputWidth  => (InputWidth / InputWidth1stStage) * OutputWidth,
			        DoPresort   => 0
		)
		port map(Tobs        => reg_out_1stStage,
			     TOBArrayOut => TOBArrayOut
		);

end Behavioral;
