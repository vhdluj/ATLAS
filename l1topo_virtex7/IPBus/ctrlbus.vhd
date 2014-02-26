----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:41:58 11/05/2013 
-- Design Name: 
-- Module Name:    ctrlbus - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

use work.ipbus.all;


entity ctrlbus is port(
		gck2_clk40_in: in std_logic;
		gck2_clk80_in: in std_logic;
		idelayctrl_refclk300_in: in std_logic;
		
		ipb_read_in: in ipb_rbus;
		CTRLBUS_OUT_P, CTRLBUS_OUT_N: out std_logic_vector(2 downto 0);
						
		CTRLBUS_IN_P, CTRLBUS_IN_N: in std_logic_vector(4 downto 0);
		ipb_write_out: out ipb_wbus;
		ctrlbus_locked_out: out std_logic;
		
		idelay_value_in: in std_logic_vector(24 downto 0);
		idelay_load_in: in std_logic_vector(4 downto 0);
		
		clk400 : out std_logic;
		clk80 : out std_logic
	);
end ctrlbus;

architecture Behavioral of ctrlbus is

	signal ctrlbus_serdes_serialclk400_unbuffered, ctrlbus_serdes_serialclk400: std_logic;
	signal ctrlbus_serdes_parallelclk80: std_logic;
	signal ctrlbus_mmcm_feedback_unbuffered: std_logic;
	signal ctrlbus_mmcm_locked: std_logic;
	signal ctrlbus_reset: std_logic;

	signal ipb_write: ipb_wbus;

begin



	ctrlbus_mmcm : MMCME2_ADV	
		generic map (
			BANDWIDTH => "OPTIMIZED",
			CLKFBOUT_PHASE => 0.0,
			CLKIN1_PERIOD => 24.95,
			CLKFBOUT_MULT_F => 30.0,			-- VCO-freq: 1202.4 MHz
			CLKOUT0_DIVIDE_F => 3.0,
			DIVCLK_DIVIDE => 1,
			REF_JITTER1 => 0.01
		)
		port map (
			CLKOUT0 => ctrlbus_serdes_serialclk400_unbuffered,
			CLKFBOUT => ctrlbus_mmcm_feedback_unbuffered,
			CLKFBIN => ctrlbus_mmcm_feedback_unbuffered,
			CLKIN1 => gck2_clk40_in,
			CLKIN2 => '0',
			CLKINSEL => '1',
			LOCKED => ctrlbus_mmcm_locked,
			PWRDWN => '0',
			RST => '0',
			DADDR => (others=>'0'),
			DCLK => '0',
			DEN => '0',
			DI => (others=>'0'),
			DWE => '0',
			PSCLK => '0',
			PSEN => '0',
			PSINCDEC => '0'
		);


		ctrlbus_reset <= not ctrlbus_mmcm_locked;





	ctrlbus_serdes_serialclk400_bufio: BUFIO
		port map (
			O => ctrlbus_serdes_serialclk400,
			I => ctrlbus_serdes_serialclk400_unbuffered
		);

    clk400 <= ctrlbus_serdes_serialclk400;

	ctrlbus_serdes_parallelclk80_bufr: BUFR
		generic map (
			BUFR_DIVIDE => "5",
			SIM_DEVICE => "7SERIES"
		)
		port map (
			O => ctrlbus_serdes_parallelclk80,
			CE => '1',
			CLR => '0',
			I => ctrlbus_serdes_serialclk400_unbuffered
		);
clk80 <= ctrlbus_serdes_parallelclk80;


	ctrlbus_in: entity work.ctrlbus_in
		port map(
			gck2_clk40_in => gck2_clk40_in,
			gck2_clk80_in => gck2_clk80_in,
			ctrlbus_serdes_parallelclk80_in => ctrlbus_serdes_parallelclk80,
			ctrlbus_serdes_serialclk400_in => ctrlbus_serdes_serialclk400,
			idelayctrl_refclk300_in => idelayctrl_refclk300_in,
			ctrlbus_reset_in => ctrlbus_reset,
			CTRLBUS_IN_P => CTRLBUS_IN_P,
			CTRLBUS_IN_N => CTRLBUS_IN_N,
			ipb_write_out => ipb_write,
			
			ctrlbus_locked_out => ctrlbus_locked_out,
			idelay_value_in => idelay_value_in,
			idelay_load_in => idelay_load_in
		);
	
	ipb_write_out <= ipb_write;
	
		
	ctrlbus_out: entity work.ctrlbus_out
		port map(
			gck2_clk40_in => gck2_clk40_in,
			gck2_clk80_in => gck2_clk80_in,
			ctrlbus_serdes_parallelclk80_in => ctrlbus_serdes_parallelclk80,
			ctrlbus_serdes_serialclk400_in => ctrlbus_serdes_serialclk400,
			ctrlbus_reset_in => ctrlbus_reset,
			CTRLBUS_OUT_P => CTRLBUS_OUT_P,
			CTRLBUS_OUT_N => CTRLBUS_OUT_N,
			ipb_read_in => ipb_read_in,
			ipb_strobe_in => ipb_write.ipb_strobe
		);
	

end Behavioral;

