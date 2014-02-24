----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:21 01/07/2014 
-- Design Name: 
-- Module Name:    top_TopoVirtex - Behavioral 
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
use work.ipbus.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity top_TopoVirtex is port(
		GCK2_IN_P, GCK2_IN_N: in std_logic;
		CTRLBUS_IN_P, CTRLBUS_IN_N: in std_logic_vector(4 downto 0);
		CTRLBUS_OUT_P, CTRLBUS_OUT_N: out std_logic_vector(2 downto 0);
		LED_OUT: out std_logic
	);
end top_TopoVirtex;

architecture Behavioral of top_TopoVirtex is

	signal gck2_clk40: std_logic;
	signal gck2_clk80: std_logic;
	signal idelayctrl_refclk300: std_logic;
	signal gck2_mmcm_locked: std_logic;
	
	signal ctrlbus_locked: std_logic;
	
	signal ipb_master_read: ipb_rbus;
	signal ipb_master_write: ipb_wbus;
	signal ctrlbus_idelay_value: std_logic_vector(24 downto 0); --5pins * 5bit/pin
	signal ctrlbus_idelay_load: std_logic_vector(4 downto 0);
	
	signal rst_ipb: std_logic;
	signal trigger: std_logic;

begin

	clocks: entity work.clocks_TopoVirtex
		port map(
			GCK2_IN_P => GCK2_IN_P,
			GCK2_IN_N => GCK2_IN_N,
			gck2_mmcm_locked_out => gck2_mmcm_locked,
			gck2_clk40_out => gck2_clk40,
			gck2_clk80_out => gck2_clk80,
			idelayctrl_refclk300_out => idelayctrl_refclk300
		);

	
	
	ctrlbus: entity work.ctrlbus
		port map(
			gck2_clk40_in => gck2_clk40,
			gck2_clk80_in => gck2_clk80,
			idelayctrl_refclk300_in => idelayctrl_refclk300,
			CTRLBUS_OUT_P => CTRLBUS_OUT_P,
			CTRLBUS_OUT_N => CTRLBUS_OUT_N,
			CTRLBUS_IN_P => CTRLBUS_IN_P,
			CTRLBUS_IN_N => CTRLBUS_IN_N,
			ipb_read_in => ipb_master_read,
			ipb_write_out => ipb_master_write,
			idelay_value_in => ctrlbus_idelay_value,
			idelay_load_in => ctrlbus_idelay_load,
			ctrlbus_locked_out => ctrlbus_locked
		);

	LED_OUT <= ctrlbus_locked;

	rst_ipb <= not gck2_mmcm_locked;

	slaves: entity work.slaves port map(
		ipb_clk => gck2_clk40, --ipb_clk
		ipb_rst => rst_ipb,
		ipb_in => ipb_master_write,
		ipb_out => ipb_master_read,
	
		ctrlbus_idelay_value_out => ctrlbus_idelay_value,
		ctrlbus_idelay_load_out => ctrlbus_idelay_load,

		ctrlbus_locked_in => ctrlbus_locked
	);




end Behavioral;

