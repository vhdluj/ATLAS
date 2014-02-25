library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
--library work;
--USE work.encode_8b10b_pkg.ALL;
--use work.s7_transmission_components.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TransmittersWrapper is
   GENERIC(
   	LINKS_NUMBER : integer := 8
   );
   PORT(
    RESET : in std_logic;
    CLK_BIT_IN     : in std_logic;
	CLK_WORD_IN    : in std_logic;--10 times lower frequnecy than CLK_BIT_IN
	
	DATA_IN        : in std_logic_vector(8*LINKS_NUMBER-1 downto 0);
	DATA_VALID_IN  : in std_logic_vector(LINKS_NUMBER-1 downto 0);
	DATA_KCTRL_IN  : in std_logic_vector(LINKS_NUMBER-1 downto 0);
	
	DATA_PIN_P_OUT : out std_logic_vector(LINKS_NUMBER-1 downto 0);
	DATA_PIN_N_OUT : out std_logic_vector(LINKS_NUMBER-1 downto 0)
   );
end TransmittersWrapper;

architecture Behavioral of TransmittersWrapper is
--____________MAIN COMPONENT representing one optical fully chained transmitter
COMPONENT ddr_enc_transmitter is
port (
        RESET          : in std_logic;
	CLK_BIT_IN     : in std_logic;
	CLK_WORD_IN    : in std_logic;--10 times lower frequnecy than CLK_BIT_IN
	RESET_IN       : in std_logic;
	
	DATA_IN        : in std_logic_vector(7 downto 0);
	DATA_VALID_IN  : in std_logic;
	DATA_KCTRL_IN  : in std_logic;
	
	DATA_PIN_P_OUT : out std_logic;
	DATA_PIN_N_OUT : out std_logic
);
end COMPONENT ddr_enc_transmitter;
-- DCM component


begin

GenerateInst: for i in 0 to (LINKS_NUMBER-1) generate
  ddr_enc_transmitterInst : ddr_enc_transmitter
    port map (
      RESET           => RESET,
      CLK_BIT_IN      => CLK_BIT_IN,   
      CLK_WORD_IN     => CLK_WORD_IN,   
      RESET_IN        => RESET,   
      
      DATA_IN         => DATA_IN(7+i*8 downto 8*i),
      DATA_VALID_IN   => DATA_VALID_IN(i),
      DATA_KCTRL_IN   => DATA_KCTRL_IN(i),
      
      DATA_PIN_P_OUT  => DATA_PIN_P_OUT(i),
      DATA_PIN_N_OUT  => DATA_PIN_N_OUT(i)
    );

end generate GenerateInst;

end Behavioral;

