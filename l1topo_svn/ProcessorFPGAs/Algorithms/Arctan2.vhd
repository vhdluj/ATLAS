library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Arctan2 is
    Port (ClockBus : in  std_logic_vector(2 downto 0);
          Ex       : in  std_logic_vector(14 downto 0); 
          Ey       : in  std_logic_vector(14 downto 0);
          Phi      : out std_logic_vector( 5 downto 0)
         );
end Arctan2;

architecture Behavioral of Arctan2 is

component GenericRegister 
generic(reg_width : integer:=5
       );
   port(clk       : in std_logic;
        enable    : in std_logic;
        reg_in    : in  std_logic_vector(reg_width-1  downto 0);
        reg_out   : out std_logic_vector(reg_width-1 downto 0)
       );
end component;

signal signed_Ex : signed(14 downto 0);
signal signed_Ey : signed(14 downto 0);

signal signed_Ex_F : signed(34 downto 0);
signal signed_Ey_f : signed(24 downto 0);

signal octant       : std_logic_vector(2 downto 0);
signal octant_fine  : std_logic_vector(2 downto 0);
signal octant_fine2 : std_logic_vector(2 downto 0);

signal flag : std_logic_vector(6 downto 0);

type thresholdarr is array(6 downto 0) of signed(14 downto 0);
constant threshold : thresholdarr :=
("010100010011100",
"001010000011011",
"000110100101111",
"000100110101000",
"000011101111011",
"000010111111100",
"000010011011111"
);

type flagthr_arr is array(6 downto 0) of signed(34 downto 0);

signal flagthr : flagthr_arr;

signal oct_sel : std_logic_vector(1 downto 0);

signal reg_phi : std_logic_vector(5 downto 0);

begin

signed_Ex <= signed(Ex);
signed_Ey <= signed(Ey);

oct_sel <= Ex(14) & Ey(14);

with oct_sel  select
octant(2 downto 1) <= "00" when "00",
                      "01" when "10",
                      "10" when "11",
                      "11" when "01",
                      "00" when others;
                      
octant(0) <= '1' when (abs(signed_Ex) < abs(signed_Ey)) AND (octant(2 downto 1)="00" or octant(2 downto 1)="10") else 
             '1' when (abs(signed_Ex) > abs(signed_Ey)) AND (octant(2 downto 1)="01" or octant(2 downto 1)="11") else'0';

signed_Ex_f(34 downto 20) <= signed_Ex      when octant="000" else
                             signed_Ey      when octant="001" else
                             signed_Ey      when octant="010" else
                             abs(signed_Ex) when octant="011" else
                             abs(signed_Ex) when octant="100" else
                             abs(signed_Ey) when octant="101" else
                             abs(signed_Ey) when octant="110" else
                             signed_Ex      when octant="111" else
                             "000000000000000";  
                            
signed_Ey_f(24 downto 10) <= signed_Ey      when octant="000" else
                             signed_Ex      when octant="001" else
                             abs(signed_Ex) when octant="010" else
                             signed_Ey      when octant="011" else
                             abs(signed_Ey) when octant="100" else
                             abs(signed_Ex) when octant="101" else
                             signed_Ex      when octant="110" else
                             abs(signed_Ey) when octant="111" else
                             "000000000000000"; 

signed_Ex_f(19 downto 0)<="00000000000000000000";
signed_Ey_f(9 downto 0) <="0000000000";
             
genFlag: for i in 0 to 6 generate
 flag(i) <= '1' when signed_Ex_f > (signed_Ey_f*threshold(i)) else '0';
end generate;

octant_fine <= "111" when flag="0000000" else 
               "110" when flag="0000001" else
               "101" when flag="0000011" else
               "100" when flag="0000111" else
               "011" when flag="0001111" else
               "010" when flag="0011111" else
               "001" when flag="0111111" else
               "000" when flag="1111111" else
               "000";

octant_fine2 <="000" when flag="0000000" else 
               "001" when flag="0000001" else
               "010" when flag="0000011" else
               "011" when flag="0000111" else
               "100" when flag="0001111" else
               "101" when flag="0011111" else
               "110" when flag="0111111" else
               "111" when flag="1111111" else
               "000";                             
           
reg_phi(5 downto 3) <= octant;

reg_phi(2 downto 0) <= octant_fine  when octant="000" or octant="010" or octant="100" or octant="110" else  
                       octant_fine2 when octant="001" or octant="011" or octant="101" or octant="111" else
                       "000";

Oup_reg: GenericRegister 
generic map(reg_width => 6
           )
   port map(clk       => ClockBus(0),
            enable    => '1',
            reg_in    => reg_phi,
            reg_out   => phi
           );

end Behavioral;