----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andreas Reiß (areiss@students.uni-mainz.de)
-- 
-- Create Date: 16.07.2014 16:45:00
-- Design Name: 
-- Module Name: BER_Check_CMX_TB - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity BER_Check_CMX_TB is
end BER_Check_CMX_TB;

architecture behavioral of BER_Check_CMX_TB is
	constant BC_TIME : time := 25 ns;
	signal clockBus : std_logic_vector(3 downto 0) := ("0000");
	signal RxData128  : std_logic_vector(127 downto 0);
	signal CharIsK    : std_logic_vector(15 downto 0);
	signal CRCError   : std_logic:='0';
	signal WordClock   : std_logic:='0';
	signal BER_Reset  : std_logic:='0';
	signal BER_Errors : std_logic_vector(31 downto 0):=(others=>'0');
begin
	BER_Check_CMX_I : entity work.BER_Check_CMX
		Port Map(
		WordClock=> WordClock,
		RxData128=>RxData128,
		CharIsK=>CharIsK,
		CRCError=>CRCError,
		BER_Reset=>BER_Reset,
		BER_Errors=>BER_Errors
		);

	-- clocks
	clk40_process : process
	begin
		clockBus(0) <= not clockBus(0);
		wait for BC_TIME / 2;
	end process;

	word_process : process
	begin
		WordClock <= not WordClock;
		wait for BC_TIME / 2;
	end process;	
	
	clk80_process : process
	begin
		clockBus(1) <= not clockBus(1);
		wait for BC_TIME / 4;
	end process;

	clk160_process : process
	begin
		clockBus(2) <= not clockBus(2);
		wait for BC_TIME / 8;
	end process;
	
	clk320_process : process
	begin
		clockBus(3) <= not clockBus(3);
		wait for BC_TIME / 16;
	end process;
    
    process
		variable CounterU: unsigned(15 downto 0):=(others=>'0');
		variable CounterSLV: std_logic_vector(15 downto 0):=(others=>'0');
    begin
			CounterU:=CounterU+1;
			CounterSLV:=std_logic_vector(CounterU);
			if CounterU=x"00FF" then
				RxData128<=CounterSLV & CounterSLV & CounterSLV & CounterSLV(15 downto 8) & "10111100" & CounterSLV & CounterSLV & CounterSLV & CounterSLV;
				CharIsK<=x"0100";
			else
				RxData128<=CounterSLV & CounterSLV & CounterSLV & CounterSLV & CounterSLV & CounterSLV & CounterSLV & CounterSLV;
				CharIsK<=(others=>'0');
			end if;    
		wait for BC_TIME;
    end process;
end;