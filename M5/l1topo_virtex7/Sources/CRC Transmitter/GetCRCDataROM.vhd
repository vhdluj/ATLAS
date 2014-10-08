----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sebastian Artz, Andreas Reiß (debugging, areiss@students.uni-mainz.de)
-- 
-- Create Date: 15.05.2014 13:13:52
-- Design Name: 
-- Module Name: GetCRCDataROM - Behavioral
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GetCRCDataROM is
	Port(
		clockBus: in std_logic_vector(3 downto 0);
		data32_out    : out std_logic_vector(31 downto 0);
		char_flag_out : out std_logic_vector(3 downto 0)
	);
end GetCRCDataROM;

architecture Behavioral of GetCRCDataROM is
	attribute DONT_TOUCH : string;
	attribute shreg_extract : string;
	attribute keep : string;	
	attribute DONT_TOUCH of Behavioral : architecture is "TRUE";
	
	constant K28_5 : std_logic_vector (7 downto 0) := x"BC";

	signal data_128 : std_logic_vector(127 downto 0);
	signal data32 : std_logic_vector(31 downto 0);
	signal data32_out2 : std_logic_vector(31 downto 0);
	signal char_flag_out2 : std_logic_vector(3 downto 0);
	signal address_ctr : unsigned(7 downto 0) := x"00";
	signal address_ctrSLV : std_logic_vector(7 downto 0) := x"00";
	signal subtick_counter : unsigned(1 downto 0) := "00";
	signal subtick_counterSLV : std_logic_vector(1 downto 0) := "00";
	signal char_flag : std_logic_vector(15 downto 0);
	signal shiftSubCtr   : std_logic_vector(1 downto 0):="00";
	signal toggle,toggle2: std_logic:='0';
	
	COMPONENT blk_mem_gen_0
	  PORT (
		clka : IN STD_LOGIC;
		addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		douta : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
	  );
	END COMPONENT;
	
	ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	ATTRIBUTE SYN_BLACK_BOX OF blk_mem_gen_0 : COMPONENT IS TRUE;
	ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
	ATTRIBUTE BLACK_BOX_PAD_PIN OF blk_mem_gen_0 : COMPONENT IS "clka,addra[7:0],douta[127:0]";

	COMPONENT ila_crc_transmitter
	  PORT (
		clk : IN STD_LOGIC;
		probe1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		probe0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		probe2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		probe3 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		probe4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		probe5 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		probe6 : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	  );
	END COMPONENT;
	-- ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	ATTRIBUTE SYN_BLACK_BOX OF ila_crc_transmitter : COMPONENT IS TRUE;
	-- ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
	ATTRIBUTE BLACK_BOX_PAD_PIN OF ila_crc_transmitter : COMPONENT IS "clk,probe1[1:0],probe0[7:0],probe2[1:0],probe3[127:0],probe4[31:0],probe5[15:0],probe6[3:0]";

	attribute keep of shiftSubCtr: signal is "TRUE";	
	attribute keep of address_ctrSLV: signal is "TRUE";	
	attribute keep of subtick_counterSLV: signal is "TRUE";	
	attribute keep of data_128: signal is "TRUE";	
	attribute keep of data32_out2: signal is "TRUE";	
	attribute keep of char_flag: signal is "TRUE";	
	attribute keep of char_flag_out2: signal is "TRUE";		
	
begin	
	CRC_DATA_ROM : blk_mem_gen_0
	  PORT MAP (
		clka => clockBus(0),
		addra => std_logic_vector(address_ctr),
		douta => data_128
	  );
	char_flag <= x"0100" when (data_128(71 downto 64) = K28_5)--b"0000_0001_0000_0000"
				 else x"0000";

	ADDRESS_CTR_PROCESS : process(clockBus(0))
	begin
		if rising_edge(clockBus(0)) then
			address_ctr <= address_ctr + 1;
			-- shiftSubCtr<=std_logic_vector(subtick_counter+3);--Voodoo von Andreas Reiß
			toggle<=not toggle;
		end if;
	end process;

	SERIALIZER : process(clockBus(2))
	begin
		if rising_edge(clockBus(2)) then	
			case (subtick_counter) is -- + unsigned(shiftSubCtr)) is
				when "11"  => data32_out2 <= data_128(31 downto 0);--(127 downto 96);
						   char_flag_out2 <= char_flag(3 downto 0);
				when "10"  => data32_out2 <= data_128(63 downto 32);--(95 downto 64);
						   char_flag_out2 <= char_flag(7 downto 4);
				when "01"  => data32_out2 <= data_128(95 downto 64);--(63 downto 32);
						   char_flag_out2 <= char_flag(11 downto 8);
				when "00"  => data32_out2 <= data_128(127 downto 96);
						   char_flag_out2 <= char_flag(15 downto 12);--;
				when others => data32_out2 <= (others => '0');
							char_flag_out2 <= (others => '0');
			end case;
			
			if toggle2/=toggle then
				subtick_counter<=b"01";
				toggle2<=toggle;
			else
				subtick_counter <= subtick_counter + 1;
			end if;			
		end if;
	end process;
	
	subtick_counterSLV<=std_logic_vector(subtick_counter);
	address_ctrSLV<=std_logic_vector(address_ctr);	
	
	char_flag_out<=char_flag_out2;
	data32_out<=data32_out2;
	
--	ila_crc_transmitter_I : ila_crc_transmitter
--	  PORT MAP (
--		clk => clockBus(2),
--		probe1 => shiftSubCtr,
--		probe0 => address_ctrSLV,
--		probe2 => subtick_counterSLV,
--		probe3 => data_128,
--		probe4 => data32_out2,
--		probe5 => char_flag,
--		probe6 => char_flag_out2
--	  );	
end Behavioral;
