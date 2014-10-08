-- Simulation: All OK! (Manuel Simon, 03.06.2014) 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.L1TopoDataTypes.all;

entity Cos is
	Port(inp : in  STD_LOGIC_VECTOR(5 downto 0); -- LSB = 0.1, needs to be in interval [0;6.3]
		 oup : out STD_LOGIC_VECTOR(CosSinBitWidth - 1 downto 0)); -- interpreted as signed number in format (+0.0000000)
end Cos;

architecture Behavioral of Cos is
	type triglut is array (integer range 0 to 63) of std_logic_vector(CosSinBitWidth - 1 downto 0);

	signal intad    : integer range 0 to 63;
	
	--           two's complement 9 bit output    cos(input)  decimal output   (exact result) 
	--                                                        corresponding to
	--                                                        9 bit value
	constant costab : triglut := ("010000000", -- cos(0.0) =  1.0              (= 1.0)
		                          "001111111", -- cos(0.1) ≃  0.9922           (= 0.9950)
		                          "001111101", -- cos(0.2) ≃  0.9766           (= 0.9801)
		                          "001111010", -- cos(0.3) ≃  0.9531           (= 0.9553)
		                          "001110101", -- cos(0.4) ≃  0.9141           (= 0.9211)
		                          "001110000", -- cos(0.5) ≃  0.8750           (= 0.8776)
		                          "001101001", -- cos(0.6) ≃  0.8203           (= 0.8253)
		                          "001100001", -- cos(0.7) ≃  0.7578           (= 0.7648)
		                          "001011001", -- cos(0.8) ≃  0.6953           (= 0.6967)
		                          "001001111", -- cos(0.9) ≃  0.6172           (= 0.6216)
		                          "001000101", -- cos(1.0) ≃  0.5391           (= 0.5403)
		                          "000111010", -- cos(1.1) ≃  0.4531           (= 0.4536)
		                          "000101110", -- cos(1.2) ≃  0.3594           (= 0.3624)
		                          "000100010", -- cos(1.3) ≃  0.2656           (= 0.2675)
		                          "000010101", -- cos(1.4) ≃  0.1641           (= 0.1700)
		                          "000001001", -- cos(1.5) ≃  0.0703           (= 0.0707)
		                          "111111101", -- cos(1.6) ≃ -0.0234           (=-0.0292)
		                          "111110000", -- cos(1.7) ≃ -0.1250           (=-0.1288)
		                          "111100011", -- cos(1.8) ≃ -0.2266           (=-0.2272)
		                          "111010111", -- cos(1.9) ≃ -0.3203           (=-0.3233)
		                          "111001011", -- cos(2.0) ≃ -0.4141           (=-0.4161)
		                          "111000000", -- cos(2.1) ≃ -0.5000           (=-0.5048)
		                          "110110101", -- cos(2.2) ≃ -0.5859           (=-0.5885)
		                          "110101011", -- cos(2.3) ≃ -0.6641           (=-0.6663)
		                          "110100010", -- cos(2.4) ≃ -0.7344           (=-0.7374)
		                          "110011010", -- cos(2.5) ≃ -0.7969           (=-0.8011)
		                          "110010011", -- cos(2.6) ≃ -0.8516           (=-0.8569)
		                          "110001101", -- cos(2.7) ≃ -0.8984           (=-0.9041)
		                          "110001000", -- cos(2.8) ≃ -0.9375           (=-0.9422)
		                          "110000100", -- cos(2.9) ≃ -0.9688           (=-0.9710)
		                          "110000010", -- cos(3.0) ≃ -0.9844           (=-0.9900)
		                          "110000001", -- cos(3.1) ≃ -0.9922           (=-0.9991)
  --continue lut to values up to 6.3 - symmetry not usable as cos(3.2) is not exactly 1.0 - (3.2 not pi)
		                          "110000001", -- cos(3.2) ≃ -0.9922           (=-0.9982)
		                          "110000010", -- cos(3.3) ≃ -0.9844           (=-0.9875)
		                          "110000101", -- cos(3.4) ≃ -0.9609           (=-0.9668)
		                          "110001001", -- cos(3.5) ≃ -0.9297           (=-0.9365)
		                          "110001110", -- cos(3.6) ≃ -0.8906           (=-0.8968)
		                          "110010100", -- cos(3.7) ≃ -0.8438           (=-0.8481)
		                          "110011011", -- cos(3.8) ≃ -0.7891           (=-0.7910)
		                          "110100100", -- cos(3.9) ≃ -0.7188           (=-0.7259)
		                          "110101101", -- cos(4.0) ≃ -0.6484           (=-0.6536)
		                          "110110111", -- cos(4.1) ≃ -0.5703           (=-0.5748)
		                          "111000010", -- cos(4.2) ≃ -0.4844           (=-0.4903)
		                          "111001101", -- cos(4.3) ≃ -0.3984           (=-0.4008)
		                          "111011001", -- cos(4.4) ≃ -0.3047           (=-0.3073)
		                          "111100110", -- cos(4.5) ≃ -0.2031           (=-0.2108)
		                          "111110010", -- cos(4.6) ≃ -0.1094           (=-0.1122)
		                          "111111111", -- cos(4.7) ≃ -0.0078           (=-0.0124)
		                          "000001011", -- cos(4.8) ≃  0.0859           (= 0.0875)
		                          "000010111", -- cos(4.9) ≃  0.1797           (= 0.1865)
		                          "000100100", -- cos(5.0) ≃  0.2813           (= 0.2837)
		                          "000110000", -- cos(5.1) ≃  0.3750           (= 0.3780)
		                          "000111011", -- cos(5.2) ≃  0.4609           (= 0.4685)
		                          "001000110", -- cos(5.3) ≃  0.5469           (= 0.5544)
		                          "001010001", -- cos(5.4) ≃  0.6328           (= 0.6347)
		                          "001011010", -- cos(5.5) ≃  0.7031           (= 0.7087)
		                          "001100011", -- cos(5.6) ≃  0.7734           (= 0.7756)
		                          "001101010", -- cos(5.7) ≃  0.8281           (= 0.8347)
		                          "001110001", -- cos(5.8) ≃  0.8828           (= 0.8855)
		                          "001110110", -- cos(5.9) ≃  0.9219           (= 0.9275)
		                          "001111010", -- cos(6.0) ≃  0.9531           (= 0.9602)
		                          "001111101", -- cos(6.1) ≃  0.9766           (= 0.9833)
		                          "001111111", -- cos(6.2) ≃  0.9922           (= 0.9965)
		                          "010000000"  -- cos(6.3) ≃  1.0              (= 0.9999)
	);

begin
	
--	lookup_cos : process(inp, intad)
--	begin
--		intad <= to_integer(unsigned(inp));
--		oup <= costab(intad);
--	end process;
	
	intad<=to_integer(unsigned(inp));
	oup<=costab(intad);

end Behavioral;