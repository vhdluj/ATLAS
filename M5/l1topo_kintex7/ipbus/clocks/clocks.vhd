----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:33 06/27/2014 
-- Design Name: 
-- Module Name:    clocks - Behavioral 
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

entity clocks is 
	generic(
		use_TTC_clk: std_logic := '0'
	);
	port(
		gck1: in std_logic;
		gck2: in std_logic;
		sysclk40_out: out std_logic;
		sysclk80_out: out std_logic;
		sysclk200_out: out std_logic;
		sysclk400_out: out std_logic;
		
		eth_gt_txoutclk: in std_logic;
		ethclk62_5_out: out std_logic;
		ethclk125_out: out std_logic;
		
		gck_mmcm_locked_out: out std_logic;
		eth_mmcm_locked_out: out std_logic
	);
	
end clocks;

architecture Behavioral of clocks is

	signal sysclk40, sysclk40_unbuffered: std_logic;
	signal sysclk80, sysclk80_unbuffered: std_logic;
	signal sysclk200, sysclk200_unbuffered: std_logic;
	signal sysclk400, sysclk400_unbuffered: std_logic;
	signal gck_mmcm_feedback, gck_mmcm_feedback_unbuffered: std_logic;
	signal gck_mmcm_locked: std_logic;

	signal ethclk62_5, ethclk62_5_unbuffered: std_logic;
	signal ethclk125, ethclk125_unbuffered: std_logic;
	signal eth_mmcm_feedback, eth_mmcm_feedback_unbuffered: std_logic;
	signal eth_mmcm_locked: std_logic;

	signal counter125mhz: unsigned(27 downto 0);

begin


GCK_MMCM: MMCME2_ADV
   generic map (
      BANDWIDTH => "OPTIMIZED",      -- Jitter programming (OPTIMIZED, HIGH, LOW)
      COMPENSATION => "ZHOLD",       -- ZHOLD, BUF_IN, EXTERNAL, INTERNAL
		
      CLKIN1_PERIOD => 24.95,
      CLKIN2_PERIOD => 24.95,
		
		
      REF_JITTER1 => 0.01,	-- REF_JITTER: Reference input jitter in UI (0.000-0.999).
      REF_JITTER2 => 0.01,
		
		--VCO Freq: 1202.405 MHz
		CLKFBOUT_MULT_F => 30.0,        -- Multiply value for all CLKOUT (2.000-64.000).
      CLKFBOUT_PHASE => 0.0,         -- Phase offset in degrees of CLKFB (-360.000-360.000).
      
		DIVCLK_DIVIDE => 1,            -- Master division value (1-106)
		
		-- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for CLKOUT (1-128)
      CLKOUT0_DIVIDE_F => 6.000,		--200.401 MHz      -- Divide amount for CLKOUT0 (1.000-128.000).
		CLKOUT1_DIVIDE => 3,				-- 400.8  MHz
      CLKOUT2_DIVIDE => 15,			-- 80.16  MHz
      CLKOUT3_DIVIDE => 30,			-- 40.08
      CLKOUT4_DIVIDE => 1,
      CLKOUT5_DIVIDE => 1,
      CLKOUT6_DIVIDE => 1,
      
      -- CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for CLKOUT outputs (0.01-0.99).
      CLKOUT0_DUTY_CYCLE => 0.5,
      CLKOUT1_DUTY_CYCLE => 0.5,
      CLKOUT2_DUTY_CYCLE => 0.5,
      CLKOUT3_DUTY_CYCLE => 0.5,
      CLKOUT4_DUTY_CYCLE => 0.5,
      CLKOUT5_DUTY_CYCLE => 0.5,
      CLKOUT6_DUTY_CYCLE => 0.5,
		
      -- CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for CLKOUT outputs (-360.000-360.000).
      CLKOUT0_PHASE => 0.0,
      CLKOUT1_PHASE => 0.0,
      CLKOUT2_PHASE => 0.0,
      CLKOUT3_PHASE => 0.0,
      CLKOUT4_PHASE => 0.0,
      CLKOUT5_PHASE => 0.0,
      CLKOUT6_PHASE => 0.0,
      
		CLKFBOUT_USE_FINE_PS => FALSE,
      CLKOUT0_USE_FINE_PS => FALSE,
      CLKOUT1_USE_FINE_PS => FALSE,
      CLKOUT2_USE_FINE_PS => FALSE,
      CLKOUT3_USE_FINE_PS => FALSE,
      CLKOUT4_USE_FINE_PS => FALSE,
      CLKOUT5_USE_FINE_PS => FALSE,
      CLKOUT6_USE_FINE_PS => FALSE, 
		
		CLKOUT4_CASCADE => FALSE,      -- Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
      STARTUP_WAIT => FALSE,         -- Delays DONE until MMCM is locked (FALSE, TRUE)
      		
      SS_EN => "FALSE",              -- Enables spread spectrum (FALSE, TRUE)
      SS_MODE => "CENTER_HIGH",      -- CENTER_HIGH, CENTER_LOW, DOWN_HIGH, DOWN_LOW
      SS_MOD_PERIOD => 10000        -- Spread spectrum modulation period (ns) (VALUES)
      
   )
	
   port map (
      CLKIN1 => gck1,
      CLKIN2 => gck2,
      CLKINSEL => use_TTC_clk,         -- 1-bit input: Clock select, High=CLKIN1 Low=CLKIN2
		
		CLKFBOUT => gck_mmcm_feedback_unbuffered,
		CLKFBIN	=> gck_mmcm_feedback,
		
		CLKOUT0 => sysclk200_unbuffered,
      CLKOUT1 => sysclk400_unbuffered,
		CLKOUT2 => sysclk80_unbuffered,
		CLKOUT3 => sysclk40_unbuffered,
		
		LOCKED => gck_mmcm_locked,             -- 1-bit output: LOCK
		
		--unused ports
		
		CLKOUT0B => open,
      CLKOUT1B => open,
      CLKOUT2B => open,
      --CLKOUT3 	=> open,
      CLKOUT3B => open,
      CLKOUT4 	=> open,
      CLKOUT5 	=> open,
      CLKOUT6 	=> open,
      
		CLKFBOUTB => open,       -- 1-bit output: Inverted CLKFBOUT
		
		CLKFBSTOPPED => open, -- 1-bit output: Feedback clock stopped
      CLKINSTOPPED => open, -- 1-bit output: Input clock stopped
		
		PWRDWN => '0',             -- 1-bit input: Power-down
      RST => '0',                   -- 1-bit input: Reset
				
      DO => open,                     -- 16-bit output: DRP data
      DRDY => open,                 -- 1-bit output: DRP ready
      DADDR => "0000000",               -- 7-bit input: DRP address
      DCLK => '0',                 -- 1-bit input: DRP clock
      DEN => '0',                   -- 1-bit input: DRP enable
      DI => X"0000",                     -- 16-bit input: DRP data
      DWE => '0',                   -- 1-bit input: DRP write enable
		
      PSDONE => open,             -- 1-bit output: Phase shift done
      PSCLK => '0',               -- 1-bit input: Phase shift clock
      PSEN => '0',                 -- 1-bit input: Phase shift enable
      PSINCDEC => '0'         -- 1-bit input: Phase shift increment/decrement
		
   );

	gck_mmcm_locked_out <= gck_mmcm_locked;


GCK_MMCM_FEEDBACK_BUFG: BUFG
	port map(
		I => gck_mmcm_feedback_unbuffered,
		O => gck_mmcm_feedback
	);



SYSCLK200_BUFG: BUFG
	port map(
		I => sysclk200_unbuffered,
		O => sysclk200
	);

	sysclk200_out <= sysclk200;



SYSCLK40_BUFG: BUFG
	port map(
		I => sysclk40_unbuffered,
		O => sysclk40
	);

	sysclk40_out <= sysclk40;
	
	
	
SYSCLK80_BUFG: BUFG
	port map(
		I => sysclk80_unbuffered,
		O => sysclk80
	);

	sysclk80_out <= sysclk80;



SYSCLK400_BUFG: BUFG
	port map(
		I => sysclk400_unbuffered,
		O => sysclk400
	);

	sysclk400_out <= sysclk400;












--ETH_MMCM: MMCME2_ADV
--   generic map (
--      BANDWIDTH => "OPTIMIZED",      -- Jitter programming (OPTIMIZED, HIGH, LOW)
--      COMPENSATION => "ZHOLD",       -- ZHOLD, BUF_IN, EXTERNAL, INTERNAL
--		
--      CLKIN1_PERIOD => 16.00,
--		
--      REF_JITTER1 => 0.01, -- REF_JITTER: Reference input jitter in UI (0.000-0.999).
--      
--		
--		--VCO Freq: 1000 MHz
--		CLKFBOUT_MULT_F => 16.0,        -- Multiply value for all CLKOUT (2.000-64.000).
--      CLKFBOUT_PHASE => 0.0,         -- Phase offset in degrees of CLKFB (-360.000-360.000).
--      
--		DIVCLK_DIVIDE => 1,            -- Master division value (1-106)
--		
--		-- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for CLKOUT (1-128)
--      CLKOUT0_DIVIDE_F => 16.0,       -- Divide amount for CLKOUT0 (1.000-128.000).
--		CLKOUT1_DIVIDE => 8,
--      CLKOUT2_DIVIDE => 1,
--      CLKOUT3_DIVIDE => 1,
--      CLKOUT4_DIVIDE => 1,
--      CLKOUT5_DIVIDE => 1,
--      CLKOUT6_DIVIDE => 1,
--      
--      -- CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for CLKOUT outputs (0.01-0.99).
--      CLKOUT0_DUTY_CYCLE => 0.5,
--      CLKOUT1_DUTY_CYCLE => 0.5,
--      CLKOUT2_DUTY_CYCLE => 0.5,
--      CLKOUT3_DUTY_CYCLE => 0.5,
--      CLKOUT4_DUTY_CYCLE => 0.5,
--      CLKOUT5_DUTY_CYCLE => 0.5,
--      CLKOUT6_DUTY_CYCLE => 0.5,
--		
--      -- CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for CLKOUT outputs (-360.000-360.000).
--      CLKOUT0_PHASE => 0.0,
--      CLKOUT1_PHASE => 0.0,
--      CLKOUT2_PHASE => 0.0,
--      CLKOUT3_PHASE => 0.0,
--      CLKOUT4_PHASE => 0.0,
--      CLKOUT5_PHASE => 0.0,
--      CLKOUT6_PHASE => 0.0,
--      
--		CLKFBOUT_USE_FINE_PS => FALSE,
--      CLKOUT0_USE_FINE_PS => FALSE,
--      CLKOUT1_USE_FINE_PS => FALSE,
--      CLKOUT2_USE_FINE_PS => FALSE,
--      CLKOUT3_USE_FINE_PS => FALSE,
--      CLKOUT4_USE_FINE_PS => FALSE,
--      CLKOUT5_USE_FINE_PS => FALSE,
--      CLKOUT6_USE_FINE_PS => FALSE, 
--		
--		CLKOUT4_CASCADE => FALSE,      -- Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
--      STARTUP_WAIT => FALSE,         -- Delays DONE until MMCM is locked (FALSE, TRUE)
--      		
--      SS_EN => "FALSE",              -- Enables spread spectrum (FALSE, TRUE)
--      SS_MODE => "CENTER_HIGH",      -- CENTER_HIGH, CENTER_LOW, DOWN_HIGH, DOWN_LOW
--      SS_MOD_PERIOD => 10000        -- Spread spectrum modulation period (ns) (VALUES)
--      
--   )
--	
--   port map (
--      
--		CLKIN1 => eth_gt_txoutclk,
--      
--		CLKFBOUT => eth_mmcm_feedback_unbuffered,
--		CLKFBIN	=> eth_mmcm_feedback,
--		
--		CLKOUT0 => ethclk62_5_unbuffered,
--      CLKOUT1 => ethclk125_unbuffered,
--		
--		LOCKED => eth_mmcm_locked,             -- 1-bit output: LOCK
--		
--		CLKINSEL => '1',         -- 1-bit input: Clock select, High=CLKIN1 Low=CLKIN2
--		--unused ports
--		
--		CLKIN2 => '0',
--		CLKOUT0B => open,
--      CLKOUT1B => open,
--      CLKOUT2 	=> open,
--      CLKOUT2B => open,
--      CLKOUT3 	=> open,
--      CLKOUT3B => open,
--      CLKOUT4 	=> open,
--      CLKOUT5 	=> open,
--      CLKOUT6 	=> open,
--      
--		CLKFBOUTB => open,       -- 1-bit output: Inverted CLKFBOUT
--		
--		CLKFBSTOPPED => open, -- 1-bit output: Feedback clock stopped
--      CLKINSTOPPED => open, -- 1-bit output: Input clock stopped
--		
--		PWRDWN => '0',             -- 1-bit input: Power-down
--      RST => '0',                   -- 1-bit input: Reset
--				
--      DO => open,                     -- 16-bit output: DRP data
--      DRDY => open,                 -- 1-bit output: DRP ready
--      DADDR => "0000000",               -- 7-bit input: DRP address
--      DCLK => '0',                 -- 1-bit input: DRP clock
--      DEN => '0',                   -- 1-bit input: DRP enable
--      DI => X"0000",                     -- 16-bit input: DRP data
--      DWE => '0',                   -- 1-bit input: DRP write enable
--		
--      PSDONE => open,             -- 1-bit output: Phase shift done
--      PSCLK => '0',               -- 1-bit input: Phase shift clock
--      PSEN => '0',                 -- 1-bit input: Phase shift enable
--      PSINCDEC => '0'         -- 1-bit input: Phase shift increment/decrement
--		
--   );

	eth_mmcm_locked_out <= eth_mmcm_locked;



ETH_MMCM_FEEDBACK_BUFG: BUFG
	port map(
		I => eth_mmcm_feedback_unbuffered,
		O => eth_mmcm_feedback
	);



ETHCLK62_5_BUFG: BUFG
	port map(
		I => ethclk62_5_unbuffered,
		O => ethclk62_5
	);
	
	ethclk62_5_out <= ethclk62_5;
	
	
	
ETHCLK125_BUFG: BUFG
	port map(
		I => ethclk125_unbuffered,
		O => ethclk125
	);	
	
	ethclk125_out <= ethclk125;






end Behavioral;

