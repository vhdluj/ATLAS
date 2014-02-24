library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.L1TopoDataTypes.all;

entity DeltaPhiIncl1 is
  generic (
    max_tob : integer := 8;
    OutputBits : integer := 1           -- Number of result bits
    );
  port (
     Tob : in TOBArray(max_tob downto 0);  -- Single array of TOBs (same type)
     Parameters : in ParameterArray;
     Clk :  in std_logic;
     Results : out std_logic_vector (OutputBits-1 downto 0);
	  Overflow : out std_logic
     );
end DeltaPhiIncl1;

architecture Behavioral of DeltaPhiIncl1 is

-- Type declarations
  
  type dphi is array (max_tob-1 downto 1) of std_logic_vector (5 downto 0);
  type dphiarray is array (max_tob-2 downto 0) of dphi;
  type thresharray is array (OutputBits-1 downto 0) of std_logic_vector(5 downto 0);

-- Internal signal declarations
  
  signal deltaphi : dphiarray;
  signal loweta, higheta : thresharray;
  signal min_et : std_logic_vector (9 downto 0);
  signal thraccept : std_logic_vector (max_tob downto 0);
  
begin  -- Behavioral

  min_et <= Parameters(0)(9 downto 0);
  
  min_tob_Et : process(Tob)         -- Flag TOBs with Et over threshold
    begin
      for i in 0 to max_tob loop
        if (Tob(i).Et >= min_et) then
          thraccept(i) <= '1';
        else
          thraccept(i) <= '0';
        end if;
      end loop;
    end process;
  
  set_ranges: for i in 0 to (OutputBits - 1) generate  -- Extract delta phi cuts
    loweta(i) <= Parameters(1 + (2*i))(5 downto 0);
    higheta(i) <= Parameters(2 + (2*i))(5 downto 0);
  end generate;
                
  deltaphi_calc : process(Tob)       -- Calculate delta phi for all TOB pairs
      variable delta : std_logic_vector(5 downto 0);
    begin
     for i in 0 to (max_tob-2) loop     -- loop over TOBs i and j
       for j in (i + 1) to (max_tob-1) loop
         if Tob(i).phi > Tob(j).phi then
           delta := Tob(i).phi - Tob(j).phi;
             else
           delta := Tob(j).phi - Tob(i).phi;
         end if;
         if delta > 32 then 
          delta := 64 - delta;
         end if;
         deltaphi(i)(j) <= delta;
       end loop;
     end loop;
  end process;

  compare_thresholds : process(deltaphi) -- Compare delta phi with thresholds for all TOB pairs
     variable hits : std_logic_vector(OutputBits-1 downto 0);
   begin
     if rising_edge(clk) then
		  hits := (others => '0');
		  for i in 0 to (max_tob-2) loop     -- loop over TOBs i and j
			 for j in (i + 1) to (max_tob-1) loop
				for k in 0 to OutputBits - 1 loop  -- loop over thresholds
				  if ((deltaphi(i)(j) >= loweta(k)) and
						(deltaphi(i)(j) <= higheta(k)) and
						(thraccept(i) = '1') and
						(thraccept(j) = '1')) then
					 hits(k) := '1';
				  end if;
				end loop;
			 end loop;
		  end loop;
		  if thraccept(max_tob) = '1' then
			 Results <= (others => '1');   -- Accept if too many TOBs
		  else
			 Results <= hits;
		  end if;
		  Overflow <= thraccept(max_tob); -- Overflow output flag
	  end if;
  end process;

end Behavioral;