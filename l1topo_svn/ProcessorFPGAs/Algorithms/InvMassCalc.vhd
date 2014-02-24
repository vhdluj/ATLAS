library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InvMassCalc is
    Port (eta1    : in  std_logic_vector( 5 downto 0);
          eta2    : in  std_logic_vector( 5 downto 0);
          phi1    : in  std_logic_vector( 5 downto 0);
          phi2    : in  std_logic_vector( 5 downto 0);
          energy1 : in  std_logic_vector( 9 downto 0);
          energy2 : in  std_logic_vector( 9 downto 0);
          mass    : out std_logic_vector(30 downto 0)
     );
end InvMassCalc;

architecture Behavioral of InvMassCalc is

component Cos 
    Port ( inp : in  STD_LOGIC_VECTOR (5 downto 0);  --for CP assume 64 phi bins per 2pi, calculate function up to pi only, mid bin.
           oup : out STD_LOGIC_VECTOR (8 downto 0));
end component;

component Cosh 
    Port ( inp : in  STD_LOGIC_VECTOR (5 downto 0);  --for CP assume 64 phi bins per 2pi, calculate function up to pi only, mid bin.
           oup : out STD_LOGIC_VECTOR (10 downto 0));
end component;

attribute S : string;

signal delta_eta : std_logic_vector(5 downto 0);
signal delta_phi : std_logic_vector(5 downto 0);

signal eta1_sig      : signed(5 downto 0);
signal eta2_sig      : signed(5 downto 0);
signal delta_eta_tmp : signed(5 downto 0);

signal phi1_sig      : signed(5 downto 0);
signal phi2_sig      : signed(5 downto 0);
signal delta_phi_tmp : signed(5 downto 0);
signal cos_result  : std_logic_vector(8 downto 0);
signal cosh_result : std_logic_vector(10 downto 0);

signal energymult : unsigned(19 downto 0);

signal cos_diff : std_logic_vector(10 downto 0);

attribute S of delta_eta: signal is "true";
attribute S of delta_phi: signal is "true";

begin

eta1_sig <= signed(eta1);
eta2_sig <= signed(eta2);

delta_eta_tmp <=abs(eta1_sig-eta2_sig);

delta_eta<=std_logic_vector(delta_eta_tmp);

phi1_sig <= signed(phi1);
phi2_sig <= signed(phi2);

delta_phi_tmp <=abs(phi1_sig-phi2_sig);

delta_phi<=std_logic_vector(delta_phi_tmp);

Cos_module: Cos
 port map(inp=>delta_phi,
          oup=>cos_result
 );

Cosh_module: Cosh
 port map(inp=>delta_eta,
          oup=>cosh_result
);

energymult<=unsigned(energy1)*unsigned(energy2);

cos_diff<=std_logic_vector(signed(cosh_result)-signed(cos_result));

mass<=std_logic_vector(energymult*unsigned(cos_diff));

end Behavioral;
