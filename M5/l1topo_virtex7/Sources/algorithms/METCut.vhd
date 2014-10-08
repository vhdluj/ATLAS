----------------------------------
-- MET Over Threshold Algorithm --
----------------------------------

--------------
-- includes --
--------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.L1TopoDataTypes.ALL;

------------------------
-- entity declaration --
------------------------

entity METCut is
	generic(NumResultBits : integer := 1 --number of output bits
	);
	port(ClockBus   : std_logic_vector(2 downto 0);
		 Parameters : in  ParameterArray; -- [min_METSqr]
		 METSqr     : in  std_logic_vector(METSqrEnergyBitWidth - 1 downto 0);
		 Results    : out std_logic_vector(NumResultBits - 1 downto 0)
--		 Overflow   : out std_logic --unused!
	);
end METCut;

-----------------------------------------
-- behavioral description of algorithm --
-----------------------------------------

architecture Behavioral of METCut is

	----------------------
	-- type definitions --
	----------------------
	type threshold_array is array (integer range <>) of std_logic_vector(METSqrEnergyBitWidth - 1 downto 0);

	-------------
	-- signals --
	-------------
	-- parameters:
	signal thresholds : threshold_array(NumResultBits - 1 downto 0);
	-- temporary results:
	signal accept     : std_logic_vector(NumResultBits - 1 downto 0);

begin

	-- read parameters
	genReadParameters : for result in 0 to NumResultBits - 1 generate
		thresholds(result) <= Parameters(result)(METSqrEnergyBitWidth - 1 downto 0);
	end generate;

	-- generate result bits (MET over threshold)
	genResults : for result in 0 to NumResultBits - 1 generate
		accept(result) <= '1' when (unsigned(METSqr) >= unsigned(thresholds(result))) else '0';
	end generate;

	-- buffer and output result:
	Oup_reg : entity work.GenericRegister
		generic map(reg_width => NumResultBits
		)
		port map(clk     => ClockBus(0),
			     enable  => '1',
			     reg_in  => accept,
			     reg_out => Results
		);

end Behavioral;