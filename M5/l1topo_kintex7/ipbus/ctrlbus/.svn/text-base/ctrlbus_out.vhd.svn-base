----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:50 12/18/2013 
-- Design Name: 
-- Module Name:    ctrlbus_out - Behavioral 
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


use work.ipbus.all;

entity ctrlbus_out is port(
		sysclk40: in std_logic;
		sysclk80: in std_logic;
		serdes_serialclk400_in: in std_logic;
		serdes_parallelclk80_in: in std_logic;
		ctrlbus_reset_in: in std_logic;
		ctrlbus_out: out std_logic_vector(4 downto 0);
		ipb_write_in: in ipb_wbus
	);
	
end ctrlbus_out;

architecture Behavioral of ctrlbus_out is

	constant ctrlbus_ipbus_out_width: natural := 5;

	signal ctrlbus_out_data_to_serialize_80bit: std_logic_vector(79 downto 0);
	
	type state_type is (ST_IDLE, ST_BOF, ST_DATA0, ST_DATA1);
	signal state: state_type;
	
	signal encode_as_comma: std_logic;
	
	type ctrlbus_out_8bit_slices_array   is array (0 to 4) of std_logic_vector(7 downto 0);
	type ctrlbus_out_10bit_slices_array is array (0 to 4) of std_logic_vector(9 downto 0);
	signal ctrlbus_out_data_slice_to_encode:  ctrlbus_out_8bit_slices_array;
	signal ctrlbus_out_data_slice_8b10b:        ctrlbus_out_10bit_slices_array;
	signal ctrlbus_out_data_slice_8b10b_inv:        ctrlbus_out_10bit_slices_array;
	
	signal ctrlbus_out_oserdes_shift1, ctrlbus_out_oserdes_shift2: std_logic_vector(ctrlbus_ipbus_out_width-1 downto 0);


	constant k28_5: std_logic_vector(7 downto 0) := "10111100";			-- RD-: 001111 1010 	, RD+: 110000 0101
	constant k28_0: std_logic_vector(7 downto 0) := "00011100";			-- RD-: 001111 0100		, RD+: 110000 1011
	constant k28_1: std_logic_vector(7 downto 0) := "00111100";			-- RD-: 001111 1001 	, RD+: 110000 0110


	
begin


	ctrlbus_out_data_to_serialize_80bit(0) <= '0';
	ctrlbus_out_data_to_serialize_80bit(40) <= '1';
	ctrlbus_out_data_to_serialize_80bit(32 downto 1) <= ipb_write_in.ipb_addr;
	ctrlbus_out_data_to_serialize_80bit(39 downto 33) <= ipb_write_in.ipb_wdata(6 downto 0);
	ctrlbus_out_data_to_serialize_80bit(65 downto 41) <= ipb_write_in.ipb_wdata(31 downto 7);
	ctrlbus_out_data_to_serialize_80bit(66) <= ipb_write_in.ipb_strobe;
	ctrlbus_out_data_to_serialize_80bit(67) <= ipb_write_in.ipb_write;
	ctrlbus_out_data_to_serialize_80bit(79 downto 68) <= (79 downto 68 => '0');

	
	process(sysclk80) begin
		if rising_edge(sysclk80) then
			if ctrlbus_reset_in='1' then
				state <= ST_IDLE;
			else
				case state is
					when ST_IDLE =>
						if ipb_write_in.ipb_strobe = '1' then state <= ST_BOF; 	-- ctrlbus_out_data_to_serialize_in(64) = ipb_strobe
						end if;
					when ST_BOF =>
						state <= ST_DATA0;
					when ST_DATA0 =>
						state <= ST_DATA1;
					when ST_DATA1 =>
						if ipb_write_in.ipb_strobe = '1' then state <= ST_DATA0;
						else state <= ST_IDLE;
						end if;
				end case;
			end if;
		end if;
	end process;



ctrlbus_out_pin_generator: for pin in 0 to ctrlbus_ipbus_out_width-1 generate begin

		-- internal 2:1 serializer: split the data in two time steps (of serdes_parallelclk80) in 8bit slices for each pin
		ctrlbus_out_data_slice_to_encode(pin) <= k28_5 when	state=ST_IDLE else
																						k28_0 when state=ST_BOF else
																						ctrlbus_out_data_to_serialize_80bit(         (pin+1) * 8 - 1 downto			pin*8 ) when state=ST_DATA0 else
                                                                  ctrlbus_out_data_to_serialize_80bit( 40 + (pin+1) * 8 - 1 downto 40 +	pin*8 ) when state=ST_DATA1 else
																						k28_1;
																						
		encode_as_comma <= '0' when ( state=ST_DATA0 or state=ST_DATA1) else '1';

		-- encode each 8bit slice with 8b10b-code
		ctrlbus_out_encoder: entity work.encode_8b10b_wrapper
			port map(
				CLK => sysclk80,
				DIN => ctrlbus_out_data_slice_to_encode(pin),
				KIN => encode_as_comma,
				DOUT => ctrlbus_out_data_slice_8b10b(pin)
			);
		
		ctrlbus_out_data_slice_8b10b_inv(pin) <= ctrlbus_out_data_slice_8b10b(pin);
		
		-- 10:1 serializer for each pin
		ctrlbus_out_oserdes_master : OSERDESE2
			generic map (
				DATA_RATE_OQ   => "DDR",
				DATA_RATE_TQ   => "SDR",
				DATA_WIDTH     => 10,
				TRISTATE_WIDTH => 1,
				SERDES_MODE    => "MASTER")
			port map (
				CLK            => serdes_serialclk400_in,
				CLKDIV       => serdes_parallelclk80_in,

				D1             => ctrlbus_out_data_slice_8b10b_inv(pin)(0),
				D2             => ctrlbus_out_data_slice_8b10b_inv(pin)(1),
				D3             => ctrlbus_out_data_slice_8b10b_inv(pin)(2),
				D4             => ctrlbus_out_data_slice_8b10b_inv(pin)(3),
				D5             => ctrlbus_out_data_slice_8b10b_inv(pin)(4),
				D6             => ctrlbus_out_data_slice_8b10b_inv(pin)(5),
				D7             => ctrlbus_out_data_slice_8b10b_inv(pin)(6),
				D8             => ctrlbus_out_data_slice_8b10b_inv(pin)(7),         		
				SHIFTIN1       => ctrlbus_out_oserdes_shift1(pin),
				SHIFTIN2       => ctrlbus_out_oserdes_shift2(pin),

				OQ             => ctrlbus_out(pin),

				RST            => ctrlbus_reset_in,

				OFB			=> open,

				-- unused ports
				OCE => '1',
				T1 => '0', T2 => '0', T3 => '0', T4 => '0',
				TBYTEIN => '0', TCE => '0'
			);
		

		ctrlbus_out_oserdes_slave : OSERDESE2
			generic map (
				DATA_RATE_OQ   => "DDR",
				DATA_RATE_TQ   => "SDR",
				DATA_WIDTH     => 10,
				TRISTATE_WIDTH => 1,
				SERDES_MODE    => "SLAVE")
			port map (
				CLK            => serdes_serialclk400_in,
				CLKDIV         => serdes_parallelclk80_in,
				
				D3             => ctrlbus_out_data_slice_8b10b_inv(pin)(8),
				D4             => ctrlbus_out_data_slice_8b10b_inv(pin)(9),
				
				SHIFTOUT1      => ctrlbus_out_oserdes_shift1(pin),
				SHIFTOUT2      => ctrlbus_out_oserdes_shift2(pin),
				
				RST            => ctrlbus_reset_in,
				
				
				
				--unused ports
				OCE => '1',
				D1 => '0',  D2 => '0', D5 => '0', D6 => '0', D7 => '0', D8 => '0',
				SHIFTIN1 => '0', SHIFTIN2 => '0',
				T1 => '0', T2 => '0', T3 => '0', T4 => '0',
				TBYTEIN => '0', TCE => '0'
			);



			
			
			
			
	


		

	end generate ctrlbus_out_pin_generator;




end Behavioral;

