
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ipbus_slave_ddr_debug is
	generic(lvds_lines : positive);
	port(
		clk: in STD_LOGIC;
		reset: in STD_LOGIC;
		ipbus_in: in ipb_wbus;
		ipbus_out: out ipb_rbus;
		
		DBG_STATE_IN     : in std_logic_vector(lvds_lines * 4 - 1 downto 0);
		DBG_REG_DATA_IN  : in std_logic_vector(lvds_lines * 10 - 1 downto 0);
		DBG_BITSLIP_IN   : in std_logic_vector(lvds_lines * 4 - 1 downto 0);
		DBG_INC_IN       : in std_logic_vector(lvds_lines * 8 - 1 downto 0);
		DBG_PAUSE_IN     : in std_logic_vector(lvds_lines * 8 - 1 downto 0);
		DBG_STEP_IN      : in std_logic_vector(lvds_lines * 8 - 1 downto 0)
	);
	
end ipbus_slave_ddr_debug;

architecture rtl of ipbus_slave_ddr_debug is

	type reg_array is array(2*lvds_lines-1 downto 0) of std_logic_vector(31 downto 0);
	signal reg: reg_array;
	signal sel: integer;
	signal ack : std_logic;
	
begin
 
	out_gen : for i in 0 to lvds_lines - 1 generate
		
		process(clk)
		begin
			if rising_edge(clk) then
				reg(i)(3 downto 0)   <= DBG_STATE_IN((i + 1) * 4 - 1 downto i * 4);
				reg(i)(7 downto 4)   <= DBG_BITSLIP_IN((i + 1) * 4 - 1 downto i * 4);
				reg(i)(15 downto 8)  <= DBG_INC_IN((i + 1) * 8 - 1 downto i * 8);
				reg(i)(23 downto 16) <= DBG_PAUSE_IN((i + 1) * 8 - 1 downto i * 8);
				reg(i)(31 downto 24) <= DBG_STEP_IN((i + 1) * 8 - 1 downto i * 8);
				
				reg(lvds_lines + i)(9 downto 0)   <= DBG_REG_DATA_IN((i + 1) * 10 - 1 downto i * 10);
				reg(lvds_lines + i)(15 downto 10) <= (others => '0');
				reg(lvds_lines + i)(31 downto 16) <= std_logic_vector(to_unsigned(i, 16));
			end if;
		end process;
	
	end generate out_gen;
	
	
	sel <= to_integer(unsigned(ipbus_in.ipb_addr(7 downto 0)));

	process(clk)
	begin
		if rising_edge(clk) then
		
				ack <= ipbus_in.ipb_strobe and not ack;
			
				ipbus_out.ipb_rdata <= reg(sel);
		end if;
	end process;
	
	ipbus_out.ipb_ack <= ack; --ipbus_in.ipb_strobe;
	ipbus_out.ipb_err <= '0';

end rtl;