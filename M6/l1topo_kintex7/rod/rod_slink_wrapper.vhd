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
	SIMULATION		: boolean := false;
	VIVADO			: boolean := false
);
port(
	-- clock and resets
	GCK_CLK40 : in std_logic;
	GCK_CLK80 : in std_logic;
	MGT5_CLK : in std_logic;
	ROD_RESET : in std_logic;
	SLINK_RESET : in std_logic_vector(11 downto 0);
	CLK_LOCKED_IN : in std_logic;
	
	-- ddr inputs
	DDR_DATA_IN : in std_logic_vector(8 * 8 - 1 downto 0);
	DDR_DV_IN : in std_logic_vector(8 - 1 downto 0);
	DDR_KCTRL_IN : in std_logic_vector(8 - 1 downto 0);
   --ROD_RW_REG : inout rod_rw_registers_array;
	
	-- slink outputs
	OPTO_KR1_N, OPTO_KR1_P : in std_logic_vector(11 downto 0);
	OPTO_KT1_N, OPTO_KT1_P : out std_logic_vector(11 downto 0);
--	SLINK_LFF_N_OUT : out std_logic;
--	SLINK_DOWN_N_OUT : out std_logic;
--	SLINK_FIFOFULL_OUT : out std_logic;
    SLINK_STATUS_REG_OUT : out std_logic_vector(63 downto 0);
	SLINK_BUSY_CNT_TIME_PERIOD_REG_IN : in std_logic_vector(31 downto 0);
	SLINK_BUSY_CNT_REG_OUT : out std_logic_vector(31 downto 0);
	SLINK_IDLE_CNT_REG_OUT : out std_logic_vector(31 downto 0);
	SLINK_FORMAT_VERSION_ROS : in std_logic_vector(31 downto 0);
	SLINK_FORMAT_VERSION_ROIB : in std_logic_vector(31 downto 0);
	
	RUN_NUMBER_IN : in std_logic_vector(23 downto 0);
	RUN_TYPE_IN : in std_logic_vector(7 downto 0);
	TRIGGER_TYPE_IN : in std_logic_vector(7 downto 0);
	SUBDET_ID_IN : in std_logic_vector(7 downto 0);
	MODULE_ID_IN : in std_logic_vector(15 downto 0);
	ECR_IN : in std_logic_vector(7 downto 0);
	
	-- ttc inputs
	L1A_IN : in std_logic;
	BCID_IN : in std_logic_vector(11 downto 0);
	EVTID_IN : in std_logic_vector(23 downto 0);
	
	BUSY_FROM_U2_IN : in std_logic;
	L1_BUSY : out std_logic;
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

type ros_roib_sel is array (0 to NUMBER_OF_OUTPUT_LINKS-1) of std_logic_vector(31 downto 0);
signal ros_roib_sel_table : ros_roib_sel;

--Slink pck builder 
signal link_lff_n : std_logic_vector (NUMBER_OF_OUTPUT_LINKS-1 downto 0);
signal slink_downt_n : std_logic_vector (NUMBER_OF_OUTPUT_LINKS-1 downto 0);
signal slink_fifo_full: std_logic_vector (NUMBER_OF_OUTPUT_LINKS-1 downto 0);

--busy fraction
signal rod_busy_cntr : unsigned(15 downto 0);
signal rod_real_busy_cntr : unsigned(15 downto 0);
signal l1_busy_l : std_logic;

signal builder_busy_cntr : unsigned(15 downto 0);
signal builder_real_busy_cntr : unsigned(15 downto 0);
signal l1A_cntr : unsigned(31 downto 0);
signal packet_cntr : std_logic_vector(31 downto 0);
signal l1_busy_l_synch : std_logic;

-- GK signals for gtx connections
signal gtx_rxusrclk2, gtx_rxencommaalign, gtx_txusrclk2 : std_logic_vector(11 downto 0);
type gtx_arr is array (0 to 11) of std_logic_vector(15 downto 0); 
signal gtx_rxdata, gtx_txdata : gtx_arr;
type gtx_cik_arr is array (0 to 11) of std_logic_vector(1 downto 0);
signal gtx_rxcharisk, gtx_txcharisk : gtx_cik_arr;
signal cplllock : std_logic_vector(11 downto 0);
type gtx_loopback_arr is array(0 to 11) of std_logic_vector(2 downto 0);
signal gtx_loopback : gtx_loopback_arr;
signal refclk_bufg : std_logic;

signal gtx_txresetdone, gtx_rxresetdone,gtx_txoutclk, gtx_txreset, gtx_rxreset, gtx_rxrecclk : std_logic_vector(11 downto 0);
signal gtx_rxresetdone_i_r : std_logic_vector(11 downto 0);
signal gtx_rxresetdone_r : std_logic_vector(11 downto 0);
signal gtx_rxresetdone_r2 : std_logic_vector(11 downto 0);
signal gtx_rxresetdone_r3 : std_logic_vector(11 downto 0);
signal gtx_txresetdone_r : std_logic_vector(11 downto 0);
signal gtx_txresetdone_r2 : std_logic_vector(11 downto 0);
signal gtx_reset : std_logic_vector(11 downto 0);
signal gtx_tlk_reset : std_logic_vector(11 downto 0);
signal gtx_resetdone : std_logic_vector(11 downto 0);
signal lsc_reset : std_logic_vector(11 downto 0);
signal tlk_gtxclk, tlk_rxclk : std_logic_vector(11 downto 0);

begin

--  L1A_CTR_PROC : process (GCK_CLK40)
--  begin
--    if rising_edge(GCK_CLK40) then
--      if ROD_RW_REG(0)(1) = '1' then
--        l1A_cntr <= (others => '0');
--        l1_busy_l_synch <= '0';
--      elsif l1_busy_l_synch = '0' and l1_busy_l = '1' then
--        l1A_cntr <= l1A_cntr + 1;
--        l1_busy_l_synch <= l1_busy_l;
--      else
--        l1A_cntr <= l1A_cntr;
--        l1_busy_l_synch <= l1_busy_l;
--      end if;
--    end if;
--  end process L1A_CTR_PROC;
--  ROD_RW_REG(31) <= std_logic_vector(l1A_cntr);
--
--  PACK_CTR_PROC : process (GCK_CLK40)
--  begin
--    if rising_edge(GCK_CLK40) then
--      if ROD_RW_REG(0)(1) = '1' then
--        packet_cntr <= (others => '0');
--      elsif end_of_frame_l = '1' then
--        packet_cntr <= packet_cntr + 1;
--      else
--        packet_cntr <= packet_cntr;
--      end if;
--    end if;
--  end process PACK_CTR_PROC;
--  ROD_RW_REG(32) <= std_logic_vector(packet_cntr);
--    
--  CALC_ROD_BUSY : process (GCK_CLK80)
--  begin
--    if rising_edge(GCK_CLK80) then
--      if rod_busy_cntr = ROD_RW_REG(3)(15 downto 0) then
--        ROD_RW_REG(34)(15 downto 0) <= std_logic_vector(rod_real_busy_cntr);
--        rod_busy_cntr  <= (others => '0');
--        rod_real_busy_cntr <= (others => '0');
--      elsif l1_busy_l = '1' then
--        rod_busy_cntr  <= rod_busy_cntr + 1;
--        rod_real_busy_cntr <= rod_real_busy_cntr + 1;
--      else
--        rod_busy_cntr  <= rod_busy_cntr + 1;
--        rod_real_busy_cntr <= rod_real_busy_cntr;
--      end if;
--    end if;
--  end process CALC_ROD_BUSY;
--
--  CALC_BUILDER_BUSY : process (GCK_CLK80)
--  begin
--    if rising_edge(GCK_CLK80) then
--      if builder_busy_cntr = ROD_RW_REG(3)(31 downto 16) then
--        ROD_RW_REG(34)(31 downto 16) <= std_logic_vector(builder_real_busy_cntr);
--        builder_busy_cntr  <= (others => '0');
--        builder_real_busy_cntr <= (others => '0');
--      elsif l1_busy_l = '1' then
--        builder_busy_cntr  <= builder_busy_cntr + 1;
--        builder_real_busy_cntr <= builder_real_busy_cntr + 1;
--      else
--        builder_busy_cntr  <= builder_busy_cntr + 1;
--        builder_real_busy_cntr <= builder_real_busy_cntr;
--      end if;
--    end if;
--  end process CALC_BUILDER_BUSY;
--    ROD_RW_REG(30)(1 downto 0) <= builder_busy_l & l1_busy_l;


SET_DUMMY_ASSIGNMENTS: for i in 0 to ros_roi_bus_assignment_sig'high generate
  ros_roi_bus_assignment_sig(i) <= (others => '0');
end generate SET_DUMMY_ASSIGNMENTS;
L1_BUSY <= l1_busy_l;


GENERATE_V1_V2_DDR_TO_ROD: for i in 0 to 0 generate
  DDR_TO_ROD_INST: entity work.ddr_to_rod
    generic map (
      VIVADO => VIVADO)
    port map (
      RESET                       => rod_receiver_rst,
      DATA_IN_CLK                 => GCK_CLK80,
      DATA_OUT_CLK                => GCK_CLK80,
      LVL1_FULL_THR               => (others => '1'), --ROD_RW_REG(1)(8 downto 0),
      --FIFO_DATA_THR               => ROD_RW_REG(2)(8 downto 0),
      L1_BUSY                     => l1_busy_l,
      BUILDER_BUSY_IN             => '0',
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
                           
GENERATE_OUPUT_SLINKS: for i in 0 to 11 generate

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
		URESET_IN          => SLINK_RESET(i),

		SLINK_READY_OUT    => open, --slink_ready,

		GT_RX_N          => OPTO_KR1_N(i),
		GT_RX_P          => OPTO_KR1_P(i),
		GT_TX_N          => OPTO_KT1_N(i),
		GT_TX_P          => OPTO_KT1_P(i),
		--from parser to slink
		ENABLE_IN          => '1', --slink_event_ready_out_l(i),
		READY_OUT          => slink_ready_in_l(i),
		PAYLOAD_IN         => slink_data_out_a(i),
		L1A_IN             => L1A_IN,
		--header words (from IPBUS or TTCrc)
		MODULE_ID           => MODULE_ID_IN,
		RUN_TYPE            => RUN_TYPE_IN,--0 = physics, 1 = Calibration, 2 = Cosmics, 15=test
		RUN_NUMBER          => RUN_NUMBER_IN,
		ECR_ID              => ECR_IN,
		ROD_L1_ID           => EVTID_IN, --x"00_0000",
		ROD_BCN             => BCID_IN, --x"000",
		TRIGGER_TYPE        => TRIGGER_TYPE_IN,
		SUB_DET_ID_IN       => SUBDET_ID_IN,
		DETECTOR_EVENT_TYPE => x"0000_0000",
		FORMAT_VERSION_IN   => ros_roib_sel_table(i),--SLINK_FORMAT_VERSION_ROS, --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! this hase to be changed - distinguish ROS ROIB
		
		DEBUG_OUT           => open, --dbg_slink,
		LFF_N_OUT			=> SLINK_STATUS_REG_OUT(3*i+2),--link_lff_n(i),
		LDOWN_N_OUT			=> SLINK_STATUS_REG_OUT(3*i+1),--slink_downt_n(i),
	   FIFOFULL_OUT      => SLINK_STATUS_REG_OUT(3*i),--slink_fifo_full(i),
		BUSY_CNT_TIME_PERIOD_IN => SLINK_BUSY_CNT_TIME_PERIOD_REG_IN,
		BUSY_CNT_OUT => open, --SLINK_BUSY_CNT_REG_OUT,
		IDLE_CNT_OUT => open, --SLINK_IDLE_CNT_REG_OUT,

		-- GK connections to external gtx 
        TLK_SYS_RST        => gtx_tlk_reset(i),
        GTX_RESET_OUT      => gtx_reset(i),
        LSC_RESET_IN       => lsc_reset(i), 
		  TLK_RXCLK_IN       => tlk_rxclk(i),
		  TLK_GTXCLK_IN      => tlk_gtxclk(i),
        -- GTX receive ports
        GTX_RXUSRCLK2      => gtx_rxusrclk2(i),
        GTX_RXDATA         => gtx_rxdata(i),
        GTX_RXCHARISK      => gtx_rxcharisk(i),
        GTX_RXENCOMMAALIGN => gtx_rxencommaalign(i),
        -- GTX transmit ports
        GTX_TXUSRCLK2      => gtx_txusrclk2(i),
        GTX_TXCHARISK      => gtx_txcharisk(i),
        GTX_TXDATA         => gtx_txdata(i),

		--stat data
		STAT_WORD1_IN       => (others => '0'),
		STAT_WORD2_IN       => (others => '0')
	);
end generate GENERATE_OUPUT_SLINKS;     

	
	refclk_bufg <= MGT5_CLK;

    ----------------------------- The GTX Wrapper -----------------------------
    gtx_minipod_12x_k7_i : entity work.gtx_minipod_12x_k7
    generic map
    (
        -- Simulation attributes
        WRAPPER_SIM_GTRESET_SPEEDUP =>  "TRUE"         -- Speedup is turned on for simulation
    ) 
    port map
    (
     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT0_CPLLFBCLKLOST_OUT           =>      open,
        GT0_CPLLLOCK_OUT                =>      cplllock(0),
        GT0_CPLLLOCKDETCLK_IN           =>      '0', --refclk_bufg, (gk)
        GT0_CPLLREFCLKLOST_OUT          =>      open,
        GT0_CPLLRESET_IN                =>      '0',
        -------------------------- Channel - Clocking Ports ------------------------
        GT0_GTREFCLK0_IN                =>      refclk_bufg,
        ---------------------------- Channel - DRP Ports  --------------------------
        GT0_DRPADDR_IN                  =>      (others => '0'),
        GT0_DRPCLK_IN                   =>      '0', --refclk_bufg, (gk)
        GT0_DRPDI_IN                    =>      (others => '0'),
        GT0_DRPDO_OUT                   =>      open,
        GT0_DRPEN_IN                    =>      '0',
        GT0_DRPRDY_OUT                  =>      open,
        GT0_DRPWE_IN                    =>      '0',
		  
		  GT0_LOOPBACK_IN                 =>      gtx_loopback(0),
        --------------------- RX Initialization and Reset Ports --------------------
        GT0_RXUSERRDY_IN                =>      CLK_LOCKED_IN,
        -------------------------- RX Margin Analysis Ports ------------------------
        GT0_EYESCANDATAERROR_OUT        =>      open,
        ------------------------- Receive Ports - CDR Ports ------------------------
        GT0_RXCDRLOCK_OUT               =>      open,
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------
        GT0_RXUSRCLK_IN                 =>      gtx_txusrclk2(0),
        GT0_RXUSRCLK2_IN                =>      gtx_txusrclk2(0),
        ------------------ Receive Ports - FPGA RX interface Ports -----------------
        GT0_RXDATA_OUT                  =>      gtx_rxdata(0),
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
        GT0_RXDISPERR_OUT               =>      open,
        GT0_RXNOTINTABLE_OUT            =>      open,
        --------------------------- Receive Ports - RX AFE -------------------------
        GT0_GTXRXP_IN                   =>      OPTO_KR1_P(0),
        ------------------------ Receive Ports - RX AFE Ports ----------------------
        GT0_GTXRXN_IN                   =>      OPTO_KR1_N(0),
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		  GT0_RXBYTEISALIGNED_OUT         =>      open,   
		  GT0_RXBYTEREALIGN_OUT           =>      open,   
		  GT0_RXCOMMADET_OUT              =>      open,   
        --------------------- Receive Ports - RX Equalizer Ports -------------------
		  GT0_RXDFELFHOLD_IN				=> 		'0', --(gk !!! added for minipod)
        GT0_RXDFEAGCHOLD_IN             =>      '0',
        --------------- Receive Ports - RX Fabric Output Control Ports -------------
        GT0_RXOUTCLK_OUT                =>      gtx_rxrecclk(0),
        ------------- Receive Ports - RX Initialization and Reset Ports ------------
        GT0_GTRXRESET_IN                =>      gtx_rxreset(0),
	 	  GT0_RXPCSRESET_IN               =>      '0',--gtx_rxreset,
        GT0_RXPMARESET_IN               =>      '0',
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
        GT0_RXCHARISCOMMA_OUT           =>      open,
        GT0_RXCHARISK_OUT               =>      gtx_rxcharisk(0),
        -------------- Receive Ports -RX Initialization and Reset Ports ------------
        GT0_RXRESETDONE_OUT             =>      gtx_rxresetdone(0),
        --------------------- TX Initialization and Reset Ports --------------------
		  GT0_GTTXRESET_IN                =>      gtx_txreset(0),
        GT0_TXUSERRDY_IN                =>      cplllock(0),
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
        GT0_TXUSRCLK_IN                 =>      gtx_txusrclk2(0),
        GT0_TXUSRCLK2_IN                =>      gtx_txusrclk2(0),
        ------------------ Transmit Ports - TX Data Path interface -----------------
        GT0_TXDATA_IN                   =>      gtx_txdata(0),
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------
        GT0_GTXTXN_OUT                  =>      OPTO_KT1_N(0),
        GT0_GTXTXP_OUT                  =>      OPTO_KT1_P(0),
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
        GT0_TXOUTCLK_OUT                =>      gtx_txoutclk(0),
        GT0_TXOUTCLKFABRIC_OUT          =>      open,
        GT0_TXOUTCLKPCS_OUT             =>      open,
        --------------------- Transmit Ports - TX Gearbox Ports --------------------
        GT0_TXCHARISK_IN                =>      gtx_txcharisk(0),
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------
        GT0_TXRESETDONE_OUT             =>      gtx_txresetdone(0),


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT1_CPLLFBCLKLOST_OUT           =>      open,                                                    
        GT1_CPLLLOCK_OUT                =>      cplllock(1),                                                
        GT1_CPLLLOCKDETCLK_IN           =>      '0', --refclk_bufg, (gk)                                 
        GT1_CPLLREFCLKLOST_OUT          =>      open,                                                    
        GT1_CPLLRESET_IN                =>      '0',                                                     
        -------------------------- Channel - Clocking Ports ------------------------                     
        GT1_GTREFCLK0_IN                =>      refclk_bufg,                                             
        ---------------------------- Channel - DRP Ports  --------------------------                     
        GT1_DRPADDR_IN                  =>      (others => '0'),                                         
        GT1_DRPCLK_IN                   =>      '0', --refclk_bufg, (gk)                                 
        GT1_DRPDI_IN                    =>      (others => '0'),                                         
        GT1_DRPDO_OUT                   =>      open,                                                    
        GT1_DRPEN_IN                    =>      '0',                                                     
        GT1_DRPRDY_OUT                  =>      open,                                                    
        GT1_DRPWE_IN                    =>      '0',                                                     
        -------------------------------                                                                  
        GT1_LOOPBACK_IN                 =>      gtx_loopback(1),                                            
        --------------------- RX Initialization and Reset Ports --------------------                     
        GT1_RXUSERRDY_IN                =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Margin Analysis Ports ------------------------                     
        GT1_EYESCANDATAERROR_OUT        =>      open,                                                    
        ------------------------- Receive Ports - CDR Ports ------------------------                     
        GT1_RXCDRLOCK_OUT               =>      open,                                                    
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------                     
        GT1_RXUSRCLK_IN                 =>      gtx_txusrclk2(1),                                           
        GT1_RXUSRCLK2_IN                =>      gtx_txusrclk2(1),                                           
        ------------------ Receive Ports - FPGA RX interface Ports -----------------                     
        GT1_RXDATA_OUT                  =>      gtx_rxdata(1),                                              
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------                     
        GT1_RXDISPERR_OUT               =>      open,                                                    
        GT1_RXNOTINTABLE_OUT            =>      open,                                                    
        --------------------------- Receive Ports - RX AFE -------------------------                     
        GT1_GTXRXP_IN                   =>      OPTO_KR1_P(1),                                                 
        ------------------------ Receive Ports - RX AFE Ports ----------------------                     
        GT1_GTXRXN_IN                   =>      OPTO_KR1_N(1),                                                 
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------                     
        GT1_RXBYTEISALIGNED_OUT         =>      open,                                     
        GT1_RXBYTEREALIGN_OUT           =>      open,                                     
        GT1_RXCOMMADET_OUT              =>      open,                                     
        --------------------- Receive Ports - RX Equalizer Ports -------------------                     
        GT1_RXDFEAGCHOLD_IN             => 		'0', --(gk !!! added for minipod)                        
        GT1_RXDFELFHOLD_IN              =>      '0',                                                     
        --------------- Receive Ports - RX Fabric Output Control Ports -------------                     
        GT1_RXOUTCLK_OUT                =>      gtx_rxrecclk(1),                                            
        ------------- Receive Ports - RX Initialization and Reset Ports ------------                     
        GT1_GTRXRESET_IN                =>      gtx_rxreset(1),                                             
        GT1_RXPCSRESET_IN               =>      '0',--gtx_rxreset,                                       
        GT1_RXPMARESET_IN               =>      '0',                                                     
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------                     
        GT1_RXCHARISCOMMA_OUT           =>      open,                                       
        GT1_RXCHARISK_OUT               =>      gtx_rxcharisk(1),                                           
        -------------- Receive Ports -RX Initialization and Reset Ports ------------                     
        GT1_RXRESETDONE_OUT             =>      gtx_rxresetdone(1),                                         
        --------------------- TX Initialization and Reset Ports --------------------                     
        GT1_GTTXRESET_IN                =>      gtx_txreset(1),                                             
        GT1_TXUSERRDY_IN                =>      cplllock(1),                                                
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------                     
        GT1_TXUSRCLK_IN                 =>      gtx_txusrclk2(1),                                           
        GT1_TXUSRCLK2_IN                =>      gtx_txusrclk2(1),                                           
        ------------------ Transmit Ports - TX Data Path interface -----------------                     
        GT1_TXDATA_IN                   =>      gtx_txdata(1),                                              
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------                     
        GT1_GTXTXN_OUT                  =>      OPTO_KT1_N(1),                                                 
        GT1_GTXTXP_OUT                  =>      OPTO_KT1_P(1),                                                 
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------                     
        GT1_TXOUTCLK_OUT                =>      gtx_txoutclk(1),                                            
        GT1_TXOUTCLKFABRIC_OUT          =>      open,                                                    
        GT1_TXOUTCLKPCS_OUT             =>      open,                                                    
        --------------------- Transmit Ports - TX Gearbox Ports --------------------                     
        GT1_TXCHARISK_IN                =>      gtx_txcharisk(1),                                           
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------                     
        GT1_TXRESETDONE_OUT             =>      gtx_txresetdone(1),                                         


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT2_CPLLFBCLKLOST_OUT           =>      open,                                                    
        GT2_CPLLLOCK_OUT                =>      cplllock(2),                                                
        GT2_CPLLLOCKDETCLK_IN           =>      '0', --refclk_bufg, (gk)                                 
        GT2_CPLLREFCLKLOST_OUT          =>      open,                                                    
        GT2_CPLLRESET_IN                =>      '0',                                                     
        -------------------------- Channel - Clocking Ports ------------------------                     
        GT2_GTREFCLK0_IN                =>      refclk_bufg,                                             
        ---------------------------- Channel - DRP Ports  --------------------------                     
        GT2_DRPADDR_IN                  =>      (others => '0'),                                         
        GT2_DRPCLK_IN                   =>      '0', --refclk_bufg, (gk)                                 
        GT2_DRPDI_IN                    =>      (others => '0'),                                         
        GT2_DRPDO_OUT                   =>      open,                                                    
        GT2_DRPEN_IN                    =>      '0',                                                     
        GT2_DRPRDY_OUT                  =>      open,                                                    
        GT2_DRPWE_IN                    =>      '0',                                                     
        -------------------------------                                                                  
        GT2_LOOPBACK_IN                 =>      gtx_loopback(2),                                            
        --------------------- RX Initialization and Reset Ports --------------------                     
        GT2_RXUSERRDY_IN                =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Margin Analysis Ports ------------------------                     
        GT2_EYESCANDATAERROR_OUT        =>      open,                                                    
        ------------------------- Receive Ports - CDR Ports ------------------------                     
        GT2_RXCDRLOCK_OUT               =>      open,                                                    
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------                     
        GT2_RXUSRCLK_IN                 =>      gtx_txusrclk2(2),                                           
        GT2_RXUSRCLK2_IN                =>      gtx_txusrclk2(2),                                           
        ------------------ Receive Ports - FPGA RX interface Ports -----------------                     
        GT2_RXDATA_OUT                  =>      gtx_rxdata(2),                                              
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------                     
        GT2_RXDISPERR_OUT               =>      open,                                           
        GT2_RXNOTINTABLE_OUT            =>      open,                                           
        --------------------------- Receive Ports - RX AFE -------------------------                     
        GT2_GTXRXP_IN                   =>      OPTO_KR1_P(2),                                                 
        ------------------------ Receive Ports - RX AFE Ports ----------------------                     
        GT2_GTXRXN_IN                   =>      OPTO_KR1_N(2),                                                 
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------                     
        GT2_RXBYTEISALIGNED_OUT         =>      open,                                      
        GT2_RXBYTEREALIGN_OUT           =>      open,                                      
        GT2_RXCOMMADET_OUT              =>      open,                                      
        --------------------- Receive Ports - RX Equalizer Ports -------------------                     
        GT2_RXDFEAGCHOLD_IN             => 		'0', --(gk !!! added for minipod)                        
        GT2_RXDFELFHOLD_IN              =>      '0',                                                     
        --------------- Receive Ports - RX Fabric Output Control Ports -------------                     
        GT2_RXOUTCLK_OUT                =>      gtx_rxrecclk(2),                                            
        ------------- Receive Ports - RX Initialization and Reset Ports ------------                     
        GT2_GTRXRESET_IN                =>      gtx_rxreset(2),                                             
        GT2_RXPCSRESET_IN               =>      '0',--gtx_rxreset,                                       
        GT2_RXPMARESET_IN               =>      '0',                                                     
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------                     
        GT2_RXCHARISCOMMA_OUT           =>      open,                                       
        GT2_RXCHARISK_OUT               =>      gtx_rxcharisk(2),                                           
        -------------- Receive Ports -RX Initialization and Reset Ports ------------                     
        GT2_RXRESETDONE_OUT             =>      gtx_rxresetdone(2),                                         
        --------------------- TX Initialization and Reset Ports --------------------                     
        GT2_GTTXRESET_IN                =>      gtx_txreset(2),                                             
        GT2_TXUSERRDY_IN                =>      cplllock(2),                                                
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------                     
        GT2_TXUSRCLK_IN                 =>      gtx_txusrclk2(2),                                           
        GT2_TXUSRCLK2_IN                =>      gtx_txusrclk2(2),                                           
        ------------------ Transmit Ports - TX Data Path interface -----------------                     
        GT2_TXDATA_IN                   =>      gtx_txdata(2),                                              
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------                     
        GT2_GTXTXN_OUT                  =>      OPTO_KT1_N(2),                                                 
        GT2_GTXTXP_OUT                  =>      OPTO_KT1_P(2),                                                 
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------                     
        GT2_TXOUTCLK_OUT                =>      gtx_txoutclk(2),                                            
        GT2_TXOUTCLKFABRIC_OUT          =>      open,                                                    
        GT2_TXOUTCLKPCS_OUT             =>      open,                                                    
        --------------------- Transmit Ports - TX Gearbox Ports --------------------                     
        GT2_TXCHARISK_IN                =>      gtx_txcharisk(2),                                           
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------                     
        GT2_TXRESETDONE_OUT             =>      gtx_txresetdone(2),                                         


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT3_CPLLFBCLKLOST_OUT           =>      open,                                                    
        GT3_CPLLLOCK_OUT                =>      cplllock(3),                                                
        GT3_CPLLLOCKDETCLK_IN           =>      '0', --refclk_bufg, (gk)                                 
        GT3_CPLLREFCLKLOST_OUT          =>      open,                                                    
        GT3_CPLLRESET_IN                =>      '0',                                                     
        -------------------------- Channel - Clocking Ports ------------------------                     
        GT3_GTREFCLK0_IN                =>      refclk_bufg,                                             
        ---------------------------- Channel - DRP Ports  --------------------------                     
        GT3_DRPADDR_IN                  =>      (others => '0'),                                         
        GT3_DRPCLK_IN                   =>      '0', --refclk_bufg, (gk)                                 
        GT3_DRPDI_IN                    =>      (others => '0'),                                         
        GT3_DRPDO_OUT                   =>      open,                                                    
        GT3_DRPEN_IN                    =>      '0',                                                     
        GT3_DRPRDY_OUT                  =>      open,                                                    
        GT3_DRPWE_IN                    =>      '0',                                                     
        -------------------------------                                                                  
        GT3_LOOPBACK_IN                 =>      gtx_loopback(3),                                            
        --------------------- RX Initialization and Reset Ports --------------------                     
        GT3_RXUSERRDY_IN                =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Margin Analysis Ports ------------------------                     
        GT3_EYESCANDATAERROR_OUT        =>      open,                                                    
        ------------------------- Receive Ports - CDR Ports ------------------------                     
        GT3_RXCDRLOCK_OUT               =>      open,                                                    
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------                     
        GT3_RXUSRCLK_IN                 =>      gtx_txusrclk2(3),                                           
        GT3_RXUSRCLK2_IN                =>      gtx_txusrclk2(3),                                           
        ------------------ Receive Ports - FPGA RX interface Ports -----------------                     
        GT3_RXDATA_OUT                  =>      gtx_rxdata(3),                                              
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------                     
        GT3_RXDISPERR_OUT               =>      open,                          
        GT3_RXNOTINTABLE_OUT            =>      open,                          
        --------------------------- Receive Ports - RX AFE -------------------------                     
        GT3_GTXRXP_IN                   =>      OPTO_KR1_P(3),                                                 
        ------------------------ Receive Ports - RX AFE Ports ----------------------                     
        GT3_GTXRXN_IN                   =>      OPTO_KR1_N(3),                                                 
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------                     
        GT3_RXBYTEISALIGNED_OUT         =>      open,                                    
        GT3_RXBYTEREALIGN_OUT           =>      open,                                    
        GT3_RXCOMMADET_OUT              =>      open,                                    
        --------------------- Receive Ports - RX Equalizer Ports -------------------                     
        GT3_RXDFEAGCHOLD_IN             => 		'0', --(gk !!! added for minipod)                        
        GT3_RXDFELFHOLD_IN              =>      '0',                                                     
        --------------- Receive Ports - RX Fabric Output Control Ports -------------                     
        GT3_RXOUTCLK_OUT                =>      gtx_rxrecclk(3),                                            
        ------------- Receive Ports - RX Initialization and Reset Ports ------------                     
        GT3_GTRXRESET_IN                =>      gtx_rxreset(3),                                             
        GT3_RXPCSRESET_IN               =>      '0',--gtx_rxreset,                                       
        GT3_RXPMARESET_IN               =>      '0',                                                     
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------                     
        GT3_RXCHARISCOMMA_OUT           =>      open,                                       
        GT3_RXCHARISK_OUT               =>      gtx_rxcharisk(3),                                           
        -------------- Receive Ports -RX Initialization and Reset Ports ------------                     
        GT3_RXRESETDONE_OUT             =>      gtx_rxresetdone(3),                                         
        --------------------- TX Initialization and Reset Ports --------------------                     
        GT3_GTTXRESET_IN                =>      gtx_txreset(3),                                             
        GT3_TXUSERRDY_IN                =>      cplllock(3),                                                
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------                     
        GT3_TXUSRCLK_IN                 =>      gtx_txusrclk2(3),                                           
        GT3_TXUSRCLK2_IN                =>      gtx_txusrclk2(3),                                           
        ------------------ Transmit Ports - TX Data Path interface -----------------                     
        GT3_TXDATA_IN                   =>      gtx_txdata(3),                                              
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------                     
        GT3_GTXTXN_OUT                  =>      OPTO_KT1_N(3),                                                 
        GT3_GTXTXP_OUT                  =>      OPTO_KT1_P(3),                                                 
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------                     
        GT3_TXOUTCLK_OUT                =>      gtx_txoutclk(3),                                            
        GT3_TXOUTCLKFABRIC_OUT          =>      open,                                                    
        GT3_TXOUTCLKPCS_OUT             =>      open,                                                    
        --------------------- Transmit Ports - TX Gearbox Ports --------------------                     
        GT3_TXCHARISK_IN                =>      gtx_txcharisk(3),                                           
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------                     
        GT3_TXRESETDONE_OUT             =>      gtx_txresetdone(3),                                         


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT4_CPLLFBCLKLOST_OUT           =>      open,                                                    
        GT4_CPLLLOCK_OUT                =>      cplllock(4),                                                
        GT4_CPLLLOCKDETCLK_IN           =>      '0', --refclk_bufg, (gk)                                 
        GT4_CPLLREFCLKLOST_OUT          =>      open,                                                    
        GT4_CPLLRESET_IN                =>      '0',                                                     
        -------------------------- Channel - Clocking Ports ------------------------                     
        GT4_GTREFCLK0_IN                =>      refclk_bufg,                                             
        ---------------------------- Channel - DRP Ports  --------------------------                     
        GT4_DRPADDR_IN                  =>      (others => '0'),                                         
        GT4_DRPCLK_IN                   =>      '0', --refclk_bufg, (gk)                                 
        GT4_DRPDI_IN                    =>      (others => '0'),                                         
        GT4_DRPDO_OUT                   =>      open,                                                    
        GT4_DRPEN_IN                    =>      '0',                                                     
        GT4_DRPRDY_OUT                  =>      open,                                                    
        GT4_DRPWE_IN                    =>      '0',                                                     
        -------------------------------                                                                  
        GT4_LOOPBACK_IN                 =>      gtx_loopback(4),                                            
        --------------------- RX Initialization and Reset Ports --------------------                     
        GT4_RXUSERRDY_IN                =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Margin Analysis Ports ------------------------                     
        GT4_EYESCANDATAERROR_OUT        =>      open,                                                    
        ------------------------- Receive Ports - CDR Ports ------------------------                     
        GT4_RXCDRLOCK_OUT               =>      open,                                                    
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------                     
        GT4_RXUSRCLK_IN                 =>      gtx_txusrclk2(4),                                           
        GT4_RXUSRCLK2_IN                =>      gtx_txusrclk2(4),                                           
        ------------------ Receive Ports - FPGA RX interface Ports -----------------                     
        GT4_RXDATA_OUT                  =>      gtx_rxdata(4),                                              
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------                     
        GT4_RXDISPERR_OUT               =>      open,                                    
        GT4_RXNOTINTABLE_OUT            =>      open,                                    
        --------------------------- Receive Ports - RX AFE -------------------------                     
        GT4_GTXRXP_IN                   =>      OPTO_KR1_P(4),                                                 
        ------------------------ Receive Ports - RX AFE Ports ----------------------                     
        GT4_GTXRXN_IN                   =>      OPTO_KR1_N(4),                                                 
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------                     
        GT4_RXBYTEISALIGNED_OUT         =>      open,                                     
        GT4_RXBYTEREALIGN_OUT           =>      open,                                     
        GT4_RXCOMMADET_OUT              =>      open,                                     
        --------------------- Receive Ports - RX Equalizer Ports -------------------                     
        GT4_RXDFEAGCHOLD_IN             => 		'0', --(gk !!! added for minipod)                        
        GT4_RXDFELFHOLD_IN              =>      '0',                                                     
        --------------- Receive Ports - RX Fabric Output Control Ports -------------                     
        GT4_RXOUTCLK_OUT                =>      gtx_rxrecclk(4),                                            
        ------------- Receive Ports - RX Initialization and Reset Ports ------------                     
        GT4_GTRXRESET_IN                =>      gtx_rxreset(4),                                             
        GT4_RXPCSRESET_IN               =>      '0',--gtx_rxreset,                                       
        GT4_RXPMARESET_IN               =>      '0',                                                     
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------                     
        GT4_RXCHARISCOMMA_OUT           =>      open,                                       
        GT4_RXCHARISK_OUT               =>      gtx_rxcharisk(4),                                           
        -------------- Receive Ports -RX Initialization and Reset Ports ------------                     
        GT4_RXRESETDONE_OUT             =>      gtx_rxresetdone(4),                                         
        --------------------- TX Initialization and Reset Ports --------------------                     
        GT4_GTTXRESET_IN                =>      gtx_txreset(4),                                             
        GT4_TXUSERRDY_IN                =>      cplllock(4),                                                
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------                     
        GT4_TXUSRCLK_IN                 =>      gtx_txusrclk2(4),                                           
        GT4_TXUSRCLK2_IN                =>      gtx_txusrclk2(4),                                           
        ------------------ Transmit Ports - TX Data Path interface -----------------                     
        GT4_TXDATA_IN                   =>      gtx_txdata(4),                                              
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------                     
        GT4_GTXTXN_OUT                  =>      OPTO_KT1_N(4),                                                 
        GT4_GTXTXP_OUT                  =>      OPTO_KT1_P(4),                                                 
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------                     
        GT4_TXOUTCLK_OUT                =>      gtx_txoutclk(4),                                            
        GT4_TXOUTCLKFABRIC_OUT          =>      open,                                                    
        GT4_TXOUTCLKPCS_OUT             =>      open,                                                    
        --------------------- Transmit Ports - TX Gearbox Ports --------------------                     
        GT4_TXCHARISK_IN                =>      gtx_txcharisk(4),                                           
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------                     
        GT4_TXRESETDONE_OUT             =>      gtx_txresetdone(4),                                         


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT5_CPLLFBCLKLOST_OUT           =>      open,                                                    
        GT5_CPLLLOCK_OUT                =>      cplllock(5),                                                
        GT5_CPLLLOCKDETCLK_IN           =>      '0', --refclk_bufg, (gk)                                 
        GT5_CPLLREFCLKLOST_OUT          =>      open,                                                    
        GT5_CPLLRESET_IN                =>      '0',                                                     
        -------------------------- Channel - Clocking Ports ------------------------                     
        GT5_GTREFCLK0_IN                =>      refclk_bufg,                                             
        ---------------------------- Channel - DRP Ports  --------------------------                     
        GT5_DRPADDR_IN                  =>      (others => '0'),                                         
        GT5_DRPCLK_IN                   =>      '0', --refclk_bufg, (gk)                                 
        GT5_DRPDI_IN                    =>      (others => '0'),                                         
        GT5_DRPDO_OUT                   =>      open,                                                    
        GT5_DRPEN_IN                    =>      '0',                                                     
        GT5_DRPRDY_OUT                  =>      open,                                                    
        GT5_DRPWE_IN                    =>      '0',                                                     
        -------------------------------                                                                  
        GT5_LOOPBACK_IN                 =>      gtx_loopback(5),                                            
        --------------------- RX Initialization and Reset Ports --------------------                     
        GT5_RXUSERRDY_IN                =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Margin Analysis Ports ------------------------                     
        GT5_EYESCANDATAERROR_OUT        =>      open,                                                    
        ------------------------- Receive Ports - CDR Ports ------------------------                     
        GT5_RXCDRLOCK_OUT               =>      open,                                                    
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------                     
        GT5_RXUSRCLK_IN                 =>      gtx_txusrclk2(5),                                           
        GT5_RXUSRCLK2_IN                =>      gtx_txusrclk2(5),                                           
        ------------------ Receive Ports - FPGA RX interface Ports -----------------                     
        GT5_RXDATA_OUT                  =>      gtx_rxdata(5),                                              
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------                     
        GT5_RXDISPERR_OUT               =>      open,                                    
        GT5_RXNOTINTABLE_OUT            =>      open,                                    
        --------------------------- Receive Ports - RX AFE -------------------------                     
        GT5_GTXRXP_IN                   =>      OPTO_KR1_P(5),                                                 
        ------------------------ Receive Ports - RX AFE Ports ----------------------                     
        GT5_GTXRXN_IN                   =>      OPTO_KR1_N(5),                                                 
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------                     
        GT5_RXBYTEISALIGNED_OUT         =>      open,                                  
        GT5_RXBYTEREALIGN_OUT           =>      open,                                  
        GT5_RXCOMMADET_OUT              =>      open,                                  
        --------------------- Receive Ports - RX Equalizer Ports -------------------                     
        GT5_RXDFEAGCHOLD_IN             => 		'0', --(gk !!! added for minipod)                        
        GT5_RXDFELFHOLD_IN              =>      '0',                                                     
        --------------- Receive Ports - RX Fabric Output Control Ports -------------                     
        GT5_RXOUTCLK_OUT                =>      gtx_rxrecclk(5),                                            
        ------------- Receive Ports - RX Initialization and Reset Ports ------------                     
        GT5_GTRXRESET_IN                =>      gtx_rxreset(5),                                             
        GT5_RXPCSRESET_IN               =>      '0',--gtx_rxreset,                                       
        GT5_RXPMARESET_IN               =>      '0',                                                     
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------                     
        GT5_RXCHARISCOMMA_OUT           =>      open,                                       
        GT5_RXCHARISK_OUT               =>      gtx_rxcharisk(5),                                           
        -------------- Receive Ports -RX Initialization and Reset Ports ------------                     
        GT5_RXRESETDONE_OUT             =>      gtx_rxresetdone(5),                                         
        --------------------- TX Initialization and Reset Ports --------------------                     
        GT5_GTTXRESET_IN                =>      gtx_txreset(5),                                             
        GT5_TXUSERRDY_IN                =>      cplllock(5),                                                
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------                     
        GT5_TXUSRCLK_IN                 =>      gtx_txusrclk2(5),                                           
        GT5_TXUSRCLK2_IN                =>      gtx_txusrclk2(5),                                           
        ------------------ Transmit Ports - TX Data Path interface -----------------                     
        GT5_TXDATA_IN                   =>      gtx_txdata(5),                                              
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------                     
        GT5_GTXTXN_OUT                  =>      OPTO_KT1_N(5),                                                 
        GT5_GTXTXP_OUT                  =>      OPTO_KT1_P(5),                                                 
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------                     
        GT5_TXOUTCLK_OUT                =>      gtx_txoutclk(5),                                            
        GT5_TXOUTCLKFABRIC_OUT          =>      open,                                                    
        GT5_TXOUTCLKPCS_OUT             =>      open,                                                    
        --------------------- Transmit Ports - TX Gearbox Ports --------------------                     
        GT5_TXCHARISK_IN                =>      gtx_txcharisk(5),                                           
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------                     
        GT5_TXRESETDONE_OUT             =>      gtx_txresetdone(5),                                         


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT6_CPLLFBCLKLOST_OUT           =>      open,                                                    
        GT6_CPLLLOCK_OUT                =>      cplllock(6),                                                
        GT6_CPLLLOCKDETCLK_IN           =>      '0', --refclk_bufg, (gk)                                 
        GT6_CPLLREFCLKLOST_OUT          =>      open,                                                    
        GT6_CPLLRESET_IN                =>      '0',                                                     
        -------------------------- Channel - Clocking Ports ------------------------                     
        GT6_GTREFCLK0_IN                =>      refclk_bufg,                                             
        ---------------------------- Channel - DRP Ports  --------------------------                     
        GT6_DRPADDR_IN                  =>      (others => '0'),                                         
        GT6_DRPCLK_IN                   =>      '0', --refclk_bufg, (gk)                                 
        GT6_DRPDI_IN                    =>      (others => '0'),                                         
        GT6_DRPDO_OUT                   =>      open,                                                    
        GT6_DRPEN_IN                    =>      '0',                                                     
        GT6_DRPRDY_OUT                  =>      open,                                                    
        GT6_DRPWE_IN                    =>      '0',                                                     
        -------------------------------                                                                  
        GT6_LOOPBACK_IN                 =>      gtx_loopback(6),                                            
        --------------------- RX Initialization and Reset Ports --------------------                     
        GT6_RXUSERRDY_IN                =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Margin Analysis Ports ------------------------                     
        GT6_EYESCANDATAERROR_OUT        =>      open,                                                    
        ------------------------- Receive Ports - CDR Ports ------------------------                     
        GT6_RXCDRLOCK_OUT               =>      open,                                                    
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------                     
        GT6_RXUSRCLK_IN                 =>      gtx_txusrclk2(6),                                           
        GT6_RXUSRCLK2_IN                =>      gtx_txusrclk2(6),                                           
        ------------------ Receive Ports - FPGA RX interface Ports -----------------                     
        GT6_RXDATA_OUT                  =>      gtx_rxdata(6),                                              
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------                     
        GT6_RXDISPERR_OUT               =>      open,                                 
        GT6_RXNOTINTABLE_OUT            =>      open,                                 
        --------------------------- Receive Ports - RX AFE -------------------------                     
        GT6_GTXRXP_IN                   =>      OPTO_KR1_P(6),                                                 
        ------------------------ Receive Ports - RX AFE Ports ----------------------                     
        GT6_GTXRXN_IN                   =>      OPTO_KR1_N(6),                                                 
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------                     
        GT6_RXBYTEISALIGNED_OUT         =>      open,                                  
        GT6_RXBYTEREALIGN_OUT           =>      open,                                  
        GT6_RXCOMMADET_OUT              =>      open,                                  
        --------------------- Receive Ports - RX Equalizer Ports -------------------                     
        GT6_RXDFEAGCHOLD_IN             => 		'0', --(gk !!! added for minipod)                        
        GT6_RXDFELFHOLD_IN              =>      '0',                                                     
        --------------- Receive Ports - RX Fabric Output Control Ports -------------                     
        GT6_RXOUTCLK_OUT                =>      gtx_rxrecclk(6),                                            
        ------------- Receive Ports - RX Initialization and Reset Ports ------------                     
        GT6_GTRXRESET_IN                =>      gtx_rxreset(6),                                             
        GT6_RXPCSRESET_IN               =>      '0',--gtx_rxreset,                                       
        GT6_RXPMARESET_IN               =>      '0',                                                     
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------                     
        GT6_RXCHARISCOMMA_OUT           =>      open,                                       
        GT6_RXCHARISK_OUT               =>      gtx_rxcharisk(6),                                           
        -------------- Receive Ports -RX Initialization and Reset Ports ------------                     
        GT6_RXRESETDONE_OUT             =>      gtx_rxresetdone(6),                                         
        --------------------- TX Initialization and Reset Ports --------------------                     
        GT6_GTTXRESET_IN                =>      gtx_txreset(6),                                             
        GT6_TXUSERRDY_IN                =>      cplllock(6),                                                
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------                     
        GT6_TXUSRCLK_IN                 =>      gtx_txusrclk2(6),                                           
        GT6_TXUSRCLK2_IN                =>      gtx_txusrclk2(6),                                           
        ------------------ Transmit Ports - TX Data Path interface -----------------                     
        GT6_TXDATA_IN                   =>      gtx_txdata(6),                                              
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------                     
        GT6_GTXTXN_OUT                  =>      OPTO_KT1_N(6),                                                 
        GT6_GTXTXP_OUT                  =>      OPTO_KT1_P(6),                                                 
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------                     
        GT6_TXOUTCLK_OUT                =>      gtx_txoutclk(6),                                            
        GT6_TXOUTCLKFABRIC_OUT          =>      open,                                                    
        GT6_TXOUTCLKPCS_OUT             =>      open,                                                    
        --------------------- Transmit Ports - TX Gearbox Ports --------------------                     
        GT6_TXCHARISK_IN                =>      gtx_txcharisk(6),                                           
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------                     
        GT6_TXRESETDONE_OUT             =>      gtx_txresetdone(6),                                         


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT7_CPLLFBCLKLOST_OUT           =>      open,                                                    
        GT7_CPLLLOCK_OUT                =>      cplllock(7),                                                
        GT7_CPLLLOCKDETCLK_IN           =>      '0', --refclk_bufg, (gk)                                 
        GT7_CPLLREFCLKLOST_OUT          =>      open,                                                    
        GT7_CPLLRESET_IN                =>      '0',                                                     
        -------------------------- Channel - Clocking Ports ------------------------                     
        GT7_GTREFCLK0_IN                =>      refclk_bufg,                                             
        ---------------------------- Channel - DRP Ports  --------------------------                     
        GT7_DRPADDR_IN                  =>      (others => '0'),                                         
        GT7_DRPCLK_IN                   =>      '0', --refclk_bufg, (gk)                                 
        GT7_DRPDI_IN                    =>      (others => '0'),                                         
        GT7_DRPDO_OUT                   =>      open,                                                    
        GT7_DRPEN_IN                    =>      '0',                                                     
        GT7_DRPRDY_OUT                  =>      open,                                                    
        GT7_DRPWE_IN                    =>      '0',                                                     
        -------------------------------                                                                  
        GT7_LOOPBACK_IN                 =>      gtx_loopback(7),                                            
        --------------------- RX Initialization and Reset Ports --------------------                     
        GT7_RXUSERRDY_IN                =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Margin Analysis Ports ------------------------                     
        GT7_EYESCANDATAERROR_OUT        =>      open,                                                    
        ------------------------- Receive Ports - CDR Ports ------------------------                     
        GT7_RXCDRLOCK_OUT               =>      open,                                                    
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------                     
        GT7_RXUSRCLK_IN                 =>      gtx_txusrclk2(7),                                           
        GT7_RXUSRCLK2_IN                =>      gtx_txusrclk2(7),                                           
        ------------------ Receive Ports - FPGA RX interface Ports -----------------                     
        GT7_RXDATA_OUT                  =>      gtx_rxdata(7),                                              
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------                     
        GT7_RXDISPERR_OUT               =>      open,                                 
        GT7_RXNOTINTABLE_OUT            =>      open,                                 
        --------------------------- Receive Ports - RX AFE -------------------------                     
        GT7_GTXRXP_IN                   =>      OPTO_KR1_P(7),                                                 
        ------------------------ Receive Ports - RX AFE Ports ----------------------                     
        GT7_GTXRXN_IN                   =>      OPTO_KR1_N(7),                                                 
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------                     
        GT7_RXBYTEISALIGNED_OUT         =>      open,                                 
        GT7_RXBYTEREALIGN_OUT           =>      open,                                 
        GT7_RXCOMMADET_OUT              =>      open,                                 
        --------------------- Receive Ports - RX Equalizer Ports -------------------                     
        GT7_RXDFEAGCHOLD_IN             => 		'0', --(gk !!! added for minipod)                        
        GT7_RXDFELFHOLD_IN              =>      '0',                                                     
        --------------- Receive Ports - RX Fabric Output Control Ports -------------                     
        GT7_RXOUTCLK_OUT                =>      gtx_rxrecclk(7),                                            
        ------------- Receive Ports - RX Initialization and Reset Ports ------------                     
        GT7_GTRXRESET_IN                =>      gtx_rxreset(7),                                             
        GT7_RXPCSRESET_IN               =>      '0',--gtx_rxreset,                                       
        GT7_RXPMARESET_IN               =>      '0',                                                     
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------                     
        GT7_RXCHARISCOMMA_OUT           =>      open,                                       
        GT7_RXCHARISK_OUT               =>      gtx_rxcharisk(7),                                           
        -------------- Receive Ports -RX Initialization and Reset Ports ------------                     
        GT7_RXRESETDONE_OUT             =>      gtx_rxresetdone(7),                                         
        --------------------- TX Initialization and Reset Ports --------------------                     
        GT7_GTTXRESET_IN                =>      gtx_txreset(7),                                             
        GT7_TXUSERRDY_IN                =>      cplllock(7),                                                
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------                     
        GT7_TXUSRCLK_IN                 =>      gtx_txusrclk2(7),                                           
        GT7_TXUSRCLK2_IN                =>      gtx_txusrclk2(7),                                           
        ------------------ Transmit Ports - TX Data Path interface -----------------                     
        GT7_TXDATA_IN                   =>      gtx_txdata(7),                                              
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------                     
        GT7_GTXTXN_OUT                  =>      OPTO_KT1_N(7),                                                 
        GT7_GTXTXP_OUT                  =>      OPTO_KT1_P(7),                                                 
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------                     
        GT7_TXOUTCLK_OUT                =>      gtx_txoutclk(7),                                            
        GT7_TXOUTCLKFABRIC_OUT          =>      open,                                                    
        GT7_TXOUTCLKPCS_OUT             =>      open,                                                    
        --------------------- Transmit Ports - TX Gearbox Ports --------------------                     
        GT7_TXCHARISK_IN                =>      gtx_txcharisk(7),                                           
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------                     
        GT7_TXRESETDONE_OUT             =>      gtx_txresetdone(7),                                         


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT8_CPLLFBCLKLOST_OUT           =>      open,                                                    
        GT8_CPLLLOCK_OUT                =>      cplllock(8),                                                
        GT8_CPLLLOCKDETCLK_IN           =>      '0', --refclk_bufg, (gk)                                 
        GT8_CPLLREFCLKLOST_OUT          =>      open,                                                    
        GT8_CPLLRESET_IN                =>      '0',                                                     
        -------------------------- Channel - Clocking Ports ------------------------                     
        GT8_GTREFCLK0_IN                =>      refclk_bufg,                                             
        ---------------------------- Channel - DRP Ports  --------------------------                     
        GT8_DRPADDR_IN                  =>      (others => '0'),                                         
        GT8_DRPCLK_IN                   =>      '0', --refclk_bufg, (gk)                                 
        GT8_DRPDI_IN                    =>      (others => '0'),                                         
        GT8_DRPDO_OUT                   =>      open,                                                    
        GT8_DRPEN_IN                    =>      '0',                                                     
        GT8_DRPRDY_OUT                  =>      open,                                                    
        GT8_DRPWE_IN                    =>      '0',                                                     
        -------------------------------                                                                  
        GT8_LOOPBACK_IN                 =>      gtx_loopback(8),                                            
        --------------------- RX Initialization and Reset Ports --------------------                     
        GT8_RXUSERRDY_IN                =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Margin Analysis Ports ------------------------                     
        GT8_EYESCANDATAERROR_OUT        =>      open,                                                    
        ------------------------- Receive Ports - CDR Ports ------------------------                     
        GT8_RXCDRLOCK_OUT               =>      open,                                                    
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------                     
        GT8_RXUSRCLK_IN                 =>      gtx_txusrclk2(8),                                           
        GT8_RXUSRCLK2_IN                =>      gtx_txusrclk2(8),                                           
        ------------------ Receive Ports - FPGA RX interface Ports -----------------                     
        GT8_RXDATA_OUT                  =>      gtx_rxdata(8),                                              
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------                     
        GT8_RXDISPERR_OUT               =>      open,                   
        GT8_RXNOTINTABLE_OUT            =>      open,                   
        --------------------------- Receive Ports - RX AFE -------------------------                     
        GT8_GTXRXP_IN                   =>      OPTO_KR1_P(8),                                                 
        ------------------------ Receive Ports - RX AFE Ports ----------------------                     
        GT8_GTXRXN_IN                   =>      OPTO_KR1_N(8),                                                 
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------                     
        GT8_RXBYTEISALIGNED_OUT         =>      open,                                  
        GT8_RXBYTEREALIGN_OUT           =>      open,                                  
        GT8_RXCOMMADET_OUT              =>      open,                                  
        --------------------- Receive Ports - RX Equalizer Ports -------------------                     
        GT8_RXDFEAGCHOLD_IN             => 		'0', --(gk !!! added for minipod)                        
        GT8_RXDFELFHOLD_IN              =>      '0',                                                     
        --------------- Receive Ports - RX Fabric Output Control Ports -------------                     
        GT8_RXOUTCLK_OUT                =>      gtx_rxrecclk(8),                                            
        ------------- Receive Ports - RX Initialization and Reset Ports ------------                     
        GT8_GTRXRESET_IN                =>      gtx_rxreset(8),                                             
        GT8_RXPCSRESET_IN               =>      '0',--gtx_rxreset,                                       
        GT8_RXPMARESET_IN               =>      '0',                                                     
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------                     
        GT8_RXCHARISCOMMA_OUT           =>      open,                                       
        GT8_RXCHARISK_OUT               =>      gtx_rxcharisk(8),                                           
        -------------- Receive Ports -RX Initialization and Reset Ports ------------                     
        GT8_RXRESETDONE_OUT             =>      gtx_rxresetdone(8),                                         
        --------------------- TX Initialization and Reset Ports --------------------                     
        GT8_GTTXRESET_IN                =>      gtx_txreset(8),                                             
        GT8_TXUSERRDY_IN                =>      cplllock(8),                                                
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------                     
        GT8_TXUSRCLK_IN                 =>      gtx_txusrclk2(8),                                           
        GT8_TXUSRCLK2_IN                =>      gtx_txusrclk2(8),                                           
        ------------------ Transmit Ports - TX Data Path interface -----------------                     
        GT8_TXDATA_IN                   =>      gtx_txdata(8),                                              
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------                     
        GT8_GTXTXN_OUT                  =>      OPTO_KT1_N(8),                                                 
        GT8_GTXTXP_OUT                  =>      OPTO_KT1_P(8),                                                 
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------                     
        GT8_TXOUTCLK_OUT                =>      gtx_txoutclk(8),                                            
        GT8_TXOUTCLKFABRIC_OUT          =>      open,                                                    
        GT8_TXOUTCLKPCS_OUT             =>      open,                                                    
        --------------------- Transmit Ports - TX Gearbox Ports --------------------                     
        GT8_TXCHARISK_IN                =>      gtx_txcharisk(8),                                           
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------                     
        GT8_TXRESETDONE_OUT             =>      gtx_txresetdone(8),                                         


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT9_CPLLFBCLKLOST_OUT          =>      open,                                                    
        GT9_CPLLLOCK_OUT               =>      cplllock(9),                                                
        GT9_CPLLLOCKDETCLK_IN          =>      '0', --refclk_bufg, (gk)                                 
        GT9_CPLLREFCLKLOST_OUT         =>      open,                                                    
        GT9_CPLLRESET_IN               =>      '0',                                                     
        -------------------------- Chanel - Clocking Ports ------------------------                     
        GT9_GTREFCLK0_IN               =>      refclk_bufg,                                             
        ---------------------------- Chnnel - DRP Ports  --------------------------                     
        GT9_DRPADDR_IN                 =>      (others => '0'),                                         
        GT9_DRPCLK_IN                  =>      '0', --refclk_bufg, (gk)                                 
        GT9_DRPDI_IN                   =>      (others => '0'),                                         
        GT9_DRPDO_OUT                  =>      open,                                                    
        GT9_DRPEN_IN                   =>      '0',                                                     
        GT9_DRPRDY_OUT                 =>      open,                                                    
        GT9_DRPWE_IN                   =>      '0',                                                     
        -------------------------------                                                                 
        GT9_LOOPBACK_IN                =>      gtx_loopback(9),                                            
        --------------------- RX Initiaization and Reset Ports --------------------                     
        GT9_RXUSERRDY_IN               =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Mrgin Analysis Ports ------------------------                     
        GT9_EYESCANDATAERROR_OUT       =>      open,                                                    
        ------------------------- Receie Ports - CDR Ports ------------------------                     
        GT9_RXCDRLOCK_OUT              =>      open,                                                    
        ------------------ Receive Port - FPGA RX Interface Ports -----------------                     
        GT9_RXUSRCLK_IN                =>      gtx_txusrclk2(9),                                           
        GT9_RXUSRCLK2_IN               =>      gtx_txusrclk2(9),                                           
        ------------------ Receive Port - FPGA RX interface Ports -----------------                     
        GT9_RXDATA_OUT                 =>      gtx_rxdata(9),                                              
        ------------------ Receive Port - RX 8B/10B Decoder Ports -----------------                     
        GT9_RXDISPERR_OUT              =>      open,                             
        GT9_RXNOTINTABLE_OUT           =>      open,                             
        --------------------------- Recive Ports - RX AFE -------------------------                     
        GT9_GTXRXP_IN                  =>      OPTO_KR1_P(9),                                                 
        ------------------------ Receiv Ports - RX AFE Ports ----------------------                     
        GT9_GTXRXN_IN                  =>      OPTO_KR1_N(9),                                                 
        -------------- Receive Ports - X Byte and Word Alignment Ports ------------                     
        GT9_RXBYTEISALIGNED_OUT        =>      open,                                     
        GT9_RXBYTEREALIGN_OUT          =>      open,                                     
        GT9_RXCOMMADET_OUT             =>      open,                                     
        --------------------- Receive Prts - RX Equalizer Ports -------------------                     
        GT9_RXDFEAGCHOLD_IN            => 		'0', --(gk !!! added for minipod)                        
        GT9_RXDFELFHOLD_IN             =>      '0',                                                     
        --------------- Receive Ports -RX Fabric Output Control Ports -------------                     
        GT9_RXOUTCLK_OUT               =>      gtx_rxrecclk(9),                                            
        ------------- Receive Ports - R Initialization and Reset Ports ------------                     
        GT9_GTRXRESET_IN               =>      gtx_rxreset(9),                                             
        GT9_RXPCSRESET_IN              =>      '0',--gtx_rxreset,                                       
        GT9_RXPMARESET_IN              =>      '0',                                                     
        ------------------- Receive Pors - RX8B/10B Decoder Ports -----------------                     
        GT9_RXCHARISCOMMA_OUT          =>      open,                                       
        GT9_RXCHARISK_OUT              =>      gtx_rxcharisk(9),                                           
        -------------- Receive Ports -R Initialization and Reset Ports ------------                     
        GT9_RXRESETDONE_OUT            =>      gtx_rxresetdone(9),                                         
        --------------------- TX Initiaization and Reset Ports --------------------                     
        GT9_GTTXRESET_IN               =>      gtx_txreset(9),                                             
        GT9_TXUSERRDY_IN               =>      cplllock(9),                                                
        ------------------ Transmit Pors - FPGA TX Interface Ports ----------------                     
        GT9_TXUSRCLK_IN                =>      gtx_txusrclk2(9),                                           
        GT9_TXUSRCLK2_IN               =>      gtx_txusrclk2(9),                                           
        ------------------ Transmit Pors - TX Data Path interface -----------------                     
        GT9_TXDATA_IN                  =>      gtx_txdata(9),                                              
        ---------------- Transmit Ports- TX Driver and OOB signaling --------------                     
        GT9_GTXTXN_OUT                 =>      OPTO_KT1_N(9),                                                 
        GT9_GTXTXP_OUT                 =>      OPTO_KT1_P(9),                                                 
        ----------- Transmit Ports - TXFabric Clock Output Control Ports ----------                     
        GT9_TXOUTCLK_OUT               =>      gtx_txoutclk(9),                                            
        GT9_TXOUTCLKFABRIC_OUT         =>      open,                                                    
        GT9_TXOUTCLKPCS_OUT            =>      open,                                                    
        --------------------- Transmit orts - TX Gearbox Ports --------------------                     
        GT9_TXCHARISK_IN               =>      gtx_txcharisk(9),                                           
        ------------- Transmit Ports - X Initialization and Reset Ports -----------                     
        GT9_TXRESETDONE_OUT            =>      gtx_txresetdone(9),                                         


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT10_CPLLFBCLKLOST_OUT          =>      open,                                                    
        GT10_CPLLLOCK_OUT               =>      cplllock(10),                                                
        GT10_CPLLLOCKDETCLK_IN          =>      '0', --refclk_bufg, (gk)                                 
        GT10_CPLLREFCLKLOST_OUT         =>      open,                                                    
        GT10_CPLLRESET_IN               =>      '0',                                                     
        -------------------------- Channel - Clocking Ports ------------------------                     
        GT10_GTREFCLK0_IN               =>      refclk_bufg,                                             
        ---------------------------- Channel - DRP Ports  --------------------------                     
        GT10_DRPADDR_IN                 =>      (others => '0'),                                         
        GT10_DRPCLK_IN                  =>      '0', --refclk_bufg, (gk)                                 
        GT10_DRPDI_IN                   =>      (others => '0'),                                         
        GT10_DRPDO_OUT                  =>      open,                                                    
        GT10_DRPEN_IN                   =>      '0',                                                     
        GT10_DRPRDY_OUT                 =>      open,                                                    
        GT10_DRPWE_IN                   =>      '0',                                                     
        -------------------------------                                                                  
        GT10_LOOPBACK_IN                =>      gtx_loopback(10),                                            
        --------------------- RX Initialization and Reset Ports --------------------                     
        GT10_RXUSERRDY_IN               =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Margin Analysis Ports ------------------------                     
        GT10_EYESCANDATAERROR_OUT       =>      open,                                                    
        ------------------------- Receive Ports - CDR Ports ------------------------                     
        GT10_RXCDRLOCK_OUT              =>      open,                                                    
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------                     
        GT10_RXUSRCLK_IN                =>      gtx_txusrclk2(10),                                           
        GT10_RXUSRCLK2_IN               =>      gtx_txusrclk2(10),                                           
        ------------------ Receive Ports - FPGA RX interface Ports -----------------                     
        GT10_RXDATA_OUT                 =>      gtx_rxdata(10),                                              
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------                     
        GT10_RXDISPERR_OUT              =>      open,                      
        GT10_RXNOTINTABLE_OUT           =>      open,                      
        --------------------------- Receive Ports - RX AFE -------------------------                     
        GT10_GTXRXP_IN                  =>      OPTO_KR1_P(10),                                                 
        ------------------------ Receive Ports - RX AFE Ports ----------------------                     
        GT10_GTXRXN_IN                  =>      OPTO_KR1_N(10),                                                 
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------                     
        GT10_RXBYTEISALIGNED_OUT        =>      open,                                       
        GT10_RXBYTEREALIGN_OUT          =>      open,                                       
        GT10_RXCOMMADET_OUT             =>      open,                                       
        --------------------- Receive Ports - RX Equalizer Ports -------------------                     
        GT10_RXDFEAGCHOLD_IN            => 		'0', --(gk !!! added for minipod)                        
        GT10_RXDFELFHOLD_IN             =>      '0',                                                     
        --------------- Receive Ports - RX Fabric Output Control Ports -------------                     
        GT10_RXOUTCLK_OUT               =>      gtx_rxrecclk(10),                                            
        ------------- Receive Ports - RX Initialization and Reset Ports ------------                     
        GT10_GTRXRESET_IN               =>      gtx_rxreset(10),                                             
        GT10_RXPCSRESET_IN              =>      '0',--gtx_rxreset,                                       
        GT10_RXPMARESET_IN              =>      '0',                                                     
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------                     
        GT10_RXCHARISCOMMA_OUT          =>      open,                                       
        GT10_RXCHARISK_OUT              =>      gtx_rxcharisk(10),                                           
        -------------- Receive Ports -RX Initialization and Reset Ports ------------                     
        GT10_RXRESETDONE_OUT            =>      gtx_rxresetdone(10),                                         
        --------------------- TX Initialization and Reset Ports --------------------                     
        GT10_GTTXRESET_IN               =>      gtx_txreset(10),                                             
        GT10_TXUSERRDY_IN               =>      cplllock(10),                                                
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------                     
        GT10_TXUSRCLK_IN                =>      gtx_txusrclk2(10),                                           
        GT10_TXUSRCLK2_IN               =>      gtx_txusrclk2(10),                                           
        ------------------ Transmit Ports - TX Data Path interface -----------------                     
        GT10_TXDATA_IN                  =>      gtx_txdata(10),                                              
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------                     
        GT10_GTXTXN_OUT                 =>      OPTO_KT1_N(10),                                                 
        GT10_GTXTXP_OUT                 =>      OPTO_KT1_P(10),                                                 
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------                     
        GT10_TXOUTCLK_OUT               =>      gtx_txoutclk(10),                                            
        GT10_TXOUTCLKFABRIC_OUT         =>      open,                                                    
        GT10_TXOUTCLKPCS_OUT            =>      open,                                                    
        --------------------- Transmit Ports - TX Gearbox Ports --------------------                     
        GT10_TXCHARISK_IN               =>      gtx_txcharisk(10),                                           
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------                     
        GT10_TXRESETDONE_OUT            =>      gtx_txresetdone(10),                                         


     --_____________________________________________________________________
     --_____________________________________________________________________
          --____________________________CHANNEL PORTS________________________________
        --------------------------------- CPLL Ports -------------------------------
        GT11_CPLLFBCLKLOST_OUT          =>      open,                                                    
        GT11_CPLLLOCK_OUT               =>      cplllock(11),                                                
        GT11_CPLLLOCKDETCLK_IN          =>      '0', --refclk_bufg, (gk)                                 
        GT11_CPLLREFCLKLOST_OUT         =>      open,                                                    
        GT11_CPLLRESET_IN               =>      '0',                                                     
        -------------------------- Channel - Clocking Ports ------------------------                     
        GT11_GTREFCLK0_IN               =>      refclk_bufg,                                             
        ---------------------------- Channel - DRP Ports  --------------------------                     
        GT11_DRPADDR_IN                 =>      (others => '0'),                                         
        GT11_DRPCLK_IN                  =>      '0', --refclk_bufg, (gk)                                 
        GT11_DRPDI_IN                   =>      (others => '0'),                                         
        GT11_DRPDO_OUT                  =>      open,                                                    
        GT11_DRPEN_IN                   =>      '0',                                                     
        GT11_DRPRDY_OUT                 =>      open,                                                    
        GT11_DRPWE_IN                   =>      '0',                                                     
        -------------------------------                                                                  
        GT11_LOOPBACK_IN                =>      gtx_loopback(11),                                            
        --------------------- RX Initialization and Reset Ports --------------------                     
        GT11_RXUSERRDY_IN               =>      CLK_LOCKED_IN,                                              
        -------------------------- RX Margin Analysis Ports ------------------------                     
        GT11_EYESCANDATAERROR_OUT       =>      open,                                                    
        ------------------------- Receive Ports - CDR Ports ------------------------                     
        GT11_RXCDRLOCK_OUT              =>      open,                                                    
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------                     
        GT11_RXUSRCLK_IN                =>      gtx_txusrclk2(11),                                           
        GT11_RXUSRCLK2_IN               =>      gtx_txusrclk2(11),                                           
        ------------------ Receive Ports - FPGA RX interface Ports -----------------                     
        GT11_RXDATA_OUT                 =>      gtx_rxdata(11),                                              
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------                     
        GT11_RXDISPERR_OUT              =>      open,                         
        GT11_RXNOTINTABLE_OUT           =>      open,                         
        --------------------------- Receive Ports - RX AFE -------------------------                     
        GT11_GTXRXP_IN                  =>      OPTO_KR1_P(11),                                                 
        ------------------------ Receive Ports - RX AFE Ports ----------------------                     
        GT11_GTXRXN_IN                  =>      OPTO_KR1_N(11),                                                 
        -------------- Receive Ports - RX Byte and WorD Alignment Ports ------------                     
        GT11_RXBYTEISALIGNED_OUT        =>      open,                                     
        GT11_RXBYTEREALIGN_OUT          =>      open,                                       
        GT11_RXCOMMADET_OUT             =>      open,                                          
        --------------------- Receive Ports - RX Equalizer Ports -------------------                     
        GT11_RXDFEAGCHOLD_IN            => 		'0', --(gk !!! added for minipod)                        
        GT11_RXDFELFHOLD_IN             =>      '0',                                                     
        --------------- Receive Ports - RX Fabric Output Control Ports -------------                     
        GT11_RXOUTCLK_OUT               =>      gtx_rxrecclk(11),                                            
        ------------- Receive Ports - RX Initialization and Reset Ports ------------                     
        GT11_GTRXRESET_IN               =>      gtx_rxreset(11),                                             
        GT11_RXPCSRESET_IN              =>      '0',--gtx_rxreset,                                       
        GT11_RXPMARESET_IN              =>      '0',                                                     
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------                     
        GT11_RXCHARISCOMMA_OUT          =>      open,                                       
        GT11_RXCHARISK_OUT              =>      gtx_rxcharisk(11),                                           
        -------------- Receive Ports -RX Initialization and Reset Ports ------------                     
        GT11_RXRESETDONE_OUT            =>      gtx_rxresetdone(11),                                         
        --------------------- TX Initialization and Reset Ports --------------------                     
        GT11_GTTXRESET_IN               =>      gtx_txreset(11),                                             
        GT11_TXUSERRDY_IN               =>      cplllock(11),                                                
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------                     
        GT11_TXUSRCLK_IN                =>      gtx_txusrclk2(11),                                           
        GT11_TXUSRCLK2_IN               =>      gtx_txusrclk2(11),                                           
        ------------------ Transmit Ports - TX Data Path interface -----------------                     
        GT11_TXDATA_IN                  =>      gtx_txdata(11),                                              
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------                     
        GT11_GTXTXN_OUT                 =>      OPTO_KT1_N(11),                                                 
        GT11_GTXTXP_OUT                 =>      OPTO_KT1_P(11),                                                 
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------                     
        GT11_TXOUTCLK_OUT               =>      gtx_txoutclk(11),                                            
        GT11_TXOUTCLKFABRIC_OUT         =>      open,                                                    
        GT11_TXOUTCLKPCS_OUT            =>      open,                                                    
        --------------------- Transmit Ports - TX Gearbox Ports --------------------                     
        GT11_TXCHARISK_IN               =>      gtx_txcharisk(11),                                           
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------                     
        GT11_TXRESETDONE_OUT            =>      gtx_txresetdone(11),                                         


    
    --____________________________COMMON PORTS________________________________
    ---------------------- Common Block  - Ref Clock Ports ---------------------
        GT0_GTREFCLK0_COMMON_IN         =>      gtx_txusrclk2(0),
    ------------------------- Common Block - QPLL Ports ------------------------
        GT0_QPLLLOCK_OUT                =>      open,
        GT0_QPLLLOCKDETCLK_IN           =>    	'0',
        GT0_QPLLREFCLKLOST_OUT          =>      open,
        GT0_QPLLRESET_IN                =>      '0',

    
    --____________________________COMMON PORTS________________________________
    ---------------------- Common Block  - Ref Clock Ports ---------------------
        GT1_GTREFCLK0_COMMON_IN         =>      gtx_txusrclk2(4),                       
    ------------------------- Common Block - QPLL Ports ------------------------     
        GT1_QPLLLOCK_OUT                =>      open,                                
        GT1_QPLLLOCKDETCLK_IN           =>      '0',                                 
        GT1_QPLLREFCLKLOST_OUT          =>      open,                                
        GT1_QPLLRESET_IN                =>      '0',                                 

    
    --____________________________COMMON PORTS________________________________
    ---------------------- Common Block  - Ref Clock Ports ---------------------
        GT2_GTREFCLK0_COMMON_IN         =>      gtx_txusrclk2(8),                       
    ------------------------- Common Block - QPLL Ports ------------------------     
        GT2_QPLLLOCK_OUT                =>      open,                                
        GT2_QPLLLOCKDETCLK_IN           =>      '0',                                 
        GT2_QPLLREFCLKLOST_OUT          =>      open,                                
        GT2_QPLLRESET_IN                =>      '0'
    );
    
    
    LINK_MANAGE_PROC_GEN : for i in 0 to 11 generate
	 
	 	txoutclk_bufg0_i : BUF port map (I => gtx_txoutclk(i), O => gtx_txusrclk2(i));
		rxrecclk_bufg1_i : BUFH port map (I => gtx_txoutclk(i), --gtx_rxrecclk,
												  O => gtx_rxusrclk2(i));
												  
		tlk_rxclk(i)  <= GTX_RXUSRCLK2(i);
		tlk_gtxclk(i) <= GTX_TXUSRCLK2(i);
    		  
		  process(gtx_rxusrclk2(i))
		  begin
		    if rising_edge(gtx_rxusrclk2(i)) then
		      gtx_rxresetdone_i_r(i) <= gtx_rxresetdone(i);
		    end if;
		  end process;
		
		  process(gtx_rxusrclk2(i), gtx_rxresetdone_i_r(i))
		  begin
		    if (gtx_rxresetdone_i_r(i) = '0') then
		      gtx_rxresetdone_r(i)  <= '0';
		      gtx_rxresetdone_r2(i) <= '0';
		    elsif rising_edge(gtx_rxusrclk2(i)) then
		      gtx_rxresetdone_r(i)  <= gtx_rxresetdone_i_r(i);
		      gtx_rxresetdone_r2(i) <= gtx_rxresetdone_r(i);
		    end if;
		  end process;
		
		  process(gtx_rxusrclk2(i))
		  begin
		    if rising_edge(gtx_rxusrclk2(i)) then
		      gtx_rxresetdone_r3(i) <= gtx_rxresetdone_r2(i);
		    end if;
		  end process;
		
		  process(gtx_txusrclk2(i), gtx_txresetdone(i))
		  begin
		    if(gtx_txresetdone(i) = '0') then
		      gtx_txresetdone_r(i)  <= '0';
		      gtx_txresetdone_r2(i) <= '0';
		    elsif rising_edge(gtx_txusrclk2(i)) then
		      gtx_txresetdone_r(i)  <= gtx_txresetdone(i);
		      gtx_txresetdone_r2(i) <= gtx_txresetdone_r(i);
		    end if;
		  end process;

		  gtx_rxreset(i)    <= GTX_RESET(i);--tied_to_ground;
		  gtx_txreset(i)    <= GTX_RESET(i);--tied_to_ground;
		
		  -- resets for the TLK-GTX interface
		  gtx_tlk_reset(i) <= not gtx_txresetdone_r2(i) or not gtx_rxresetdone_r3(i) or GTX_RESET(i) or not cplllock(i);
		
		  gtx_resetdone(i) <= gtx_txresetdone_r2(i) and gtx_rxresetdone_r3(i);
		  
		  lsc_reset(i) <= gtx_resetdone(i);
    
    end generate LINK_MANAGE_PROC_GEN;
                      

--Gen_ros_roib_sel_table1 : for i in 0 to NUMBER_OF_OUTPUT_LINKS_TO_ROS -1 generate
--begin
--	ros_roib_sel_table(i) <= SLINK_FORMAT_VERSION_ROS;
--end generate;
--Gen_ros_roib_sel_table2 : for i in NUMBER_OF_OUTPUT_LINKS_TO_ROS to NUMBER_OF_OUTPUT_LINKS -1 generate
--begin
--	ros_roib_sel_table(i) <= SLINK_FORMAT_VERSION_ROIB;
--end generate;



rod_receiver_rst <= ROD_RESET or not slink_ready;

DEBUG_OUT(47 downto 0) <= dbg_slink;
DEBUG_OUT(255 downto 48) <= (others => '0');

end rtl;
