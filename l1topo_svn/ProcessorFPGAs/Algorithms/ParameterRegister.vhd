library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity ParameterRegister is
port(clk    : in  std_logic;
     enable : in  std_logic;
     reg_in : in  ParameterArray;
     reg_out: out ParameterArray
    );
end ParameterRegister;
    
architecture behavioral of ParameterRegister is

signal sr: ParameterArray;

begin

process (clk)
begin
 if (rising_edge(clk)) then
  if (enable = '1') then
   sr <= reg_in;
  end if;
 end if;
end process;

reg_out <= sr;

end behavioral;