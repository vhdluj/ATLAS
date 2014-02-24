library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


library UNISIM;
use UNISIM.VComponents.all;

use work.ipbus.all;
use work.ipbus_trans_decl.all;

use work.s7_transmission_components.all;
use work.rod_l1_topo_types_const.all;


entity l1topo_kintex_top is
generic (
	LINKS_NUMBER : integer range 0 to 40 := 8;
        SIMULATION : boolean := TRUE
);
port (
	SFP_TX_P : out std_logic;
	SFP_TX_N : out std_logic;
	SFP_RX_P : in std_logic;
	SFP_RX_N : in std_logic;
	GCLK2_P : in std_logic;
	GCLK2_N : in std_logic;
	GTXCLK_P : in std_logic;
	GTXCLK_N : in std_logic;
	SFP3_LOS : in std_logic;
	SFP3_TXDIS : out std_logic;
--	DATA_PIN_P_IN : in std_logic_vector(LINKS_NUMBER - 1 downto 0);
--	DATA_PIN_N_IN : in std_logic_vector(LINKS_NUMBER - 1 downto 0);
        DATA_BANK18_IN_P : in std_logic_vector(7 downto 0);
        DATA_BANK18_IN_N : in std_logic_vector(7 downto 0);
        DATA_BANK16_IN_P : in std_logic_vector(6 downto 0);
        DATA_BANK16_IN_N : in std_logic_vector(6 downto 0);
        
	CTRLBUS_OUT_P : out std_logic_vector(1 downto 0);
	CTRLBUS_OUT_N : out std_logic_vector(1 downto 0);
	IPBUS_TX_P : out std_logic;
	IPBUS_TX_N : out std_logic;
	IPBUS_RX_P : in std_logic;
	IPBUS_RX_N : in std_logic	
);
end l1topo_kintex_top;

architecture l1topo_kintex_top of l1topo_kintex_top is

component clock
port
 (-- Clock in ports
  CLK_IN1_P         : in     std_logic;
  CLK_IN1_N         : in     std_logic;
  -- Clock out ports
  CLK_40_OUT          : out    std_logic;
  CLK_90_OUT          : out    std_logic;
  CLK_450_OUT          : out    std_logic;
  CLK_200_OUT          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
 );
end component;

--component ddr_to_rod
--  port (
--    RESET                       : in  std_logic;
--    DATA_IN_CLK                 : in  std_logic;
--    DATA_OUT_CLK                : in  std_logic;
--    LVL1_FULL_THR               : in  std_logic_vector(7 downto 0);
--    L1_BUSY                     : out std_logic;
--    DDR_ROS_ROI_IN_DATA         : in  std_logic_vector(63 downto 0);
--    DATA_VALID_IN               : in  std_logic;
--    SPECIAL_CHAR_IN             : in  std_logic;
--    OUT_DATA                    : out out_data_array;
--    DATA_VALID_OUT              : out std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
--    ROS_ROI_BUS_ASSIGNMENT      : in  in_cntrl_array;
--    ROS_ROI_BUS_ASSIGNMENT_DONE : in  std_logic;
--    ROS_ROI_OUT_DATA_CNTR       : out output_link_data_cntr_array;
--    START_OF_FRAME              : out std_logic;
--    END_OF_FRAME                : out std_logic);
--end component;

signal clk_tx_ref : std_logic;
signal reset, locked : std_logic;
signal init_clk, clk_40, clk_400, clk_80 : std_logic;
signal au_txd : std_logic_vector(0 to 15);
signal au_sof : std_logic;
signal au_eof : std_logic;
signal au_src : std_logic;
signal au_dst : std_logic;
signal ddr_synced : std_logic;
signal clk_200 : std_logic;
signal links_synced : std_logic_vector(LINKS_NUMBER - 1 downto 0);
signal ddr_data : std_logic_vector(LINKS_NUMBER*8-1 downto 0);
signal ddr_dv : std_logic_vector(LINKS_NUMBER-1 downto 0);
signal ones : std_logic_vector(LINKS_NUMBER-1 downto 0);
signal ddr_kctrl : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);

attribute keep : string;
attribute keep of ddr_kctrl : signal is "true";
signal clk_125 : std_ulogic;
signal mac_rx_data : std_logic_vector(7 downto 0);
signal mac_tx_valid : std_logic;
signal mac_rx_valid : std_logic;
signal mac_rx_last : std_logic;
signal mac_rx_error : std_logic;
signal mac_tx_data : std_logic_vector(7 downto 0);
signal mac_tx_last : std_logic;
signal mac_tx_error : std_logic;
signal mac_tx_ready : std_logic;
signal ipb_master_out : ipb_wbus;
signal ipb_master_in : ipb_rbus;
signal ipb_req : std_logic;
signal ipb_grant : std_logic;
signal mac_addr : std_logic_vector(47 downto 0);
signal ip_addr : std_logic_vector(31 downto 0);
signal pkt_rx : std_logic;
signal pkt_tx : std_logic;
signal eth_locked : std_logic;
signal clk_125_fr : std_logic;
signal ros_roi_bus_assignment_sig : in_cntrl_array;
signal number_of_slices_out_l     : slice_parameters_array_u;
signal lvl0_offset_out_l          : slice_parameters_array_u;
signal data_out_l                 : out_data_array;
signal data_valid_in_l            : std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
signal type_assignment_in_l       : slice_parameters_array_u := (others => (others => '0'));
signal actual_bus_number_out_l    : bus_number_array;
constant ddr_lines_on_bank16 : positive := 7;
constant ddr_lines_on_bank17 : positive := 2;
constant ddr_lines_on_bank18 : positive := 8;
constant ddr_lines_on_bank32 : positive := 5;

signal ddr_data_from_bank16 : std_logic_vector(ddr_lines_on_bank16 * 8 - 1 downto 0);
signal ddr_data_from_bank18 : std_logic_vector(ddr_lines_on_bank18 * 8 - 1 downto 0);
signal ddr_dv_from_bank16 : std_logic_vector(ddr_lines_on_bank16 - 1 downto 0);
signal ddr_dv_from_bank18 : std_logic_vector(ddr_lines_on_bank18 - 1 downto 0);
signal ddr_kctrl_from_bank16 : std_logic_vector(ddr_lines_on_bank16 - 1 downto 0);
signal ddr_kctrl_from_bank18 : std_logic_vector(ddr_lines_on_bank18 - 1 downto 0);
signal ddr_receivers_synced_bank16 : std_logic_vector(ddr_lines_on_bank16 - 1 downto 0);
signal ddr_receivers_synced_bank18 : std_logic_vector(ddr_lines_on_bank18 - 1 downto 0);


begin

ones <= (others => '1');                --here register for switching off anf
                                        --on active links 

clock_inst : entity work.rod_kintex_clk
port map(CLK_IN1_P    => GCLK2_P,
		  CLK_IN1_N   => GCLK2_N,
		  CLK_40  => clk_40,
		  CLK_80  => clk_80,
		  CLK_400 => clk_400,
		  CLK_200 => clk_200,
                  LOCKED      => locked
); 

reset <= (not locked) or (SFP3_LOS); -- or (not eth_locked);

SFP3_TXDIS <= '0';

reset_buf1 : OBUFDS 
generic map ( IOSTANDARD => "LVDS")
port map ( I => ddr_synced, O => CTRLBUS_OUT_P(0), OB => CTRLBUS_OUT_N(0));
reset_buf2 : OBUFDS 
generic map ( IOSTANDARD => "LVDS_25")
port map ( I => ddr_synced, O => CTRLBUS_OUT_P(1), OB => CTRLBUS_OUT_N(1));


--*********
-- DDR RECEIVERS

--ddr_rec : ReceiversWrapper
--	generic map(LINKS_NUMBER    => LINKS_NUMBER,
--                    SIMULATION       => 1,
--                    IOSTANDARD_CONF => "1010010111111111"
--	)
--	port map(CLK_BIT_IN      => clk_400,
--		     CLK_WORD_IN     => clk_80,
--		     CLK_DELAY_IN    => clk_200,
--		     RESET           => reset,
--		     DATA_OUT        => ddr_data,
--		     DATA_VALID_OUT  => ddr_dv,
--		     DATA_KCTRL_OUT  => ddr_kctrl,
--		     LINK_SYNCED_OUT => links_synced,
--		     CRC_VALID_OUT   => open,
--		     DATA_PIN_P_IN   => DATA_PIN_P_IN,
--		     DATA_PIN_N_IN   => DATA_PIN_N_IN
--	);

ddr_bank18 : entity work.ddr_links_wrapper
generic map(
                DELAY_GROUP_NAME     => "bank18_delay_group",
                AVAILABLE_LVDS_LINES => ddr_lines_on_bank18,
                EXCLUDE_DCM_IDELAY_CTRL => FALSE,
                SIMULATION              => SIMULATION
)
port map(
                GCLK_40_IN         => clk_40,
                DELAY_CLK_IN       => clk_200,
                EXT_DDR_CLK_IN     => '0',
                EXT_DDR_CLK_X8_IN  => '0',
                RESET_IN           => reset,
               
                LVDS_IN_P          => DATA_BANK18_IN_P,
                LVDS_IN_N          => DATA_BANK18_IN_N,
               
                LINKS_SYNCED_OUT   => ddr_receivers_synced_bank18,
                               
                DATA_OUT           => ddr_data_from_bank18,
                DATA_VALID_OUT     => ddr_dv_from_bank18,
                DATA_KCTRL_OUT     => ddr_kctrl_from_bank18
);
 
ddr_bank16 : entity work.ddr_links_wrapper
generic map(
                DELAY_GROUP_NAME     => "bank16_delay_group",
                AVAILABLE_LVDS_LINES => ddr_lines_on_bank16,
                EXCLUDE_DCM_IDELAY_CTRL => FALSE,
                SIMULATION           => SIMULATION
)
port map(
                GCLK_40_IN         => clk_40,
                DELAY_CLK_IN       => clk_200,
                EXT_DDR_CLK_IN     => '0',
                EXT_DDR_CLK_X8_IN  => '0',
                RESET_IN           => reset,
               
                LVDS_IN_P          => DATA_BANK16_IN_P,
                LVDS_IN_N          => DATA_BANK16_IN_N,
               
                LINKS_SYNCED_OUT   => ddr_receivers_synced_bank16,
                               
                DATA_OUT           => ddr_data_from_bank16,
                DATA_VALID_OUT     => ddr_dv_from_bank16,
                DATA_KCTRL_OUT     => ddr_kctrl_from_bank16
);
 
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
 
ddr_synced <= '1' when links_synced = ones else '0';

SET_DUMMY_ASSIGNMENTS: for i in 0 to ros_roi_bus_assignment_sig'high generate
  ros_roi_bus_assignment_sig(i) <= std_logic_vector(to_unsigned(0, ros_roi_bus_assignment_sig(0)'length));--std_logic_vector(to_unsigned(i mod 12,ros_roi_bus_assignment_sig(0)'length));
end generate SET_DUMMY_ASSIGNMENTS;

GENERATE_V1_V2_DDR_TO_ROD: for i in 0 to 0 generate
  DDR_TO_ROD_INST: entity work.ddr_to_rod
  port map (
    RESET                       => reset,
    DATA_IN_CLK                 => clk_80,
    DATA_OUT_CLK                => clk_80,
    LVL1_FULL_THR               => x"fe",--"11111110",
    L1_BUSY                     => open,
    DDR_ROS_ROI_IN_DATA         => ddr_data((i+1)*64-1 downto i*64),
    DATA_VALID_IN               => ddr_dv(0),
    SPECIAL_CHAR_IN             => ddr_kctrl(0),
    OUT_DATA                    => data_out_l,
    DATA_VALID_OUT              => data_valid_in_l,
    ACTUAL_BUS_NUMBER_OUT       => actual_bus_number_out_l,
    NUMBER_OF_SLICES_OUT        => number_of_slices_out_l,
    LVL0_OFFSET_OUT             => lvl0_offset_out_l,
    ROS_ROI_BUS_ASSIGNMENT      => ros_roi_bus_assignment_sig,
    ROS_ROI_BUS_ASSIGNMENT_DONE => not reset,--ROS_ROI_BUS_ASSIGNMENT_DONE,
    ROS_ROI_OUT_DATA_CNTR       => open,--ROS_ROI_OUT_DATA_CNTR,
    START_OF_FRAME              => open,
    END_OF_FRAME                => open);
end generate GENERATE_V1_V2_DDR_TO_ROD;


set_data_assignment: for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES - 1 generate
  MUON: if (i mod 4) = 0 generate
    type_assignment_in_l(i) <= to_unsigned(4,4);
  end generate MUON;
  SUM: if (i mod 4) = 1 generate
    type_assignment_in_l(i) <= x"8";
  end generate SUM;
  JET: if (i mod 4) = 2 generate
    type_assignment_in_l(i) <= x"3";
  end generate JET;
  ENERGY: if (i mod 4) = 3 generate
    type_assignment_in_l(i) <= x"2";
  end generate ENERGY;
end generate set_data_assignment;
                           

GENERATE_OUTPUT_PARSERS: for i in 0 to 0 generate--NUMBER_OF_OUTPUT_LINKS - 1 generate

  PARSER_WRAPPER_INST: entity work.parser_wrapper
    generic map (
      LINK_NUMBER              => i)
      --TOTAL_NUMBER_OF_IN_LINKS => tot_number_of_links(ros_roi_bus_assignment_sig,i),
      --ACTIVE_LINKS             => set_active_links(ros_roi_bus_assignment_sig,i))

    port map (
      CLK_WR_IN          => clk_80,
      CLK_RD_IN          => clk_80,
      RESET_IN           => reset,
      BC_OFFSET_IN       => std_logic_vector(to_unsigned(3,6)),
      BC_QTY_IN          => std_logic_vector(to_unsigned(5,6)),
      DATA_IN            => data_out_l(i),
      ROS_ROI_BUS_NUMBER => std_logic_vector(actual_bus_number_out_l(i)),
      DATA_OUT           => open,
      DATA_RE_IN         => '0',
      DATA_RDY_OUT       => open,
      DATA_VALID_IN      => data_valid_in_l(i)
      );
  
end generate GENERATE_OUTPUT_PARSERS;

                           
--*********
-- IPBUS

--ipbus_ctrl_inst : entity work.ipbus_ctrl
--	port map(mac_clk      => clk_125,
--		     rst_macclk   => reset,
--		     ipb_clk      => clk_40,
--		     rst_ipb      => reset,
--		     mac_rx_data  => mac_rx_data,
--		     mac_rx_valid => mac_rx_valid,
--		     mac_rx_last  => mac_rx_last,
--		     mac_rx_error => mac_rx_error,
--		     mac_tx_data  => mac_tx_data,
--		     mac_tx_valid => mac_tx_valid,
--		     mac_tx_last  => mac_tx_last,
--		     mac_tx_error => mac_tx_error,
--		     mac_tx_ready => mac_tx_ready,
--		     ipb_out      => ipb_master_out,
--		     ipb_in       => ipb_master_in,
--		     ipb_req      => ipb_req,
--		     ipb_grant    => ipb_grant,
--		     mac_addr     => mac_addr,
--		     ip_addr      => ip_addr,
--		     pkt_rx       => pkt_rx,
--		     pkt_tx       => pkt_tx
--     );
     




--ddr_bridge : ddr_aurora_buffer
--	port map(CLK_DDR_IN           => clk_80,
--		     CLK_AURORA_IN        => clk_tx_ref,
--		     RESET_IN             => reset,
--		     SYNCED_IN            => ddr_synced,
--		     DDR_DATA_IN          => ddr_data(8 * 9 - 1 downto 8 * 8),
--		     DDR_DV_IN            => ddr_dv(8),
--		     AURORA_DATA_OUT      => au_txd,
--		     AURORA_SOF_N_OUT     => au_sof,
--		     AURORA_EOF_N_OUT     => au_eof,
--		     AURORA_SRC_RDY_N_OUT => au_src,
--		     AURORA_DST_RDY_N_IN  => au_dst
--	);xf

----*********
---- AURORA - GBE  TRANSMISSION

--aurora_inst : aurora2_test_exdes
--port map(
---- User I/O

--    RESET             => reset,
--    HARD_ERR          => open,
--    SOFT_ERR          => open,
--    FRAME_ERR         => open,
--    ERR_COUNT         => open,
--    LANE_UP           => open,
--    CHANNEL_UP        => open,

--   INIT_CLK_P         => clk_125_fr,
--   INIT_CLK_N         => '0',
--   GT_RESET_IN        => reset,

---- Clocks

--   GTXQ2_P    => clk_125_fr, --GTXCLK_P,
--   GTXQ2_N    => '0', --GTXCLK_N,
   
--   TX_D            => au_txd,
--   TX_REM          => '1',   
--   TX_SOF_N        => au_sof,
--   TX_EOF_N        => au_eof,
--   TX_SRC_RDY_N    => au_src,
--   TX_DST_RDY_N    => au_dst,
--	clk_out => clk_tx_ref,
	
--   -- GT I/O

--    RXP               => SFP_RX_N,
--    RXN               => SFP_RX_P,
--    TXP               => SFP_TX_P,
--    TXN               => SFP_TX_N
-- );

--slaves: entity work.slaves 
--	port map(
--			ipb_clk => clk_40,
--			ipb_rst => reset,
--			ipb_in => ipb_master_out,
--			ipb_out => ipb_master_in,
--			rst_out => open, --reset,
--			pkt_rx => pkt_rx,
--			pkt_tx => pkt_tx,
			
--			ttc_readrequest_o => open, --ttc_readrequest,
--			ttc_broadcast_o => open, --ctrlbus_to_virtex(1),
--			ttc_bunchcounterreset_o => open, --ctrlbus_to_virtex(2),
--			ttc_readsize_o => open --ttc_readsize
--	);
	
--eth: entity work.eth_7s_1000basex
--	port map(
--			gt_clkp => GTXCLK_P,
--			gt_clkn => GTXCLK_N,
--			gt_txp => IPBUS_TX_P,
--			gt_txn => IPBUS_TX_N,
--			gt_rxp => IPBUS_RX_P,
--			gt_rxn => IPBUS_RX_N,
--			clk125_out => clk_125,
--			clk125_fr => clk_125_fr,
--			rsti => reset,
--			locked => eth_locked,
--			tx_data => mac_tx_data,
--			tx_valid => mac_tx_valid,
--			tx_last => mac_tx_last,
--			tx_error => mac_tx_error,
--			tx_ready => mac_tx_ready,
--			rx_data => mac_rx_data,
--			rx_valid => mac_rx_valid,
--			rx_last => mac_rx_last,
--			rx_error => mac_rx_error,
--			pcs_pma_status_vector => open
--	);

--	mac_addr <= X"000A3501F610"; 
--	ip_addr <= X"865D828B";


end l1topo_kintex_top;

