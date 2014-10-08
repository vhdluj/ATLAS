-----------------------
-- Arctan2 Algorithm --
-----------------------

--------------
-- includes --
--------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.L1TopoDataTypes.all;

------------------------
-- entity declaration --
------------------------

entity Arctan2 is
	Port(ClockBus : in  std_logic_vector(2 downto 0);
		 Ex       : in  std_logic_vector(METEnergyBitWidth - 1 downto 0); -- interpreted as twos complement representation
		 Ey       : in  std_logic_vector(METEnergyBitWidth - 1 downto 0); -- interpreted as twos complement representation
		 Phi      : out std_logic_vector(GenericPhiBitWidth - 1 downto 0) -- interpreted as unsigned in interval [0;6.3], LSB = 0.1
	);
end Arctan2;

-----------------------------------------
-- behavioral description of algorithm --
-----------------------------------------

architecture Behavioral of Arctan2 is

	----------------------
	-- type definitions --
	----------------------

	type thresholdarr is array (6 downto 0) of signed(14 downto 0);

	---------------
	-- constants --
	---------------

	constant threshold : thresholdarr := ("011011100010101", -- 14.101
		                                  "001011010100101", --  5.797
		                                  "000111000010010", --  3.602
		                                  "000101000001100", --  2.572
		                                  "000011110101100", --  1.964
		                                  "000011000010101", --  1.557
		                                  "000010011101100"  --  1.260
	);

	-- old values from Stefan Maldaner
--	constant threshold : thresholdarr := ("010100010011100", -- 10.396
--		                                  "001010000011011", --  5.147
--		                                  "000110100101111", --  3.375
--		                                  "000100110101000", --  2.472
--		                                  "000011101111011", --  1.915
--		                                  "000010111111100", --  1.532
--		                                  "000010011011111"  --  1.247
--	);

	-------------
	-- signals --
	-------------
	signal tmp_Ex : std_logic_vector(METEnergyBitWidth - 1 downto 0);
	signal tmp_Ey : std_logic_vector(METEnergyBitWidth - 1 downto 0);

	signal signed_Ex : signed(METEnergyBitWidth - 1 downto 0);
	signal signed_Ey : signed(METEnergyBitWidth - 1 downto 0);

	signal signed_Ex_F : signed(34 downto 0);
	signal signed_Ey_f : signed(24 downto 0);

	signal octant       : std_logic_vector(2 downto 0);
	signal octant_fine  : std_logic_vector(2 downto 0);
	signal octant_fine2 : std_logic_vector(2 downto 0);

	signal flag : std_logic_vector(6 downto 0);

	signal oct_sel : std_logic_vector(1 downto 0);

	signal reg_phi : std_logic_vector(GenericPhiBitWidth - 1 downto 0);

begin

	-- correct special case (If Ex or Ey = "100000000000000" and Ey or Ex are positive -> Wrong result)
	-- "100000000000001" works and is almost the same value.
	tmp_Ex <= "100000000000001" when Ex = "100000000000000" else Ex;
	tmp_Ey <= "100000000000001" when Ey = "100000000000000" else Ey;

	signed_Ex <= signed(tmp_Ex);
	signed_Ey <= signed(tmp_Ey);

	oct_sel <= tmp_Ex(14) & tmp_Ey(14);

	-- use signs to define phi quadrant and set/unset 3.2- and 1.6-bit					
	with oct_sel select octant(2 downto 1) <=
		"00" when "00",
		"01" when "10",
		"10" when "11",
		"11" when "01",
		"00" when others;

	-- set/unset 0.8-bit depending on the octant
	-- (for details take a closer look at the concrete arctan functions for the different octants)
	octant(0) <= '1' when (abs (signed_Ex) < abs (signed_Ey)) AND (octant(2 downto 1) = "00" or octant(2 downto 1) = "10") else '1' when (abs (signed_Ex) > abs (signed_Ey)) AND (octant(2 downto 1) = "01" or octant(2 downto 1) = "11") else '0';

	-- set signed_Ex_f to the higher value of signed_Ex and signed_Ey
	signed_Ex_f(34 downto 20) <= signed_Ex when octant = "000" else signed_Ey when octant = "001" else signed_Ey when octant = "010" else abs (signed_Ex) when octant = "011" else abs (signed_Ex) when octant = "100" else abs (signed_Ey) when octant = "101" else abs (signed_Ey) when octant =
		"110" else signed_Ex when octant = "111" else "000000000000000";

	-- set signed_Ey_f to the lower value of signed_Ex and signed_Ey                       
	signed_Ey_f(24 downto 10) <= signed_Ey when octant = "000" else signed_Ex when octant = "001" else abs (signed_Ex) when octant = "010" else signed_Ey when octant = "011" else abs (signed_Ey) when octant = "100" else abs (signed_Ex) when octant = "101" else signed_Ex when octant = "110" else
		abs (signed_Ey) when octant = "111" else "000000000000000";

	signed_Ex_f(19 downto 0) <= "00000000000000000000";
	signed_Ey_f(9 downto 0)  <= "0000000000";

	-- do threshold check in the area  0.8 < Phi < 1.6 of arctan
	genFlag : for i in 0 to 6 generate
		flag(i) <= '1' when signed_Ex_f > (signed_Ey_f * threshold(i)) else '0';
	end generate;

	-- if sign of the concrete arctan function in the given octant is negative 
	-- set 8-bit angle in decreasing order from 1.6 to 0.8
	octant_fine <= "111" when flag = "0000000" else "110" when flag = "0000001" else "101" when flag = "0000011" else "100" when flag = "0000111" else "011" when flag = "0001111" else "010" when flag = "0011111" else "001" when flag = "0111111" else "000" when flag = "1111111" else "000";

	-- if sign of the concrete arctan function in the given octant is positive
	-- set 8-bit angle in increasing order from 0.8 to 1.6
	octant_fine2 <= "000" when flag = "0000000" else "001" when flag = "0000001" else "010" when flag = "0000011" else "011" when flag = "0000111" else "100" when flag = "0001111" else "101" when flag = "0011111" else "110" when flag = "0111111" else "111" when flag = "1111111" else "000";

	reg_phi(5 downto 3) <= octant;

	reg_phi(2 downto 0) <= octant_fine when octant = "000" or octant = "010" or octant = "100" or octant = "110" else octant_fine2 when octant = "001" or octant = "011" or octant = "101" or octant = "111" else "000";

	Oup_reg : entity work.GenericRegister
		generic map(reg_width => 6
		)
		port map(clk     => ClockBus(0),
			     enable  => '1',
			     reg_in  => reg_phi,
			     reg_out => phi
		);

end Behavioral;