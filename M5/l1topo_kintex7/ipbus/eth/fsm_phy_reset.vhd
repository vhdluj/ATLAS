----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:02:29 10/11/2013 
-- Design Name: 
-- Module Name:    fsm_phy_reset - Behavioral 
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

entity fsm_phy_reset is port(
		clk_125_i: 	in  std_logic;
      eth_locked_in: 	in  std_logic;
		phy_reset_o: out std_logic
	);
end fsm_phy_reset;

architecture Behavioral of fsm_phy_reset is

	signal start_counter: unsigned(16 downto 0);
	signal rst_phy: std_logic;

	type state_type is (ST_IDLE, ST_PREPARE_RESET, ST_RESET);
	signal state: state_type;
	signal counter: unsigned(5 downto 0);

begin


process(clk_125_i) begin
		if rising_edge(clk_125_i) then
		 if eth_locked_in='0' then
			start_counter <= (others => '0');
		 elsif start_counter /= x"1ffff" then
			start_counter <= start_counter + 1;
		 else start_counter <= start_counter;
		 end if;
		end if;
	end process;
	
	rst_phy <= not start_counter(16);




process(clk_125_i) begin
	if rising_edge(clk_125_i) then
		if rst_phy='1' then 
			counter <= (others => '0');
			state <= ST_PREPARE_RESET;
		else
			case state is
				when ST_IDLE =>
					counter <= (others => '0');
					state <= ST_IDLE;
				when ST_PREPARE_RESET =>
					if counter = "111111" then
						counter <= (others => '0');
						state <= ST_RESET;
					else 
						counter <= counter + 1;
						state <= ST_PREPARE_RESET;
					end if;
				when ST_RESET =>
					if counter = "111111" then
						counter <= (others => '0');
						state <= ST_IDLE;
					else 
						counter <= counter + 1;
						state <= ST_RESET;
					end if;
				when others =>
					counter <= (others => '0');
					state <= ST_IDLE;
			end case;
		end if;
	end if;
end process;

phy_reset_o <= '1' when state = ST_RESET else '0';

end Behavioral;

