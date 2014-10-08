----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andreas D. Reiﬂ (areiss@students.uni-mainz.de)
-- 
-- Create Date: 15.05.2014 13:00:00
-- Design Name: 
-- Module Name: Timer - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity Timer is
	Generic (
		OneTickClockCycles: integer:=160320000
	);
    Port (
		Clock: in std_logic;
		Timer_Reset: in std_logic;--if 1 then TimeInSecondsElapsedSTDLV becomes 0
		TimeInSecondsElapsedSTDLV: out std_logic_vector(31 downto 0)
	);
end Timer;

architecture Behavioral of Timer is
	attribute DONT_TOUCH : string;                                                           
	attribute DONT_TOUCH of Behavioral : architecture is "TRUE";
begin
	NumberOfTicks: process (Clock)--relax timing by using a process with an additional flip flop
		variable OneSecondCounter : integer:=0;
		variable TimeInSecondsElapsed: integer:=0;
	begin
		if rising_edge(Clock) then
			if OneSecondCounter = OneTickClockCycles then
				OneSecondCounter:=0;
			else
				OneSecondCounter:=OneSecondCounter+1;
			end if;
			
			if Timer_Reset='1' then
				TimeInSecondsElapsed:=0;
			elsif OneSecondCounter=0 then
				TimeInSecondsElapsed:=TimeInSecondsElapsed+1;
			end if;
			
			TimeInSecondsElapsedSTDLV<=std_logic_vector(to_unsigned(TimeInSecondsElapsed,32));
		end if;
	end process;
end Behavioral;
