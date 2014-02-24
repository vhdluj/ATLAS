-- Top-level design for ipbus demo
--
-- You must edit this file to set the IP and MAC addresses
--
-- Dave Newbold, 16/7/12

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;
use work.ipbus.ALL;

entity top is port(
	gt_clkp, gt_clkn: in std_logic;
	gt_txp, gt_txn: out std_logic;
	gt_rxp, gt_rxn: in std_logic;
	GCK2_IN_P, GCK2_IN_N: in std_logic;
	
	CTRLBUS_U1_IN_P, CTRLBUS_U1_IN_N: in std_logic_vector(2 downto 0);
	CTRLBUS_U2_IN_P, CTRLBUS_U2_IN_N: in std_logic_vector(2 downto 0);
	CTRLBUS_U1_OUT_P, CTRLBUS_U1_OUT_N: out std_logic_vector(4 downto 0);
	CTRLBUS_U2_OUT_P, CTRLBUS_U2_OUT_N: out std_logic_vector(4 downto 0);
	PHY_RESET_OUT_N: out std_logic;
	LED_OUT: out STD_LOGIC_VECTOR(15 downto 0)
	);

end top;

architecture rtl of top is

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

begin

--	DCM clock generation for internal bus, ethernet

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
	
	locked <= clk_locked and eth_locked;
	led_speedis1000 <= pcs_pma_status(11) and not pcs_pma_status(10);
	LED_OUT(0) <= onehz;
	LED_OUT(1) <= locked;
	LED_OUT(2) <= pcs_pma_status(0);  --Link status
	LED_OUT(3) <= pcs_pma_status(1);  --Link synchronization
	LED_OUT(4) <= pcs_pma_status(7);  --PHY Link status
	LED_OUT(5) <= led_speedis1000; --speed is 1000Mb/s
	LED_OUT(6) <= pcs_pma_status(12); --full duplex
	LED_OUT(7) <= pcs_pma_status(2); --receiving /C/ ordered sets (auto-negotiation)
	LED_OUT(8) <= pcs_pma_status(3); --receiving /I/ ordered sets (idle)
	LED_OUT(9) <= pcs_pma_status(4); --receiving invalid data while /C/ or /I/ ordered sets
	LED_OUT(10) <= pcs_pma_status(5); --receiving disparity error
	LED_OUT(11) <= pcs_pma_status(6); --receiving not interpretable 8b10b-code
	LED_OUT(12) <= phy_reset;
	LED_OUT(13) <= '0';
	LED_OUT(14) <= pkt_rx_led;
	LED_OUT(15) <= pkt_tx_led;
	
	
		
	
	
-- Ethernet MAC core and PHY interface
	
	eth: entity work.eth_7s_sgmii
		port map(
			gt_clkp => gt_clkp,
			gt_clkn => gt_clkn,
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
	ip_addr <= X"898A5114"; --137.138.81.20


-- ipbus slaves live in the entity below, and can expose top-level ports
-- The ipbus fabric is instantiated within.

	slaves: entity work.slaves port map(
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
		ctrlbus_idelay_load_out => ctrlbus_idelay_load
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
			idelay_load_in => ctrlbus_idelay_load
		);


	
end rtl;

