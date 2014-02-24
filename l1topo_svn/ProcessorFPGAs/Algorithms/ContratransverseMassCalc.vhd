library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity ContratransverseMassCalc is
    Port (phi1    : in  std_logic_vector( 5 downto 0);
          phi2    : in  std_logic_vector( 5 downto 0);
          energy1 : in  std_logic_vector( 9 downto 0);
          energy2 : in  std_logic_vector(15 downto 0);
          mass    : out std_logic_vector(34 downto 0)
     );
end ContratransverseMassCalc;

architecture Behavioral of ContratransverseMassCalc is

component Cos 
    Port ( inp : in  STD_LOGIC_VECTOR (5 downto 0);  --for CP assume 64 phi bins per 2pi, calculate function up to pi only, mid bin.
           oup : out STD_LOGIC_VECTOR (8 downto 0));
end component;

attribute S : string;

signal delta_phi : std_logic_vector(5 downto 0);
attribute S of delta_phi: signal is "true";

signal phi1_sig      : signed(5 downto 0);
signal phi2_sig      : signed(5 downto 0);
signal delta_phi_tmp : signed(5 downto 0);

signal cos_result  : std_logic_vector(8 downto 0);

signal energymult : unsigned(25 downto 0);

signal cos_sum : std_logic_vector(8 downto 0);

constant one : std_logic_vector(7 downto 0):="10000000";

begin

phi1_sig <= signed(phi1);
phi2_sig <= signed(phi2);

delta_phi_tmp <=abs(phi1_sig-phi2_sig);

delta_phi<=std_logic_vector(delta_phi_tmp);

Cos_module: Cos
 port map(inp=>delta_phi,
          oup=>cos_result
 );

energymult<=unsigned(energy1)*unsigned(energy2);

cos_sum<=std_logic_vector(signed('0' & one)+signed(cos_result));

mass<=std_logic_vector(energymult*unsigned(cos_sum));

end Behavioral;
