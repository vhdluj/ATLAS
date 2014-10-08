library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.L1TopoDataTypes.all;

entity Sin is
	Port(inp : in  STD_LOGIC_VECTOR(5 downto 0); -- LSB = 0.1, needs to be in interval [0;3.2]
		 oup : out STD_LOGIC_VECTOR(CosSinBitWidth - 1 downto 0)); -- interpreted as signed number in format (+0.0000000)
end Sin;

architecture Behavioral of Sin is
	type triglut is array (integer range 0 to 31) of std_logic_vector(CosSinBitWidth - 1 downto 0);

	signal intad    : integer range 0 to 31;
	-- two's complement
	constant sintab : triglut := ("000000000",
		                          "000001100",
		                          "000011001",
		                          "000100101",
		                          "000110001",
		                          "000111101",
		                          "001001000",
		                          "001010010",
		                          "001011011",
		                          "001100100",
		                          "001101011",
		                          "001110010",
		                          "001110111",
		                          "001111011",
		                          "001111110",
		                          "001111111",
		                          "001111111",
		                          "001111110",
		                          "001111100",
		                          "001111001",
		                          "001110100",
		                          "001101110",
		                          "001100111",
		                          "001011111",
		                          "001010110",
		                          "001001100",
		                          "001000001",
		                          "000110110",
		                          "000101010",
		                          "000011110",
		                          "000010010",
		                          "000000101");

begin
	lookup_sin : process(inp, intad)
	begin
		intad <= to_integer(unsigned(inp));
		if (intad < 32) then
			oup <= sintab(intad);
		else
			oup <= std_logic_vector(-signed(sintab(intad - 32)));
		end if;

	end process;

--intad<=to_integer(unsigned(inp));
--oup<=sintab(intad);

end Behavioral;
