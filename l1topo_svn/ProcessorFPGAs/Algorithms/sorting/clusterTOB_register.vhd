library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity clusterTOB_register is
generic(num_TOBs : integer:=5
       );
    Port(clk    : in  std_logic;
         enable : in  std_logic;
         reg_in : in  ClusterArray(num_TOBs-1 downto 0);
         reg_out: out ClusterArray(num_TOBs-1 downto 0)
        );
end clusterTOB_register;

architecture Behavioral of clusterTOB_register is

--signal reg_Et: Etarr(num_TOBs-1 downto 0);
--signal reg_isol: isolarr(num_TOBs-1 downto 0);
--signal reg_eta: etaarr(num_TOBs-1 downto 0);
--signal reg_phi: phiarr(num_TOBs-1 downto 0);

signal reg : ClusterArray(num_tobs-1 downto 0);

begin

process (clk)
begin
 if (rising_edge(clk)) then
  if (enable = '1') then
   reg <= reg_in;
  end if;
 end if;
end process;

reg_out <= reg;


end Behavioral;
