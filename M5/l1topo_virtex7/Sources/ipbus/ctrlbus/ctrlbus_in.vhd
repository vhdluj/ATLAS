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
		ctrlbus_serdes_parallelclk80_in: in std_logic;
		ctrlbus_serdes_serialclk400_in: in std_logic;
		sysclk200: in std_logic;
		ctrlbus_reset_in: in std_logic;
		
		ctrlbus_in: in std_logic_vector(4 downto 0);
		ipb_write_out: out ipb_wbus;
		
		ctrlbus_locked_out: out std_logic;
		
		
		ctrlbus_out_state: in std_logic_vector(1 downto 0);
        slice_to_encode_0: in std_logic_vector(7 downto 0);
        slice_to_encode_1: in std_logic_vector(7 downto 0);
        slice_to_encode_2: in std_logic_vector(7 downto 0);
        ipb_read: in ipb_rbus
		
	);
end ctrlbus_in;

architecture Behavioral of ctrlbus_in is

    signal idelay_load: std_logic_vector(4 downto 0);
    type array5x5 is array(4 downto 0) of std_logic_vector(4 downto 0);
    signal idelay_value, idelay_value_reg: array5x5;
    signal idelay_valueout: array5x5;
    
    signal idelay_valueout_0_int : std_logic_vector(4 downto 0);
    signal idelay_valueout_1_int : std_logic_vector(4 downto 0);
    signal idelay_valueout_2_int : std_logic_vector(4 downto 0);
    signal idelay_valueout_3_int : std_logic_vector(4 downto 0);
    signal idelay_valueout_4_int : std_logic_vector(4 downto 0);
    
	attribute s: string;

	-- signals of the dataflow

	
	signal ctrlbus_in_delayed: std_logic_vector(4 downto 0);
	
	type ctrlbus_in_10bit_array is array (4 downto 0) of std_logic_vector(9 downto 0);
	signal ctrlbus_in_deserialised: ctrlbus_in_10bit_array;
	
	type ctrlbus_in_8bit_array is array (4 downto 0)  of std_logic_vector(7 downto 0);
	signal ctrlbus_in_decoded: ctrlbus_in_8bit_array;

	signal ctrlbus_in_internal_deserialiser_reg: std_logic_vector(39 downto 0);
	signal ctrlbus_in_data_80bit: std_logic_vector(79 downto 0);

    signal ipb_write: ipb_wbus;

	attribute s of ctrlbus_in_internal_deserialiser_reg: signal is "true";

	-- control and status signals

	
	signal ctrlbus_in_idelayctrl_reset: std_logic;  -- minimum reset pulse width 52ns => 3 clk40 tics
	signal ctrlbus_in_idelayctrl_reset_counter: unsigned(1 downto 0);
	signal ctrlbus_in_idelayctrl_locked: std_logic;

	signal ctrlbus_in_idelay_load: std_logic_vector(4 downto 0);
	
	type ctrlbus_in_idelay_value_type is array (4 downto 0) of std_logic_vector(4 downto 0);
	signal ctrlbus_in_idelay_value: ctrlbus_in_idelay_value_type;
	
	signal ctrlbus_in_idelay_CNTVALUEOUT: ctrlbus_in_idelay_value_type;
	
	attribute s of ctrlbus_in_idelay_load: signal is "true";
	attribute s of ctrlbus_in_idelay_value: signal is "true";
	attribute s of ctrlbus_in_idelay_CNTVALUEOUT: signal is "true";
	
	signal ctrlbus_in_iserdes_serialclk_inverted: std_logic;
	signal ctrlbus_in_iserdes_shift1: std_logic_vector(4 downto 0);
	signal ctrlbus_in_iserdes_shift2: std_logic_vector(4 downto 0);
	signal ctrlbus_in_iserdes_bitslip: std_logic_vector(4 downto 0);
	type ctrlbus_in_iserdes_bitslip_counter_type is array (4 downto 0) of unsigned(3 downto 0);
	signal ctrlbus_in_iserdes_bitslip_counter: ctrlbus_in_iserdes_bitslip_counter_type;

	signal ctrlbus_in_decoder_kout: std_logic_vector(4 downto 0);
	signal ctrlbus_in_decoder_code_err: std_logic_vector(4 downto 0);
	signal ctrlbus_in_decoder_disp_err: std_logic_vector(4 downto 0);
	
	constant k28_5: std_logic_vector(7 downto 0) := "10111100";
	constant K28_0: std_logic_vector(7 downto 0) := "00011100";
	
	signal ctrlbus_in_decoder_pin_err: std_logic_vector(4 downto 0);
	signal ctrlbus_in_decoder_pin_err_ored: std_logic_vector(5 downto 0);
	signal ctrlbus_in_decoder_comma_anded: std_logic_vector(5 downto 0);
	signal ctrlbus_in_decoder_comma_ored: std_logic_vector(5 downto 0);
	signal ctrlbus_in_decoder_dout_K28_0_anded: std_logic_vector(5 downto 0);
	
	signal ctrlbus_in_decoder_BOF: std_logic;
	signal ctrlbus_in_decoder_DATA: std_logic;
	signal ctrlbus_in_decoder_ERR: std_logic;
	
	attribute s of ctrlbus_in_decoder_BOF: signal is "true";
	attribute s of ctrlbus_in_decoder_DATA: signal is "true";
	attribute s of ctrlbus_in_decoder_ERR: signal is "true";
	
	type ctrlbus_in_state_type  is (ST_IDLE, ST_DATA0, ST_DATA1);
	signal ctrlbus_in_state: ctrlbus_in_state_type;
    signal ctrlbus_in_state_slv: std_logic_vector(1 downto 0);

	attribute s of ctrlbus_in_state: signal is "true";

	attribute IODELAY_GROUP : string;

begin




    idelay_valueout_0_int <= idelay_valueout(0);
    idelay_valueout_1_int <= idelay_valueout(1);
    idelay_valueout_2_int <= idelay_valueout(2);
    idelay_valueout_3_int <= idelay_valueout(3);
    idelay_valueout_4_int <= idelay_valueout(4);


ctrlbus_in_pin_generator: for pin in 4 downto 0 generate 
		attribute IODELAY_GROUP of ctrlbus_in_idelay: label is "bank14_iodelaygroup";
	begin

process(ctrlbus_serdes_parallelclk80_in) begin
    if rising_edge(ctrlbus_serdes_parallelclk80_in) then
        idelay_value_reg(pin) <= idelay_value(pin);
        if idelay_value(pin) /= idelay_value_reg(pin) then
            idelay_load(pin) <= '1';
        else idelay_load(pin) <= '0';
        end if;
    end if;
end process;

    

ctrlbus_in_idelay: IDELAYE2
	generic map (
		CINVCTRL_SEL => "FALSE",
		DELAY_SRC => "IDATAIN",
		HIGH_PERFORMANCE_MODE => "FALSE",
		IDELAY_TYPE => "VAR_LOAD",
		IDELAY_VALUE => 0,
		REFCLK_FREQUENCY => 200.0,
		PIPE_SEL => "FALSE",
		SIGNAL_PATTERN => "DATA"
		)
	port map (
		C => ctrlbus_serdes_parallelclk80_in,
		IDATAIN => ctrlbus_in(pin),
		DATAOUT => ctrlbus_in_delayed(pin),
		CNTVALUEOUT => idelay_valueout(pin),
        DATAIN => '0',
        CE => '0',
        INC => '0',
		--unused ports
		LD => idelay_load(pin),
        CNTVALUEIN => idelay_value(pin),
        
		REGRST => '0',
		LDPIPEEN => '0',
		CINVCTRL => '0'
);

ctrlbus_in_iserdes_serialclk_inverted <= not ctrlbus_serdes_serialclk400_in;


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
         CLK => ctrlbus_serdes_serialclk400_in,
         CLKB => ctrlbus_in_iserdes_serialclk_inverted,
         CLKDIV => ctrlbus_serdes_parallelclk80_in,
         RST => ctrlbus_reset_in,
			
         DDLY => ctrlbus_in_delayed(pin),
        
         Q1 => ctrlbus_in_deserialised(pin)(9),
         Q2 => ctrlbus_in_deserialised(pin)(8),
         Q3 => ctrlbus_in_deserialised(pin)(7),
         Q4 => ctrlbus_in_deserialised(pin)(6),
         Q5 => ctrlbus_in_deserialised(pin)(5),
         Q6 => ctrlbus_in_deserialised(pin)(4),
         Q7 => ctrlbus_in_deserialised(pin)(3),
         Q8 => ctrlbus_in_deserialised(pin)(2),
         
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
				CLK => ctrlbus_serdes_serialclk400_in,
				CLKB => ctrlbus_in_iserdes_serialclk_inverted,
				CLKDIV => ctrlbus_serdes_parallelclk80_in,
				RST => ctrlbus_reset_in,
				
				SHIFTIN1 => ctrlbus_in_iserdes_shift1(pin),
				SHIFTIN2 => ctrlbus_in_iserdes_shift2(pin),

				Q3 => ctrlbus_in_deserialised(pin)(1),
				Q4 => ctrlbus_in_deserialised(pin)(0),

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



deserialised_data_decoder: ENTITY work.decode_8b10b_lut_base
    GENERIC MAP (
      C_HAS_CODE_ERR   => 1,
      C_HAS_DISP_ERR   => 1
      )
    PORT MAP (
      CLK              => sysclk80,
      DIN              => ctrlbus_in_deserialised(pin),
      DOUT             => ctrlbus_in_decoded(pin),
      KOUT             => ctrlbus_in_decoder_kout(pin),

      CE               => '1',
      DISP_IN          => '0',
      SINIT            => '0',
      CODE_ERR         => ctrlbus_in_decoder_code_err(pin),
      DISP_ERR         => ctrlbus_in_decoder_disp_err(pin),
      ND               => open,
      RUN_DISP         => open,
      SYM_DISP         => open
      );



--ctrlbus_in_decoder: entity work.decode_8b10b_wrapper
--		port map(
--			CLK => sysclk80,
--			DIN => ctrlbus_in_deserialised(pin),
--			DOUT => ctrlbus_in_decoded(pin),
--			KOUT => ctrlbus_in_decoder_kout(pin),
--			CODE_ERR => ctrlbus_in_decoder_code_err(pin),
--			DISP_ERR => ctrlbus_in_decoder_disp_err(pin)
--		);

	ctrlbus_in_decoder_pin_err(pin) <= ctrlbus_in_decoder_code_err(pin) or ctrlbus_in_decoder_disp_err(pin);
	
	ctrlbus_in_decoder_pin_err_ored(5) <= '0';
	ctrlbus_in_decoder_pin_err_ored(pin) <= ctrlbus_in_decoder_pin_err_ored(pin+1) or ctrlbus_in_decoder_pin_err(pin);
	
	ctrlbus_in_decoder_comma_anded(5) <= '1';
	ctrlbus_in_decoder_comma_anded(pin) <= ctrlbus_in_decoder_comma_anded(pin+1) and ctrlbus_in_decoder_kout(pin);
	
	ctrlbus_in_decoder_comma_ored(5) <= '0';
	ctrlbus_in_decoder_comma_ored(pin) <= ctrlbus_in_decoder_comma_ored(pin+1)  or ctrlbus_in_decoder_kout(pin);

	ctrlbus_in_decoder_dout_K28_0_anded(5) <= '1';
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
			ctrlbus_in_internal_deserialiser_reg( (pin+1)*8-1 downto pin*8 ) <= (7 downto 0 =>'0');
			ctrlbus_in_data_80bit(			(pin+1)*8-1 downto 			pin*8) <= (7 downto 0 => '0');
			ctrlbus_in_data_80bit( 40+	(pin+1)*8-1 downto 40+	pin*8) <= (7 downto 0 => '0');
			ctrlbus_in_state <= ST_IDLE;
		else
			case ctrlbus_in_state is
				when ST_IDLE =>
					--ctrlbus_in_data_80bit( (pin+1)*8-1 downto pin*8) <= (7 downto 0 => '0');
					--ctrlbus_in_data_80bit( 40 + (pin+1)*8-1 downto 40 + pin*8) <= (7 downto 0 => '0');
					if ctrlbus_in_decoder_BOF = '1' then 
						ctrlbus_in_state <= ST_DATA0;
					else
					   ctrlbus_in_state <= ST_IDLE;
					end if;
				when ST_DATA0 =>
					if ctrlbus_in_decoder_DATA='1' then 
							ctrlbus_in_state <= ST_DATA1;
							ctrlbus_in_internal_deserialiser_reg( (pin+1)*8-1 downto pin*8 ) <= ctrlbus_in_decoded(pin);
					else 
							ctrlbus_in_state <= ST_IDLE;
							ctrlbus_in_data_80bit(				(pin+1)*8-1 downto			pin*8) <= (7 downto 0 => '0');
							ctrlbus_in_data_80bit( 40 +	(pin+1)*8-1 downto 40 +	pin*8) <= (7 downto 0 => '0');		-- error occured. do not try to receive the second half of data
					end if;
				when ST_DATA1 =>
					ctrlbus_in_data_80bit(			(pin+1)*8-1 downto			pin*8) <= ctrlbus_in_internal_deserialiser_reg( (pin+1)*8-1 downto pin*8 );
					ctrlbus_in_data_80bit( 40+	(pin+1)*8-1 downto 40+	pin*8) <= ctrlbus_in_decoded(pin);
					if ctrlbus_in_decoder_DATA='1' then 
							ctrlbus_in_state <= ST_DATA0;
					else ctrlbus_in_state <= ST_IDLE;
					end if;
				when others =>
				    ctrlbus_in_internal_deserialiser_reg( (pin+1)*8-1 downto pin*8 ) <= (7 downto 0 =>'0');
                    ctrlbus_in_data_80bit(            (pin+1)*8-1 downto             pin*8) <= (7 downto 0 => '0');
                    ctrlbus_in_data_80bit( 40+    (pin+1)*8-1 downto 40+    pin*8) <= (7 downto 0 => '0');
				    ctrlbus_in_state <= ST_IDLE;
			end case;
		end if;
	end if;
end process;

ctrlbus_in_state_slv(0) <= '0' when ctrlbus_in_state=ST_IDLE or ctrlbus_in_state=ST_DATA0 else '1';
ctrlbus_in_state_slv(1) <= '1' when ctrlbus_in_state=ST_DATA1 or ctrlbus_in_state=ST_DATA0 else '0';


process(ctrlbus_serdes_parallelclk80_in) begin
	if rising_edge(ctrlbus_serdes_parallelclk80_in) then
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

	ipb_write.ipb_addr	<= ctrlbus_in_data_80bit(32 downto  1);
	
	ipb_write.ipb_wdata( 6 downto  0) 	<= ctrlbus_in_data_80bit(39 downto 33);
	ipb_write.ipb_wdata(31 downto 7)	<= ctrlbus_in_data_80bit(65 downto 41);
	
	ipb_write.ipb_strobe	<= ctrlbus_in_data_80bit(66) and ctrlbus_in_decoder_DATA;
	
	ipb_write.ipb_write	<= ctrlbus_in_data_80bit(67) and ctrlbus_in_decoder_DATA;

	ipb_write_out <= ipb_write;
	
	ctrlbus_locked_out <= not ctrlbus_in_decoder_ERR;



vio: entity work.vio_ctrlbus_deserialiser
  PORT MAP (
    clk => ctrlbus_serdes_parallelclk80_in,
    probe_in0 => idelay_valueout(0),
    probe_in1 => idelay_valueout(1),
    probe_in2 => idelay_valueout(2),
    probe_in3 => idelay_valueout(3),
    probe_in4 => idelay_valueout(4),
    probe_out0 => idelay_value(0),
    probe_out1 => idelay_value(1),
    probe_out2 => idelay_value(2),
    probe_out3 => idelay_value(3),
    probe_out4 => idelay_value(4)
  );




--ila: entity work.ila_ctrlbus_deserialiser
--  PORT MAP (
--    clk => sysclk80,
--    probe0 => ctrlbus_in_decoded(0),
--    probe1 => ctrlbus_in_decoded(1),
--    probe2 => ctrlbus_in_decoded(2),
--    probe3 => ctrlbus_in_decoded(3),
--    probe4 => ctrlbus_in_decoded(4),
--    probe5 => ctrlbus_in_decoder_kout,
--    probe6 => ctrlbus_in_decoder_code_err,
--    probe7 => ctrlbus_in_decoder_disp_err,
--    probe8 => ctrlbus_in_data_80bit,
--    probe9 => ipb_write.ipb_wdata,
--    probe10 => ipb_write.ipb_addr,
--    probe11(0) => ipb_write.ipb_strobe,
--    probe12(0) => ipb_write.ipb_write,
--    probe13(0) => ctrlbus_in_decoder_ERR,
--    probe14(0) => ctrlbus_in_decoder_BOF,
--    probe15(0) => ctrlbus_in_decoder_DATA,
--    probe16 => idelay_valueout(0),
--    probe17 => idelay_valueout(1),
--    probe18 => idelay_valueout(2),
--    probe19 => idelay_valueout(3),
--    probe20 => idelay_valueout(4),
--    probe21 => ctrlbus_in_deserialised(0),
--    probe22 => ctrlbus_in_deserialised(1),
--    probe23 => ctrlbus_in_deserialised(2),
--    probe24 => ctrlbus_in_deserialised(3),
--    probe25 => ctrlbus_in_deserialised(4),
--    probe26 => ctrlbus_in_state_slv,
--    probe27 => ctrlbus_out_state,
--    probe28 => slice_to_encode_0,
--    probe29 => slice_to_encode_1,
--    probe30 => slice_to_encode_2,
--    probe31 => ipb_read.ipb_rdata,
--    probe32(0) => ipb_read.ipb_ack,
--    probe33 => ctrlbus_in_iserdes_bitslip,
--    probe34(0) => idelay_load(0),
--    probe35(0) => idelay_load(1),
--    probe36(0) => idelay_load(2),
--    probe37(0) => idelay_load(3),
--    probe38(0) => idelay_load(4)
--  );


end Behavioral;

