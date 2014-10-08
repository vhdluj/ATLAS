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
		
		ipb_read_in: in ipb_rbus;
		ctrlbus_out: out std_logic_vector(2 downto 0);
						
		ctrlbus_in: in std_logic_vector(4 downto 0);
		ipb_write_out: out ipb_wbus;
		ctrlbus_locked_out: out std_logic
		
	);
end ctrlbus;

architecture Behavioral of ctrlbus is

	signal ctrlbus_serdes_serialclk400_unbuffered, ctrlbus_serdes_serialclk400: std_logic;
	signal ctrlbus_serdes_parallelclk80: std_logic;
	signal ctrlbus_mmcm_feedback_unbuffered: std_logic;
	signal ctrlbus_mmcm_locked: std_logic;
	signal ctrlbus_reset: std_logic;

	signal ipb_write: ipb_wbus;

    signal ctrlbus_out_state: std_logic_vector(1 downto 0);
    signal slice_to_encode_0: std_logic_vector(7 downto 0);
    signal slice_to_encode_1: std_logic_vector(7 downto 0);
    signal slice_to_encode_2: std_logic_vector(7 downto 0);

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
			CLKIN1 => sysclk40,
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



	ctrlbus_in_deserialiser: entity work.ctrlbus_in
		port map(
			sysclk40 => sysclk40,
			sysclk80 => sysclk80,
			ctrlbus_serdes_parallelclk80_in => ctrlbus_serdes_parallelclk80,
			ctrlbus_serdes_serialclk400_in => ctrlbus_serdes_serialclk400,
			sysclk200 => sysclk200,
			ctrlbus_reset_in => ctrlbus_reset,
			ctrlbus_in => ctrlbus_in,
			ipb_write_out => ipb_write,
			
			ctrlbus_locked_out => ctrlbus_locked_out,
			
			ctrlbus_out_state => ctrlbus_out_state,
            slice_to_encode_0 => slice_to_encode_0,
            slice_to_encode_1 => slice_to_encode_1,
            slice_to_encode_2 => slice_to_encode_2,
            ipb_read => ipb_read_in
		);
	
	ipb_write_out <= ipb_write;
	
		
	ctrlbus_out_serialiser: entity work.ctrlbus_out
		port map(
			sysclk40 => sysclk40,
			sysclk80 => sysclk80,
			ctrlbus_serdes_parallelclk80_in => ctrlbus_serdes_parallelclk80,
			ctrlbus_serdes_serialclk400_in => ctrlbus_serdes_serialclk400,
			ctrlbus_reset_in => ctrlbus_reset,
			ctrlbus_out => ctrlbus_out,
			ipb_read_in => ipb_read_in,
			ipb_strobe_in => ipb_write.ipb_strobe,
			
			ctrlbus_out_state => ctrlbus_out_state,
            slice_to_encode_0 => slice_to_encode_0,
            slice_to_encode_1 => slice_to_encode_1,
            slice_to_encode_2 => slice_to_encode_2
		);
	

end Behavioral;

