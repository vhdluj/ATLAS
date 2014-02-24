library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.L1TopoDataTypes.all;

entity GenericRegister is
generic(reg_width : integer:=5
       );
port(clk : in std_logic;
     enable : in std_logic;
     reg_in : in  std_logic_vector(reg_width-1  downto 0);
     reg_out: out std_logic_vector(reg_width-1 downto 0)
    );
end GenericRegister;
    
architecture behavioral of GenericRegister is

signal sr: std_logic_vector(reg_width-1 downto 0);

begin

process (clk)
begin
 if (rising_edge(clk)) then
  if (enable = '1') then
   sr(reg_width-1 downto 0) <= reg_in(reg_width-1 downto 0);
  end if;
 end if;
end process;

reg_out(reg_width-1 downto 0) <= sr(reg_width-1 downto 0);

end behavioral;