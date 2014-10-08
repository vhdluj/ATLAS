-------------------------------
-- MET Calculation Algorithm --
-------------------------------

--------------
-- includes --
--------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.L1TopoDataTypes.all;
use work.L1TopoFunctions.all;

------------------------
-- entity declaration --
------------------------

entity METCalc is
	Port(ClockBus : in  std_logic_vector(2 downto 0);
		 SignedEx : in  std_logic_vector(METEnergyBitWidth - 1 downto 0);
		 SignedEy : in  std_logic_vector(METEnergyBitWidth - 1 downto 0);
		 METSqr   : out std_logic_vector(METSqrEnergyBitWidth - 1 downto 0)
	);
end METCalc;

-----------------------------------------
-- behavioral description of algorithm --
-----------------------------------------

architecture Behavioral of METCalc is
begin
	process(ClockBus(0))
	begin
		if rising_edge(ClockBus(0)) then
			METSqr <= std_logic_vector((signed(signedEx) * signed(signedEx)) + (signed(signedEy) * signed(signedEy)));
		end if;
	end process;

end Behavioral;