----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andreas D. Reiß (areiss@students.uni-mainz.de)
-- 
-- Create Date: 15.05.2014 13:00:00
-- Design Name: 
-- Module Name: Topo690T - Behavioral
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

use work.L1TopoDataTypes.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity BER_Check is
    Port (
		WordClock: in std_logic;
		RxData: in std_logic_vector(31 downto 0);--one data word
		CharIsK: in std_logic_vector(3 downto 0);
		BER_Reset: in std_logic;--if 1 then BER_Errors becomes 0
		BER_Errors: out std_logic_vector(31 downto 0)
	);
end BER_Check;

architecture Behavioral of BER_Check is
	attribute DONT_TOUCH : string;                                                           
	attribute DONT_TOUCH of Behavioral : architecture is "TRUE";

	signal LastNumber,NumberResult: integer range 0 to 255;
	signal ByteComparator: std_logic_vector(2 downto 0);
	signal LastWordWasError: std_logic:='0';
	signal Realign: std_logic:='0';

	signal RealignSTDLV,LastWordWasErrorSTDLV,BER_ResetSTDLV: std_logic_vector(0 downto 0);
	signal LastNumberSTDLV,NumberResultSTDLV: std_logic_vector(7 downto 0);
	signal BER_Errors_Temp: std_logic_vector(31 downto 0):=(others=>'0');
	
	-- COMPONENT ila_ber
	  -- PORT (
		-- clk : IN STD_LOGIC;
		-- probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		-- probe1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		-- probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		-- probe3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		-- probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		-- probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		-- probe6 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		-- probe7 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		-- probe8 : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	  -- );
	-- END COMPONENT;
	-- ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	-- ATTRIBUTE SYN_BLACK_BOX OF ila_ber : COMPONENT IS TRUE;
	-- ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
	-- ATTRIBUTE BLACK_BOX_PAD_PIN OF ila_ber : COMPONENT IS "clk,probe0[31:0],probe1[3:0],probe2[0:0],probe3[31:0],probe4[0:0],probe5[0:0],probe6[7:0],probe7[7:0],probe8[2:0]";	
	
	attribute keep : string;
	attribute keep of RxData: signal is "TRUE";
	attribute keep of CharIsK: signal is "TRUE";
	attribute keep of BER_Errors: signal is "TRUE";
	attribute keep of ByteComparator: signal is "TRUE";
	attribute keep of BER_Errors_Temp: signal is "TRUE";
	-- attribute keep of LastWordWasErrorSTDLV: signal is "TRUE";
	-- attribute keep of RealignSTDLV: signal is "TRUE";
	-- attribute keep of NumberResultSTDLV: signal is "TRUE";
	-- attribute keep of LastNumberSTDLV: signal is "TRUE";
	-- attribute keep of BER_ResetSTDLV: signal is "TRUE";
	
begin
	BER_Check_1 : process (WordClock)
	begin
		if rising_edge(WordClock) then
			if CharIsK="0001" then
				Realign<='1';
			else
				Realign<='0';
			end if;
			
			if CharIsK="0001" or LastWordWasError='1' then
				LastNumber<=to_integer(unsigned(RxData(31 downto 24)));
			elsif LastNumber=255 then
				LastNumber<=0;
			else
				LastNumber<=LastNumber+1;
			end if;
		end if;
	end process;
	
	BER_Check_2 : process (WordClock)--relax timing by using more processes
	begin
		if rising_edge(WordClock) then
			if RxData(31 downto 24)=RxData(23 downto 16) then	ByteComparator(2)<='1'; else ByteComparator(2)<='0'; end if;--Byte 4 is equal Byte 3
			if RxData(31 downto 24)=RxData(15 downto 8 ) then	ByteComparator(1)<='1'; else ByteComparator(1)<='0'; end if;--Byte 4 is equal Byte 1
			if RxData(31 downto 24)=RxData(7  downto 0 ) then	ByteComparator(0)<='1'; else ByteComparator(0)<='0'; end if;--Byte 4 is equal Byte 0
			NumberResult<=to_integer(unsigned(RxData(31 downto 24)));--return integer of byte 4
		end if;
	end process;
	
	BER_Check_3 : process (WordClock)--relax timing by using more processes
		variable BER_INT: integer range 0 to 2147483647:=0;
	begin
		if rising_edge(WordClock) then
			if (LastNumber=NumberResult) and Realign='0' and (ByteComparator="111")then--if data was last word-> no error
				LastWordWasError<='0';
			elsif (LastNumber=NumberResult) and Realign='1' and (ByteComparator(2 downto 1)="11")then--if comma was last word-> no error
				LastWordWasError<='0';
			else --if sth else was last word
				BER_INT:=BER_INT+1;
				LastWordWasError<='1';
			end if;

			if BER_Reset='1' then
				BER_INT:=0;
			end if;

			BER_Errors_Temp<=std_logic_vector(to_unsigned(BER_INT,32));
		end if;
	end process;
	
	BER_Errors<=BER_Errors_Temp;
	
	-- RealignSTDLV(0)<=Realign;
	-- LastWordWasErrorSTDLV(0)<=LastWordWasError;
	-- BER_ResetSTDLV(0)<=BER_Reset;
	
	-- LastNumberSTDLV<=std_logic_vector(to_unsigned(LastNumber,8));
	-- NumberResultSTDLV<=std_logic_vector(to_unsigned(NumberResult,8));
	
	-- ila_ber_i : ila_ber
	-- PORT MAP (
	-- clk => WordClock,
	-- probe0 => RxData,
	-- probe1 => CharIsK,
	-- probe2 => BER_ResetSTDLV,
	-- probe3 => BER_Errors_Temp,
	-- probe4 => LastWordWasErrorSTDLV,
	-- probe5 => RealignSTDLV,
	-- probe6 => NumberResultSTDLV,
	-- probe7 => LastNumberSTDLV,
	-- probe8 => ByteComparator
	-- );
end Behavioral;
