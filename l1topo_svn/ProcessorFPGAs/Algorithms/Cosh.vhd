library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Cosh is
    Port ( inp : in STD_LOGIC_VECTOR (5 downto 0);  --for CP assume 64 phi bins per 2pi, calculate function up to pi only, mid bin.
           oup : out STD_LOGIC_VECTOR (10 downto 0));
end Cosh;

architecture Behavioral of cosh is
type triglut is array (integer range 0 to 32) of std_logic_vector (10 downto 0);

signal intad : integer range 0 to 32;
-- two's complement
constant coshtab : triglut :=
("00010000000",
"00010000000",
"00010000010",
"00010000101",
"00010001010",
"00010010000",
"00010010111",
"00010100000",
"00010101011",
"00010110111",
"00011000101",
"00011010101",
"00011100111",
"00011111100",
"00100010011",
"00100101101",
"00101001001",
"00101101010",
"00110001101",
"00110110101",
"00111100001",
"01000010010",
"01001001000",
"01010000100",
"01011000111",
"01100010000",
"01101100010",
"01110111100",
"10000100000",
"10010001110",
"10100001000",
"10110001111",
"11000100100");

begin

intad<=to_integer(unsigned(inp));
oup<=coshtab(intad);

end Behavioral;