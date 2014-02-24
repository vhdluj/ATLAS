library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity Sech is
    Port ( inp : in  STD_LOGIC_VECTOR (5 downto 0);  --for CP assume 64 phi bins per 2pi, calculate function up to pi only, mid bin.
           oup : out STD_LOGIC_VECTOR (7 downto 0));
end Sech;

architecture Behavioral of Sech is
type triglut is array (integer range 0 to 63) of std_logic_vector (7 downto 0);

signal intad : integer range 0 to 63;
-- two's complement
constant sechtab : triglut :=
("10000000",
"01111111",
"01111101",
"01111010",
"01110110",
"01110001",
"01101011",
"01100101",
"01011111",
"01011001",
"01010010",
"01001100",
"01000110",
"01000000",
"00111011",
"00110110",
"00110001",
"00101101",
"00101001",
"00100101",
"00100010",
"00011110",
"00011100",
"00011001",
"00010111",
"00010100",
"00010010",
"00010001",
"00001111",
"00001110",
"00001100",
"00001011",
"10000000",
"01111111",
"01111101",
"01111010",
"01110110",
"01110001",
"01101011",
"01100101",
"01011111",
"01011001",
"01010010",
"01001100",
"01000110",
"01000000",
"00111011",
"00110110",
"00110001",
"00101101",
"00101001",
"00100101",
"00100010",
"00011110",
"00011100",
"00011001",
"00010111",
"00010100",
"00010010",
"00010001",
"00001111",
"00001110",
"00001100",
"00001011");

begin

intad<=to_integer(unsigned(inp));
oup<=sechtab(intad);

end Behavioral;