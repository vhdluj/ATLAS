library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity JetTobRegister is
generic(InputWidth : integer:=64
       );
   Port(clk    : in  std_logic;
        enable : in  std_logic;
        reg_in : in  JetArray(InputWidth-1 downto 0);
        reg_out: out JetArray(InputWidth-1 downto 0)
       );
end JetTobRegister;

architecture Behavioral of JetTobRegister is

type Et1arr is array(integer range <>) of std_logic_vector(8 downto 0);
type Et2arr is array(integer range <>) of std_logic_vector(9 downto 0);
type etaarr is array(integer range <>) of std_logic_vector(4 downto 0);
type phiarr is array(integer range <>) of std_logic_vector(4 downto 0);

signal reg_Et1_tmp: Et1arr(InputWidth-1 downto 0);
signal reg_Et2_tmp: Et2arr(InputWidth-1 downto 0);
signal reg_eta_tmp: etaarr(InputWidth-1 downto 0);
signal reg_phi_tmp: phiarr(InputWidth-1 downto 0);

signal reg_Et1: Et1arr(InputWidth-1 downto 0);
signal reg_Et2: Et2arr(InputWidth-1 downto 0);
signal reg_eta: etaarr(InputWidth-1 downto 0);
signal reg_phi: phiarr(InputWidth-1 downto 0);

begin

process (clk)
begin
 if (rising_edge(clk)) then
  if (enable = '1') then
   
   reg_Et1 <=reg_Et1_tmp;
   reg_Et2 <=reg_Et2_tmp;
   reg_eta <=reg_eta_tmp;
   reg_phi <=reg_phi_tmp;
   
  end if;
 end if;
end process;

genIn: for i in 0 to InputWidth-1 generate
 reg_Et1_tmp(i) <=reg_in(i).Et1;
 reg_Et2_tmp(i) <=reg_in(i).Et2;
 reg_eta_tmp(i) <=reg_in(i).eta;
 reg_phi_tmp(i) <=reg_in(i).phi;
end generate;

genOut: for i in 0 to InputWidth-1 generate
 reg_out(i).Et1 <= reg_Et1(i);
 reg_out(i).Et2 <= reg_Et2(i);
 reg_out(i).eta <= reg_eta(i);
 reg_out(i).phi <= reg_phi(i);
end generate;


end Behavioral;