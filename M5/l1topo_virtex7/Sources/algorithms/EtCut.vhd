-------------------------------------
-- TOB Over Et-Threshold Algorithm --
-------------------------------------

--------------
-- includes --
--------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.ALL;

------------------------
-- entity declaration --
------------------------

entity EtCut is
	generic(InputWidth    : integer := 1; --number of input TOBs
		    NumResultBits : integer := 1  --number of output bits
	);
	Port(ClockBus   : std_logic_vector(2 downto 0);
		 Parameters : in  ParameterArray;
		 TOBs       : in  TOBArray(InputWidth - 1 downto 0);
		 Results    : out std_logic_vector(NumResultBits - 1 downto 0)
--		 Overflow   : out std_logic --unused!
	);
end EtCut;

-----------------------------------------
-- behavioral description of algorithm --
-----------------------------------------

architecture Behavioral of EtCut is

	----------------------
	-- type definitions --
	----------------------
	type threshold_array is array (integer range <>) of std_logic_vector(GenericEtBitWidth - 1 downto 0);
	type accept_array is array (integer range <>) of std_logic;
	type accept_matrix is array (integer range <>) of accept_array(2 * InputWidth - 2 downto 0);

	-------------
	-- signals --
	-------------
	-- parameters:
	signal thresholds : threshold_array(NumResultBits - 1 downto 0);
	-- temporary results:
	signal accept_tmp : accept_matrix(NumResultBits - 1 downto 0);
	signal accept     : std_logic_vector(NumResultBits - 1 downto 0);

begin

	-- read parameters
	genReadParameters : for result in 0 to NumResultBits - 1 generate
		thresholds(result) <= Parameters(result)(GenericEtBitWidth - 1 downto 0);
	end generate;

	-- generate result bits (Et over threshold)
	genResults : for result in 0 to NumResultBits - 1 generate
		-- store for all TOBs if over threshold:
		genAcceptTemp : for tob in 0 to InputWidth - 1 generate
			accept_tmp(result)(tob) <= '1' when (TOBs(tob).Et >= thresholds(result)) else '0';
		end generate;
		-- get result bit (OR of all TOBs):
		genAccept : for tob in 0 to InputWidth - 2 generate
			accept_tmp(result)(InputWidth + tob) <= accept_tmp(result)(2 * tob) OR accept_tmp(result)(2 * tob + 1);
		end generate;
		-- result is last element:
		accept(result) <= accept_tmp(result)(2 * InputWidth - 2);
	end generate;

	-- buffer and output results:
	Oup_reg : entity work.GenericRegister
		generic map(reg_width => NumResultBits
		)
		port map(clk     => ClockBus(0),
			     enable  => '1',
			     reg_in  => accept,
			     reg_out => Results
		);

end Behavioral;
