library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.L1TopoDataTypes.all;

entity SelectMerge is
generic(InputWidthBlocks   : integer:=8;
        InputWidthPerBlock : integer:=11
       );
  Port (clk40         : in  std_logic;
        clkFast       : in  std_logic;
        threshold_res : in  std_logic_vector(InputWidthPerBlock*(InputWidthBlocks+1)-1 downto 0);
        inp           : in  TOBArray(InputWidthPerBlock*(InputWidthBlocks+1)-1 downto 0);
        oup           : out TOBArray(InputWidthPerBlock-1 downto 0)
       );
end SelectMerge;

architecture Behavioral of SelectMerge is

signal tmp_tobs : TOBArray(InputWidthPerBlock-1 downto 0);

signal current_block     : TOBArray(InputWidthPerBlock-1 downto 0);
signal current_threshold : std_logic_vector(InputWidthPerBlock-1 downto 0);

signal ctrl_reg_flags : std_logic_vector(InputWidthPerBlock-1 downto 0);

signal reg_ctrl_num : integer range 0 to 16;

begin

with ctrl_reg_flags select
reg_ctrl_num <= 0 when "00000000000",
                1 when "00000000001",
                2 when "00000000011",
                3 when "00000000111",
                4 when "00000001111",
                5 when "00000011111",
                6 when "00000111111",
                7 when "00001111111",
                8 when "00011111111",
                9 when "00111111111",
               10 when "01111111111",
               11 when "11111111111",
                0 when others;

process (clkFast)
variable cnt :  integer range 0 to (InputWidthBlocks):=0;
begin
 if rising_edge(clkFast) then

  if cnt < (InputWidthBlocks-1) then 
     cnt:=cnt+1;
    else 
     cnt:=0;
  end if;

  current_threshold <= threshold_res((cnt+2)*InputWidthPerBlock-1 downto (cnt+1)*InputWidthPerBlock);
  current_block <= inp((cnt+2)*InputWidthPerBlock-1 downto (cnt+1)*InputWidthPerBlock);

  if cnt=0 then
   ctrl_reg_flags <= threshold_res(InputWidthPerBlock-1 downto 0);
   tmp_tobs <= inp(InputWidthPerBlock-1 downto 0);
  else
   if reg_ctrl_num /=InputWidthPerBlock then
    ctrl_reg_flags(InputWidthPerBlock-1 downto reg_ctrl_num) <= current_threshold(InputWidthPerBlock-reg_ctrl_num-1 downto 0);
    tmp_tobs(InputWidthPerBlock-1 downto reg_ctrl_num) <= current_block(InputWidthPerBlock-reg_ctrl_num-1 downto 0);
   else
    ctrl_reg_flags <= ctrl_reg_flags;
    tmp_tobs <= tmp_tobs;
   end if;
  end if;

 end if;
end process;

process (clk40)
begin
 if rising_edge(clk40) then
  oup <= tmp_tobs;
 end if;
end process;

end Behavioral;