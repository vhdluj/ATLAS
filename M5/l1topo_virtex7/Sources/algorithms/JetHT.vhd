----------------------
-- Jet HT Algorithm --
----------------------

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

entity JetHT is
	generic(InputWidth    : integer := InputWidthJET; --number of input TOBs
		    NumResultBits : integer := 1;             --number of output bits
		    jet_size      : integer := DefaultJetSize --jet Et bit width (1 = 9 bit, 2 = 10 bit)
	);
	Port(ClockBus    : in  std_logic_vector(2 downto 0);
		 Parameters  : in  ParameterArray;
		 JetTobArray : in  JetArray(InputWidth - 1 downto 0);
		 Results     : out std_logic_vector(NumResultBits - 1 downto 0)
--		 Overflow    : out std_logic --unused!
	);
end JetHT;

-----------------------------------------
-- behavioral description of algorithm --
-----------------------------------------

architecture Behavioral of JetHT is

	----------------------
	-- type definitions --
	----------------------
	type sumarr is array (integer range <>) of integer range 0 to (2 ** GenericEtBitWidth - 1) * InputWidth;
	type thresholdArray is array (integer range <>) of std_logic_vector(ld(((2 ** GenericEtBitWidth - 1) * InputWidth) + 65535) - 1 downto 0);
	
	-------------
	-- signals --
	-------------
	-- parameters:
	signal threshold        : std_logic_vector(GenericEtBitWidth-1 downto 0);
	signal min_eta          : std_logic_vector(JetEtaBitWidth-1 downto 0);
	signal max_eta          : std_logic_vector(JetEtaBitWidth-1 downto 0);
	signal SumThresholds : thresholdArray(NumResultBits - 1 downto 0);
	-- buffered input jets
	signal reg_JetTobArray1 : JetArray(InputWidth - 1 downto 0);
	signal reg_JetTobArray2 : JetArray(InputWidth - 1 downto 0);
	-- selected input TOBs (Eta,Et):
	signal generic_in : TOBArray(InputWidth - 1 downto 0);
	signal sel_jets   : TOBArray(InputWidth - 1 downto 0);
	-- temporary results:
	signal tmp_sum : sumarr(2 * InputWidth - 2 downto 0);
	signal sum : std_logic_vector(ld((2 ** GenericEtBitWidth - 1) * InputWidth) - 1 downto 0);
	signal accept : std_logic_vector(NumResultBits - 1 downto 0);

begin
	
	-- read parameters
	threshold <= Parameters(0)(GenericEtBitWidth-1 downto 0);
	min_eta   <= Parameters(1)(JetEtaBitWidth-1 downto 0);
	max_eta   <= Parameters(2)(JetEtaBitWidth-1 downto 0);
	
	genThrArr : for result in 0 to NumResultBits-1 generate
		SumThresholds(result) <= Parameters(3 + result)(16 downto 0);
	end generate;
	
	-- wait 2 BC to synchronize to sorting/selecting
	inp_reg1 : entity work.JetTobRegister
		generic map(InputWidth => InputWidth
		)
		Port map(clk     => ClockBus(0),
			     enable  => '1',
			     reg_in  => JetTobArray,
			     reg_out => reg_JetTobArray1
		);

	inp_reg2 : entity work.JetTobRegister
		generic map(InputWidth => InputWidth
		)
		Port map(clk     => ClockBus(0),
			     enable  => '1',
			     reg_in  => reg_JetTobArray1,
			     reg_out => reg_JetTobArray2
		);

	----------------------------------------------------------
	-- select TOBs (Eta range) and translate to generic TOB --
	----------------------------------------------------------
	sel_eta_range : process(min_eta, max_eta, JetTobArray)
	begin
		for i in 0 to InputWidth - 1 loop
			if ( (signed(max_eta) >= abs (signed(JetTobArray(i).Eta))) and    -- <= max_eta
				 (abs (signed(JetTobArray(i).Eta)) >= signed(min_eta)) ) then -- >= min_eta
				-- translate to generic TOB
				generic_in(i) <= to_GenericTOB(JetTobArray(i), jet_size);
			else
				-- replace by empty dummy TOB if not matching selection criteria
				generic_in(i) <= empty_tob;
			end if;
		end loop;
	end process;
	
	----------------------
	-- select TOBs (Et) --
	----------------------
	genInp : for i in 0 to InputWidth - 1 generate
		sel_jets(i) <= generic_in(i) when generic_in(i).Et > threshold else empty_tob;
	end generate;

	-------------------
	-- calculate sum --
	-------------------
	genTmpSum : for i in 0 to InputWidth - 1 generate
		tmp_sum(i) <= to_integer(unsigned(sel_jets(i).Et));
	end generate;

	genSumTree : for i in 0 to InputWidth - 2 generate
		tmp_sum(InputWidth + i) <= tmp_sum(2 * i) + tmp_sum(2 * i + 1);
	end generate;

	sum <= std_logic_vector(to_unsigned(tmp_sum(2 * InputWidth - 2), sum'length));

    --------------------------------------------------
	-- generate result bits (jet HT over threshold) --
	--------------------------------------------------
	genAccept : for result in 0 to NumResultBits - 1 generate
		accept(result) <= '1' when sum > SumThresholds(result) else '0';
	end generate;
	
	-------------------------------
	-- buffer and output results --
	-------------------------------
	Oup_reg : entity work.GenericRegister
		generic map(reg_width => NumResultBits
		)
		port map(clk     => ClockBus(0),
			     enable  => '1',
			     reg_in  => accept,
			     reg_out => Results
		);

end Behavioral;
