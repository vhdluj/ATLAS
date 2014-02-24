library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity Tanh is
    Port ( inp : in  STD_LOGIC_VECTOR (5 downto 0);  --for CP assume 64 phi bins per 2pi, calculate function up to pi only, mid bin.
           oup : out STD_LOGIC_VECTOR (7 downto 0));
end Tanh;

architecture Behavioral of Tanh is
type triglut is array (integer range 0 to 63) of std_logic_vector (7 downto 0);

signal intad : integer range 0 to 63;
-- two's complement
constant tanhtab : triglut :=
("00000000",
"00001100",
"00011001",
"00100101",
"00110000",
"00111011",
"01000100",
"01001101",
"01010100",
"01011011",
"01100001",
"01100110",
"01101010",
"01101110",
"01110001",
"01110011",
"01110101",
"01110111",
"01111001",
"01111010",
"01111011",
"01111100",
"01111100",
"01111101",
"01111101",
"01111110",
"01111110",
"01111110",
"01111111",
"01111111",
"01111111",
"01111111",
"00000000",
"11110100",
"11100111",
"11011011",
"11010000",
"11000101",
"10111100",
"10110011",
"10101100",
"10100101",
"10011111",
"10011010",
"10010110",
"10010010",
"10001111",
"10001101",
"10001011",
"10001001",
"10000111",
"10000110",
"10000101",
"10000100",
"10000100",
"10000011",
"10000011",
"10000010",
"10000010",
"10000010",
"10000001",
"10000001",
"10000001",
"10000001");

begin

intad<=to_integer(unsigned(inp));
oup<=tanhtab(intad);

end Behavioral;
