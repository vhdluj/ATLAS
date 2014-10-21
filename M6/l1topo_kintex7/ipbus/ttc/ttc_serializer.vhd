----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:50 02/12/2014 
-- Design Name: 
-- Module Name:    ctrlbus_ttc - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ttc_serializer is port(
		sysclk40: in std_logic;
		sysclk80: in std_logic;
		ttc_L1Accept: in std_logic;
		ttc_EventCounterReset: in std_logic;
		ttc_BunchCounterReset: in std_logic;
		ttc_BroadcastStrobe1, ttc_BroadcastStrobe2: in std_logic;
		ttc_Broadcast: in std_logic_vector(5 downto 0);
		fakeTTCBroadcast: in std_logic;
		ttc_out: out std_logic_vector(1 downto 0)
	);
end ttc_serializer;




architecture Behavioral of ttc_serializer is
	
	attribute s: string;
	
	signal ttc_broadcast_01xxxx_received: std_logic;

	signal toggle, toggle_reg: std_logic_vector(1 downto 0);
	attribute s of toggle: signal is "true";
	attribute s of toggle_reg: signal is "true";
	
	type array2x4 is array(1 downto 0) of std_logic_vector(3 downto 0);
	signal paralleldata: array2x4;
	attribute s of paralleldata: signal is "true";
	
	signal oddr_d1, oddr_d2: std_logic_vector(1 downto 0);

begin
	
	ttc_broadcast_01xxxx_received <= '1' when ( (ttc_Broadcast(5 downto 4)="01" and ttc_BroadcastStrobe1='1') 
												or (fakeTTCBroadcast='1') ) 
												else '0';


TTC_OSERDES_GEN: for i in 0 to 1 generate begin

	paralleldata(i) <= ttc_L1Accept & ttc_broadcast_01xxxx_received & ttc_BunchCounterReset & '1';

	process(sysclk40) begin
		if rising_edge(sysclk40) then toggle(i) <= not toggle(i);
		end if;
	end process;

	process(sysclk80) begin
		if rising_edge(sysclk80) then
			toggle_reg(i) <= toggle(i);
			if toggle_reg(i) /= toggle(i) then
				oddr_d1(i) <= paralleldata(i)(0);
				oddr_d2(i) <= paralleldata(i)(1);
			else
				oddr_d1(i) <= paralleldata(i)(2);
				oddr_d2(i) <= paralleldata(i)(3);
			end if;
		end if;
	end process;

	TTC_ODDR : ODDR
   generic map(
      DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
      INIT => '0',   -- Initial value for Q port ('1' or '0')
      SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
   port map (
      Q => ttc_out(i),   -- 1-bit DDR output
      C => sysclk80,    -- 1-bit clock input
      CE => '1',  -- 1-bit clock enable input
      D1 => oddr_d1(i),  -- 1-bit data input (positive edge)
      D2 => oddr_d2(i),  -- 1-bit data input (negative edge)
      R => '0',    -- 1-bit reset input
      S => '0'     -- 1-bit set input
   );

end generate;	
	
	
end Behavioral;

