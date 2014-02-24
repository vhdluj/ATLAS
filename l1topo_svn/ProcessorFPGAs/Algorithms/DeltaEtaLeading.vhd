library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.L1TopoDataTypes.all;

entity DeltaEtaLeading is
  generic (
    OutputBits : integer := 1           -- Number of result bits
    );
  port (
     Tob1 : in GenericTOB;  -- Two TOBs
     Tob2 : in GenericTOB;
     Parameters : in ParameterArray;
     Clk :  in std_logic;
     Results : out std_logic_vector (OutputBits-1 downto 0)
     );
end DeltaEtaLeading;

architecture Behavioral of DeltaEtaLeading is

-- Type declarations
  
  subtype deta is  std_logic_vector(5 downto 0);
  type thresharray is array (OutputBits-1 downto 0) of std_logic_vector(5 downto 0);

-- Internal signal declarations
  
  signal deltaeta : deta;
  signal loweta, higheta : thresharray;
  signal min_et_1, min_et_2 : std_logic_vector (9 downto 0); -- min ET of both TOBs
  signal thraccept_1, thraccept_2, accept: std_logic;
  
begin  -- Behavioral

  min_et_1 <= Parameters(0)(9 downto 0);
  min_et_2 <= Parameters(1)(9 downto 0);

  min_tob_Et : process(Tob1,Tob2)         -- Flag TOBs with Et over threshold
    begin
        if (Tob1.Et >= min_et_1) then
          thraccept_1 <= '1';
        else
          thraccept_1 <= '0';
        end if;
        if (Tob2.Et >= min_et_2) then
          thraccept_2 <= '1';
        else
          thraccept_2 <= '0';
        end if;
    end process;
  
  set_ranges: for i in 0 to (OutputBits - 1) generate  -- Extract delta eta cuts
    loweta(i) <= Parameters(2 + (2*i))(5 downto 0);
    higheta(i) <= Parameters(3 + (2*i))(5 downto 0);
  end generate;
                
  deltaeta_calc : process(Tob1,Tob2)       -- Calculate delta eta for the TOB pair
      variable delta : std_logic_vector(5 downto 0);
    begin
         if Tob1.eta > Tob2.eta then
           delta := Tob1.eta - Tob2.eta;
             else
           delta := Tob2.eta - Tob1.eta;
         end if;
         deltaeta <= delta;
  end process;

  compare_thresholds : process(deltaeta) -- Compare delta eta with thresholds
     variable hits : std_logic_vector(OutputBits-1 downto 0);
   begin
     if rising_edge(clk) then
		  hits := (others => '0');
				for k in 0 to OutputBits - 1 loop  -- loop over thresholds
				  if ((deltaeta >= loweta(k)) and
						(deltaeta <= higheta(k)) and
						(thraccept_1 = '1') and
						(thraccept_2 = '1')) then
					 hits(k) := '1';
				  end if;
				end loop;
		  Results <= hits;
	  end if;
  end process;

end Behavioral;
