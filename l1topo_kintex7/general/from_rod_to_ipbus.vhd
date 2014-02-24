
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use ieee.numeric_std.all;

entity from_rod_to_ipbus is
	port(
		clk: in STD_LOGIC;
		reset: in STD_LOGIC;
		
		parsers_data_in : in std_logic_vector(31 downto 0);
		parsers_rd_out : out std_logic;
		parsers_rdy_in : in std_logic;
		
		ram_we_out : out std_logic;
		ram_waddr_out : out std_logic_vector(9 downto 0);
		ram_data_out : out std_logic_vector(31 downto 0)
	);
	
end from_rod_to_ipbus;

architecture rtl of from_rod_to_ipbus is
	
signal parsers_rd : std_logic;
signal addr : std_logic_vector(9 downto 0);

begin

parsers_rd_out <= parsers_rd;
ram_data_out <= parsers_data_in;
ram_waddr_out <= addr;

process(clk)
begin
	if rising_edge(clk) then
		if parsers_rdy_in = '1' then
			parsers_rd <= '1';
		else
			parsers_rd <= '0';
		end if;
		
		ram_we_out <= parsers_rd;		
	end if;
end process;

process(clk)
begin
	if rising_edge(clk) then
		if (parsers_rd = '0') then
			addr <= (others => '0');
		else
			addr <= addr + x"1";
		end if;
	end if;
end process;

end rtl;

