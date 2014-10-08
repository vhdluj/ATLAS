library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.L1TopoDataTypes.all;

entity DeltaEtaIncl1 is
  generic (
    InputWidth    : integer := 8;
    NumResultBits : integer := 1           -- Number of result bits
    );
  port (
     Tob : in TOBArray(InputWidth - 1 downto 0);  -- Single array of TOBs (same type)
     Parameters : in ParameterArray; --! [min_et, loweta, higheta, ...]
     Clk :  in std_logic;
     Results : out std_logic_vector (NumResultBits-1 downto 0);
	  Overflow : out std_logic
     );
end DeltaEtaIncl1;


architecture Behavioral of DeltaEtaIncl1 is

-- Type declarations
  
  type deta is array (InputWidth-1 downto 1) of std_logic_vector (GenericEtaBitWidth-1 downto 0);
  type detaarray is array (InputWidth-2 downto 0) of deta;
  type thresharray is array (NumResultBits-1 downto 0) of std_logic_vector(GenericEtaBitWidth-1 downto 0);

-- Internal signal declarations
  
  signal deltaeta : detaarray;
  signal loweta, higheta : thresharray;
  signal min_et : std_logic_vector (GenericEtBitWidth-1 downto 0);
  signal thraccept : std_logic_vector (InputWidth downto 0);
  
begin  -- Behavioral

  min_et <= Parameters(0)(GenericEtBitWidth-1 downto 0);
  
  min_tob_Et : process(Tob)         -- Flag TOBs with Et over threshold
    begin
      for i in 0 to (InputWidth - 1) loop
        if (Tob(i).Et >= min_et) then
          thraccept(i) <= '1';
        else
          thraccept(i) <= '0';
        end if;
      end loop;
    end process;
  
  set_ranges: for i in 0 to (NumResultBits - 1) generate  -- Extract delta eta cuts
    loweta(i) <= Parameters(1 + (2*i))(GenericEtaBitWidth-1 downto 0);
    higheta(i) <= Parameters(2 + (2*i))(GenericEtaBitWidth-1 downto 0);
  end generate;
                
  deltaeta_calc : process(Tob)       -- Calculate delta eta for all TOB pairs
      variable delta : std_logic_vector(GenericEtaBitWidth-1 downto 0);
    begin
     for i in 0 to (InputWidth-2) loop     -- loop over TOBs i and j
       for j in (i + 1) to (InputWidth-1) loop
         if Tob(i).Eta > Tob(j).Eta then
           delta := Tob(i).Eta - Tob(j).Eta;
             else
           delta := Tob(j).Eta - Tob(i).Eta;
         end if;
			deltaeta(i)(j) <= delta;
       end loop;
     end loop;
  end process;

  compare_thresholds : process(deltaeta) -- Compare delta eta with thresholds for all TOB pairs
     variable hits : std_logic_vector(NumResultBits-1 downto 0);
   begin
     if rising_edge(clk) then
		  hits := (others => '0');
		  for i in 0 to (InputWidth-2) loop     -- loop over TOBs i and j
			 for j in (i + 1) to (InputWidth-1) loop
				for k in 0 to NumResultBits - 1 loop  -- loop over thresholds
				  if ((deltaeta(i)(j) >= loweta(k)) and
						(deltaeta(i)(j) <= higheta(k)) and
						(thraccept(i) = '1') and
						(thraccept(j) = '1')) then
					 hits(k) := '1';
				  end if;
				end loop;
			 end loop;
		  end loop;
		  if thraccept(InputWidth -1) = '1' then	-- TODO: check if overflow bit is set correctly
			 Results <= (others => '1');   -- Accept if too many TOBs
		  else
			 Results <= hits;
		  end if;
		  Overflow <= thraccept(InputWidth -1); -- Overflow output flag
	  end if;
  end process;

end Behavioral;
