library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.L1TopoDataTypes.all;

entity DeltaPhiIncl1 is
	generic(
		InputWidth    : integer := 4;--8;
		NumResultBits : integer := 1       -- Number of result bits
	);
	port(
		TOBs       : in  TOBArray(InputWidth - 1 downto 0); -- Single array of TOBs (same type)
		Parameters : in  ParameterArray;
		Clk        : in  std_logic;
		Results    : out std_logic_vector(NumResultBits - 1 downto 0);
		Overflow   : out std_logic;
		
		debug: out std_logic_vector(dPhiDebugWidth-1 downto 0 )
	);
end DeltaPhiIncl1;

architecture Behavioral of DeltaPhiIncl1 is

	-- Type declarations

	type dphi is array (InputWidth - 1 downto 1) of std_logic_vector(GenericPhiBitWidth-1 downto 0);
	type dphiarray is array (InputWidth - 2 downto 0) of dphi;
	type thresharray is array (NumResultBits - 1 downto 0) of std_logic_vector(GenericPhiBitWidth-1 downto 0);

	-- Internal signal declarations

	signal deltaphi        : dphiarray;
	signal lowphi, highphi : thresharray;
	signal min_et          : std_logic_vector(GenericEtBitWidth-1 downto 0);
	signal thraccept       : std_logic_vector(InputWidth downto 0);

    constant tobWidth: natural := GenericEtBitWidth + GenericEtaBitWidth + GenericPhiBitWidth;
    constant EtEtaWidth: natural := GenericEtBitWidth + GenericEtaBitWidth;
    

begin                                   -- Behavioral

DEBUG_INPUT_GEN: for i in InputWidth-1 downto 0 generate begin
    debug(i*tobWidth+GenericEtBitWidth-1 downto i*tobWidth) <= TOBs(i).Et;
    debug(i*tobWidth+EtEtaWidth-1 downto i*tobWidth+GenericEtBitWidth) <= TOBs(i).Eta;
    debug(i*tobWidth+tobWidth-1 downto i*tobWidth+EtEtaWidth) <= TOBs(i).Phi;  
end generate;

	min_et <= Parameters(0)(GenericEtBitWidth-1 downto 0);

	min_tob_Et : process(TOBs)           -- Flag TOBs with Et over threshold
	begin
		for i in 0 to (InputWidth - 1) loop
			if (TOBs(i).Et >= min_et) then
				thraccept(i) <= '1';
			else
				thraccept(i) <= '0';
			end if;
		end loop;
	end process;

	set_ranges : for i in 0 to (NumResultBits - 1) generate -- Extract delta phi cuts
		lowphi(i)  <= Parameters(1 + (2 * i))(GenericPhiBitWidth-1 downto 0);
		highphi(i) <= Parameters(2 + (2 * i))(GenericPhiBitWidth-1 downto 0);
	end generate;

	deltaphi_calc : process(TOBs)        -- Calculate delta phi for all TOB pairs
		variable delta : std_logic_vector(GenericPhiBitWidth-1 downto 0);
	begin
		for i in 0 to (InputWidth - 2) loop -- loop over TOBs i and j
			for j in (i + 1) to (InputWidth - 1) loop
				if TOBs(i).phi > TOBs(j).phi then
					delta := TOBs(i).phi - TOBs(j).phi;
				else
					delta := TOBs(j).phi - TOBs(i).phi;
				end if;
				if delta > 32 then
					delta := 64 - delta;
				end if;
				deltaphi(i)(j) <= delta;
			end loop;
		end loop;
	end process;

DEBUG_DELTAPHI_GEN_i: for i in (InputWidth-2) downto 0 generate begin
DEBUG_DELTAPHI_GEN_j: for j in (InputWidth-2-i) downto 0 generate begin
    debug(InputWidth*tobWidth + (i*(InputWidth-1) - i*(i-1)/2)*GenericPhiBitWidth + (j+1)*GenericPhiBitWidth-1 downto InputWidth*tobWidth + (i*(InputWidth-1) - i*(i-1)/2)*GenericPhiBitWidth + j*GenericPhiBitWidth) <= deltaphi(i)(i+j+1);
    end generate;
end generate;

	compare_thresholds : process(deltaphi) -- Compare delta phi with thresholds for all TOB pairs
		variable hits : std_logic_vector(NumResultBits - 1 downto 0);
	begin
		if rising_edge(clk) then
			hits := (others => '0');
			for i in 0 to (InputWidth - 2) loop -- loop over TOBs i and j
				for j in (i + 1) to (InputWidth - 1) loop
					for k in 0 to NumResultBits - 1 loop -- loop over thresholds
						if ((deltaphi(i)(j) >= lowphi(k)) and (deltaphi(i)(j) <= highphi(k)) and (thraccept(i) = '1') and (thraccept(j) = '1')) then
							hits(k) := '1';
						end if;
					end loop;
				end loop;
			end loop;
			if thraccept(InputWidth - 1) = '1' then	-- TODO: check if overflow bit is set correctly	-- TODO: check if overflow bit is set correctly
				Results <= (others => '1'); -- Accept if too many TOBs
			else
				Results <= hits;
			end if;
			Overflow <= thraccept(InputWidth -1); -- Overflow output flag
		end if;
	end process;

end Behavioral;