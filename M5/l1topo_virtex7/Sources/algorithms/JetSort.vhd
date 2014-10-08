------------------------
-- Jet Sort Algorithm --
------------------------

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

entity JetSort is
	generic(InputWidth         : integer := InputWidthJET;             --number of input TOBs
		    InputWidth1stStage : integer := InputWidth1stStageSortJET; --number of TOBs in 1st stage
		    OutputWidth        : integer := OutputWidthSortJET;        --number of sorted output TOBs
		    jet_size           : integer := DefaultJetSize             --jet Et bit width (1 = 9 bit, 2 = 10 bit)
	);
	Port(ClockBus    : in  std_logic_vector(2 downto 0);
		 Parameters  : in  ParameterArray;
		 JetTobArray : in  JetArray(InputWidth - 1 downto 0);
		 TobArrayOut : out TOBArray(OutputWidth - 1 downto 0);
		 
		 debug: out std_logic_vector(127 downto 0)
	);
end JetSort;

-----------------------------------------
-- behavioral description of algorithm --
-----------------------------------------

architecture Behavioral of JetSort is

	-------------
	-- signals --
	-------------
	-- parameters:
--	signal threshold        : std_logic_vector(GenericEtBitWidth-1 downto 0); --TODO: unused - include!
	signal min_eta          : std_logic_vector(JetEtaBitWidth-1 downto 0);
	signal max_eta          : std_logic_vector(JetEtaBitWidth-1 downto 0);
	-- selected input TOBs (Eta):
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

    constant tobWidth: natural := GenericEtBitWidth + GenericEtaBitWidth + GenericPhiBitWidth + 2;
    signal slv5: std_logic_vector(4 downto 0);

begin

	-- read parameters
--	threshold <= Parameters(0)(GenericEtBitWidth-1 downto 0); --TODO: unused - include!
	min_eta   <= Parameters(1)(JetEtaBitWidth-1 downto 0);
	max_eta   <= Parameters(2)(JetEtaBitWidth-1 downto 0);

	----------------------------------------------------------
	-- select TOBs (Eta range) and translate to generic TOB --
	----------------------------------------------------------

	sel_eta_range : process(min_eta, max_eta, JetTobArray)
	begin
		for i in 0 to InputWidth - 1 loop
			if ( (signed('0' & max_eta) >= abs (signed('0' & JetTobArray(i).Eta))) and    -- <= max_eta
				 (abs (signed('0' & JetTobArray(i).Eta)) >= signed('0' & min_eta)) ) then -- >= min_eta
				-- translate to generic TOB
				generic_in(i) <= to_GenericTOB(JetTobArray(i), jet_size);
			else
				-- replace by empty dummy TOB if not matching selection criteria
				generic_in(i) <= empty_tob;
			end if;
		end loop;
	end process;



DEBUG_GEN: for i in InputWidth-1 downto 0 generate
    constant eEta: natural := GenericEtBitWidth + GenericEtaBitWidth;
    constant eEtaPhi: natural := eEta + GenericPhiBitWidth;
begin

    debug(i*tobWidth + GenericEtBitWidth-1 downto i*tobWidth) <= generic_in(i).Et;
    debug(i*tobWidth + eEta-1 downto i*tobWidth + GenericEtBitWidth) <= generic_in(i).Eta;
    debug(i*tobWidth + eEtaPhi-1 downto i*tobWidth + eEta) <= generic_in(i).Phi;
    debug(i*tobWidth + eEtaPhi)   <= '1' when (signed(max_eta) >= abs (signed(JetTobArray(i).Eta))) else '0';
    debug(i*tobWidth + eEtaPhi+1) <= '1' when (abs (signed(JetTobArray(i).Eta)) >= signed(min_eta)) else '0';

end generate;
    
    debug(InputWidth*tobWidth +   JetEtaBitWidth-1 downto InputWidth*tobWidth) <= min_eta;
    debug(InputWidth*tobWidth + 2*JetEtaBitWidth-1 downto InputWidth*tobWidth + JetEtaBitWidth) <= max_eta; 
    
    debug(114 downto 110) <= std_logic_vector(abs (signed(JetTobArray(0).Eta)));
    debug(119 downto 115) <= std_logic_vector(abs (signed(JetTobArray(1).Eta)));
    debug(124 downto 120) <= std_logic_vector(abs (signed(JetTobArray(2).Eta)));
    slv5 <= std_logic_vector(abs (signed(JetTobArray(3).Eta)));
    debug(127 downto 125) <= slv5(2 downto 0);
    
--debug(127 downto InputWidth*tobWidth + 2*JetEtaBitWidth) <= (others => '0');




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
				TobArrayOut => out_1stStage((i + 1) * OutputWidth - 1 downto i * OutputWidth)
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
			     TobArrayOut => TobArrayOut
		);

end Behavioral;
