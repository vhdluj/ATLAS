----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:42:39 01/07/2014 
-- Design Name: 
-- Module Name:    clocks_TopoVirtex - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity clocks_TopoVirtex is port(
	GCK2_IN_P, GCK2_IN_N: in std_logic;
	gck2_mmcm_locked_out: out std_logic;
	gck2_clk40_out: out std_logic;
	gck2_clk80_out: out std_logic;
	--serdes_serialclk400_out: out std_logic;
	idelayctrl_refclk300_out: out std_logic
);
end clocks_TopoVirtex;


architecture Behavioral of clocks_TopoVirtex is

	signal gck2: std_logic;
	signal gck2_mmcm_feedback, gck2_mmcm_feedback_unbuffered: std_logic;
	signal idelayctrl_refclk300_unbuffered: std_logic;
	signal gck2_clk40_unbuffered: std_logic;
	signal gck2_clk80_unbuffered: std_logic;
	--signal serdes_serialclk400_unbuffered: std_logic;

begin



GCK2_IBUFGDS: IBUFGDS
		port map(
			I => GCK2_IN_P,
			IB => GCK2_IN_N,
			O => gck2
		);
		

	GCK2_MMCM: MMCME2_ADV
	generic map(
		BANDWIDTH					=>	"OPTIMIZED",
		CLKIN1_PERIOD			=> 24.95,		-- 40.08MHz
		REF_JITTER1					=> 0.010,
		DIVCLK_DIVIDE			=>	1,
		CLKFBOUT_MULT_F	=>	30.000,		--	1202.4 MHz
		CLKOUT0_DIVIDE_F	=>	4.000,		--	  300.6 MHz
		CLKOUT1_DIVIDE		=>	30,				--	    40.08 MHz
		CLKOUT2_DIVIDE		=>	15				--	    80.16 MHz
		--CLKOUT3_DIVIDE		=>	3					--	  400.80 MHz
	)
	port map(
		CLKIN1 			=>	gck2,
		CLKFBIN		=>	gck2_mmcm_feedback,
		CLKFBOUT	=>	gck2_mmcm_feedback_unbuffered,
		CLKOUT0		=>	idelayctrl_refclk300_unbuffered,
		CLKOUT1		=>	gck2_clk40_unbuffered,
		CLKOUT2		=>	gck2_clk80_unbuffered,
		--CLKOUT3		=>	serdes_serialclk400_unbuffered,
		LOCKED			=> gck2_mmcm_locked_out,
		
		--unused ports
		CLKIN2=>'0', CLKINSEL=>'1',
		DADDR=>(others=>'0'), DCLK=>'0', DEN=>'0', DI=>(others=>'0'), DWE=>'0',
		PSCLK=>'0', PSEN=>'0', PSINCDEC=>'0', PWRDWN=>'0',
		RST=>'0'
	);

	
	GCK2_MMCM_FEEDBACK_BUFG: BUFG
		port map(
			I	=>	gck2_mmcm_feedback_unbuffered,
			O	=>	gck2_mmcm_feedback
		);

	IDELAYCTRL_REFCLK_BUFG: BUFG
		port map(
			I => idelayctrl_refclk300_unbuffered,
			O => idelayctrl_refclk300_out
		);

	GCK2_CLK80_BUFG: BUFG
		port map(
			I	=>	gck2_clk80_unbuffered,
			O	=>	gck2_clk80_out
		);

--	SERDES_SERIALCLK_BUFG: BUFG
--		port map(
--			I	=>	serdes_serialclk400_unbuffered,
--			O	=>	serdes_serialclk400_out
--		);
	
	GCK2_BUFG: BUFG
		port map(
			I	=>	gck2_clk40_unbuffered,
			O	=>	gck2_clk40_out
		);

	


end Behavioral;

