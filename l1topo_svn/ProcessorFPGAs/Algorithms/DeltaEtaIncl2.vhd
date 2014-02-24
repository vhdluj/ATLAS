library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.L1TopoDataTypes.all;

entity DeltaEtaIncl2 is
  generic (
    max_tob_1 : integer := 8;
    max_tob_2 : integer := 8;
    OutputBits : integer := 1           -- Number of result bits
    );
  port (
     Tob1 : in TOBArray(max_tob_1 downto 0);  -- Two arrays of TOBs
     Tob2 : in TOBArray(max_tob_2 downto 0);
     Parameters : in ParameterArray;
     Clk :  in std_logic;
     Results : out std_logic_vector (OutputBits-1 downto 0);
	  Overflow : out std_logic
     );
end DeltaEtaIncl2;

architecture Behavioral of DeltaEtaIncl2 is

-- Type declarations
  
  type deta is array (max_tob_2-1 downto 0) of std_logic_vector (5 downto 0);
  type detaarray is array (max_tob_1-1 downto 0) of deta;
  type thresharray is array (OutputBits-1 downto 0) of std_logic_vector(5 downto 0);

-- Internal signal declarations
  
  signal deltaeta : detaarray;
  signal loweta, higheta : thresharray;
  signal min_et_1, min_et_2 : std_logic_vector (9 downto 0); -- min ET of both TObs
  signal thraccept_1 : std_logic_vector (max_tob_1 downto 0);
  signal thraccept_2 : std_logic_vector (max_tob_2 downto 0);
  
begin  -- Behavioral

  min_et_1 <= Parameters(0)(9 downto 0);
  min_et_2 <= Parameters(1)(9 downto 0);

  min_tob_Et : process(Tob1,Tob2)         -- Flag TOBs with Et over threshold
    begin
      for i in 0 to max_tob_1 loop
        if (Tob1(i).Et >= min_et_1) then
          thraccept_1(i) <= '1';
        else
          thraccept_1(i) <= '0';
        end if;
      end loop;
      for i in 0 to max_tob_2 loop
        if (Tob2(i).Et >= min_et_2) then
          thraccept_2(i) <= '1';
        else
          thraccept_2(i) <= '0';
        end if;
      end loop;
    end process;
  
  set_ranges: for i in 0 to (OutputBits - 1) generate  -- Extract delta eta cuts
    loweta(i) <= Parameters(2 + (2*i))(5 downto 0);
    higheta(i) <= Parameters(3 + (2*i))(5 downto 0);
  end generate;
                
  deltaeta_calc : process(Tob1,Tob2)       -- Calculate delta eta for all TOB pairs
      variable delta : std_logic_vector(5 downto 0);
    begin
     for i in 0 to (max_tob_1-1) loop     -- loop over TOBs i and j
       for j in 0 to (max_tob_2-1) loop
         if Tob1(i).eta > Tob2(j).eta then
           delta := Tob1(i).eta - Tob2(j).eta;
             else
           delta := Tob2(j).eta - Tob1(i).eta;
         end if;
         deltaeta(i)(j) <= delta;
       end loop;
     end loop;
  end process;

  compare_thresholds : process(deltaeta) -- Compare delta eta with thresholds for all TOB pairs
     variable hits : std_logic_vector(OutputBits-1 downto 0);
   begin
     if rising_edge(clk) then
		  hits := (others => '0');
		  for i in 0 to (max_tob_1 - 1) loop     -- loop over TOBs i and j
			 for j in (i + 1) to (max_tob_2 - 1) loop
				for k in 0 to OutputBits - 1 loop  -- loop over thresholds
				  if ((deltaeta(i)(j) >= loweta(k)) and
						(deltaeta(i)(j) <= higheta(k)) and
						(thraccept_1(i) = '1') and
						(thraccept_2(j) = '1')) then
					 hits(k) := '1';
				  end if;
				end loop;
			 end loop;
		  end loop;
		  if ((thraccept_1(max_tob_1) = '1') or (thraccept_2(max_tob_2) = '1')) then
			 Results <= (others => '1');   -- Accept if too many TOBs
		  else
			 Results <= hits;
		  end if;
		  Overflow <= (thraccept_1(max_tob_1) or thraccept_2(max_tob_2)); -- Overflow output flag
	  end if;
  end process;

end Behavioral;
