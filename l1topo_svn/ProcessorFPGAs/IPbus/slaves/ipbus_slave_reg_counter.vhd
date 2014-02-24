----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:31:43 01/07/2014 
-- Design Name: 
-- Module Name:    ipbus_slave_reg_counter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.ipbus.ALL;

entity ipbus_slave_reg_counter is 
	port(
		clk: in std_logic;
		reset: in std_logic;
		ipbus_in: in ipb_wbus;
		ipbus_out: out ipb_rbus;
		pulse: in std_logic
	);
end ipbus_slave_reg_counter;

architecture Behavioral of ipbus_slave_reg_counter is

	signal pulse_reg: std_logic;
	signal counter: unsigned(31 downto 0);
	signal ack: std_logic;

begin

	process(clk)
		begin
			if rising_edge(clk) then
				if reset='1' then
					counter <= (others=>'0');
					pulse_reg <= '0';
				else
					pulse_reg <= pulse;
					if ipbus_in.ipb_strobe='1' and ipbus_in.ipb_write='1' then
						counter <= unsigned(ipbus_in.ipb_wdata);
					elsif pulse='1' and pulse_reg='0' then
						counter <= counter + 1;
					end if;
				end if;
				ipbus_out.ipb_rdata <= std_logic_vector(counter);
				
				ack <= ipbus_in.ipb_strobe and not ack;

			end if;
	end process;
		
		ipbus_out.ipb_ack <= ack;
		ipbus_out.ipb_err <= '0';


end Behavioral;

