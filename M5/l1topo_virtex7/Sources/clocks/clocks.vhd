----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.07.2014 16:18:16
-- Design Name: 
-- Module Name: clocks - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
		sysclk160_out: out std_logic;
		sysclk200_out: out std_logic;
		sysclk320_out: out std_logic;
		sysclk400_out: out std_logic;
		
		sysclk_pll_locked_out: out std_logic
	);
	
end clocks;

architecture Behavioral of clocks is
    
    signal sysclk: std_logic;

	signal sysclk40, sysclk40_unbuffered: std_logic;
	signal sysclk80, sysclk80_unbuffered: std_logic;
	signal sysclk160, sysclk160_unbuffered: std_logic;
	signal sysclk200, sysclk200_unbuffered: std_logic;
	signal sysclk320, sysclk320_unbuffered: std_logic;
	signal sysclk400, sysclk400_unbuffered: std_logic;
	signal sysclk_pll_feedback, sysclk_pll_feedback_unbuffered: std_logic;
	signal sysclk_pll_locked: std_logic;

	signal idelayctrlReset: std_logic;
	signal idelayctrlResetCounter: std_logic_vector(1 downto 0);

    attribute IODELAY_GROUP : string;
	attribute IODELAY_GROUP of BANK14_IDELAYCTRL : label is "bank14_iodelaygroup";
	

begin


SYSCLK_MAP_TTC: if use_TTC_clk='1' generate begin
    sysclk <= gck1;
end generate;

SYSCLK_MAP_CRYSTAL: if use_TTC_clk='0' generate begin
    sysclk <= gck2;
end generate;



SYSCLK_PLL : PLLE2_ADV
   generic map (
      BANDWIDTH => "OPTIMIZED",  -- OPTIMIZED, HIGH, LOW
      
      --VCO-Frequency: 1603.2 MHz
      CLKFBOUT_MULT => 40,        -- Multiply value for all CLKOUT, (2-64)
      CLKFBOUT_PHASE => 0.0,     -- Phase offset in degrees of CLKFB, (-360.000-360.000).
      -- CLKIN_PERIOD: Input clock period in nS to ps resolution (i.e. 33.333 is 30 MHz).
      CLKIN1_PERIOD => 24.95,
      CLKIN2_PERIOD => 0.0,
      -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT (1-128)
      CLKOUT0_DIVIDE => 4,  -- 400.80 MHz
      CLKOUT1_DIVIDE => 40, --  40.08 MHz
      CLKOUT2_DIVIDE => 20, --  80.16 MHz
      CLKOUT3_DIVIDE => 10, -- 160.32 MHz 
      CLKOUT4_DIVIDE => 8,  -- 200.40 MHz
      CLKOUT5_DIVIDE => 5,  -- 320.64 MHz
      -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT outputs (0.001-0.999).
      CLKOUT0_DUTY_CYCLE => 0.5,
      CLKOUT1_DUTY_CYCLE => 0.5,
      CLKOUT2_DUTY_CYCLE => 0.5,
      CLKOUT3_DUTY_CYCLE => 0.5,
      CLKOUT4_DUTY_CYCLE => 0.5,
      CLKOUT5_DUTY_CYCLE => 0.5,
      -- CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for CLKOUT outputs (-360.000-360.000).
      CLKOUT0_PHASE => 0.0,
      CLKOUT1_PHASE => 0.0,
      CLKOUT2_PHASE => 0.0,
      CLKOUT3_PHASE => 0.0,
      CLKOUT4_PHASE => 0.0,
      CLKOUT5_PHASE => 0.0,
      COMPENSATION => "ZHOLD",   -- ZHOLD, BUF_IN, EXTERNAL, INTERNAL
      DIVCLK_DIVIDE => 1,        -- Master division value (1-56)
      -- REF_JITTER: Reference input jitter in UI (0.000-0.999).
      REF_JITTER1 => 0.0,
      REF_JITTER2 => 0.0,
      STARTUP_WAIT => "FALSE"    -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
   )
   port map (
      -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
      CLKOUT0 => sysclk400_unbuffered,   -- 1-bit output: CLKOUT0
      CLKOUT1 => sysclk40_unbuffered,   -- 1-bit output: CLKOUT1
      CLKOUT2 => sysclk80_unbuffered,   -- 1-bit output: CLKOUT2
      CLKOUT3 => sysclk160_unbuffered,   -- 1-bit output: CLKOUT3
      CLKOUT4 => sysclk200_unbuffered,   -- 1-bit output: CLKOUT4
      CLKOUT5 => sysclk320_unbuffered,   -- 1-bit output: CLKOUT5
      -- DRP Ports: 16-bit (each) output: Dynamic reconfiguration ports
      DO => open,             -- 16-bit output: DRP data
      DRDY => open,         -- 1-bit output: DRP ready
      -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
      CLKFBOUT => sysclk_pll_feedback_unbuffered, -- 1-bit output: Feedback clock
      LOCKED => sysclk_pll_locked,     -- 1-bit output: LOCK
      -- Clock Inputs: 1-bit (each) input: Clock inputs
      CLKIN1 => sysclk,     -- 1-bit input: Primary clock
      CLKIN2 => '0',     -- 1-bit input: Secondary clock
      -- Control Ports: 1-bit (each) input: PLL control ports
      CLKINSEL => '1', -- 1-bit input: Clock select, High=CLKIN1 Low=CLKIN2
      PWRDWN => '0',     -- 1-bit input: Power-down
      RST => '0',           -- 1-bit input: Reset
      -- DRP Ports: 7-bit (each) input: Dynamic reconfiguration ports
      DADDR => "0000000",       -- 7-bit input: DRP address
      DCLK => '0',         -- 1-bit input: DRP clock
      DEN => '0',           -- 1-bit input: DRP enable
      DI => x"0000",             -- 16-bit input: DRP data
      DWE => '0',           -- 1-bit input: DRP write enable
      -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
      CLKFBIN => sysclk_pll_feedback    -- 1-bit input: Feedback clock
   );


    sysclk_pll_locked_out <= sysclk_pll_locked; 




SYSCLK_PLL_FEEDBACK_BUFG: BUFG
	port map(
		I => sysclk_pll_feedback_unbuffered,
		O => sysclk_pll_feedback
	);




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



SYSCLK160_BUFG: BUFG
	port map(
		I => sysclk160_unbuffered,
		O => sysclk160
	);

	sysclk160_out <= sysclk160;



SYSCLK200_BUFG: BUFG
	port map(
		I => sysclk200_unbuffered,
		O => sysclk200
	);

	sysclk200_out <= sysclk200;	

	
	
SYSCLK320_BUFG: BUFG
	port map(
		I => sysclk320_unbuffered,
		O => sysclk320
	);

	sysclk320_out <= sysclk320;



SYSCLK400_BUFG: BUFG
	port map(
		I => sysclk400_unbuffered,
		O => sysclk400
	);

	sysclk400_out <= sysclk400;





process(sysclk40) begin
    if rising_edge(sysclk40) then
        if sysclk_pll_locked='0' then
            idelayctrlReset <= '1';
            idelayctrlResetCounter <= (others => '0');
        else
            if idelayctrlResetCounter = "11" then
                idelayctrlReset <= '0';
                idelayctrlResetCounter <= idelayctrlResetCounter;
            else
                idelayctrlReset <= '1';
                idelayctrlResetCounter <= std_logic_vector( unsigned(idelayctrlResetCounter) + 1);
            end if;
        end if;
    end if;
end process;




BANK14_IDELAYCTRL : IDELAYCTRL
	 port map (
		  REFCLK => sysclk200,
		  RST    => idelayctrlReset,
		  RDY    => open
	  );








end Behavioral;
