library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity TobRegister is
generic(InputWidth : integer:=16          -- Width of the register (in generic TOBs)
       );
    Port(clk    : in  std_logic;
         enable : in  std_logic;
         reg_in : in  TOBArray(InputWidth-1 downto 0);
         reg_out: out TOBArray(InputWidth-1 downto 0)
        );
end TobRegister;

architecture Behavioral of TobRegister is

type Et_arr is array(integer range <>) of std_logic_vector(9 downto 0);
type etaarr is array(integer range <>) of std_logic_vector(5 downto 0);
type phiarr is array(integer range <>) of std_logic_vector(5 downto 0);

signal reg_Et_tmp: Et_arr(InputWidth-1 downto 0);
signal reg_eta_tmp: etaarr(InputWidth-1 downto 0);
signal reg_phi_tmp: phiarr(InputWidth-1 downto 0);

signal reg_Et: Et_arr(InputWidth-1 downto 0);
signal reg_eta: etaarr(InputWidth-1 downto 0);
signal reg_phi: phiarr(InputWidth-1 downto 0);

begin

process (clk)
begin
 if (rising_edge(clk)) then
  if (enable = '1') then
    
   reg_Et <=reg_Et_tmp;
   reg_eta <=reg_eta_tmp;
   reg_phi <=reg_phi_tmp;
   
  end if;
 end if;
end process;

genIn: for i in 0 to InputWidth-1 generate
 reg_Et_tmp(i) <=reg_in(i).Et;
 reg_eta_tmp(i) <=reg_in(i).eta;
 reg_phi_tmp(i) <=reg_in(i).phi;
end generate;

genOut: for i in 0 to InputWidth-1 generate
 reg_out(i).Et <= reg_Et(i);
 reg_out(i).eta <= reg_eta(i);
 reg_out(i).phi <= reg_phi(i);
end generate;


end Behavioral;