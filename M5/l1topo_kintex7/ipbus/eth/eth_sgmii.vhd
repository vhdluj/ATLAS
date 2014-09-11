----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:57 06/27/2014 
-- Design Name: 
-- Module Name:    eth - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;



entity eth_sgmii is port(
		VME_EXT_RX_P, VME_EXT_RX_N: in std_logic;
		VME_EXT_TX_P, VME_EXT_TX_N: out std_logic;
		mgt5_clk: in std_logic;
		eth_gt_txoutclk: out std_logic;
		ethclk62_5: in std_logic;
		ethclk125: in std_logic;
		sysclk200: in std_logic;	
		
		rst_sgmiiphy: in std_logic;
		rst_mac: in std_logic;
		rst_extphy: out std_logic;
		
		eth_mmcm_locked: in std_logic;
		sgmiiphy_done: out std_logic;
		
		
		mac_rx_data: out std_logic_vector(7 downto 0);
		mac_rx_valid: out std_logic;
		mac_rx_error: out std_logic;
		mac_rx_last: out std_logic;
		mac_tx_data: in std_logic_vector(7 downto 0);
		mac_tx_ready: out std_logic;
		mac_tx_valid: in std_logic;
		mac_tx_error: in std_logic;
		mac_tx_last: in std_logic
		
		
	);
end eth_sgmii;

architecture Behavioral of eth_sgmii is

	signal gmii_txd: std_logic_vector(7 downto 0);
	signal gmii_tx_en: std_logic;
	signal gmii_tx_er: std_logic;
	
	signal gmii_rxd: std_logic_vector(7 downto 0);
	signal gmii_rx_dv: std_logic;
	signal gmii_rx_er: std_logic;

	signal eth_gt_txoutclk_unbuffered: std_logic;
	signal mgt5_clk_buffered: std_logic;
	
	signal status: std_logic_vector(15 downto 0);
	
	signal rst_mac_n: std_logic;
	
	type extphyreset_state_type is (ST_IDLE, ST_PREPARE_RESET, ST_RESET);
	signal extphyreset_state: extphyreset_state_type;
	signal extphyreset_counter: unsigned(5 downto 0);
	
	
	COMPONENT tri_mode_eth_mac_v5_5
		PORT (
			glbl_rstn : IN STD_LOGIC;
			rx_axi_rstn : IN STD_LOGIC;
			tx_axi_rstn : IN STD_LOGIC;
			rx_axi_clk : IN STD_LOGIC;
			rx_reset_out : OUT STD_LOGIC;
			rx_axis_mac_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			rx_axis_mac_tvalid : OUT STD_LOGIC;
			rx_axis_mac_tlast : OUT STD_LOGIC;
			rx_axis_mac_tuser : OUT STD_LOGIC;
			rx_statistics_vector : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
			rx_statistics_valid : OUT STD_LOGIC;
			tx_axi_clk : IN STD_LOGIC;
			tx_reset_out : OUT STD_LOGIC;
			tx_axis_mac_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			tx_axis_mac_tvalid : IN STD_LOGIC;
			tx_axis_mac_tlast : IN STD_LOGIC;
			tx_axis_mac_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			tx_axis_mac_tready : OUT STD_LOGIC;
			tx_ifg_delay : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			tx_statistics_vector : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			tx_statistics_valid : OUT STD_LOGIC;
			pause_req : IN STD_LOGIC;
			pause_val : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			speed_is_100 : OUT STD_LOGIC;
			speed_is_10_100 : OUT STD_LOGIC;
			gmii_txd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			gmii_tx_en : OUT STD_LOGIC;
			gmii_tx_er : OUT STD_LOGIC;
			gmii_rxd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			gmii_rx_dv : IN STD_LOGIC;
			gmii_rx_er : IN STD_LOGIC;
			rx_mac_config_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
			tx_mac_config_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0)
		);
	END COMPONENT;
	
	
	
	
	
	
begin






process(ethclk125) begin
	if rising_edge(ethclk125) then
		if eth_mmcm_locked='0' then 
			extphyreset_counter <= (others => '0');
			extphyreset_state <= ST_PREPARE_RESET;
		else
			case extphyreset_state is
				when ST_IDLE =>
					extphyreset_counter <= (others => '0');
				when ST_PREPARE_RESET =>
					if extphyreset_counter = "111111" then
						extphyreset_counter <= (others => '0');
						extphyreset_state <= ST_RESET;
					else 
						extphyreset_counter <= extphyreset_counter + 1;
					end if;
				when ST_RESET =>
					if extphyreset_counter = "111111" then
						extphyreset_state <= ST_IDLE;
					else 
						extphyreset_counter <= extphyreset_counter + 1;
					end if;
			end case;
		end if;
	end if;
end process;


rst_extphy <= '1' when extphyreset_state=ST_RESET else '0';








MGT5_CLK_BUFG: BUFG
	port map(
		I => mgt5_clk,
		O => mgt5_clk_buffered
	);


	sgmiiphy: entity work.gig_eth_pcs_pma_v11_5_block
		port map(
			drpaddr_in	=> (others => '0'),
			drpclk_in	=> ethclk125,
			drpdi_in		=> (others => '0'),
			drpdo_out	=> open,
			drpen_in		=> '0',
			drprdy_out	=> open,
			drpwe_in		=> '0',
			
			gtrefclk => mgt5_clk,
			txoutclk => eth_gt_txoutclk_unbuffered,
			rxp => VME_EXT_RX_P,
			rxn => VME_EXT_RX_N,
			txp => VME_EXT_TX_P,
			txn => VME_EXT_TX_N,
			
			userclk => ethclk62_5,
			userclk2 => ethclk125,
			independent_clock_bufg => sysclk200,
			
			resetdone => sgmiiphy_done,
			mmcm_locked => eth_mmcm_locked,
			
			pma_reset => rst_sgmiiphy,
			
--			sgmii_clk_r => open,
--			sgmii_clk_f => open,
--			sgmii_clk_en => open,
			
			gmii_txd => gmii_txd,
			gmii_tx_en => gmii_tx_en,
			gmii_tx_er => gmii_tx_er,
			gmii_rxd => gmii_rxd,
			gmii_rx_dv => gmii_rx_dv,
			gmii_rx_er => gmii_rx_er,
			gmii_isolate => open,
			configuration_vector => "10000",
			
			an_interrupt => open,
			an_adv_config_vector => "0000000000100001",
			an_restart_config => '0',
			link_timer_value => "000110010",
			
--			speed_is_10_100 => '0',
--			speed_is_100 => '0',
			
			status_vector => status,
			reset => rst_sgmiiphy,
			signal_detect => '1'
		);


ETH_GT_TXOUTCLK_BUFG: BUFG
	port map(
		I => eth_gt_txoutclk_unbuffered,
		O => eth_gt_txoutclk
	);






	rst_mac_n <= not rst_mac;
	

mac: tri_mode_eth_mac_v5_5
	port map(
		glbl_rstn				=> rst_mac_n,
		rx_axi_rstn 			=> '1',
		tx_axi_rstn 			=> '1',
		rx_axi_clk				=>	ethclk125,
		rx_reset_out			=> open,
		rx_axis_mac_tdata		=> mac_rx_data,
		rx_axis_mac_tvalid	=> mac_rx_valid,
		rx_axis_mac_tlast		=> mac_rx_last,
		rx_axis_mac_tuser		=> mac_rx_error,
		rx_statistics_vector	=> open,
		rx_statistics_valid	=> open,
		tx_axi_clk				=> ethclk125,
		tx_reset_out			=> open,
		tx_axis_mac_tdata		=> mac_tx_data,
		tx_axis_mac_tvalid	=> mac_tx_valid,
		tx_axis_mac_tlast		=> mac_tx_last,
		tx_axis_mac_tuser(0)	=> mac_tx_error,
		tx_axis_mac_tready	=> mac_tx_ready,
		tx_ifg_delay			=> X"00",
		tx_statistics_vector	=> open,
		tx_statistics_valid	=> open,
		pause_req				=> '0',
		pause_val				=> X"0000",
		speed_is_100			=> open,
		speed_is_10_100		=> open,
		gmii_txd					=> gmii_txd,
		gmii_tx_en				=> gmii_tx_en,
		gmii_tx_er				=> gmii_tx_er,
		gmii_rxd					=> gmii_rxd,
		gmii_rx_dv				=> gmii_rx_dv,
		gmii_rx_er				=> gmii_rx_er,
		rx_mac_config_vector	=> X"0000_0000_0000_0000_0812",
		tx_mac_config_vector	=> X"0000_0000_0000_0000_0012"
	);

end Behavioral;

