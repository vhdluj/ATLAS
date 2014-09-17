library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
use work.ipbus.ALL;

use work.rod_l1_topo_types_const.all;

entity rod_slink_wrapper is
generic (
	NUMBER_OF_OUTPUT_LINKS	: integer range 0 to 8 := 1;
	SIMULATION		: boolean := false;
	VIVADO			: boolean := false
);
port(
	-- clock and resets
	GCK_CLK40 : in std_logic;
	GCK_CLK80 : in std_logic;
	MGT5_CLK : in std_logic;
	ROD_RESET : in std_logic;
	SLINK_RESET : in std_logic;
	CLK_LOCKED_IN : in std_logic;
	
	-- ddr inputs
	DDR_DATA_IN : in std_logic_vector(8 * 8 - 1 downto 0);
	DDR_DV_IN : in std_logic_vector(8 - 1 downto 0);
	DDR_KCTRL_IN : in std_logic_vector(8 - 1 downto 0);
	
	-- slink outputs
	OPTO_KR1_N, OPTO_KR1_P : in std_logic;
	OPTO_KT1_N, OPTO_KT1_P : out std_logic;
	SLINK_LFF_N_OUT : out std_logic;
	SLINK_DOWN_N_OUT : out std_logic;
	
	-- ttc inputs
	L1A_IN : in std_logic;
	BCID_IN : in std_logic_vector(11 downto 0);
	EVTID_IN : in std_logic_vector(23 downto 0);
	
	BUSY_FROM_U2_IN : in std_logic;
	
	DEBUG_OUT : out std_logic_vector(255 downto 0)
);
end rod_slink_wrapper;

architecture rtl of rod_slink_wrapper is


signal slink_ready, rod_receiver_rst : std_logic;

signal ros_roi_bus_assignment_sig : in_cntrl_array;
signal number_of_slices_out_l : slice_parameters_array_u;
signal lvl0_offset_out_l : slice_parameters_array_u;
signal data_out_l : out_data_array;
signal data_valid_in_l : std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
signal actual_bus_number_out_l : bus_number_array;
signal start_of_frame_l, end_of_frame_l : std_logic;

signal slink_ready_in_l, slink_event_ready_out_l : std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
type slink_data_out_array is array (0 to NUMBER_OF_OUTPUT_LINKS-1) of std_logic_vector(31 downto 0);
signal slink_data_out_a : slink_data_out_array;        
type link_number_array is array (0 to NUMBER_OF_OUTPUT_LINKS-1) of std_logic_vector(6 downto 0);
signal link_number_l : link_number_array :=(others => (others => '0'));
signal builder_busy_l : std_logic;

signal dbg_slink : std_logic_vector(47 downto 0);

begin


SET_DUMMY_ASSIGNMENTS: for i in 0 to ros_roi_bus_assignment_sig'high generate
  ros_roi_bus_assignment_sig(i) <= (others => '0');
end generate SET_DUMMY_ASSIGNMENTS;

GENERATE_V1_V2_DDR_TO_ROD: for i in 0 to 0 generate
  DDR_TO_ROD_INST: entity work.ddr_to_rod
    generic map (
      VIVADO => VIVADO)
    port map (
      RESET                       => rod_receiver_rst,
      DATA_IN_CLK                 => GCK_CLK80,
      DATA_OUT_CLK                => GCK_CLK80,
      LVL1_FULL_THR               => (others => '0'),
      L1_BUSY                     => open,
		BUILDER_BUSY_IN           => '0',
      DDR_ROS_ROI_IN_DATA         => DDR_DATA_IN((i+1)*64-1 downto i*64),
      DATA_VALID_IN               => DDR_DV_IN(0),
      SPECIAL_CHAR_IN             => DDR_KCTRL_IN(0),
      OUT_DATA                    => data_out_l,
      DATA_VALID_OUT              => data_valid_in_l,
      ACTUAL_BUS_NUMBER_OUT       => actual_bus_number_out_l,
      NUMBER_OF_SLICES_OUT        => number_of_slices_out_l,
      LVL0_OFFSET_OUT             => lvl0_offset_out_l,
      ROS_ROI_BUS_ASSIGNMENT      => ros_roi_bus_assignment_sig,
      ROS_ROI_BUS_ASSIGNMENT_DONE => not rod_receiver_rst,
      ROS_ROI_OUT_DATA_CNTR       => open,
      START_OF_FRAME              => start_of_frame_l,
      END_OF_FRAME                => end_of_frame_l);
end generate GENERATE_V1_V2_DDR_TO_ROD;                                                
                           
GENERATE_OUPUT_SLINKS: for i in 0 to NUMBER_OF_OUTPUT_LINKS -1 generate

	link_number_l(i)(actual_bus_number_out_l(i)'range) <= std_logic_vector(actual_bus_number_out_l(i));
  
	TOB_SLINK_BUILDER_INST: entity work.tob_slink_builder
	generic map (
		VIVADO => VIVADO
	)
	port map (
		RESET                 => rod_receiver_rst,
		CLK                   => GCK_CLK80,  --has to be higher !!! 160, 320 ?
		TOB_DATA_IN           => data_out_l(i),
		LINK_NUMBER           => link_number_l(i),--std_logic_vector(actual_bus_number_out_l(i)),
		BCID_OFFSET_IN        => std_logic_vector(lvl0_offset_out_l(to_integer(unsigned(actual_bus_number_out_l(i))))),
		MAX_OFFSET_IN         => max_offset(lvl0_offset_out_l),--x"5",    --here make a function to calculate it
		CRATE_ASSIGNMENT      => (others => '0'),
		DATA_VALID_IN         => data_valid_in_l(i),
		BEGINNING_OF_DATA     => start_of_frame_l,
		END_OF_DATA           => end_of_frame_l,
		ACTIVE_LINKS_NUMBER   => b"01",
		BUILDER_BUSY          => builder_busy_l,
		SLINK_CLK             => GCK_CLK40,
		SLINK_DATA_OUT        => slink_data_out_a(i),
		SLINK_READY_IN        => slink_ready_in_l(i),
		SLINK_EVENT_READY_OUT => slink_event_ready_out_l(i)
	);

	SLINKPCKBUILDER_INST: entity work.slinkPckBuilder
	generic map (
		SIMULATION => SIMULATION	
	)
	port map (
		SYSCLK             => GCK_CLK40,
		CLK_LOCKED_IN      => CLK_LOCKED_IN,
		--!!! GK: clock distributed also to ipbus, only P is used with buffered clock !!!
		GT_CLKP            => MGT5_CLK,
		GT_CLKN            => '0',
		URESET_IN          => SLINK_RESET,

		SLINK_READY_OUT    => slink_ready,

		GT_RX_N          => OPTO_KR1_N,
		GT_RX_P          => OPTO_KR1_P,
		GT_TX_N          => OPTO_KT1_N,
		GT_TX_P          => OPTO_KT1_P,
		--from parser to slink
		ENABLE_IN          => slink_event_ready_out_l(i),
		READY_OUT          => slink_ready_in_l(i),
		PAYLOAD_IN         => slink_data_out_a(i),
		L1A_IN             => L1A_IN,
		--header words (from IPBUS or TTCrc)
		MODULE_ID           => x"0001",
		RUN_TYPE            => x"0f",--0 = physics, 1 = Calibration, 2 = Cosmics, 15=test
		RUN_NUMBER          => (others => '0'),
		ECR_ID              => x"00",
		ROD_L1_ID           => EVTID_IN, --x"00_0000",
		ROD_BCN             => BCID_IN, --x"000",
		TRIGGER_TYPE        => x"00",
		DETECTOR_EVENT_TYPE => x"0000_0000",
		DEBUG_OUT           => dbg_slink,
		LFF_N_OUT			=> SLINK_LFF_N_OUT,
		LDOWN_N_OUT			=> SLINK_DOWN_N_OUT,
	
		--stat data
		STAT_WORD1_IN       => (others => '0'),
		STAT_WORD2_IN       => (others => '0')
	);
end generate GENERATE_OUPUT_SLINKS;                           

rod_receiver_rst <= ROD_RESET or not slink_ready;

DEBUG_OUT(47 downto 0) <= dbg_slink;
DEBUG_OUT(255 downto 48) <= (others => '0');

end rtl;