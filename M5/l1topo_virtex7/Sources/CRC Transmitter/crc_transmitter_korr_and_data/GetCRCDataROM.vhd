----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
	Port(clk40_in      : in  STD_LOGIC;
		 clk160_in     : in  STD_LOGIC;
		 shiftSubCtr   : in  std_logic_vector(1 downto 0);
		 data_out      : out std_logic_vector(31 downto 0);
		 char_flag_out : out std_logic_vector(3 downto 0)
	);
end GetCRCDataROM;

architecture Behavioral of GetCRCDataROM is

constant K28_5 : std_logic_vector (7 downto 0) := x"BC";

signal data_128    : std_logic_vector(127 downto 0);
signal data_32     : std_logic_vector(31 downto 0);
signal crc         : std_logic_vector(11 downto 0);
signal address_ctr : unsigned(7 downto 0) := x"00";
signal subtick_counter : unsigned(1 downto 0) := "00";
signal char_flag   : std_logic_vector(15 downto 0);
signal clk40       : std_logic;
signal clk160      : std_logic;


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


begin

clk40 <= clk40_in;
clk160 <= clk160_in;

data_out <= data_32;

--CALC_CRC: entity work.CalcCRC
--	port map(
--		DATA_in            => data_pre_crc_32,
--		CRC_out            => crc,
--		clk                => clk40,
--		rx_subtick_counter => subtick_counter);
		
CRC_DATA_ROM : blk_mem_gen_0
  PORT MAP (
    clka => clk40,
    addra => std_logic_vector(address_ctr),
    douta => data_128
  );

--ADD_K_CHAR : process
--begin
--	if (data_128(71 downto 64) = K28_5) then
--		char_flag(15 downto 0) <= x"0100";
--	else
--		char_flag(15 downto 0) <= x"0000";
--	end if;
--end process;

char_flag <= x"0100" when (data_128(71 downto 64) = K28_5)
			 else x"0000";

ADDRESS_CTR_PROCESS : process(clk40)
begin
	if rising_edge(clk40) then
		
--		if (address_ctr = "11111111") then
--			address_ctr <= "00000000";
--		else
			address_ctr <= address_ctr + 1;
--		end if;
		
--		subtick_counter <= 0;
	end if;
end process;

SERIALIZER : process(clk160)
begin
	if rising_edge(clk160) then
		case (subtick_counter + unsigned(shiftSubCtr)) is
			when "00"      => data_32 <= data_128(31 downto 0);--(127 downto 96);
						   char_flag_out <= char_flag(3 downto 0);
			when "11"      => data_32 <= data_128(63 downto 32);--(95 downto 64);
						   char_flag_out <= char_flag(7 downto 4);
			when "10"      => data_32 <= data_128(95 downto 64);--(63 downto 32);
						   char_flag_out <= char_flag(11 downto 8);
			when "01"      => data_32 <= data_128(127 downto 96);
						   char_flag_out <= char_flag(15 downto 12);--;
			when others => data_32 <= (others => '0');
		end case;

		subtick_counter <= subtick_counter + 1;
	end if;
end process;

end Behavioral;
