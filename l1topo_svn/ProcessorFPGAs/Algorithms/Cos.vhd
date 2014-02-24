library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Cos is
    Port ( inp : in  STD_LOGIC_VECTOR (5 downto 0);  --for CP assume 64 phi bins per 2pi, calculate function up to pi only, mid bin.
           oup : out STD_LOGIC_VECTOR (8 downto 0));
end Cos;

architecture Behavioral of Cos is
type triglut is array (integer range 0 to 32) of std_logic_vector (8 downto 0);

signal intad : integer range 0 to 32;
-- two's complement
constant costab : triglut :=
("010000000",
"001111111",
"001111101",
"001111010",
"001110101",
"001110000",
"001101001",
"001100001",
"001011001",
"001001111",
"001000101",
"000111010",
"000101110",
"000100010",
"000010101",
"000001001",
"111111101",
"111110000",
"111100011",
"111010111",
"111001011",
"111000000",
"110110101",
"110101011",
"110100010",
"110011010",
"110010011",
"110001101",
"110001000",
"110000100",
"110000010",
"110000001",
"110000001");

begin

intad<=to_integer(unsigned(inp));
oup<=costab(intad);

end Behavioral;