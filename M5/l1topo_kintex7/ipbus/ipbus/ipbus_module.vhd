----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:48:47 07/07/2014 
-- Design Name: 
-- Module Name:    ipbus_module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.ipbus.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ipbus_module is
	port(
		sysclk40: in std_logic;
		sysclk80: in std_logic;
		sysclk200: in std_logic;
		sysclk400: in std_logic;
		mgt5_clk_buffered: in std_logic;
		eth_gt_txoutclk: out std_logic;
		ethclk62_5: in std_logic;
		ethclk125: in std_logic;
		gck_mmcm_locked: in std_logic;
		eth_mmcm_locked: in std_logic;
		
		mgt5_clk: in std_logic;
		VME_EXT_RX_P, VME_EXT_RX_N: in std_logic;
		VME_EXT_TX_P, VME_EXT_TX_N: out std_logic;
		
		eth_sgmiiphy_done_out: out std_logic;
		rst_extphy: out std_logic;
		mac_addr: in std_logic_vector(47 downto 0) := X"000000000000"; -- Static MAC and IP addresses
		ip_addr: in std_logic_vector(31 downto 0) := X"00000000";
		pkt_rx_led: out std_logic;
		pkt_tx_led: out std_logic;
		
		ctrlbus_u1_in, ctrlbus_u2_in: in std_logic_vector(2 downto 0);
		ctrlbus_u1_out, ctrlbus_u2_out: out std_logic_vector(4 downto 0);
		
		fakeTTCBroadcast: out std_logic;
		
		debugIPBus: out std_logic_vector(98 downto 0);
		debugIPBusBridgeU2: out std_logic_vector(227 downto 0)
		
	);
end ipbus_module;

architecture Behavioral of ipbus_module is

	signal rst: std_logic;
	signal rst_sgmiiphy: std_logic;
	signal rst_mac: std_logic;
	signal rst_ipb125: std_logic;
	signal rst_ipb: std_logic;
	signal eth_sgmiiphy_done: std_logic;
	signal eth_locked: std_logic;
	
	signal mac_tx_data: std_logic_vector(7 downto 0);
	signal mac_rx_data: std_logic_vector(7 downto 0);
	signal mac_tx_valid: std_logic;
	signal mac_tx_last: std_logic;
	signal mac_tx_error: std_logic;
	signal mac_tx_ready: std_logic;
	signal mac_rx_valid: std_logic;
	signal mac_rx_last: std_logic;
	signal mac_rx_error: std_logic;
	
	signal ipb_master_out : ipb_wbus;
	signal ipb_master_in : ipb_rbus;

begin

process(mgt5_clk_buffered) begin
	if rising_edge(mgt5_clk_buffered) then
		rst <= not gck_mmcm_locked;
		rst_sgmiiphy <= rst;
		eth_locked <= eth_mmcm_locked and eth_sgmiiphy_done;
	end if;
end process;

	rst_mac <= not(eth_locked) or rst_sgmiiphy;



process(ethclk125) begin
	if rising_edge(ethclk125) then
		rst_ipb125 <= rst or not eth_locked;
	end if;
end process;



process(sysclk40) begin
	if rising_edge(sysclk40) then
		rst_ipb <= rst;
	end if;
end process;



eth: entity work.eth_sgmii
	port map(
		mgt5_clk 	 		=> mgt5_clk,
		eth_gt_txoutclk	=> eth_gt_txoutclk,
		ethclk62_5 			=> ethclk62_5,
		ethclk125 			=> ethclk125,
		sysclk200 			=> sysclk200,
		
		rst_sgmiiphy => rst_sgmiiphy,
		rst_mac => rst_mac,
		rst_extphy => rst_extphy,
		
		eth_mmcm_locked => eth_mmcm_locked,
		sgmiiphy_done => eth_sgmiiphy_done,
	
		VME_EXT_RX_P 		=> VME_EXT_RX_P,
		VME_EXT_RX_N 		=> VME_EXT_RX_N,
		VME_EXT_TX_P 		=> VME_EXT_TX_P,
		VME_EXT_TX_N 		=> VME_EXT_TX_N,
		
		mac_rx_data => mac_rx_data,
		mac_rx_valid => mac_rx_valid,
		mac_rx_error => mac_rx_error,
		mac_rx_last => mac_rx_last,
		
		mac_tx_data => mac_tx_data,
		mac_tx_ready => mac_tx_ready,
		mac_tx_valid => mac_tx_valid,
		mac_tx_error => mac_tx_error,
		mac_tx_last => mac_tx_last
	);




ipbus_master: entity work.ipbus_ctrl
	port map(
		mac_clk => ethclk125,
		rst_macclk => rst_ipb125,
		ipb_clk => sysclk40,
		rst_ipb => rst_ipb,
		
		mac_addr => mac_addr,
		ip_addr => ip_addr,
		
		mac_rx_data => mac_rx_data,
		mac_rx_valid => mac_rx_valid,
		mac_rx_error => mac_rx_error,
		mac_rx_last => mac_rx_last,
		
		mac_tx_data => mac_tx_data,
		mac_tx_ready => mac_tx_ready,
		mac_tx_valid => mac_tx_valid,
		mac_tx_error => mac_tx_error,
		mac_tx_last => mac_tx_last,
		
		ipb_out => ipb_master_out,
		ipb_in => ipb_master_in,
		
		pkt_rx => open,
		pkt_tx => open,
		pkt_rx_led => pkt_rx_led,
		pkt_tx_led => pkt_tx_led
	);



ipbus_slaves: entity work.slaves
		port map(
			sysclk40  => sysclk40,
			sysclk80  => sysclk80,
			sysclk200 => sysclk200,
			sysclk400 => sysclk400,
			
			gck_mmcm_locked => gck_mmcm_locked,
			
			ipb_rst => rst_ipb,
			ipb_in  => ipb_master_out,
			ipb_out => ipb_master_in,
			
			ctrlbus_u1_out => ctrlbus_u1_out,
			ctrlbus_u2_out => ctrlbus_u2_out,
			ctrlbus_u1_in  => ctrlbus_u1_in,
			ctrlbus_u2_in  => ctrlbus_u2_in,
			
			fakeTTCBroadcast => fakeTTCBroadcast,
			
			debugIPBusBridgeU2 => debugIPBusBridgeU2
			
		);


debugIPBus(31 downto  0) <= ipb_master_out.ipb_addr;
debugIPBus(63 downto 32) <= ipb_master_out.ipb_wdata;
debugIPBus(64) <= ipb_master_out.ipb_strobe;
debugIPBus(65) <= ipb_master_out.ipb_write;
debugIPBus(97 downto 66) <= ipb_master_in.ipb_rdata;
debugIPBus(98) <= ipb_master_in.ipb_ack;




end Behavioral;

