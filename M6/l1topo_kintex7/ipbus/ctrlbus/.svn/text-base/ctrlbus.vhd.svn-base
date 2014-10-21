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
		sysclk40: in std_logic;
		sysclk80: in std_logic;
		sysclk200: in std_logic;
		sysclk400: in std_logic;
		gck_mmcm_locked: in std_logic;
		
		ctrlbus_u1_out, ctrlbus_u2_out: out std_logic_vector(4 downto 0);
		ctrlbus_u1_in, ctrlbus_u2_in: in std_logic_vector(2 downto 0);
		
		ipb_write_U1_in: in ipb_wbus;
		ipb_write_U2_in: in ipb_wbus;
		ipb_read_U1_out: out ipb_rbus;
		ipb_read_U2_out: out ipb_rbus;
		
		idelay_inc: in std_logic_vector(2 downto 0);
		idelay_counter_0: out std_logic_vector(4 downto 0);
		idelay_counter_1: out std_logic_vector(4 downto 0);
		idelay_counter_2: out std_logic_vector(4 downto 0)
	);
end ctrlbus;

architecture Behavioral of ctrlbus is

	signal ctrlbus_u1_serdes_serialclk400_unbuffered, ctrlbus_u2_serdes_serialclk400_unbuffered: std_logic;
	signal ctrlbus_u1_serdes_serialclk400, ctrlbus_u2_serdes_serialclk400: std_logic;
	signal ctrlbus_u1_serdes_parallelclk80, ctrlbus_u2_serdes_parallelclk80: std_logic;
	
	signal ctrlbus_u1_mmcm_feedback_unbuffered, ctrlbus_u2_mmcm_feedback_unbuffered: std_logic;
	signal ctrlbus_u1_mmcm_feedback, ctrlbus_u2_mmcm_feedback: std_logic;
	
	signal ctrlbus_u1_mmcm_locked, ctrlbus_u2_mmcm_locked: std_logic;
	signal ctrlbus_u1_reset, ctrlbus_u2_reset: std_logic;

begin


--ctrlbus_u1_mmcm : MMCME2_ADV	--bank32
--   generic map (
--      BANDWIDTH => "OPTIMIZED",
--      CLKFBOUT_PHASE => 0.0,
--      CLKIN1_PERIOD => 24.95,
--		CLKFBOUT_MULT_F => 30.0,			-- VCO-freq: 1202.4 MHz
--		CLKOUT0_DIVIDE_F => 3.0,
--      DIVCLK_DIVIDE => 1,
--      REF_JITTER1 => 0.01
--   )
--   port map (
--      CLKOUT0 => ctrlbus_u1_serdes_serialclk400_unbuffered,
--      CLKFBOUT => ctrlbus_u1_mmcm_feedback_unbuffered,
--		CLKFBIN => ctrlbus_u1_mmcm_feedback_unbuffered,
--      CLKIN1 => sysclk40,
--      CLKIN2 => '0',
--      CLKINSEL => '1',
--		LOCKED => ctrlbus_u1_mmcm_locked,
--      PWRDWN => '0',
--      RST => '0',
--      DADDR => (others=>'0'),
--      DCLK => '0',
--      DEN => '0',
--      DI => (others=>'0'),
--      DWE => '0',
--      PSCLK => '0',
--      PSEN => '0',
--      PSINCDEC => '0'
--   );
--
--	ctrlbus_u1_reset <= not ctrlbus_u1_mmcm_locked;
--
--
--
--
----ctrlbus_u1_mmcm_feedback_bufr: BUFR
----	generic map (
----      BUFR_DIVIDE => "1",
----      SIM_DEVICE => "7SERIES"
----   )
----   port map (
----      O => ctrlbus_u1_mmcm_feedback,
----      CE => '1',
----      CLR => '0',
----      I => ctrlbus_u1_mmcm_feedback_unbuffered
----   );
--
--
--
--
--ctrlbus_u1_serdes_serialclk400_bufio: BUFIO
--   port map (
--      O => ctrlbus_u1_serdes_serialclk400,
--      I => ctrlbus_u1_serdes_serialclk400_unbuffered
--   );
--
--
--
--
--ctrlbus_u1_serdes_parallelclk80_bufr: BUFR
--	generic map (
--      BUFR_DIVIDE => "5",
--      SIM_DEVICE => "7SERIES"
--   )
--   port map (
--      O => ctrlbus_u1_serdes_parallelclk80,
--      CE => '1',
--      CLR => '0',
--      I => ctrlbus_u1_serdes_serialclk400_unbuffered
--   );





ctrlbus_from_U1_in: entity work.ctrlbus_in
	port map(
		sysclk40 => sysclk40,
		sysclk80 => sysclk80,
		serdes_serialclk400_in => sysclk400,	--ctrlbus_u1_serdes_serialclk400,
		serdes_parallelclk80_in => sysclk80,	--ctrlbus_u1_serdes_parallelclk80,
		sysclk200 => sysclk200,
		gck_mmcm_locked => gck_mmcm_locked,
		ctrlbus_reset_in => ctrlbus_u1_reset,
		ipb_strobe => ipb_write_U1_in.ipb_strobe,
		ctrlbus_in => ctrlbus_u1_in,
		ipb_read_out => ipb_read_U1_out,
		idelay_inc => "000", --idelay_inc,
		idelay_counter_0 => open, --idelay_counter_0,
		idelay_counter_1 => open, --idelay_counter_1,
		idelay_counter_2 => open --idelay_counter_2
	);



ctrlbus_to_U1_out: entity work.ctrlbus_out
	port map(
		sysclk40 => sysclk40,
		sysclk80 => sysclk80,
		serdes_serialclk400_in => sysclk400,	--ctrlbus_u1_serdes_serialclk400,
		serdes_parallelclk80_in => sysclk80,	--ctrlbus_u1_serdes_parallelclk80,
		ctrlbus_reset_in => ctrlbus_u1_reset,
		ctrlbus_out => ctrlbus_u1_out,
		ipb_write_in => ipb_write_U1_in
	);
		







		
		
		
--ctrlbus_u2_mmcm : MMCME2_ADV	--bank17
--   generic map (
--      BANDWIDTH => "OPTIMIZED",
--      CLKFBOUT_PHASE => 0.0,
--      CLKIN1_PERIOD => 24.95,
--		CLKFBOUT_MULT_F => 30.0,			-- VCO-freq: 1202.4 MHz
--		CLKOUT0_DIVIDE_F => 3.0,
--      DIVCLK_DIVIDE => 1,
--      REF_JITTER1 => 0.01
--   )
--   port map (
--      CLKOUT0 => ctrlbus_u2_serdes_serialclk400_unbuffered,
--      CLKFBOUT => ctrlbus_u2_mmcm_feedback_unbuffered,
--		CLKFBIN => ctrlbus_u2_mmcm_feedback_unbuffered,
--      CLKIN1 => sysclk40,
--      CLKIN2 => '0',
--      CLKINSEL => '1',
--		LOCKED => ctrlbus_u2_mmcm_locked,
--      PWRDWN => '0',
--      RST => '0',
--      DADDR => (others=>'0'),
--      DCLK => '0',
--      DEN => '0',
--      DI => (others=>'0'),
--      DWE => '0',
--      PSCLK => '0',
--      PSEN => '0',
--      PSINCDEC => '0'
--   );
--
--
--		ctrlbus_u2_reset <= not ctrlbus_u2_mmcm_locked;			
--		
--
--
----ctrlbus_u2_mmcm_feedback_bufr: BUFR
----	generic map (
----      BUFR_DIVIDE => "1",
----      SIM_DEVICE => "7SERIES"
----   )
----   port map (
----      O => ctrlbus_u2_mmcm_feedback,
----      CE => '1',
----      CLR => '0',
----      I => ctrlbus_u2_mmcm_feedback_unbuffered
----   );
--
--
--
--		
--		
--ctrlbus_u2_serdes_serialclk400_bufio: BUFIO
--   port map (
--      O => ctrlbus_u2_serdes_serialclk400,
--      I => ctrlbus_u2_serdes_serialclk400_unbuffered
--   );
--
--
--ctrlbus_u2_serdes_parallelclk80_bufr: BUFR
--	generic map (
--      BUFR_DIVIDE => "5",
--      SIM_DEVICE => "7SERIES"
--   )
--   port map (
--      O => ctrlbus_u2_serdes_parallelclk80,
--      CE => '1',
--      CLR => '0',
--      I => ctrlbus_u2_serdes_serialclk400_unbuffered
--   );
		
		
		
ctrlbus_from_U2_in: entity work.ctrlbus_in
	port map(
		sysclk40 => sysclk40,
		sysclk80 => sysclk80,
		serdes_serialclk400_in => sysclk400,	--ctrlbus_u2_serdes_serialclk400,
		serdes_parallelclk80_in => sysclk80,	--ctrlbus_u2_serdes_parallelclk80,
		sysclk200 => sysclk200,
		gck_mmcm_locked => gck_mmcm_locked,
		ctrlbus_reset_in => ctrlbus_u2_reset,
		ipb_strobe => ipb_write_U2_in.ipb_strobe,
		ctrlbus_in => ctrlbus_u2_in,
		ipb_read_out => ipb_read_U2_out,
		idelay_inc => idelay_inc, --"000",
		idelay_counter_0 => idelay_counter_0, --open,
		idelay_counter_1 => idelay_counter_1, --open,
		idelay_counter_2 => idelay_counter_2	--open
	);		
		
		
		
		
ctrlbus_to_U2_out: entity work.ctrlbus_out
	port map(
		sysclk40 => sysclk40,
		sysclk80 => sysclk80,
		serdes_serialclk400_in => sysclk400,	--ctrlbus_u2_serdes_serialclk400,
		serdes_parallelclk80_in => sysclk80,	--ctrlbus_u2_serdes_parallelclk80,
		ctrlbus_reset_in => ctrlbus_u2_reset,
		ctrlbus_out => ctrlbus_u2_out,
		ipb_write_in => ipb_write_U2_in
	);
	
	
		


end Behavioral;

