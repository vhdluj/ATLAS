library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
use work.ipbus.ALL;

use work.rod_l1_topo_types_const.all;

entity top_L1TopoController is
generic (
	LINKS_NUMBER : integer range 0 to 40 := 8;
	SIMULATION  : boolean := false
		  );
port(
	-- 125 mhz 
	gt_clkp, gt_clkn: in std_logic;
	
	-- ipbus eth
	gt_txp, gt_txn: out std_logic;
	gt_rxp, gt_rxn: in std_logic;
	
	-- 40 mhz
	GCK2_IN_P, GCK2_IN_N: in std_logic;
	
	-- link minipod (3)
	OPTO_KR1_P, OPTO_KR1_N : in std_logic;
	OPTO_KT1_P, OPTO_KT1_N : out std_logic;
	
	CTRLBUS_U1_IN_P, CTRLBUS_U1_IN_N: in std_logic_vector(2 downto 0);
	CTRLBUS_U2_IN_P, CTRLBUS_U2_IN_N: in std_logic_vector(2 downto 0);
	CTRLBUS_U1_OUT_P, CTRLBUS_U1_OUT_N: out std_logic_vector(4 downto 0);
	CTRLBUS_U2_OUT_P, CTRLBUS_U2_OUT_N: out std_logic_vector(4 downto 0);
	
	DATA_U1_CTRL_OUT_P, DATA_U1_CTRL_OUT_N : out std_logic;
	DATA_U2_CTRL_OUT_P, DATA_U2_CTRL_OUT_N : out std_logic;
	DATA_U2_SYNC_OUT_P, DATA_U2_SYNC_OUT_N : out std_logic;
	DATA_BANK17_IN_P, DATA_BANK17_IN_N : in std_logic_vector(1 downto 0);
	DATA_BANK32_IN_P, DATA_BANK32_IN_N : in std_logic_vector(4 downto 0);
	DATA_BANK18_IN_P, DATA_BANK18_IN_N : in std_logic_vector(7 downto 0);
	DATA_BANK16_IN_P, DATA_BANK16_IN_N : in std_logic_vector(6 downto 0);
	
	PHY_RESET_OUT_N: out std_logic;
	LED_OUT: out STD_LOGIC_VECTOR(15 downto 0)--;
	
--	SFP3_RX_N, SFP3_RX_P : in std_logic;
--	SFP3_TX_N, SFP3_TX_P : out std_logic
	);

end top_L1TopoController;

architecture rtl of top_L1TopoController is

	constant ddr_lines_on_bank16 : positive := 7;
	constant ddr_lines_on_bank17 : positive := 2;
	constant ddr_lines_on_bank18 : positive := 8;
	constant ddr_lines_on_bank32 : positive := 5;

	signal clk125_fr, clk125, clk100, ipb_clk, clk_locked, locked, eth_locked: std_logic;
	signal rst_125, rst_ipb, rst_eth, onehz: std_logic;
	signal mac_tx_data, mac_rx_data: std_logic_vector(7 downto 0);
	signal mac_tx_valid, mac_tx_last, mac_tx_error, mac_tx_ready, mac_rx_valid, mac_rx_last, mac_rx_error: std_logic;
	signal ipb_master_out : ipb_wbus;
	signal ipb_master_in : ipb_rbus;
	signal mac_addr: std_logic_vector(47 downto 0);
	signal ip_addr: std_logic_vector(31 downto 0);
	signal pkt_rx, pkt_tx, pkt_rx_led, pkt_tx_led, sys_rst: std_logic;	
	signal phy_reset: std_logic;
	signal pcs_pma_status: std_logic_vector(15 downto 0);
	signal led_speedis1000: std_logic;
	
	signal gck2_mmcm_locked: std_logic;
	signal gck2_clk40: std_logic;
	signal gck2_clk80: std_logic;
	signal idelayctrl_refclk300: std_logic;
	
	signal ipb_write_U1, ipb_write_U2: ipb_wbus;
	signal ipb_read_U1, ipb_read_U2: ipb_rbus;
	
	signal ctrlbus_idelay_value: std_logic_vector(29 downto 0);
	signal ctrlbus_idelay_load: std_logic_vector(5 downto 0);
	
	signal ddr_clk_80, ddr_clk_400 : std_logic;
	
	signal ddr_receivers_synced_bank18 : std_logic_vector(ddr_lines_on_bank18 - 1 downto 0);
	signal ddr_receivers_synced_bank16 : std_logic_vector(ddr_lines_on_bank16 - 1 downto 0);
	signal ddr_receivers_synced_bank32 : std_logic_vector(ddr_lines_on_bank32 - 1 downto 0);
	signal ddr_receivers_synced_bank17 : std_logic_vector(ddr_lines_on_bank17 - 1 downto 0);
	
	signal ddr_rst, clk_40 : std_logic;
	signal v_reset : std_logic;
	
	signal ctrlbus_32_clk, ctrlbus_32_clkx8 : std_logic;
	signal ctrlbus_17_clk, ctrlbus_17_clkx8 : std_logic;
	
	signal ddr_data_from_u2 : std_logic_vector(8 * 8 - 1 downto 0);
	signal ddr_dv_from_u2 : std_logic_vector(7 downto 0);
	signal ddr_sync_from_u2 : std_logic_vector(7 downto 0);
	signal ddr_data_from_bank16 : std_logic_vector(ddr_lines_on_bank16 * 8 - 1 downto 0);
	signal ddr_data_from_bank18 : std_logic_vector(ddr_lines_on_bank18 * 8 - 1 downto 0);
	signal ddr_dv_from_bank16 : std_logic_vector(ddr_lines_on_bank16 - 1 downto 0);
	signal ddr_dv_from_bank18 : std_logic_vector(ddr_lines_on_bank18 - 1 downto 0);

	signal ddr_kctrl_from_bank16 : std_logic_vector(ddr_lines_on_bank16 - 1 downto 0);
	signal ddr_kctrl_from_bank18 : std_logic_vector(ddr_lines_on_bank18 - 1 downto 0);

	signal hola_ldown_n : std_logic;
	
	
	signal ros_roi_bus_assignment_sig : in_cntrl_array;
	signal number_of_slices_out_l     : slice_parameters_array_u;
	signal lvl0_offset_out_l          : slice_parameters_array_u;
	signal data_out_l                 : out_data_array;
	signal data_valid_in_l            : std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
	signal type_assignment_in_l       : slice_parameters_array_u := (others => (others => '0'));
	signal actual_bus_number_out_l    : bus_number_array;

	signal ddr_synced : std_logic;
	signal clk_200 : std_logic;
	signal links_synced : std_logic_vector(LINKS_NUMBER - 1 downto 0);
	signal ddr_data : std_logic_vector(LINKS_NUMBER*8-1 downto 0);
	signal ddr_dv : std_logic_vector(LINKS_NUMBER-1 downto 0);
	signal ones : std_logic_vector(LINKS_NUMBER-1 downto 0);
	signal ddr_kctrl : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);
	
	signal rod_rdy, rod_re, ram_we : std_logic;
	signal ram_addr : std_logic_vector(9 downto 0);
	signal rod_data, ram_data : std_logic_vector(31 downto 0);
	signal rst_from_bank18, rst_from_bank16 : std_logic;

	signal soft_rst : std_logic;
	
	signal dbg_ddr_state_from18   : std_logic_vector(ddr_lines_on_bank18 * 4 - 1 downto 0);
	signal dbg_ddr_reg_from18     : std_logic_vector(ddr_lines_on_bank18 * 10 - 1 downto 0);
	signal dbg_ddr_bitslip_from18 : std_logic_vector(ddr_lines_on_bank18 * 4 - 1 downto 0);
	signal dbg_ddr_inc_from18     : std_logic_vector(ddr_lines_on_bank18 * 8 - 1 downto 0);
	signal dbg_ddr_pause_from18   : std_logic_vector(ddr_lines_on_bank18 * 8 - 1 downto 0);
	signal dbg_ddr_step_from18    : std_logic_vector(ddr_lines_on_bank18 * 8 - 1 downto 0);
	signal dbg_ddr_retry_from18   : std_logic_vector(ddr_lines_on_bank18 * 8 - 1 downto 0);
	
	signal dbg_ddr_state_from16   : std_logic_vector(ddr_lines_on_bank16 * 4 - 1 downto 0);
	signal dbg_ddr_reg_from16     : std_logic_vector(ddr_lines_on_bank16 * 10 - 1 downto 0);
	signal dbg_ddr_bitslip_from16 : std_logic_vector(ddr_lines_on_bank16 * 4 - 1 downto 0);
	signal dbg_ddr_inc_from16     : std_logic_vector(ddr_lines_on_bank16 * 8 - 1 downto 0);
	signal dbg_ddr_pause_from16   : std_logic_vector(ddr_lines_on_bank16 * 8 - 1 downto 0);
	signal dbg_ddr_step_from16    : std_logic_vector(ddr_lines_on_bank16 * 8 - 1 downto 0);
	signal dbg_ddr_retry_from16   : std_logic_vector(ddr_lines_on_bank16 * 8 - 1 downto 0);
	
	signal dbg_ddr_state   : std_logic_vector(LINKS_NUMBER * 4 - 1 downto 0);
	signal dbg_ddr_reg     : std_logic_vector(LINKS_NUMBER * 10 - 1 downto 0);
	signal dbg_ddr_bitslip : std_logic_vector(LINKS_NUMBER * 4 - 1 downto 0);
	signal dbg_ddr_inc     : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	signal dbg_ddr_pause   : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	signal dbg_ddr_step    : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	signal dbg_ddr_retry   : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	
	signal ddr_val_bank18       : std_logic_vector(ddr_lines_on_bank18 * 5 - 1 downto 0);
	signal ddr_val_load_bank18  : std_logic_vector(ddr_lines_on_bank18 - 1 downto 0);
	signal ddr_val_out_bank18   : std_logic_vector(ddr_lines_on_bank18 * 5 - 1 downto 0);
	signal ddr_val_bank16       : std_logic_vector(ddr_lines_on_bank16 * 5 - 1 downto 0);
	signal ddr_val_load_bank16  : std_logic_vector(ddr_lines_on_bank16 - 1 downto 0);
	signal ddr_val_out_bank16   : std_logic_vector(ddr_lines_on_bank16 * 5 - 1 downto 0);
	
	signal ddr_val              : std_logic_vector(LINKS_NUMBER * 5 - 1 downto 0);
	signal ddr_val_load         : std_logic_vector(LINKS_NUMBER - 1 downto 0);
	
	signal clk_400, clk_80, clk_fb, clk_400_ub, clk_80_ub, local_dcm_locked : std_logic;
	
	signal ddr_clk_bank18, ddr_clk_bank16 : std_logic;
	signal icon_control0, icon_control1 : std_logic_vector(35 downto 0);
	signal ila_trg : std_logic_vector(254 downto 0);
	
	-- SLINK signals
--	type state is (working, reseting, initializing);
--	signal holaInitNS, holaInitCS : state := working;
--	signal LFF_N_sgn  : std_logic;
--	signal LRL_sgn    : std_logic_vector(3 downto 0);
--	signal LDOWN_N_sgn: std_logic;
--	signal uwen_cntr : std_logic_vector(2 downto 0) := "000";
--	signal uwen_allowed_n : std_logic;
--	signal ureset_n_sgn : std_logic:= '0';
--	signal ctr : std_logic_vector(29 downto 0) := b"00_0000_0000_0000_0000_0000_0000_0000";
	
	signal enable_in_sgn : std_logic  := '0';
	signal ready_out_sgn : std_logic  := '0';  
	signal busy_out_sgn      : std_logic  := '0';  
	signal ureset_in_sgn     : std_logic  := '0';  
	signal payload_in_sgn 	 : std_logic_vector (31 downto 0)  := (others => '0');
	signal cnt 				 : std_logic_vector(7 downto 0)  := x"00";
	signal runNumber_sgn	 : std_logic_vector(23 downto 0)  := x"00_0000";
	signal numberOfDataEl_sgn	 : std_logic_vector(15 downto 0)  := x"0001";
	signal pauseCnt : std_logic_vector(31 downto 0)   :=  (others => '0');
	signal wordsCnt : std_logic_vector(3 downto 0)  := (others => '0');
	signal rstCnt : std_logic_vector(28 downto 0) := (others => '0');
	signal rstCnt_sgn : std_logic := '0';
	
	type state_type is (idle,reset,prepare2send, send , pause);
	signal state, n_state : state_type  := idle;
	-- end of SLINK signals
	
	signal gte2_clk_125 : std_logic;

begin
 ones <= (others => '1');

--##################   ROD

--SET_DUMMY_ASSIGNMENTS: for i in 0 to ros_roi_bus_assignment_sig'high generate
--  ros_roi_bus_assignment_sig(i) <= std_logic_vector(to_unsigned(i mod 12,ros_roi_bus_assignment_sig(0)'length));
--end generate SET_DUMMY_ASSIGNMENTS;
--
--GENERATE_V1_V2_DDR_TO_ROD: for i in 0 to 0 generate
--  DDR_TO_ROD_INST: entity work.ddr_to_rod
--  port map (
--    RESET                       => ddr_rst,
--    DATA_IN_CLK                 => gck2_clk80, --clk_80,
--    DATA_OUT_CLK                => gck2_clk80, --clk_80,
--    LVL1_FULL_THR               => "11111110",
--    L1_BUSY                     => open,
--    DDR_ROS_ROI_IN_DATA         => ddr_data((i+1)*64-1 downto i*64),
--    DATA_VALID_IN               => ddr_dv(0),
--    SPECIAL_CHAR_IN             => ddr_kctrl(0),
--    OUT_DATA                    => data_out_l,
--    DATA_VALID_OUT              => data_valid_in_l,
--    ACTUAL_BUS_NUMBER_OUT       => actual_bus_number_out_l,
--    NUMBER_OF_SLICES_OUT        => number_of_slices_out_l,
--    LVL0_OFFSET_OUT             => lvl0_offset_out_l,
--    ROS_ROI_BUS_ASSIGNMENT      => ros_roi_bus_assignment_sig,
--    ROS_ROI_BUS_ASSIGNMENT_DONE => not sys_rst,--ROS_ROI_BUS_ASSIGNMENT_DONE,
--    ROS_ROI_OUT_DATA_CNTR       => open,--ROS_ROI_OUT_DATA_CNTR,
--    START_OF_FRAME              => open,
--    END_OF_FRAME                => open);
--end generate GENERATE_V1_V2_DDR_TO_ROD;
--
--
--set_data_assignment: for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES - 1 generate
--  MUON: if (i mod 4) = 0 generate
--    type_assignment_in_l(i) <= to_unsigned(4,4);
--  end generate MUON;
--  SUM: if (i mod 4) = 1 generate
--    type_assignment_in_l(i) <= x"8";
--  end generate SUM;
--  JET: if (i mod 4) = 2 generate
--    type_assignment_in_l(i) <= x"3";
--  end generate JET;
--  ENERGY: if (i mod 4) = 3 generate
--    type_assignment_in_l(i) <= x"2";
--  end generate ENERGY;
--end generate set_data_assignment;
--
--GENERATE_OUTPUT_PARSERS: for i in 0 to 0 generate--NUMBER_OF_OUTPUT_LINKS - 1 generate
--
--  PARSER_WRAPPER_INST: entity work.parser_wrapper
--    generic map (
--      LINK_NUMBER              => i,
--      TOTAL_NUMBER_OF_IN_LINKS => NUMBER_OF_ROS_ROI_INPUT_BUSES) --tot_number_of_links(ros_roi_bus_assignment_sig,i))
--      --ACTIVE_LINKS             => set_active_links(ros_roi_bus_assignment_sig,i))
--
--    port map (
--      CLK_WR_IN          => gck2_clk80, --clk_80,
--      CLK_RD_IN          => gck2_clk80, --clk_80,
--      RESET_IN           => ddr_rst,
--      BC_OFFSET_IN       => std_logic_vector(to_unsigned(3,6)),
--      BC_QTY_IN          => std_logic_vector(to_unsigned(3,6)),
--      DATA_IN            => data_out_l(i),
--      ROS_ROI_BUS_NUMBER => std_logic_vector(actual_bus_number_out_l(i)),
--      DATA_OUT           => rod_data,
--      DATA_RE_IN         => rod_re,
--      DATA_RDY_OUT       => rod_rdy,
--      DATA_VALID_IN      => data_valid_in_l(i));
--  
--end generate GENERATE_OUTPUT_PARSERS;


ddr_synced <= '1' when (links_synced = ones) else '0'; -- and rst_ipb = '0') and soft_rst = '0' else '0';

--##################################### END OF ROD


ddr_rst <= not gck2_mmcm_locked; -- or rst_ipb;

v_reset <= '0'; --rst_from_bank18 or rst_from_bank16 or rst_ipb;

ddr_bank18 : entity work.ddr_links_wrapper
generic map(
                DELAY_GROUP_NAME     => "bank18_delay_group",
                AVAILABLE_LVDS_LINES => ddr_lines_on_bank18,
                EXCLUDE_DCM_IDELAY_CTRL => FALSE,
				MANUAL_SYNC => TRUE,
                SIMULATION => SIMULATION
)
port map(
                GCLK_40_IN         => gck2_clk40,
                DELAY_CLK_IN       => idelayctrl_refclk300,
                EXT_DDR_CLK_IN     => '0',
                EXT_DDR_CLK_X8_IN  => '0',
				INT_DDR_CLK_OUT    => ddr_clk_bank18,
                RESET_IN           => ddr_rst,
               
                LVDS_IN_P          => DATA_BANK18_IN_P,
                LVDS_IN_N          => DATA_BANK18_IN_N,
               
                LINKS_SYNCED_OUT   => ddr_receivers_synced_bank18,
				RESET_TRANS_OUT    => rst_from_bank18,
					 
				DELAY_VALS_IN      => ddr_val_bank18,
				DELAY_LOAD_IN      => ddr_val_load_bank18,
				DELAY_VALS_OUT     => ddr_val_out_bank18,
                               
                DATA_OUT           => ddr_data_from_bank18,
                DATA_VALID_OUT     => ddr_dv_from_bank18,
                DATA_KCTRL_OUT     => ddr_kctrl_from_bank18,
                
                DBG_STATE_OUT    => dbg_ddr_state_from18,
				DBG_REG_DATA_OUT => dbg_ddr_reg_from18,
				DBG_BITSLIP_OUT  => dbg_ddr_bitslip_from18,
				DBG_INC_OUT      => dbg_ddr_inc_from18,
				DBG_PAUSE_OUT    => dbg_ddr_pause_from18,
				DBG_STEP_OUT     => dbg_ddr_step_from18,
				DBG_RETRY_OUT    => dbg_ddr_retry_from18
);
 
ddr_bank16 : entity work.ddr_links_wrapper
generic map(
                DELAY_GROUP_NAME     => "bank16_delay_group",
                AVAILABLE_LVDS_LINES => ddr_lines_on_bank16,
                EXCLUDE_DCM_IDELAY_CTRL => FALSE,
				MANUAL_SYNC => TRUE,
                SIMULATION => SIMULATION
)
port map(
                GCLK_40_IN         => gck2_clk40,
                DELAY_CLK_IN       => idelayctrl_refclk300,
                EXT_DDR_CLK_IN     => '0',
                EXT_DDR_CLK_X8_IN  => '0',
				INT_DDR_CLK_OUT    => ddr_clk_bank16,
                RESET_IN           => ddr_rst,
               
                LVDS_IN_P          => DATA_BANK16_IN_P,
                LVDS_IN_N          => DATA_BANK16_IN_N,
               
                LINKS_SYNCED_OUT   => ddr_receivers_synced_bank16,
				RESET_TRANS_OUT    => rst_from_bank16,           
				
				DELAY_VALS_IN      => ddr_val_bank16,
				DELAY_LOAD_IN      => ddr_val_load_bank16,
				DELAY_VALS_OUT     => ddr_val_out_bank16,                    
						
                DATA_OUT           => ddr_data_from_bank16,
                DATA_VALID_OUT     => ddr_dv_from_bank16,
                DATA_KCTRL_OUT     => ddr_kctrl_from_bank16,
                
                DBG_STATE_OUT    => dbg_ddr_state_from16,
				DBG_REG_DATA_OUT => dbg_ddr_reg_from16,
				DBG_BITSLIP_OUT  => dbg_ddr_bitslip_from16,
				DBG_INC_OUT      => dbg_ddr_inc_from16,
				DBG_PAUSE_OUT    => dbg_ddr_pause_from16,
				DBG_STEP_OUT     => dbg_ddr_step_from16,
				DBG_RETRY_OUT    => dbg_ddr_retry_from16
);

ddr_bank32 : entity work.ddr_links_wrapper -- connected to ctrlbus U1
generic map(
	DELAY_GROUP_NAME     => "bank32_delay_group",
	AVAILABLE_LVDS_LINES => ddr_lines_on_bank32,
	EXCLUDE_DCM_IDELAY_CTRL => TRUE,
	MANUAL_SYNC => TRUE,
    SIMULATION => SIMULATION
)
port map(
	GCLK_40_IN         => gck2_clk40,
	DELAY_CLK_IN       => idelayctrl_refclk300,
	EXT_DDR_CLK_IN     => ctrlbus_32_clk,
	EXT_DDR_CLK_X8_IN  => ctrlbus_32_clkx8,
	RESET_IN           => ddr_rst,
	
	LVDS_IN_P          => DATA_BANK32_IN_P,
	LVDS_IN_N          => DATA_BANK32_IN_N,
	
	LINKS_SYNCED_OUT   => ddr_receivers_synced_bank32,
	RESET_TRANS_OUT    => open,       
				
	DELAY_VALS_IN      => (others => '0'),
	DELAY_LOAD_IN      => (others => '0'),
	DELAY_VALS_OUT     => open,                    
			
    DATA_OUT           => open,
    DATA_VALID_OUT     => open,
    DATA_KCTRL_OUT     => open,
    
    DBG_STATE_OUT    => open,
	DBG_REG_DATA_OUT => open,
	DBG_BITSLIP_OUT  => open,
	DBG_INC_OUT      => open,
	DBG_PAUSE_OUT    => open,
	DBG_STEP_OUT     => open,
	DBG_RETRY_OUT    => open
);

ddr_bank17 : entity work.ddr_links_wrapper -- connected to ctrlbus U2
generic map(
	DELAY_GROUP_NAME     => "bank17_delay_group",
	AVAILABLE_LVDS_LINES => ddr_lines_on_bank17,
	EXCLUDE_DCM_IDELAY_CTRL => TRUE,
	MANUAL_SYNC => TRUE,
    SIMULATION => SIMULATION
)
port map(
	GCLK_40_IN         => gck2_clk40,
	DELAY_CLK_IN       => idelayctrl_refclk300,
	EXT_DDR_CLK_IN     => ctrlbus_17_clk,
	EXT_DDR_CLK_X8_IN  => ctrlbus_17_clkx8,
	RESET_IN           => ddr_rst,
	
	LVDS_IN_P          => DATA_BANK17_IN_P,
	LVDS_IN_N          => DATA_BANK17_IN_N,
	
	LINKS_SYNCED_OUT   => ddr_receivers_synced_bank17,
	RESET_TRANS_OUT    => open,
	
	DELAY_VALS_IN      => (others => '0'),
	DELAY_LOAD_IN      => (others => '0'),
	DELAY_VALS_OUT     => open,                    
			
    DATA_OUT           => open,
    DATA_VALID_OUT     => open,
    DATA_KCTRL_OUT     => open,
    
    DBG_STATE_OUT    => open,
	DBG_REG_DATA_OUT => open,
	DBG_BITSLIP_OUT  => open,
	DBG_INC_OUT      => open,
	DBG_PAUSE_OUT    => open,
	DBG_STEP_OUT     => open,
	DBG_RETRY_OUT    => open
);

vrst_u1_buf : obufds port map( I =>  v_reset, O => DATA_U1_CTRL_OUT_P, OB => DATA_U1_CTRL_OUT_N);
vrst_u2_buf : obufds port map( I =>  v_reset, O => DATA_U2_CTRL_OUT_P, OB => DATA_U2_CTRL_OUT_N);
vsyn_u2_buf : obufds port map( I =>  ddr_synced, O => DATA_U2_SYNC_OUT_P, OB => DATA_U2_SYNC_OUT_N);

--	DCM clock generation for internal bus, ethernet

SIM_CLOCK: if SIMULATION generate
  GC_CLOCK: process
  begin  -- process CLOCK
    gck2_clk40 <= '1';
    wait for 12.5 ns;
    gck2_clk40 <= '0';
    wait for 12.5 ns;
  end process GC_CLOCK;

  DELAY_CLK: process
  begin  -- process
    idelayctrl_refclk300 <= '1';
    wait for 1.666 ns;
    idelayctrl_refclk300 <= '0';
    wait for 1.666 ns;
  end process DELAY_CLK;
  rst_ipb <= '0';
  gck2_mmcm_locked <= not rst_from_bank18;
end generate SIM_CLOCK;
        -----------------------------------------------------------------------
        -- comment for sim
        -----------------------------------------------------------------------                 
	clocks: entity work.clocks_7s_serdes
		port map(
			clki_fr => clk125_fr,
			clki_125 => clk125,
			clko_ipb => ipb_clk,
			eth_locked => eth_locked,
			locked => clk_locked,
			nuke => sys_rst,
			rsto_125 => rst_125,
			rsto_ipb => rst_ipb,
			rsto_eth => rst_eth,
			onehz => onehz,
			GCK2_IN_P => GCK2_IN_P,
			GCK2_IN_N => GCK2_IN_N,
			gck2_mmcm_locked_out => gck2_mmcm_locked,
			gck2_clk40_out => gck2_clk40,
			gck2_clk80_out => gck2_clk80,
			idelayctrl_refclk300_out => idelayctrl_refclk300
		);
        --------------------------------------------------------------------
        -- end comment for sim
        --------------------------------------------------------------------
           
	locked <= clk_locked and eth_locked;
	led_speedis1000 <= pcs_pma_status(11) and not pcs_pma_status(10);

	   LED_OUT(0)  <= '0';
	LED_OUT(1)  <= links_synced(0);--ddr_sync_from_u2(0);
	LED_OUT(2)  <= links_synced(1);--ddr_sync_from_u2(1);
	LED_OUT(3)  <= links_synced(2);--ddr_sync_from_u2(2);
	   LED_OUT(4)  <= '0';
	LED_OUT(5)  <= links_synced(3);--ddr_sync_from_u2(3);
	LED_OUT(6)  <= links_synced(4);--ddr_sync_from_u2(4);
	LED_OUT(7)  <= links_synced(5);--ddr_sync_from_u2(5);
	   LED_OUT(8)  <= '0';
	LED_OUT(9)  <= links_synced(6);--ddr_sync_from_u2(6);
	LED_OUT(10) <= links_synced(7);--ddr_sync_from_u2(7);
	LED_OUT(11) <= '0';
	   LED_OUT(12) <= '0';
	   LED_OUT(13) <= '0';
	LED_OUT(14) <= '0';
	LED_OUT(15) <= '0';
-------------------------------------------------------------------------------
-- comment for sim
-------------------------------------------------------------------------------
------ Ethernet MAC core and PHY interface
----

	refclk_ibufds_i : IBUFDS_GTE2
	port map (
		O     => gte2_clk_125,
	    ODIV2 => open,
		CEB   => '0',
		I     => gt_clkp,
		IB    => gt_clkn
	);

                         
	eth: entity work.eth_7s_sgmii
		port map(
			--!!! GK: clock distributed also to slink, only P is used with buffered clock !!!
			gt_clkp => gte2_clk_125, --gt_clkp,
			gt_clkn => '0', --gt_clkn,
			
			gt_txp => gt_txp,
			gt_txn => gt_txn,
			gt_rxp => gt_rxp,
			gt_rxn => gt_rxn,
--			sig_detn => sfp_los,
			clk125_out => clk125,
			clk125_fr => clk125_fr,
			rsti => rst_eth,
			locked => eth_locked,
			tx_data => mac_tx_data,
			tx_valid => mac_tx_valid,
			tx_last => mac_tx_last,
			tx_error => mac_tx_error,
			tx_ready => mac_tx_ready,
			rx_data => mac_rx_data,
			rx_valid => mac_rx_valid,
			rx_last => mac_rx_last,
			rx_error => mac_rx_error,
			pcs_pma_status => pcs_pma_status,
			ExternalPhyChip_reset_out => phy_reset
		);


      
	PHY_RESET_OUT_N <= not phy_reset;
      
-- ipbus control logic

	ipbus: entity work.ipbus_ctrl
		port map(
			mac_clk => clk125,
			rst_macclk => rst_125,
			ipb_clk => gck2_clk40, --ipb_clk,
			rst_ipb => rst_ipb,
			mac_rx_data => mac_rx_data,
			mac_rx_valid => mac_rx_valid,
			mac_rx_last => mac_rx_last,
			mac_rx_error => mac_rx_error,
			mac_tx_data => mac_tx_data,
			mac_tx_valid => mac_tx_valid,
			mac_tx_last => mac_tx_last,
			mac_tx_error => mac_tx_error,
			mac_tx_ready => mac_tx_ready,
			ipb_out => ipb_master_out,
			ipb_in => ipb_master_in,
			mac_addr => mac_addr,
			ip_addr => ip_addr,
			pkt_rx => pkt_rx,
			pkt_tx => pkt_tx,
			pkt_rx_led => pkt_rx_led,
			pkt_tx_led => pkt_tx_led
		);
      	

	mac_addr <= X"000A3501F610";
	--ip_addr <= X"865D828B"; --134.93.130.139
	ip_addr <= X"898A5121"; --137.138.81.33  --X"898A5114"; --137.138.81.20


-- ipbus slaves live in the entity below, and can expose top-level ports
-- The ipbus fabric is instantiated within.


      slaves: entity work.slaves 
      generic map(
      	lvds_lines => LINKS_NUMBER
      	)
      port map(
      	ipb_clk => gck2_clk40, --ipb_clk
      	ipb_rst => rst_ipb,
      	ipb_in => ipb_master_out,
      	ipb_out => ipb_master_in,
      	rst_out => sys_rst,
      	pkt_rx => pkt_rx,
      	pkt_tx => pkt_tx,
      	
		ipb_write_U1_out => ipb_write_U1,
		ipb_read_U1_in => ipb_read_U1,
		ipb_write_U2_out => ipb_write_U2,
		ipb_read_U2_in => ipb_read_U2,
      	
		ctrlbus_idelay_value_out => ctrlbus_idelay_value,
		ctrlbus_idelay_load_out => ctrlbus_idelay_load,
      	
		soft_rst_out => soft_rst,
			
		DELAY_VALS_OUT   => ddr_val,
		DELAY_LOAD_OUT   => ddr_val_load,
      		
      	DBG_LINKS_SYNCED_IN => links_synced,
		DBG_STATE_IN     => dbg_ddr_state,
		DBG_REG_DATA_IN  => dbg_ddr_reg,
		DBG_BITSLIP_IN   => dbg_ddr_bitslip,
		DBG_INC_IN       => dbg_ddr_inc,
		DBG_PAUSE_IN     => dbg_ddr_pause,
		DBG_STEP_IN      => dbg_ddr_step,
		DBG_RETRY_IN     => dbg_ddr_retry,
      	
		ROD_RAM_CLK_IN => gck2_clk80,
		ROD_RAM_WE_IN => ram_we,
		ROD_RAM_ADDR_IN => ram_addr,
		ROD_RAM_DATA_IN => ram_data
	);
      
	ctrlbus: entity work.ctrlbus
		port map(
			gck2_clk40_in => gck2_clk40,
			gck2_clk80_in => gck2_clk80,
			idelayctrl_refclk300_in => idelayctrl_refclk300,
			gck2_mmcm_locked_in => gck2_mmcm_locked,
			CTRLBUS_U1_OUT_P => CTRLBUS_U1_OUT_P,
			CTRLBUS_U1_OUT_N => CTRLBUS_U1_OUT_N,
			CTRLBUS_U2_OUT_P => CTRLBUS_U2_OUT_P,
			CTRLBUS_U2_OUT_N => CTRLBUS_U2_OUT_N,
			CTRLBUS_U1_IN_P => CTRLBUS_U1_IN_P,
			CTRLBUS_U1_IN_N => CTRLBUS_U1_IN_N,
			CTRLBUS_U2_IN_P => CTRLBUS_U2_IN_P,
			CTRLBUS_U2_IN_N => CTRLBUS_U2_IN_N,
			ipb_write_U1_in => ipb_write_U1,
			ipb_read_U1_out => ipb_read_U1,
			ipb_write_U2_in => ipb_write_U2,
			ipb_read_U2_out => ipb_read_U2,
			idelay_value_in => ctrlbus_idelay_value,
			idelay_load_in => ctrlbus_idelay_load,
			
			clk_400_in => clk_400,
			clk_80_in  => clk_80,
      		
			mmcm_clk_80_u1_out => ctrlbus_32_clk,
			mmcm_clk_400_u1_out => ctrlbus_32_clkx8,
      		
			mmcm_clk_80_u2_out => ctrlbus_17_clk,
			mmcm_clk_400_u2_out => ctrlbus_17_clkx8
		);

-------------------------------------------------------------------------------
-- end comment for sim
-------------------------------------------------------------------------------


in_slinkPckBuilder : entity work.slinkPckBuilder
generic map( 
			SIMULATION => 0
)
port map(sysClk             => gck2_clk40,
	     CLK_LOCKED_IN      => gck2_mmcm_locked,
	     
	     	--!!! GK: clock distributed also to ipbus, only P is used with buffered clock !!!
	     gt_clkp            => gte2_clk_125,
	     gt_clkn            => '0',
	     
	     PHY_RESET_N        => '1', -- NOT USED INSIDE
	     SFP3_TXDIS         => open,  -- NOT USED INSIDE
	     SFP3_LOS           => '0', -- NOT USED INSIDE
	     SFP3_RX_N          => OPTO_KR1_N, --SFP3_RX_N,
	     SFP3_RX_P          => OPTO_KR1_P, --SFP3_RX_P,
	     SFP3_TX_N          => OPTO_KT1_N, --SFP3_TX_N,
	     SFP3_TX_P          => OPTO_KT1_P, --SFP3_TX_P,
	     enable_in          => enable_in_sgn,
	     ready_out          => ready_out_sgn,
	     busy_out           => busy_out_sgn,
	     ureset_in          => ureset_in_sgn,
	     headerSize         => x"0000_0009", --nine words in the header exluding control word
	     minorFormatVersion => x"1002",
	     subDetId           => x"91",
	     moduleId           => x"0001",
	     runType            => b"0000_1111", --0 = physics, 1 = Calibration, 2 = Cosmics, 15=test
	     runNumber          => runNumber_sgn,
	     ECRID              => x"00",
	     ROD_L1ID           => x"00_0000",
	     ROD_BCN            => x"000",
	     triggerType        => x"00",
	     detectorEventType  => x"0000_0000",
	     numberOfStatEl     => b"00",
	     numberOfDataEl     => numberOfDataEl_sgn,
	     statBlockPos       => '1',
	     statWord1_in       => x"0000_0000",
	     statWord2_in       => x"0000_0000",
	     payload_in         => payload_in_sgn
);

FSM_sync : process(gck2_clk40) 
begin
	if rising_edge(gck2_clk40) then
		rstCnt <= rstCnt + 1;
		if(gck2_mmcm_locked = '0' or rstCnt_sgn = '1') then
			state <= idle;
		else
			state  <= n_state;
		end if;
		if(state = send) then
			numberOfDataEl_sgn  <= numberOfDataEl_sgn + 1;
		elsif(state = pause) then
			numberOfDataEl_sgn <= numberOfDataEl_sgn;
		else
			numberOfDataEl_sgn  <= x"0001";
		end if;
		if(state = pause) then
			pauseCnt  <=  pauseCnt + 1;
		else
			pauseCnt  <= (others  => '0');
		end if;
		if(state = send) then
			wordsCnt  <= wordsCnt -1;
		else
			wordsCnt  <= x"4";  --we send 4 words
		end if;
	end if;
end process;

FSM : process(ready_out_sgn,wordsCnt,pauseCnt,busy_out_sgn, runNumber_sgn, state)
begin
enable_in_sgn  <= '0';
ureset_in_sgn  <= '0';
runNumber_sgn  <= runNumber_sgn;
	case state is 
		when idle =>
			n_state <= reset;
			ureset_in_sgn  <= '1';
		when reset =>
			if (busy_out_sgn = '0') then	
				n_state  <= prepare2Send;
			else
				n_state  <= reset;
			end if;
		when prepare2Send => 
			enable_in_sgn <= '1';
			if (ready_out_sgn = '1') then
				n_state  <= send;
			else
				n_state  <= prepare2Send;
			end if;		
		when send =>
			enable_in_sgn <= '1';
			if(ready_out_sgn = '1' and wordsCnt >0 ) then
				n_state  <= send;
			else
				n_state  <= pause;
			end if;
		when pause =>
			if(pauseCnt > 100000 and busy_out_sgn = '0') then
				n_state   <= prepare2Send;
			else
				n_state  <= pause; 
			end if;			
	end case;
end process;




DataGenerator : process (gck2_clk40)
begin
	if rising_edge ( gck2_clk40 ) then
		cnt  <=  cnt + 1;
	end if;
end process;


--One line signal assigmnet
payload_in_sgn  <= cnt & cnt & cnt & cnt;
rstCnt_sgn <= '1' when rstCnt = x"00_0000" else '0';


--################### UGLY LINKS MAPPING

ddr_data(1 * 8 - 1 downto 0 * 8) <= ddr_data_from_bank16(1 * 8 - 1 downto 0 * 8);
ddr_data(2 * 8 - 1 downto 1 * 8) <= ddr_data_from_bank16(2 * 8 - 1 downto 1 * 8);
ddr_data(3 * 8 - 1 downto 2 * 8) <= ddr_data_from_bank18(5 * 8 - 1 downto 4 * 8);
ddr_data(4 * 8 - 1 downto 3 * 8) <= ddr_data_from_bank16(3 * 8 - 1 downto 2 * 8);
ddr_data(5 * 8 - 1 downto 4 * 8) <= ddr_data_from_bank16(4 * 8 - 1 downto 3 * 8);
ddr_data(6 * 8 - 1 downto 5 * 8) <= ddr_data_from_bank18(6 * 8 - 1 downto 5 * 8);
ddr_data(7 * 8 - 1 downto 6 * 8) <= ddr_data_from_bank18(7 * 8 - 1 downto 6 * 8);
ddr_data(8 * 8 - 1 downto 7 * 8) <= ddr_data_from_bank18(8 * 8 - 1 downto 7 * 8);
 
ddr_dv(0) <= ddr_dv_from_bank16(0);
ddr_dv(1) <= ddr_dv_from_bank16(1);
ddr_dv(2) <= ddr_dv_from_bank18(4);
ddr_dv(3) <= ddr_dv_from_bank16(2);
ddr_dv(4) <= ddr_dv_from_bank16(3);
ddr_dv(5) <= ddr_dv_from_bank18(5);
ddr_dv(6) <= ddr_dv_from_bank18(6);
ddr_dv(7) <= ddr_dv_from_bank18(7);

ddr_kctrl(0) <= ddr_kctrl_from_bank16(0);
ddr_kctrl(1) <= ddr_kctrl_from_bank16(1);
ddr_kctrl(2) <= ddr_kctrl_from_bank18(4);
ddr_kctrl(3) <= ddr_kctrl_from_bank16(2);
ddr_kctrl(4) <= ddr_kctrl_from_bank16(3);
ddr_kctrl(5) <= ddr_kctrl_from_bank18(5);
ddr_kctrl(6) <= ddr_kctrl_from_bank18(6);
ddr_kctrl(7) <= ddr_kctrl_from_bank18(7);

links_synced(0) <= ddr_receivers_synced_bank16(0);
links_synced(1) <= ddr_receivers_synced_bank16(1);
links_synced(2) <= ddr_receivers_synced_bank18(4);
links_synced(3) <= ddr_receivers_synced_bank16(2);
links_synced(4) <= ddr_receivers_synced_bank16(3);
links_synced(5) <= ddr_receivers_synced_bank18(5);
links_synced(6) <= ddr_receivers_synced_bank18(6);
links_synced(7) <= ddr_receivers_synced_bank18(7);

dbg_ddr_state(3 downto 0)   <= dbg_ddr_state_from16(3 downto 0);
dbg_ddr_state(7 downto 4)   <= dbg_ddr_state_from16(7 downto 4);
dbg_ddr_state(11 downto 8)  <= dbg_ddr_state_from18(19 downto 16);
dbg_ddr_state(15 downto 12) <= dbg_ddr_state_from16(11 downto 8);
dbg_ddr_state(19 downto 16) <= dbg_ddr_state_from16(15 downto 12);
dbg_ddr_state(23 downto 20) <= dbg_ddr_state_from18(23 downto 20);
dbg_ddr_state(27 downto 24) <= dbg_ddr_state_from18(27 downto 24);
dbg_ddr_state(31 downto 28) <= dbg_ddr_state_from18(31 downto 28);

dbg_ddr_reg(9 downto 0)   <= dbg_ddr_reg_from16(9 downto 0);
dbg_ddr_reg(19 downto 10) <= dbg_ddr_reg_from16(19 downto 10);
dbg_ddr_reg(29 downto 20) <= dbg_ddr_reg_from18(49 downto 40);
dbg_ddr_reg(39 downto 30) <= dbg_ddr_reg_from16(29 downto 20);
dbg_ddr_reg(49 downto 40) <= dbg_ddr_reg_from16(39 downto 30);
dbg_ddr_reg(59 downto 50) <= dbg_ddr_reg_from18(59 downto 50);
dbg_ddr_reg(69 downto 60) <= dbg_ddr_reg_from18(69 downto 60);
dbg_ddr_reg(79 downto 70) <= dbg_ddr_reg_from18(79 downto 70);

dbg_ddr_bitslip(3 downto 0)   <= dbg_ddr_bitslip_from16(3 downto 0);  
dbg_ddr_bitslip(7 downto 4)   <= dbg_ddr_bitslip_from16(7 downto 4);  
dbg_ddr_bitslip(11 downto 8)  <= dbg_ddr_bitslip_from18(19 downto 16);
dbg_ddr_bitslip(15 downto 12) <= dbg_ddr_bitslip_from16(11 downto 8); 
dbg_ddr_bitslip(19 downto 16) <= dbg_ddr_bitslip_from16(15 downto 12);
dbg_ddr_bitslip(23 downto 20) <= dbg_ddr_bitslip_from18(23 downto 20);
dbg_ddr_bitslip(27 downto 24) <= dbg_ddr_bitslip_from18(27 downto 24);
dbg_ddr_bitslip(31 downto 28) <= dbg_ddr_bitslip_from18(31 downto 28);

dbg_ddr_inc(7 downto 0)   <= dbg_ddr_inc_from16(7 downto 0);
dbg_ddr_inc(15 downto 8)  <= dbg_ddr_inc_from16(15 downto 8);
dbg_ddr_inc(23 downto 16) <= dbg_ddr_inc_from18(39 downto 32);
dbg_ddr_inc(31 downto 24) <= dbg_ddr_inc_from16(23 downto 16);
dbg_ddr_inc(39 downto 32) <= dbg_ddr_inc_from16(31 downto 24);
dbg_ddr_inc(47 downto 40) <= dbg_ddr_inc_from18(47 downto 40);
dbg_ddr_inc(55 downto 48) <= dbg_ddr_inc_from18(55 downto 48);
dbg_ddr_inc(63 downto 56) <= dbg_ddr_inc_from18(63 downto 56);

dbg_ddr_pause(7 downto 0)   <= dbg_ddr_pause_from16(7 downto 0);  
dbg_ddr_pause(15 downto 8)  <= dbg_ddr_pause_from16(15 downto 8); 
dbg_ddr_pause(23 downto 16) <= dbg_ddr_pause_from18(39 downto 32);
dbg_ddr_pause(31 downto 24) <= dbg_ddr_pause_from16(23 downto 16);
dbg_ddr_pause(39 downto 32) <= dbg_ddr_pause_from16(31 downto 24);
dbg_ddr_pause(47 downto 40) <= dbg_ddr_pause_from18(47 downto 40);
dbg_ddr_pause(55 downto 48) <= dbg_ddr_pause_from18(55 downto 48);
dbg_ddr_pause(63 downto 56) <= dbg_ddr_pause_from18(63 downto 56);

dbg_ddr_step(7 downto 0)   <= dbg_ddr_step_from16(7 downto 0);  
dbg_ddr_step(15 downto 8)  <= dbg_ddr_step_from16(15 downto 8); 
dbg_ddr_step(23 downto 16) <= dbg_ddr_step_from18(39 downto 32);
dbg_ddr_step(31 downto 24) <= dbg_ddr_step_from16(23 downto 16);
dbg_ddr_step(39 downto 32) <= dbg_ddr_step_from16(31 downto 24);
dbg_ddr_step(47 downto 40) <= dbg_ddr_step_from18(47 downto 40);
dbg_ddr_step(55 downto 48) <= dbg_ddr_step_from18(55 downto 48);
dbg_ddr_step(63 downto 56) <= dbg_ddr_step_from18(63 downto 56);

dbg_ddr_retry(7 downto 0)   <= dbg_ddr_retry_from16(7 downto 0);  
dbg_ddr_retry(15 downto 8)  <= dbg_ddr_retry_from16(15 downto 8); 
dbg_ddr_retry(23 downto 16) <= dbg_ddr_retry_from18(39 downto 32);
dbg_ddr_retry(31 downto 24) <= dbg_ddr_retry_from16(23 downto 16);
dbg_ddr_retry(39 downto 32) <= dbg_ddr_retry_from16(31 downto 24);
dbg_ddr_retry(47 downto 40) <= dbg_ddr_retry_from18(47 downto 40);
dbg_ddr_retry(55 downto 48) <= dbg_ddr_retry_from18(55 downto 48);
dbg_ddr_retry(63 downto 56) <= dbg_ddr_retry_from18(63 downto 56);

ddr_val_bank16(4 downto 0)   <= ddr_val(4 downto 0);
ddr_val_bank16(9 downto 5)   <= ddr_val(9 downto 5);
ddr_val_bank18(24 downto 20) <= ddr_val(14 downto 10);
ddr_val_bank16(14 downto 10) <= ddr_val(19 downto 15);
ddr_val_bank16(19 downto 15) <= ddr_val(24 downto 20);
ddr_val_bank18(29 downto 25) <= ddr_val(29 downto 25);
ddr_val_bank18(34 downto 30) <= ddr_val(34 downto 30);
ddr_val_bank18(39 downto 35) <= ddr_val(39 downto 35);

ddr_val_load_bank16(0)  <= ddr_val_load(0);
ddr_val_load_bank16(1)  <= ddr_val_load(1);
ddr_val_load_bank18(4)  <= ddr_val_load(2);
ddr_val_load_bank16(2)  <= ddr_val_load(3);
ddr_val_load_bank16(3)  <= ddr_val_load(4);
ddr_val_load_bank18(5)  <= ddr_val_load(5);
ddr_val_load_bank18(6)  <= ddr_val_load(6);
ddr_val_load_bank18(7)  <= ddr_val_load(7);


--##################################


icon : entity work.cs_icon
PORT map(
    CONTROL0 => icon_control0,
    CONTROL1 => icon_control1
);
    
ila0 : entity work.cs_ila
PORT map(
    CONTROL => icon_control0,
    CLK     => idelayctrl_refclk300,
    TRIG0   => ila_trg
);

ila1 : entity work.cs_ila
PORT map(
    CONTROL => icon_control1,
    CLK     => idelayctrl_refclk300,
    TRIG0   => (others => '0')
);

ila_trg(63 downto 0)   <= ddr_data;
ila_trg(71 downto 64)  <= ddr_dv;
ila_trg(79 downto 72)  <= ddr_kctrl;
ila_trg(87 downto 80)  <= links_synced;
ila_trg(168 downto 89) <= dbg_ddr_reg;

--ila_trg(254)            <= LDOWN_N_sgn;
--ila_trg(253 downto 251) <= uwen_cntr;
--ila_trg(250)            <= uwen_allowed_n;
--ila_trg(249)            <= ureset_n_sgn;
--ila_trg(248)            <= LFF_N_sgn;
--ila_trg(247 downto 244) <= LRL_sgn;

ila_trg(254) <= enable_in_sgn;
ila_trg(253) <= ready_out_sgn;
ila_trg(252) <= busy_out_sgn;
ila_trg(251) <= ureset_in_sgn;

ila_trg(250 downto 169) <= (others => '0'); 

	
end rtl;

 
