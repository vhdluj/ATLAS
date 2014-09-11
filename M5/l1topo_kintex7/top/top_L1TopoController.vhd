-- Top-level design for ipbus demo
--
-- You must edit this file to set the IP and MAC addresses
--
-- Dave Newbold, 16/7/12
--final
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
        SIMULATION  : boolean := false;
        VIVADO : boolean := false
        );
port(
	gt_clkp, gt_clkn: in std_logic;
	gt_txp, gt_txn: out std_logic;
	gt_rxp, gt_rxn: in std_logic;
	GCK2_IN_P, GCK2_IN_N: in std_logic;
	GCK1_IN_P, GCK1_IN_N: in std_logic;

	-- link minipod (3)
	OPTO_KR1_P, OPTO_KR1_N : in std_logic;
	OPTO_KT1_P, OPTO_KT1_N : out std_logic; 
	TTC_RESET_OUT : out std_logic;
	MMCX_OUT : out std_logic;
	TTC_EVT_H_STR_IN : in std_logic;
	TTC_L1A_IN : in std_logic;
	TTC_BCNT_STR_IN : in std_logic;
	TTC_EVT_L_STR_IN : in std_logic;
	TTC_BCNT_IN : in std_logic_vector(11 downto 0);
	
	CTRLBUS_U1_IN_P, CTRLBUS_U1_IN_N: in std_logic_vector(2 downto 0);
	CTRLBUS_U2_IN_P, CTRLBUS_U2_IN_N: in std_logic_vector(2 downto 0);
	CTRLBUS_U1_OUT_P, CTRLBUS_U1_OUT_N: out std_logic_vector(4 downto 0);
	CTRLBUS_U2_OUT_P, CTRLBUS_U2_OUT_N: out std_logic_vector(4 downto 0);
	
	DATA_U1_CTRL_OUT_P, DATA_U1_CTRL_OUT_N : out std_logic;
	DATA_U2_CTRL_OUT_P, DATA_U2_CTRL_OUT_N : out std_logic;
	DATA_U1_SYNC_OUT_P, DATA_U1_SYNC_OUT_N : out std_logic;
	DATA_U2_SYNC_OUT_P, DATA_U2_SYNC_OUT_N : out std_logic;
--	DATA_BANK17_IN_P, DATA_BANK17_IN_N : in std_logic_vector(1 downto 0);
--	DATA_BANK32_IN_P, DATA_BANK32_IN_N : in std_logic_vector(4 downto 0);
	DATA_BANK18_IN_P, DATA_BANK18_IN_N : in std_logic_vector(7 downto 0);
	DATA_BANK16_IN_P, DATA_BANK16_IN_N : in std_logic_vector(4 downto 0); -- GK removed last bit
	L1A_TO_U2_OUT_P, L1A_TO_U2_OUT_N : out std_logic; -- GK last bit from bank 16 used for L1A
	BUSY_FROM_U2_IN_P, BUSY_FROM_U2_IN_N : in std_logic;  -- GK another bit taken from bank 16
	
	PHY_RESET_OUT_N: out std_logic;
	LED_OUT: out STD_LOGIC_VECTOR(15 downto 0)--;
	--LEMO_BUSY_OUT : out std_logic;
--	SFP3_RX_N, SFP3_RX_P : in std_logic;
--	SFP3_TX_N, SFP3_TX_P : out std_logic
	);

end top_L1TopoController;

architecture rtl of top_L1TopoController is

	constant ddr_lines_on_bank16 : positive := 5; -- GK removed last bit and the next one also
	constant ddr_lines_on_bank17 : positive := 2;
	constant ddr_lines_on_bank18 : positive := 8;
	constant ddr_lines_on_bank32 : positive := 5;

	signal clk125_fr, clk125, clk100, ipb_clk, clk_locked, locked, eth_locked: std_logic;
	signal rst_125, rst_ipb, rst_eth, onehz, rod_receiver_rst: std_logic;
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
	
	signal gck2_mmcm_locked: std_logic := '1';
	signal gck2_clk40: std_logic;
	signal gck2_clk80: std_logic;
   signal gck2_clk200: std_logic;
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
	--for u2
	signal ddr_data_from_bank16 : std_logic_vector(ddr_lines_on_bank16 * 8 - 1 downto 0);
	signal ddr_data_from_bank18 : std_logic_vector(ddr_lines_on_bank18 * 8 - 1 downto 0);
	signal ddr_dv_from_bank16 : std_logic_vector(ddr_lines_on_bank16 - 1 downto 0);
	signal ddr_dv_from_bank18 : std_logic_vector(ddr_lines_on_bank18 - 1 downto 0);
	signal ddr_kctrl_from_bank16 : std_logic_vector(ddr_lines_on_bank16 - 1 downto 0);
	signal ddr_kctrl_from_bank18 : std_logic_vector(ddr_lines_on_bank18 - 1 downto 0);
	--for u1
	signal ddr_data_from_bank17 : std_logic_vector(ddr_lines_on_bank17 * 8 - 1 downto 0);
	signal ddr_data_from_bank32 : std_logic_vector(ddr_lines_on_bank32 * 8 - 1 downto 0);
	signal ddr_dv_from_bank17 : std_logic_vector(ddr_lines_on_bank17 - 1 downto 0);
	signal ddr_dv_from_bank32 : std_logic_vector(ddr_lines_on_bank32 - 1 downto 0);
	signal ddr_kctrl_from_bank17 : std_logic_vector(ddr_lines_on_bank17 - 1 downto 0);
	signal ddr_kctrl_from_bank32 : std_logic_vector(ddr_lines_on_bank32 - 1 downto 0);

	signal hola_ldown_n : std_logic;
	
   signal ros_roi_bus_assignment_sig       : in_cntrl_array;
   signal number_of_slices_out_l           : slice_parameters_array_u;
   signal lvl0_offset_out_l                : slice_parameters_array_u;
   signal data_out_l, data_out_l_synch     : out_data_array;
   signal data_valid_in_l                  : std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
   signal actual_bus_number_out_l          : bus_number_array;

	signal ddr_synced_u1, ddr_synced_u2 : std_logic;
	signal links_synced_u1, links_synced_u2 : std_logic_vector(LINKS_NUMBER - 1 downto 0);
	signal ddr_data_u1, ddr_data_u2 : std_logic_vector(LINKS_NUMBER*8-1 downto 0);
	signal ddr_dv_u1, ddr_dv_u2 : std_logic_vector(LINKS_NUMBER-1 downto 0);
	signal ones : std_logic_vector(LINKS_NUMBER-1 downto 0);
	signal ddr_kctrl_u1, ddr_kctrl_u2 : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);
	
	signal rod_rdy, rod_re, ram_we : std_logic;
	signal ram_addr : std_logic_vector(9 downto 0);
	signal rod_data, ram_data : std_logic_vector(31 downto 0);
	signal rst_from_bank18, rst_from_bank16 : std_logic;
	
	signal soft_rst : std_logic;

--ttc 
	signal ttc_rst : std_logic;
	signal l1a : std_logic;
	signal bcn : std_logic_vector(11 downto 0) := (others=>'0'); --BCID is other name for BCN (bunch crossing number)
	signal evt_nb : std_logic_vector (23 downto 0) := (others => '0');
	
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
	
	signal dbg_ddr_state_from17   : std_logic_vector(ddr_lines_on_bank17 * 4 - 1 downto 0);
	signal dbg_ddr_reg_from17     : std_logic_vector(ddr_lines_on_bank17 * 10 - 1 downto 0);
	signal dbg_ddr_bitslip_from17 : std_logic_vector(ddr_lines_on_bank17 * 4 - 1 downto 0);
	signal dbg_ddr_inc_from17     : std_logic_vector(ddr_lines_on_bank17 * 8 - 1 downto 0);
	signal dbg_ddr_pause_from17   : std_logic_vector(ddr_lines_on_bank17 * 8 - 1 downto 0);
	signal dbg_ddr_step_from17    : std_logic_vector(ddr_lines_on_bank17 * 8 - 1 downto 0);
	signal dbg_ddr_retry_from17   : std_logic_vector(ddr_lines_on_bank17 * 8 - 1 downto 0);
	
	signal dbg_ddr_state_from32   : std_logic_vector(ddr_lines_on_bank32 * 4 - 1 downto 0);
	signal dbg_ddr_reg_from32     : std_logic_vector(ddr_lines_on_bank32 * 10 - 1 downto 0);
	signal dbg_ddr_bitslip_from32 : std_logic_vector(ddr_lines_on_bank32 * 4 - 1 downto 0);
	signal dbg_ddr_inc_from32     : std_logic_vector(ddr_lines_on_bank32 * 8 - 1 downto 0);
	signal dbg_ddr_pause_from32   : std_logic_vector(ddr_lines_on_bank32 * 8 - 1 downto 0);
	signal dbg_ddr_step_from32    : std_logic_vector(ddr_lines_on_bank32 * 8 - 1 downto 0);
	signal dbg_ddr_retry_from32   : std_logic_vector(ddr_lines_on_bank32 * 8 - 1 downto 0);
	
	signal dbg_ddr_state_u2   : std_logic_vector(LINKS_NUMBER * 4 - 1 downto 0);
	signal dbg_ddr_reg_u2     : std_logic_vector(LINKS_NUMBER * 10 - 1 downto 0);
	signal dbg_ddr_bitslip_u2 : std_logic_vector(LINKS_NUMBER * 4 - 1 downto 0);
	signal dbg_ddr_inc_u2     : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	signal dbg_ddr_pause_u2   : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	signal dbg_ddr_step_u2    : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	signal dbg_ddr_retry_u2   : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	
	signal dbg_ddr_state_u1   : std_logic_vector(LINKS_NUMBER * 4 - 1 downto 0);
	signal dbg_ddr_reg_u1     : std_logic_vector(LINKS_NUMBER * 10 - 1 downto 0);
	signal dbg_ddr_bitslip_u1 : std_logic_vector(LINKS_NUMBER * 4 - 1 downto 0);
	signal dbg_ddr_inc_u1     : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	signal dbg_ddr_pause_u1   : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	signal dbg_ddr_step_u1    : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	signal dbg_ddr_retry_u1   : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	
	signal ddr_val_bank18       : std_logic_vector(ddr_lines_on_bank18 * 5 - 1 downto 0);
	signal ddr_val_load_bank18  : std_logic_vector(ddr_lines_on_bank18 - 1 downto 0);
	signal ddr_val_out_bank18   : std_logic_vector(ddr_lines_on_bank18 * 5 - 1 downto 0);
	signal ddr_val_bank16       : std_logic_vector(ddr_lines_on_bank16 * 5 - 1 downto 0);
	signal ddr_val_load_bank16  : std_logic_vector(ddr_lines_on_bank16 - 1 downto 0);
	signal ddr_val_out_bank16   : std_logic_vector(ddr_lines_on_bank16 * 5 - 1 downto 0);
	
	signal ddr_val              : std_logic_vector(LINKS_NUMBER * 5 - 1 downto 0):= (others => '0');
	signal ddr_val_load         : std_logic_vector(LINKS_NUMBER - 1 downto 0);
	
	signal clk_400, clk_80, clk_fb, clk_400_ub, clk_80_ub, local_dcm_locked : std_logic;
	
	signal ddr_clk_bank18, ddr_clk_bank16 : std_logic;
   signal start_of_frame_l, end_of_frame_l : std_logic;

   signal slink_ready_in_l, slink_event_ready_out_l : std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
   type slink_data_out_array is array (0 to NUMBER_OF_OUTPUT_LINKS-1) of std_logic_vector(31 downto 0);
   signal slink_data_out_a : slink_data_out_array;
          
   type link_number_array is array (0 to NUMBER_OF_OUTPUT_LINKS-1) of std_logic_vector(6 downto 0);
   signal link_number_l : link_number_array :=(others => (others => '0')); 


	signal gte2_clk_125 : std_logic;
	signal busy_from_u2, busy_from_u1 : std_logic := '0';
	signal builder_busy_l : std_logic;
	signal l1_busy_l : std_logic;
	signal slink_status : std_logic_vector(47 downto 0);
	
	signal icon_control0, icon_control1 : std_logic_vector(35 downto 0);
	signal ila_trg_0, ila_trg_1, vio_out : std_logic_vector(255 downto 0);
	
	signal ldown_n, lff_n : std_logic;
	
	signal gck1, gck2 : std_logic;
	signal mgt5_clk, mgt5_clk_buffered : std_logic;
	signal sysclk200, sysclk400 : std_logic;
	signal eth_gt_txoutclk, ethclk62_5, ethclk125, rst_extphy : std_logic;
	
	signal ctrlbus_u1_in : std_logic_vector(2 downto 0);
	signal ctrlbus_u2_in : std_logic_vector(2 downto 0);
	signal ctrlbus_u1_out : std_logic_vector(4 downto 0);
	signal ctrlbus_u2_out : std_logic_vector(4 downto 0);
	
	signal slink_rst, slink_ready : std_logic;
	
	signal dbg_txd, dbg_rxd : std_logic_vector(15 downto 0);
	signal dbg_tx_en, dbg_tx_er, dbg_rx_dv, dbg_rx_er : std_logic;

begin
 ones <= (others => '1');
 
 -- GK debug signal
 MMCX_OUT <= l1a;
 
 
icon : entity work.cs_icon
PORT map(
    CONTROL0 => icon_control0,
    CONTROL1 => icon_control1
);
 
ila0 : entity work.cs_ila
PORT map(
    CONTROL => icon_control0,
    CLK     => sysclk200, --idelayctrl_refclk300,
    TRIG0   => ila_trg_0
);

ila1 : entity work.cs_ila
PORT map(
    CONTROL => icon_control1,
    CLK     => sysclk200, --idelayctrl_refclk300,
    TRIG0   => ila_trg_1
);

ila_trg_0(0) <= l1a; 
ila_trg_0(1) <= l1_busy_l;
ila_trg_0(2) <= builder_busy_l;
ila_trg_0(3) <= ddr_dv_u2(0);
ila_trg_0(67 downto 4) <= ddr_data_u2(63 downto 0);
ila_trg_0(68) <= start_of_frame_l;
ila_trg_0(69) <= end_of_frame_l;
ila_trg_0(70) <= slink_event_ready_out_l(0);
ila_trg_0(71) <= slink_ready_in_l(0);
ila_trg_0(103 downto 72) <= slink_data_out_a(0);
ila_trg_0(183 downto 104) <= data_out_l(0)(79 downto 0);
ila_trg_0(231 downto 184) <= slink_status;
ila_trg_0(247 downto 246) <= std_logic_vector(actual_bus_number_out_l(0));
ila_trg_0(251 downto 248) <= std_logic_vector(number_of_slices_out_l(0));
ila_trg_0(255 downto 252) <= std_logic_vector(lvl0_offset_out_l(0));

ila_trg_0(232) <= TTC_L1A_IN;

ila_trg_0(233) <= lff_n;
ila_trg_0(234) <= ldown_n;
ila_trg_0(245 downto 235) <= (others => '0');

ila_trg_1(0) <= l1a;
ila_trg_1(1) <= start_of_frame_l;
ila_trg_1(2) <= dbg_tx_en;
ila_trg_1(3) <= dbg_tx_er;
ila_trg_1(19 downto 4) <= dbg_txd;
ila_trg_1(35 downto 20) <= dbg_rxd;
ila_trg_1(36) <= dbg_rx_dv;
ila_trg_1(37) <= dbg_rx_er;
ila_trg_1(38) <= end_of_frame_l;
ila_trg_1(39) <= ila_trg_0(187);
ila_trg_1(71 downto 40) <= ila_trg_0(228 downto 197);
ila_trg_1(72) <= ila_trg_0(185);
ila_trg_1(255 downto 73) <= (others => '0');



--##################   ROD

SET_DUMMY_ASSIGNMENTS: for i in 0 to ros_roi_bus_assignment_sig'high generate
  ros_roi_bus_assignment_sig(i) <= (others => '0');--std_logic_vector(to_unsigned(i mod 12,ros_roi_bus_assignment_sig(0)'length));
end generate SET_DUMMY_ASSIGNMENTS;


                       
GENERATE_V1_V2_DDR_TO_ROD: for i in 0 to 0 generate
  DDR_TO_ROD_INST: entity work.ddr_to_rod
    generic map (
      VIVADO => VIVADO)
    port map (
      RESET                       => rod_receiver_rst,
      DATA_IN_CLK                 => gck2_clk80, --clk_80,
      DATA_OUT_CLK                => gck2_clk80, --clk_80,
      LVL1_FULL_THR               => (others => '0'),--x"fe",
      L1_BUSY                     => l1_busy_l,
		BUILDER_BUSY_IN             => '0',--builder_busy_l,
      DDR_ROS_ROI_IN_DATA         => ddr_data_u2((i+1)*64-1 downto i*64),
      DATA_VALID_IN               => ddr_dv_u2(0),
      SPECIAL_CHAR_IN             => ddr_kctrl_u2(0),
      OUT_DATA                    => data_out_l,
      DATA_VALID_OUT              => data_valid_in_l,
      ACTUAL_BUS_NUMBER_OUT       => actual_bus_number_out_l,
      NUMBER_OF_SLICES_OUT        => number_of_slices_out_l,
      LVL0_OFFSET_OUT             => lvl0_offset_out_l,
      ROS_ROI_BUS_ASSIGNMENT      => ros_roi_bus_assignment_sig,
      ROS_ROI_BUS_ASSIGNMENT_DONE => not rod_receiver_rst,--ROS_ROI_BUS_ASSIGNMENT_DONE,
      ROS_ROI_OUT_DATA_CNTR       => open,--ROS_ROI_OUT_DATA_CNTR,
      START_OF_FRAME              => start_of_frame_l,
      END_OF_FRAME                => end_of_frame_l);
end generate GENERATE_V1_V2_DDR_TO_ROD;

  --LEMO_BUSY_OUT <= not (l1_busy_l or busy_from_u2 or busy_from_u1);
	LED_OUT(14) <= not (l1_busy_l or busy_from_u2 or busy_from_u1);
	
SET_SIM_VALUES: if SIMULATION = TRUE generate
    clk_locked <= '1';
  end generate SET_SIM_VALUES;                                                   
                           
GENERATE_OUPUT_SLINKS: for i in 0 to NUMBER_OF_OUTPUT_LINKS -1 generate

  link_number_l(i)(actual_bus_number_out_l(i)'range) <= std_logic_vector(actual_bus_number_out_l(i));
  
  TOB_SLINK_BUILDER_INST: entity work.tob_slink_builder
    generic map (
      VIVADO => VIVADO)
    port map (
      RESET                 => rod_receiver_rst,
      CLK                   => gck2_clk80,  --has to be higher !!! 160, 320 ?
      TOB_DATA_IN           => data_out_l(i),
      LINK_NUMBER           => link_number_l(i),--std_logic_vector(actual_bus_number_out_l(i)),
      BCID_OFFSET_IN        => std_logic_vector(lvl0_offset_out_l(to_integer(unsigned(actual_bus_number_out_l(i))))),
      MAX_OFFSET_IN         => max_offset(lvl0_offset_out_l),--x"5",    --here make a function to calculate it
      CRATE_ASSIGNMENT      => (others => '0'),
      DATA_VALID_IN         => data_valid_in_l(i),
      BEGINNING_OF_DATA     => start_of_frame_l,
      END_OF_DATA           => end_of_frame_l,
--      SLINK_PACKET_BUSY     => open,
      ACTIVE_LINKS_NUMBER   => b"01",--(others => '0'),  --change to real number
      BUILDER_BUSY          => builder_busy_l,
      SLINK_CLK             => gck2_clk40,
      SLINK_DATA_OUT        => slink_data_out_a(i),
      SLINK_READY_IN        => slink_ready_in_l(i),
      SLINK_EVENT_READY_OUT => slink_event_ready_out_l(i));

	SLINKPCKBUILDER_INST: entity work.slinkPckBuilder
    generic map (
      SIMULATION => SIMULATION)
    port map (
      SYSCLK             => gck2_clk40,
      CLK_LOCKED_IN      => locked, --clk_locked,--CLK_LOCKED_IN,
      --!!! GK: clock distributed also to ipbus, only P is used with buffered clock !!!
		GT_CLKP            => mgt5_clk, --mgt5_clk_buffered, --gte2_clk_125,
      GT_CLKN            => '0',--
      URESET_IN          => slink_rst, --rod_receiver_rst,
		
		SLINK_READY_OUT    => slink_ready,
		
--      SFP3_TXDIS         => SFP3_TXDIS,
      GT_RX_N          => OPTO_KR1_N,--'0',--
      GT_RX_P          => OPTO_KR1_P,--'0',--
      GT_TX_N          => OPTO_KT1_N,--open,--
      GT_TX_P          => OPTO_KT1_P,--open,--
      --from parser to slink
      ENABLE_IN          => slink_event_ready_out_l(i),
      READY_OUT          => slink_ready_in_l(i),
      PAYLOAD_IN         => slink_data_out_a(i),
		L1A_IN             => l1a,
      --header words (from IPBUS or TTCrc)
      MODULE_ID           => x"0001",
      RUN_TYPE            => x"0f",--0 = physics, 1 = Calibration, 2 = Cosmics, 15=test
      RUN_NUMBER          => (others => '0'),
      ECR_ID              => x"00",
      ROD_L1_ID           => evt_nb, --x"00_0000",
      ROD_BCN             => bcn, --x"000",
      TRIGGER_TYPE        => x"00",
      DETECTOR_EVENT_TYPE => x"0000_0000",
		DEBUG_OUT           => slink_status,
		LFF_N_OUT => lff_n,
		LDOWN_N_OUT => ldown_n,
		
      --stat data
      STAT_WORD1_IN       => (others => '0'),
      STAT_WORD2_IN       => (others => '0')
      );
end generate GENERATE_OUPUT_SLINKS;                           
--GT_TX_DIS(0) <= '0';
                       
ddr_synced_u2 <= '1' when (links_synced_u2 = ones) else '0'; -- and rst_ipb = '0') and soft_rst = '0' else '0';
ddr_synced_u1 <= '1' when (links_synced_u1 = ones) else '0'; -- and rst_ipb = '0') and soft_rst = '0' else '0';
--##################################### END OF ROD ######################################
--#######################################################################################

TTC_RESET_OUT <= ttc_rst;

--##################################### TTC #############################################
ttcrx_receiver_inst : entity work.ttcrx_interface 
port map(
-- GK: only P is used, the clk40 clock from ttcrx is recovered in clocks component
	CLK_P  =>  gck2_clk40, --GCK2_IN_P, 
	CLK_N  =>  '0', --GCK2_IN_N,  --ttcrx is supplied with the cristal oscillator 40MHz -what about whole system clock reconstruction
	MMCX_OUT  =>  open,

		--input signals from ttcrx chip - physical connections on pcb
	TTC_EVT_H_STR_IN 	=> TTC_EVT_H_STR_IN,
	TTC_L1A_IN 			=> TTC_L1A_IN,
	TTC_BCNT_STR_IN 	=> TTC_BCNT_STR_IN,
	TTC_EVT_L_STR_IN	=> TTC_EVT_L_STR_IN, 
	TTC_BCNT_IN			=> TTC_BCNT_IN,
		--output signals
	TTC_RESET_OUT =>ttc_rst,
	L1A_OUT => l1a, --level 1 accepted. Main trigger
	BCID_OUT => bcn, --BCID is other name for BCN (bunch crossing number)
	EVTID_OUT => evt_nb
);


-- GK added output buffer for L1A
l1a_u2_buf : OBUFDS port map ( I => l1a, O => L1A_TO_U2_OUT_P, OB => L1A_TO_U2_OUT_N);
busy_u2_buf : IBUFDS port map ( I => BUSY_FROM_U2_IN_P, IB => BUSY_FROM_U2_IN_N, O => busy_from_u2);


-- ################################### DDR
rod_receiver_rst <= (not ddr_synced_u2) or not gck2_mmcm_locked or not slink_ready; 
ddr_rst <= not gck2_mmcm_locked; -- or rst_ipb;
slink_rst <= not locked; --eth_locked;

v_reset <= '0'; --rst_from_bank18 or rst_from_bank16 or rst_ipb;

ddr_bank18 : entity work.ddr_links_wrapper
generic map(
                DELAY_GROUP_NAME     => "bank18_delay_group",
                AVAILABLE_LVDS_LINES => ddr_lines_on_bank18,
                EXCLUDE_DCM_IDELAY_CTRL => FALSE,
                MANUAL_SYNC => TRUE,
                SIMULATION => SIMULATION,
                VIVADO => VIVADO
)
port map(
                GCLK_40_IN         => gck2_clk40,
                DELAY_CLK_IN       => sysclk200, --idelayctrl_refclk300,
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
                SIMULATION => SIMULATION,
                VIVADO => VIVADO
)
port map(
                GCLK_40_IN         => gck2_clk40,
                DELAY_CLK_IN       => sysclk200, --idelayctrl_refclk300,
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

vrst_u1_buf : obufds port map( I =>  v_reset, O => DATA_U1_CTRL_OUT_P, OB => DATA_U1_CTRL_OUT_N);
vsyn_u1_buf : obufds port map( I =>  ddr_synced_u1, O => DATA_U1_SYNC_OUT_P, OB => DATA_U1_SYNC_OUT_N);
vrst_u2_buf : obufds port map( I =>  v_reset, O => DATA_U2_CTRL_OUT_P, OB => DATA_U2_CTRL_OUT_N);
vsyn_u2_buf : obufds port map( I =>  ddr_synced_u2, O => DATA_U2_SYNC_OUT_P, OB => DATA_U2_SYNC_OUT_N);

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

  GC80_CLOCK: process
  begin  -- process CLOCK
    gck2_clk80 <= '1';
    wait for 6.25 ns;
    gck2_clk80 <= '0';
    wait for 6.25 ns;
  end process GC80_CLOCK;

  GC320_CLOCK: process
  begin  -- process CLOCK
    gck2_clk200 <= '1';
    wait for 2.5 ns;
    gck2_clk200 <= '0';
    wait for 2.5 ns;
  end process GC320_CLOCK;

  
end generate SIM_CLOCK;
        -----------------------------------------------------------------------
        -- comment for sim
        -----------------------------------------------------------------------                 

	GCK1_IBUFGDS: IBUFGDS
		port map(
			I  => GCK1_IN_P,
			IB => GCK1_IN_N,
			O  => gck1
	);


	GCK2_IBUFGDS: IBUFGDS
		port map(
			I  => GCK2_IN_P,
			IB => GCK2_IN_N,
			O  => gck2
	);

	MGT5_IBUFGDS_GTE2: IBUFDS_GTE2 
		port map(
			I  => gt_clkp,
			IB => gt_clkn,
			O  => mgt5_clk,
			ceb=> '0'
		);

	MGT5_CLK_BUFG: BUFG
		port map(
			I => mgt5_clk,
			O => mgt5_clk_buffered
		);

	clk: entity work.clocks
	port map(
		gck1				=> gck1,
		gck2				=> gck2,
		sysclk40_out	=> gck2_clk40, --sysclk40,
		sysclk80_out	=> gck2_clk80, --sysclk80,
		sysclk200_out	=> sysclk200,
		sysclk400_out	=> sysclk400,
		
		eth_gt_txoutclk	=> eth_gt_txoutclk,
		ethclk62_5_out		=> ethclk62_5,
		ethclk125_out		=> ethclk125,
		
		gck_mmcm_locked_out => clk_locked, --gck_mmcm_locked,
		eth_mmcm_locked_out => eth_locked --eth_mmcm_locked
	);
	
	

        --------------------------------------------------------------------
        -- end comment for sim
        --------------------------------------------------------------------
           
	locked <= clk_locked; -- and eth_locked;
	led_speedis1000 <= pcs_pma_status(11) and not pcs_pma_status(10);

	   LED_OUT(0)  <= '0';
	LED_OUT(1)  <= links_synced_u2(0);--ddr_sync_from_u2(0);
	LED_OUT(2)  <= links_synced_u2(1);--ddr_sync_from_u2(1);
	LED_OUT(3)  <= links_synced_u2(2);--ddr_sync_from_u2(2);
	   LED_OUT(4)  <= '0';
	LED_OUT(5)  <= links_synced_u2(3);--ddr_sync_from_u2(3);
	LED_OUT(6)  <= links_synced_u2(4);--ddr_sync_from_u2(4);
	LED_OUT(7)  <= links_synced_u2(5);--ddr_sync_from_u2(5);
	   LED_OUT(8)  <= '0';
	LED_OUT(9)  <= links_synced_u2(6);--ddr_sync_from_u2(6);
	LED_OUT(10) <= links_synced_u2(7);--ddr_sync_from_u2(7);
	LED_OUT(11) <= '0';
	   LED_OUT(12) <= '0';
	   LED_OUT(13) <= '0';
	--LED_OUT(14) <= '0';
	LED_OUT(15) <= '0';
-------------------------------------------------------------------------------
-- comment for sim
-------------------------------------------------------------------------------

--ipb: entity work.ipbus_module
--	port map(
--		sysclk40 => gck2_clk40, --sysclk40,
--		sysclk80 => gck2_clk80, --sysclk80,
--		sysclk200 => sysclk200,
--		sysclk400 => sysclk400,
--		mgt5_clk_buffered => mgt5_clk_buffered,
--		eth_gt_txoutclk => eth_gt_txoutclk,
--		ethclk62_5 => ethclk62_5,
--		ethclk125 => ethclk125,
--		gck_mmcm_locked => clk_locked, --gck_mmcm_locked,
--		eth_mmcm_locked => eth_locked, --eth_mmcm_locked,
--		
--		mgt5_clk => mgt5_clk,
--		VME_EXT_RX_P => gt_rxp, --VME_EXT_RX_P,
--		VME_EXT_RX_N => gt_rxn, --VME_EXT_RX_N,
--		VME_EXT_TX_P => gt_txp, --VME_EXT_TX_P,
--		VME_EXT_TX_N => gt_txn, --VME_EXT_TX_N,
--		
--		eth_sgmiiphy_done_out => open, --eth_sgmiiphy_done,
--		rst_extphy => rst_extphy,
--		mac_addr => mac_addr,
--		ip_addr => ip_addr,
--		pkt_rx_led => pkt_rx_led,
--		pkt_tx_led => pkt_tx_led,
--		
--		ctrlbus_u1_in => ctrlbus_u1_in,
--		ctrlbus_u2_in => ctrlbus_u2_in,
--		ctrlbus_u1_out => ctrlbus_u1_out,
--		ctrlbus_u2_out => ctrlbus_u2_out,
--		
--		fakeTTCBroadcast => open, --fakeTTCBroadcast,
--
--		debugIPBus => open, --debugIPBus,
--		debugIPBusBridgeU2 => open --debugIPBusBridgeU2
--	);
	
	PHY_RESET_OUT_N <= not rst_extphy;
	
	CTRLBUS_IN_IBUFDS_GEN: for i in 2 downto 0 generate
	CTRLBUS_U1_IN_IBUFDS: IBUFDS
		port map(
			I  => ctrlbus_u1_in_p(i),
			IB => ctrlbus_u1_in_n(i),
			O  => ctrlbus_u1_in(i)
		);
	CTRLBUS_U2_IN_IBUFDS: IBUFDS
		port map(
			I  => ctrlbus_u2_in_p(i),
			IB => ctrlbus_u2_in_n(i),
			O  => ctrlbus_u2_in(i)
		);
	end generate;
	
	CTRLBUS_U1_OUT_OBUFDS_GEN: for i in 4 downto 0 generate
	CTRLBUS_U1_OUT_OBUFDS: OBUFDS
		port map(
			I  => ctrlbus_u1_out(i),
			O  => ctrlbus_u1_out_p(i),
			OB => ctrlbus_u1_out_n(i)
		);
	end generate;
	
	CTRLBUS_U2_OUT_OBUFDS_GEN: for i in 4 downto 0 generate
		CTRLBUS_U2_OUT_OBUFDS: OBUFDS
			port map(
				I  => ctrlbus_u2_out(i),
				O  => ctrlbus_u2_out_p(i),
				OB => ctrlbus_u2_out_n(i)
			);
		end generate;
 
	mac_addr <= X"000A3501F610";
	--ip_addr <= X"865D828B"; --134.93.130.139
	ip_addr <= X"898A5121"; --137.138.81.33

-------------------------------------------------------------------------------
-- end comment for sim
-------------------------------------------------------------------------------




--################### UGLY LINKS MAPPING

ddr_data_u2(1 * 8 - 1 downto 0 * 8) <= ddr_data_from_bank16(1 * 8 - 1 downto 0 * 8);
ddr_data_u2(2 * 8 - 1 downto 1 * 8) <= ddr_data_from_bank16(2 * 8 - 1 downto 1 * 8);
ddr_data_u2(3 * 8 - 1 downto 2 * 8) <= ddr_data_from_bank18(5 * 8 - 1 downto 4 * 8);
ddr_data_u2(4 * 8 - 1 downto 3 * 8) <= ddr_data_from_bank16(3 * 8 - 1 downto 2 * 8);
ddr_data_u2(5 * 8 - 1 downto 4 * 8) <= ddr_data_from_bank16(4 * 8 - 1 downto 3 * 8);
ddr_data_u2(6 * 8 - 1 downto 5 * 8) <= ddr_data_from_bank18(6 * 8 - 1 downto 5 * 8);
ddr_data_u2(7 * 8 - 1 downto 6 * 8) <= ddr_data_from_bank18(7 * 8 - 1 downto 6 * 8);
ddr_data_u2(8 * 8 - 1 downto 7 * 8) <= ddr_data_from_bank18(8 * 8 - 1 downto 7 * 8);

ddr_data_u1(1 * 8 - 1 downto 0 * 8) <= ddr_data_from_bank18(4 * 8 - 1 downto 3 * 8);
ddr_data_u1(2 * 8 - 1 downto 1 * 8) <= ddr_data_from_bank17(1 * 8 - 1 downto 0 * 8);
ddr_data_u1(3 * 8 - 1 downto 2 * 8) <= ddr_data_from_bank32(1 * 8 - 1 downto 0 * 8);
ddr_data_u1(4 * 8 - 1 downto 3 * 8) <= ddr_data_from_bank32(2 * 8 - 1 downto 1 * 8);
ddr_data_u1(5 * 8 - 1 downto 4 * 8) <= ddr_data_from_bank32(3 * 8 - 1 downto 2 * 8);
ddr_data_u1(6 * 8 - 1 downto 5 * 8) <= ddr_data_from_bank32(4 * 8 - 1 downto 3 * 8);
ddr_data_u1(7 * 8 - 1 downto 6 * 8) <= ddr_data_from_bank17(2 * 8 - 1 downto 1 * 8);
ddr_data_u1(8 * 8 - 1 downto 7 * 8) <= ddr_data_from_bank32(5 * 8 - 1 downto 4 * 8);
 
ddr_dv_u2(0) <= ddr_dv_from_bank16(0);
ddr_dv_u2(1) <= ddr_dv_from_bank16(1);
ddr_dv_u2(2) <= ddr_dv_from_bank18(4);
ddr_dv_u2(3) <= ddr_dv_from_bank16(2);
ddr_dv_u2(4) <= ddr_dv_from_bank16(3);
ddr_dv_u2(5) <= ddr_dv_from_bank18(5);
ddr_dv_u2(6) <= ddr_dv_from_bank18(6);
ddr_dv_u2(7) <= ddr_dv_from_bank18(7);

ddr_kctrl_u2(0) <= ddr_kctrl_from_bank16(0);
ddr_kctrl_u2(1) <= ddr_kctrl_from_bank16(1);
ddr_kctrl_u2(2) <= ddr_kctrl_from_bank18(4);
ddr_kctrl_u2(3) <= ddr_kctrl_from_bank16(2);
ddr_kctrl_u2(4) <= ddr_kctrl_from_bank16(3);
ddr_kctrl_u2(5) <= ddr_kctrl_from_bank18(5);
ddr_kctrl_u2(6) <= ddr_kctrl_from_bank18(6);
ddr_kctrl_u2(7) <= ddr_kctrl_from_bank18(7);

ddr_dv_u1(0) <= ddr_dv_from_bank18(3);
ddr_dv_u1(1) <= ddr_dv_from_bank17(0);
ddr_dv_u1(2) <= ddr_dv_from_bank32(0);
ddr_dv_u1(3) <= ddr_dv_from_bank32(1);
ddr_dv_u1(4) <= ddr_dv_from_bank32(2);
ddr_dv_u1(5) <= ddr_dv_from_bank32(3);
ddr_dv_u1(6) <= ddr_dv_from_bank17(1);
ddr_dv_u1(7) <= ddr_dv_from_bank32(4);

ddr_kctrl_u1(0) <= ddr_kctrl_from_bank18(3);
ddr_kctrl_u1(1) <= ddr_kctrl_from_bank17(0);
ddr_kctrl_u1(2) <= ddr_kctrl_from_bank32(0);
ddr_kctrl_u1(3) <= ddr_kctrl_from_bank32(1);
ddr_kctrl_u1(4) <= ddr_kctrl_from_bank32(2);
ddr_kctrl_u1(5) <= ddr_kctrl_from_bank32(3);
ddr_kctrl_u1(6) <= ddr_kctrl_from_bank17(1);
ddr_kctrl_u1(7) <= ddr_kctrl_from_bank32(4);


links_synced_u2(0) <= ddr_receivers_synced_bank16(0);
links_synced_u2(1) <= ddr_receivers_synced_bank16(1);
links_synced_u2(2) <= ddr_receivers_synced_bank18(4);
links_synced_u2(3) <= ddr_receivers_synced_bank16(2);
links_synced_u2(4) <= ddr_receivers_synced_bank16(3);
links_synced_u2(5) <= ddr_receivers_synced_bank18(5);
links_synced_u2(6) <= ddr_receivers_synced_bank18(6);
links_synced_u2(7) <= ddr_receivers_synced_bank18(7);

links_synced_u1(0) <= ddr_receivers_synced_bank18(3);
links_synced_u1(1) <= ddr_receivers_synced_bank17(0);
links_synced_u1(2) <= ddr_receivers_synced_bank32(0);
links_synced_u1(3) <= ddr_receivers_synced_bank32(1);
links_synced_u1(4) <= ddr_receivers_synced_bank32(2);
links_synced_u1(5) <= ddr_receivers_synced_bank32(3);
links_synced_u1(6) <= ddr_receivers_synced_bank17(1);
links_synced_u1(7) <= ddr_receivers_synced_bank32(4);

dbg_ddr_state_u2(3 downto 0)   <= dbg_ddr_state_from16(3 downto 0);
dbg_ddr_state_u2(7 downto 4)   <= dbg_ddr_state_from16(7 downto 4);
dbg_ddr_state_u2(11 downto 8)  <= dbg_ddr_state_from18(19 downto 16);
dbg_ddr_state_u2(15 downto 12) <= dbg_ddr_state_from16(11 downto 8);
dbg_ddr_state_u2(19 downto 16) <= dbg_ddr_state_from16(15 downto 12);
dbg_ddr_state_u2(23 downto 20) <= dbg_ddr_state_from18(23 downto 20);
dbg_ddr_state_u2(27 downto 24) <= dbg_ddr_state_from18(27 downto 24);
dbg_ddr_state_u2(31 downto 28) <= dbg_ddr_state_from18(31 downto 28);

dbg_ddr_reg_u2(9 downto 0)   <= dbg_ddr_reg_from16(9 downto 0);
dbg_ddr_reg_u2(19 downto 10) <= dbg_ddr_reg_from16(19 downto 10);
dbg_ddr_reg_u2(29 downto 20) <= dbg_ddr_reg_from18(49 downto 40);
dbg_ddr_reg_u2(39 downto 30) <= dbg_ddr_reg_from16(29 downto 20);
dbg_ddr_reg_u2(49 downto 40) <= dbg_ddr_reg_from16(39 downto 30);
dbg_ddr_reg_u2(59 downto 50) <= dbg_ddr_reg_from18(59 downto 50);
dbg_ddr_reg_u2(69 downto 60) <= dbg_ddr_reg_from18(69 downto 60);
dbg_ddr_reg_u2(79 downto 70) <= dbg_ddr_reg_from18(79 downto 70);

dbg_ddr_bitslip_u2(3 downto 0)   <= dbg_ddr_bitslip_from16(3 downto 0);  
dbg_ddr_bitslip_u2(7 downto 4)   <= dbg_ddr_bitslip_from16(7 downto 4);  
dbg_ddr_bitslip_u2(11 downto 8)  <= dbg_ddr_bitslip_from18(19 downto 16);
dbg_ddr_bitslip_u2(15 downto 12) <= dbg_ddr_bitslip_from16(11 downto 8); 
dbg_ddr_bitslip_u2(19 downto 16) <= dbg_ddr_bitslip_from16(15 downto 12);
dbg_ddr_bitslip_u2(23 downto 20) <= dbg_ddr_bitslip_from18(23 downto 20);
dbg_ddr_bitslip_u2(27 downto 24) <= dbg_ddr_bitslip_from18(27 downto 24);
dbg_ddr_bitslip_u2(31 downto 28) <= dbg_ddr_bitslip_from18(31 downto 28);

dbg_ddr_inc_u2(7 downto 0)   <= dbg_ddr_inc_from16(7 downto 0);
dbg_ddr_inc_u2(15 downto 8)  <= dbg_ddr_inc_from16(15 downto 8);
dbg_ddr_inc_u2(23 downto 16) <= dbg_ddr_inc_from18(39 downto 32);
dbg_ddr_inc_u2(31 downto 24) <= dbg_ddr_inc_from16(23 downto 16);
dbg_ddr_inc_u2(39 downto 32) <= dbg_ddr_inc_from16(31 downto 24);
dbg_ddr_inc_u2(47 downto 40) <= dbg_ddr_inc_from18(47 downto 40);
dbg_ddr_inc_u2(55 downto 48) <= dbg_ddr_inc_from18(55 downto 48);
dbg_ddr_inc_u2(63 downto 56) <= dbg_ddr_inc_from18(63 downto 56);

dbg_ddr_pause_u2(7 downto 0)   <= dbg_ddr_pause_from16(7 downto 0);  
dbg_ddr_pause_u2(15 downto 8)  <= dbg_ddr_pause_from16(15 downto 8); 
dbg_ddr_pause_u2(23 downto 16) <= dbg_ddr_pause_from18(39 downto 32);
dbg_ddr_pause_u2(31 downto 24) <= dbg_ddr_pause_from16(23 downto 16);
dbg_ddr_pause_u2(39 downto 32) <= dbg_ddr_pause_from16(31 downto 24);
dbg_ddr_pause_u2(47 downto 40) <= dbg_ddr_pause_from18(47 downto 40);
dbg_ddr_pause_u2(55 downto 48) <= dbg_ddr_pause_from18(55 downto 48);
dbg_ddr_pause_u2(63 downto 56) <= dbg_ddr_pause_from18(63 downto 56);

dbg_ddr_step_u2(7 downto 0)   <= dbg_ddr_step_from16(7 downto 0);  
dbg_ddr_step_u2(15 downto 8)  <= dbg_ddr_step_from16(15 downto 8); 
dbg_ddr_step_u2(23 downto 16) <= dbg_ddr_step_from18(39 downto 32);
dbg_ddr_step_u2(31 downto 24) <= dbg_ddr_step_from16(23 downto 16);
dbg_ddr_step_u2(39 downto 32) <= dbg_ddr_step_from16(31 downto 24);
dbg_ddr_step_u2(47 downto 40) <= dbg_ddr_step_from18(47 downto 40);
dbg_ddr_step_u2(55 downto 48) <= dbg_ddr_step_from18(55 downto 48);
dbg_ddr_step_u2(63 downto 56) <= dbg_ddr_step_from18(63 downto 56);

dbg_ddr_retry_u2(7 downto 0)   <= dbg_ddr_retry_from16(7 downto 0);  
dbg_ddr_retry_u2(15 downto 8)  <= dbg_ddr_retry_from16(15 downto 8); 
dbg_ddr_retry_u2(23 downto 16) <= dbg_ddr_retry_from18(39 downto 32);
dbg_ddr_retry_u2(31 downto 24) <= dbg_ddr_retry_from16(23 downto 16);
dbg_ddr_retry_u2(39 downto 32) <= dbg_ddr_retry_from16(31 downto 24);
dbg_ddr_retry_u2(47 downto 40) <= dbg_ddr_retry_from18(47 downto 40);
dbg_ddr_retry_u2(55 downto 48) <= dbg_ddr_retry_from18(55 downto 48);
dbg_ddr_retry_u2(63 downto 56) <= dbg_ddr_retry_from18(63 downto 56);



dbg_ddr_state_u1(3 downto 0)   <= dbg_ddr_state_from18(15 downto 12);
dbg_ddr_state_u1(7 downto 4)   <= dbg_ddr_state_from17(3 downto 0);
dbg_ddr_state_u1(11 downto 8)  <= dbg_ddr_state_from32(3 downto 0);
dbg_ddr_state_u1(15 downto 12) <= dbg_ddr_state_from32(7 downto 4);
dbg_ddr_state_u1(19 downto 16) <= dbg_ddr_state_from32(11 downto 8);
dbg_ddr_state_u1(23 downto 20) <= dbg_ddr_state_from32(15 downto 12);
dbg_ddr_state_u1(27 downto 24) <= dbg_ddr_state_from17(7 downto 4);
dbg_ddr_state_u1(31 downto 28) <= dbg_ddr_state_from32(19 downto 16);

dbg_ddr_reg_u1(9 downto 0)   <= dbg_ddr_reg_from18(39 downto 30);
dbg_ddr_reg_u1(19 downto 10) <= dbg_ddr_reg_from17(9 downto 0);
dbg_ddr_reg_u1(29 downto 20) <= dbg_ddr_reg_from32(9 downto 0);
dbg_ddr_reg_u1(39 downto 30) <= dbg_ddr_reg_from32(19 downto 10);
dbg_ddr_reg_u1(49 downto 40) <= dbg_ddr_reg_from32(29 downto 20);
dbg_ddr_reg_u1(59 downto 50) <= dbg_ddr_reg_from32(39 downto 30);
dbg_ddr_reg_u1(69 downto 60) <= dbg_ddr_reg_from17(19 downto 10);
dbg_ddr_reg_u1(79 downto 70) <= dbg_ddr_reg_from32(49 downto 40);

dbg_ddr_bitslip_u1(3 downto 0)   <= dbg_ddr_bitslip_from18(15 downto 12); 
dbg_ddr_bitslip_u1(7 downto 4)   <= dbg_ddr_bitslip_from17(3 downto 0);   
dbg_ddr_bitslip_u1(11 downto 8)  <= dbg_ddr_bitslip_from32(3 downto 0);   
dbg_ddr_bitslip_u1(15 downto 12) <= dbg_ddr_bitslip_from32(7 downto 4);   
dbg_ddr_bitslip_u1(19 downto 16) <= dbg_ddr_bitslip_from32(11 downto 8);  
dbg_ddr_bitslip_u1(23 downto 20) <= dbg_ddr_bitslip_from32(15 downto 12); 
dbg_ddr_bitslip_u1(27 downto 24) <= dbg_ddr_bitslip_from17(7 downto 4);   
dbg_ddr_bitslip_u1(31 downto 28) <= dbg_ddr_bitslip_from32(19 downto 16); 

dbg_ddr_inc_u1(7 downto 0)   <= dbg_ddr_inc_from18(31 downto 24);
dbg_ddr_inc_u1(15 downto 8)  <= dbg_ddr_inc_from17(7 downto 0);
dbg_ddr_inc_u1(23 downto 16) <= dbg_ddr_inc_from32(7 downto 0);
dbg_ddr_inc_u1(31 downto 24) <= dbg_ddr_inc_from32(15 downto 8);
dbg_ddr_inc_u1(39 downto 32) <= dbg_ddr_inc_from32(23 downto 16);
dbg_ddr_inc_u1(47 downto 40) <= dbg_ddr_inc_from32(31 downto 24);
dbg_ddr_inc_u1(55 downto 48) <= dbg_ddr_inc_from17(15 downto 8);
dbg_ddr_inc_u1(63 downto 56) <= dbg_ddr_inc_from32(39 downto 32);

dbg_ddr_pause_u1(7 downto 0)   <= dbg_ddr_pause_from18(31 downto 24);  
dbg_ddr_pause_u1(15 downto 8)  <= dbg_ddr_pause_from17(7 downto 0);    
dbg_ddr_pause_u1(23 downto 16) <= dbg_ddr_pause_from32(7 downto 0);    
dbg_ddr_pause_u1(31 downto 24) <= dbg_ddr_pause_from32(15 downto 8);   
dbg_ddr_pause_u1(39 downto 32) <= dbg_ddr_pause_from32(23 downto 16);  
dbg_ddr_pause_u1(47 downto 40) <= dbg_ddr_pause_from32(31 downto 24);  
dbg_ddr_pause_u1(55 downto 48) <= dbg_ddr_pause_from17(15 downto 8);   
dbg_ddr_pause_u1(63 downto 56) <= dbg_ddr_pause_from32(39 downto 32);  

dbg_ddr_step_u1(7 downto 0)   <= dbg_ddr_step_from18(31 downto 24);  
dbg_ddr_step_u1(15 downto 8)  <= dbg_ddr_step_from17(7 downto 0);    
dbg_ddr_step_u1(23 downto 16) <= dbg_ddr_step_from32(7 downto 0);    
dbg_ddr_step_u1(31 downto 24) <= dbg_ddr_step_from32(15 downto 8);   
dbg_ddr_step_u1(39 downto 32) <= dbg_ddr_step_from32(23 downto 16);  
dbg_ddr_step_u1(47 downto 40) <= dbg_ddr_step_from32(31 downto 24);  
dbg_ddr_step_u1(55 downto 48) <= dbg_ddr_step_from17(15 downto 8);   
dbg_ddr_step_u1(63 downto 56) <= dbg_ddr_step_from32(39 downto 32);  

dbg_ddr_retry_u1(7 downto 0)   <= dbg_ddr_retry_from18(31 downto 24);  
dbg_ddr_retry_u1(15 downto 8)  <= dbg_ddr_retry_from17(7 downto 0);    
dbg_ddr_retry_u1(23 downto 16) <= dbg_ddr_retry_from32(7 downto 0);    
dbg_ddr_retry_u1(31 downto 24) <= dbg_ddr_retry_from32(15 downto 8);   
dbg_ddr_retry_u1(39 downto 32) <= dbg_ddr_retry_from32(23 downto 16);  
dbg_ddr_retry_u1(47 downto 40) <= dbg_ddr_retry_from32(31 downto 24);  
dbg_ddr_retry_u1(55 downto 48) <= dbg_ddr_retry_from17(15 downto 8);   
dbg_ddr_retry_u1(63 downto 56) <= dbg_ddr_retry_from32(39 downto 32);  

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

end rtl;