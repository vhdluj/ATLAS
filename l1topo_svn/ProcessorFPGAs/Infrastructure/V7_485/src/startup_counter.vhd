----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2013 18:48:58
-- Design Name: 
-- Module Name: counter - Behavioral
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


entity startup_counter is
	generic	( max_count : integer:=256 --shouldn't exceed 256
	);
    Port ( PowerUpIn : in STD_LOGIC;
			Qpll_locked : in std_logic;
			clkIn		: in std_logic;
			ResetOut	: out std_logic);
end startup_counter;

architecture Behavioral of startup_counter is

signal pd	: std_logic;
signal clk	: std_logic;
signal reset : std_logic;
signal qpll_lock	: std_logic;
signal count	:	integer range 0 to 255 :=0;

begin
qpll_lock <=	Qpll_locked;
pd<= not PowerUpIn;
clk<=clkIn;
ResetOut<=reset;

counter_proc: process(clk)

begin
	if rising_edge(clk) then
			if qpll_lock='1' then
				if pd='1' then
					count<=0;
					reset<='0';
				else
					if count=max_count-1 then
						count<=count;
						reset<='0';
					else
						count<=count+1;
						reset<='1';
					end if;
				end if;
			else
				count<=0;
				reset<='0';
			end if;
	end if;
end process;

end Behavioral;
