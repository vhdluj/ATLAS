library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BoxCalc is
Port (eta1   : in  std_logic_vector(5 downto 0);
      eta2   : in  std_logic_vector(5 downto 0);
      phi1   : in  std_logic_vector(5 downto 0);
      phi2   : in  std_logic_vector(5 downto 0);
--    deltaR : out std_logic_vector(5 downto 0);
      deltaEta : out std_logic_vector(5 downto 0);
      deltaPhi : out std_logic_vector(5 downto 0)
 );
end BoxCalc;

architecture Behavioral of BoxCalc is

--signal box_delta : std_logic_vector(6 downto 0);

--signal delta_eta : std_logic_vector(5 downto 0);
--signal delta_phi : std_logic_vector(5 downto 0);

signal eta1_sig      : signed(5 downto 0);
signal eta2_sig      : signed(5 downto 0);
signal delta_eta_tmp : signed(5 downto 0);

signal phi1_sig      : signed(5 downto 0);
signal phi2_sig      : signed(5 downto 0);
signal delta_phi_tmp : signed(5 downto 0);

begin

eta1_sig <= signed(eta1);
eta2_sig <= signed(eta2);

delta_eta_tmp <=abs(eta1_sig-eta2_sig);

deltaEta<=std_logic_vector(delta_eta_tmp);

phi1_sig <= signed(phi1);
phi2_sig <= signed(phi2);

delta_phi_tmp <=abs(phi1_sig-phi2_sig);

deltaPhi<=std_logic_vector(delta_phi_tmp);

--box_delta<=std_logic_vector(unsigned('0' & delta_phi)+unsigned('0' & delta_eta));

--deltaR<=box_delta(5 downto 0);


end Behavioral;
