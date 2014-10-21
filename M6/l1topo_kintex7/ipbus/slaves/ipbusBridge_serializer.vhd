----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:27:06 08/29/2014 
-- Design Name: 
-- Module Name:    ipbusBridge_serializer - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

use work.encode_8b10b_pkg.all;



entity ipbusBridge_serializer is
    port( 
		parallelclk : in  std_logic;
		serialclk   : in  std_logic;
      mmcm_locked : in  std_logic;
		
		parallelData: in  std_logic_vector(7 downto 0);
		charIsK     : in  std_logic;
		serialData  : out std_logic
	 );
	 
end ipbusBridge_serializer;

architecture Behavioral of ipbusBridge_serializer is

	signal encodedData: std_logic_vector(9 downto 0);
	signal reset: std_logic;
	
	signal toggle, toggle_reg: std_logic;
	signal dataShiftRegister: std_logic_vector(9 downto 0);
	signal oddr_d1, oddr_d2: std_logic;

begin



	reset <= not mmcm_locked;



encoder: entity work.encode_8b10b_lut_base PORT MAP(
		CLK => parallelclk,
		DIN => parallelData,
		KIN => charIsK,
		DOUT => encodedData,
		CE => '1'
	);




process(parallelclk) begin
	if rising_edge(parallelclk) then
		if reset='1' then toggle <= '0';
		else toggle <= not toggle;
		end if;
	end if;
end process;




process(serialclk) begin
    if rising_edge(serialclk) then
        toggle_reg <= toggle;
        if toggle/=toggle_reg then dataShiftRegister <= encodedData;
        else dataShiftRegister(9 downto 2) <= dataShiftRegister(7 downto 0);
        end if;
    end if;
end process;




	oddr_d1 <= dataShiftRegister(9);
	oddr_d2 <= dataShiftRegister(8);




DATA_ODDR: ODDR
	generic map(
		DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
		INIT => '0', -- Initial value for Q port ('1' or '0')
		SRTYPE => "SYNC" -- Reset Type ("ASYNC" or "SYNC")
		)
	port map (
		Q => serialdata, -- 1-bit DDR output
		C => serialclk, -- 1-bit clock input
		CE => '1', -- 1-bit clock enable input
		D1 => oddr_d1, -- 1-bit data input (positive edge)
		D2 => oddr_d2, -- 1-bit data input (negative edge)
		R => reset, -- 1-bit reset input
		S => '0' -- 1-bit set input
	);
	




end Behavioral;

