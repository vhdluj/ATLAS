----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:35:58 01/10/2014 
-- Design Name: 
-- Module Name:    ctrlbus_in - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;


use work.ipbus.all;




entity ctrlbus_in is port(
		sysclk40: in std_logic;
		sysclk80: in std_logic;
		serdes_serialclk400_in: in std_logic;
		serdes_parallelclk80_in: in std_logic;
		sysclk200: in std_logic;
		gck_mmcm_locked: in std_logic;
		ctrlbus_reset_in: in std_logic;
		
		ipb_strobe: in std_logic;
		ctrlbus_in: in std_logic_vector(2 downto 0);
		ipb_read_out: out ipb_rbus;
		
		idelay_inc: in std_logic_vector(2 downto 0);
		idelay_counter_0: out std_logic_vector(4 downto 0);
		idelay_counter_1: out std_logic_vector(4 downto 0);
		idelay_counter_2: out std_logic_vector(4 downto 0)
		
	);
end ctrlbus_in;

architecture Behavioral of ctrlbus_in is


	attribute s: string;

	-- signals of the dataflow

	
	signal ctrlbus_in_delayed: std_logic_vector(2 downto 0);
	
	type ctrlbus_in_10bit_array is array (2 downto 0) of std_logic_vector(9 downto 0);
	signal ctrlbus_in_deserialised_inv: ctrlbus_in_10bit_array;
	signal ctrlbus_in_deserialised: ctrlbus_in_10bit_array;
	attribute s of ctrlbus_in_deserialised: signal is "true";
	
	type ctrlbus_in_8bit_array is array (2 downto 0)  of std_logic_vector(7 downto 0);
	signal ctrlbus_in_decoded: ctrlbus_in_8bit_array;

	signal ctrlbus_in_decoder_data_48bit: std_logic_vector(47 downto 0);


	-- control and status signals

	
	signal ctrlbus_in_idelayctrl_reset: std_logic;  -- minimum reset pulse width 52ns => 3 clk40 tics
	signal ctrlbus_in_idelayctrl_reset_counter: unsigned(1 downto 0);
	signal ctrlbus_in_idelayctrl_locked: std_logic;


	
	signal ctrlbus_in_iserdes_serialclk_inverted: std_logic;
	signal ctrlbus_in_iserdes_shift1: std_logic_vector(2 downto 0);
	signal ctrlbus_in_iserdes_shift2: std_logic_vector(2 downto 0);
	signal ctrlbus_in_iserdes_bitslip: std_logic_vector(2 downto 0);
	type ctrlbus_in_iserdes_bitslip_counter_type is array (2 downto 0) of unsigned(3 downto 0);
	signal ctrlbus_in_iserdes_bitslip_counter: ctrlbus_in_iserdes_bitslip_counter_type;

	signal ctrlbus_in_decoder_kout: std_logic_vector(2 downto 0);
	signal ctrlbus_in_decoder_code_err: std_logic_vector(2 downto 0);
	signal ctrlbus_in_decoder_disp_err: std_logic_vector(2 downto 0);
	
	constant k28_5: std_logic_vector(7 downto 0) := "10111100";
	constant K28_0: std_logic_vector(7 downto 0) := "00011100";
	
	signal ctrlbus_in_decoder_pin_err: std_logic_vector(2 downto 0);
	signal ctrlbus_in_decoder_pin_err_ored: std_logic_vector(3 downto 0);
	signal ctrlbus_in_decoder_comma_anded: std_logic_vector(3 downto 0);
	signal ctrlbus_in_decoder_comma_ored: std_logic_vector(3 downto 0);
	signal ctrlbus_in_decoder_dout_K28_0_anded: std_logic_vector(3 downto 0);
	
	signal ctrlbus_in_decoder_BOF: std_logic;
	signal ctrlbus_in_decoder_DATA: std_logic;
	signal ctrlbus_in_decoder_ERR: std_logic;

	attribute s of ctrlbus_in_decoder_BOF: signal is "true";
	attribute s of ctrlbus_in_decoder_DATA: signal is "true";
	attribute s of ctrlbus_in_decoder_ERR: signal is "true";
	
	type ctrlbus_in_state_type  is (ST_IDLE, ST_DATA0, ST_DATA1);
	signal ctrlbus_in_state: ctrlbus_in_state_type;

	attribute s of ctrlbus_in_state: signal is "true";

	attribute IODELAY_GROUP : string;
	attribute IODELAY_GROUP of ctrlbus_in_idelayctrl : label is "ctrlbus_in_group";

	signal idelay_inc_reg, idelay_ce: std_logic_vector(2 downto 0);
	type array3x5 is array(2 downto 0) of std_logic_vector(4 downto 0);
	signal idelay_counter: array3x5;
	

begin


	process(sysclk40) begin
		if rising_edge(sysclk40) then
			if gck_mmcm_locked='0' then
				ctrlbus_in_idelayctrl_reset <= '1';
				ctrlbus_in_idelayctrl_reset_counter <= (others => '0');
			else
				if ctrlbus_in_idelayctrl_reset_counter = "11" then
					ctrlbus_in_idelayctrl_reset <= '0';
					ctrlbus_in_idelayctrl_reset_counter <= ctrlbus_in_idelayctrl_reset_counter;
				else
					ctrlbus_in_idelayctrl_reset <= '1';
					ctrlbus_in_idelayctrl_reset_counter <= ctrlbus_in_idelayctrl_reset_counter + 1;
				end if;
			end if;
		end if;
	end process;




ctrlbus_in_idelayctrl : IDELAYCTRL
	 port map (
		  REFCLK => sysclk200,
		  RST    => ctrlbus_in_idelayctrl_reset,
		  RDY    => ctrlbus_in_idelayctrl_locked
	  );




	idelay_counter_0 <= idelay_counter(0);
	idelay_counter_1 <= idelay_counter(1);
	idelay_counter_2 <= idelay_counter(2);


ctrlbus_in_pin_generator: for pin in 2 downto 0 generate 
		attribute IODELAY_GROUP of ctrlbus_in_idelay: label is "ctrlbus_in_group";
	begin


process(serdes_parallelclk80_in) begin
	if rising_edge(serdes_parallelclk80_in) then
		idelay_inc_reg(pin) <= idelay_inc(pin);
	end if;
end process;

idelay_ce(pin) <= '1' when idelay_inc(pin)='1' and idelay_inc_reg(pin)='0' else '0';


ctrlbus_in_idelay: IDELAYE2
	generic map (
		CINVCTRL_SEL => "FALSE",
		DELAY_SRC => "IDATAIN",
		HIGH_PERFORMANCE_MODE => "FALSE",
		IDELAY_TYPE => "VARIABLE",
		IDELAY_VALUE => 14,
		REFCLK_FREQUENCY => 200.0,
		PIPE_SEL => "FALSE",
		SIGNAL_PATTERN => "DATA"
		)
	port map (
		C => serdes_parallelclk80_in,
		IDATAIN => ctrlbus_in(pin),
		DATAOUT => ctrlbus_in_delayed(pin),
		LD => '0',
		CNTVALUEIN => "00000",
		CNTVALUEOUT => idelay_counter(pin),
		--unused ports
		DATAIN => '0',
		CE => idelay_ce(pin),
		INC => '1',
		REGRST => '0',
		LDPIPEEN => '0',
		CINVCTRL => '0'
);

ctrlbus_in_iserdes_serialclk_inverted <= not serdes_serialclk400_in;


ctrlbus_in_iserdes_master: ISERDESE2
       generic map (
         DATA_RATE => "DDR",
         DATA_WIDTH => 10,
         INTERFACE_TYPE => "NETWORKING", 
         DYN_CLKDIV_INV_EN => "FALSE",
         DYN_CLK_INV_EN => "FALSE",
         NUM_CE => 2,
         OFB_USED => "FALSE",
         IOBDELAY => "IFD",
         SERDES_MODE => "MASTER")
       port map (
         CLK => serdes_serialclk400_in,
         CLKB => ctrlbus_in_iserdes_serialclk_inverted,
         CLKDIV => serdes_parallelclk80_in,
         RST => ctrlbus_reset_in,
			
			DDLY => ctrlbus_in_delayed(pin),
			
			Q1 => ctrlbus_in_deserialised_inv(pin)(9),
         Q2 => ctrlbus_in_deserialised_inv(pin)(8),
         Q3 => ctrlbus_in_deserialised_inv(pin)(7),
         Q4 => ctrlbus_in_deserialised_inv(pin)(6),
         Q5 => ctrlbus_in_deserialised_inv(pin)(5),
         Q6 => ctrlbus_in_deserialised_inv(pin)(4),
         Q7 => ctrlbus_in_deserialised_inv(pin)(3),
         Q8 => ctrlbus_in_deserialised_inv(pin)(2),
         
			SHIFTOUT1 => ctrlbus_in_iserdes_shift1(pin),
         SHIFTOUT2 => ctrlbus_in_iserdes_shift2(pin),
         
			BITSLIP => ctrlbus_in_iserdes_bitslip(pin),
        -- unused connections
         CE1 => '1', 
			CE2 => '1',
			CLKDIVP => '0',
         D => '0',         
			SHIFTIN1 => '0', 
			SHIFTIN2 => '0',
			DYNCLKDIVSEL => '0', 
			DYNCLKSEL => '0',
         OFB => '0',
			OCLK => '0', 
			OCLKB => '0'
		);



iserdese2_slave : ISERDESE2
       generic map (
				DATA_RATE => "DDR",
				DATA_WIDTH => 10,
				INTERFACE_TYPE => "NETWORKING",
				DYN_CLKDIV_INV_EN => "FALSE",
				DYN_CLK_INV_EN => "FALSE",
				NUM_CE => 2,
				OFB_USED => "FALSE",
				IOBDELAY => "IFD",
				SERDES_MODE => "SLAVE")
       port map (
				CLK => serdes_serialclk400_in,
				CLKB => ctrlbus_in_iserdes_serialclk_inverted,
				CLKDIV => serdes_parallelclk80_in,
				RST => ctrlbus_reset_in,
				
				SHIFTIN1 => ctrlbus_in_iserdes_shift1(pin),
				SHIFTIN2 => ctrlbus_in_iserdes_shift2(pin),

				Q3 => ctrlbus_in_deserialised_inv(pin)(1),
				Q4 => ctrlbus_in_deserialised_inv(pin)(0),

				BITSLIP => ctrlbus_in_iserdes_bitslip(pin),

				-- unused connections
				CE1 => '1',
				CE2 => '1',
				CLKDIVP => '0',
				D => '0',
				DDLY => '0',
				DYNCLKDIVSEL => '0',
				DYNCLKSEL => '0',
				OFB => '0',
				OCLK => '0',
				OCLKB => '0'
		);

	ctrlbus_in_deserialised(pin) <= not ctrlbus_in_deserialised_inv(pin);


ctrlbus_in_decoder: entity work.decode_8b10b_wrapper
		port map(
			CLK => sysclk80,
			DIN => ctrlbus_in_deserialised(pin),
			DOUT => ctrlbus_in_decoded(pin),
			KOUT => ctrlbus_in_decoder_kout(pin),
			CODE_ERR => ctrlbus_in_decoder_code_err(pin),
			DISP_ERR => ctrlbus_in_decoder_disp_err(pin)
		);

	ctrlbus_in_decoder_pin_err(pin) <= ctrlbus_in_decoder_code_err(pin) or ctrlbus_in_decoder_disp_err(pin);
	
	ctrlbus_in_decoder_pin_err_ored(3) <= '0';
	ctrlbus_in_decoder_pin_err_ored(pin) <= ctrlbus_in_decoder_pin_err_ored(pin+1) or ctrlbus_in_decoder_pin_err(pin);
	
	ctrlbus_in_decoder_comma_anded(3) <= '1';
	ctrlbus_in_decoder_comma_anded(pin) <= ctrlbus_in_decoder_comma_anded(pin+1) and ctrlbus_in_decoder_kout(pin);
	
	ctrlbus_in_decoder_comma_ored(3) <= '0';
	ctrlbus_in_decoder_comma_ored(pin) <= ctrlbus_in_decoder_comma_ored(pin+1)  or ctrlbus_in_decoder_kout(pin);

	ctrlbus_in_decoder_dout_K28_0_anded(3) <= '1';
	ctrlbus_in_decoder_dout_K28_0_anded(pin) <= '1' when ( ctrlbus_in_decoder_dout_K28_0_anded(pin+1)='1' and  ctrlbus_in_decoded(pin)=K28_0 ) else '0';
	
	ctrlbus_in_decoder_BOF <= '1' when ( ctrlbus_in_decoder_dout_K28_0_anded(0)='1' and ctrlbus_in_decoder_comma_anded(0)='1' and ctrlbus_in_decoder_pin_err_ored(0)='0' ) else '0';
	ctrlbus_in_decoder_DATA <= '1' when ( ctrlbus_in_decoder_comma_ored(0)='0' and ctrlbus_in_decoder_pin_err_ored(0)='0' ) else '0';
	ctrlbus_in_decoder_ERR <= '1' when ( 
													ctrlbus_in_decoder_pin_err_ored(0)='1' 																										--  <-- an error occured at least on one pin
											or (	ctrlbus_in_decoder_comma_anded(0)='0' and ctrlbus_in_decoder_comma_ored(0)='1' ) 			--  <-- pins have unequal comma states
											or ( ctrlbus_in_state=ST_IDLE and ctrlbus_in_decoder_comma_anded(0)='0' )										--  <-- IDLE state (K28_5 = comma) should only be left by K28_0 (=comma)
											or ( ctrlbus_in_state=ST_DATA1 and ctrlbus_in_decoder_comma_ored(0)='1' )										--  <-- DATA1 state should only receive data (no comma)
											) else '0';



process(sysclk80) begin
	if rising_edge(sysclk80) then
		if ctrlbus_reset_in='1' then
			ctrlbus_in_state <= ST_IDLE;
		else
			case ctrlbus_in_state is
				when ST_IDLE =>
					ctrlbus_in_decoder_data_48bit( (pin+1)*8-1 downto pin*8) <= (7 downto 0 => '0');
					ctrlbus_in_decoder_data_48bit( 24 + (pin+1)*8-1 downto 24 + pin*8) <= (7 downto 0 => '0');
					if ctrlbus_in_decoder_BOF = '1' then 
						ctrlbus_in_state <= ST_DATA0;
					end if;
				when ST_DATA0 =>
					ctrlbus_in_decoder_data_48bit( (pin+1)*8-1 downto pin*8) <= ctrlbus_in_decoded(pin);
					if ctrlbus_in_decoder_DATA='1' then 
							ctrlbus_in_state <= ST_DATA1;
					else 
							ctrlbus_in_state <= ST_IDLE;
							ctrlbus_in_decoder_data_48bit( 24 + (pin+1)*8-1 downto 24 + pin*8) <= (7 downto 0 => '0');		-- error occured. do not try to receive the second half of data
					end if;
				when ST_DATA1 =>
					ctrlbus_in_decoder_data_48bit( 24 + (pin+1)*8-1 downto 24 + pin*8) <= ctrlbus_in_decoded(pin);
					if ctrlbus_in_decoder_DATA='1' then 
							ctrlbus_in_state <= ST_DATA0;
					else ctrlbus_in_state <= ST_IDLE;
					end if;
			end case;
		end if;
	end if;
end process;



process(sysclk80) begin
	if rising_edge(sysclk80) then
		if ( ctrlbus_in_state /= ST_IDLE or (ctrlbus_in_decoded(pin)=K28_5 and ctrlbus_in_decoder_kout(pin)='1') ) then
			ctrlbus_in_iserdes_bitslip_counter(pin) <= "0000";
			ctrlbus_in_iserdes_bitslip(pin) <= '0';
		else
			if ctrlbus_in_iserdes_bitslip_counter(pin) = "1111" then
				ctrlbus_in_iserdes_bitslip_counter(pin) <= "0000";
				ctrlbus_in_iserdes_bitslip(pin) <= '1';
			else
				ctrlbus_in_iserdes_bitslip_counter(pin) <= ctrlbus_in_iserdes_bitslip_counter(pin) + 1;
				ctrlbus_in_iserdes_bitslip(pin) <= '0';
			end if;
		end if;
	end if;
end process;




end generate ctrlbus_in_pin_generator;



	ipb_read_out.ipb_rdata(22 downto  0) 	<= ctrlbus_in_decoder_data_48bit(23 downto  1)		when ctrlbus_in_state = ST_DATA1 else (22 downto  0 	=> '0');
	ipb_read_out.ipb_rdata(31 downto 23)	<= ctrlbus_in_decoder_data_48bit(33 downto 25)	when ctrlbus_in_state = ST_DATA1 else (33 downto 25	=> '0');
	
	ipb_read_out.ipb_ack	<= ( ctrlbus_in_decoder_data_48bit(34) and not ctrlbus_in_decoder_ERR )	when ( ctrlbus_in_state = ST_DATA1  and ipb_strobe='1' ) 	else '0';
	
	ipb_read_out.ipb_err		<= ( ctrlbus_in_decoder_data_48bit(35) or ctrlbus_in_decoder_ERR ) 			when ( ctrlbus_in_state = ST_DATA1  and ipb_strobe='1' ) 	else '0';

	
	


end Behavioral;

