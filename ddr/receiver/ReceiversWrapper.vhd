library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

library work;
use work.s7_transmission_components.all;

entity ReceiversWrapper is
   GENERIC(
   	LINKS_NUMBER : integer := 8;
   	IOSTANDARD_CONF : string
   );
   PORT(
	CLK_BIT_IN      : in std_logic;
	CLK_WORD_IN     : in std_logic;
	CLK_DELAY_IN    : in std_logic;
	RESET           : in std_logic;
	
	DATA_OUT        : out std_logic_vector(LINKS_NUMBER*8-1 downto 0);
	DATA_VALID_OUT  : out std_logic_vector(LINKS_NUMBER-1 downto 0);
	DATA_KCTRL_OUT  : out std_logic;
	LINK_SYNCED_OUT : out std_logic_vector(LINKS_NUMBER-1 downto 0);
	CRC_VALID_OUT   : out std_logic_vector(LINKS_NUMBER-1 downto 0);
	
	DATA_PIN_P_IN   : in std_logic_vector(LINKS_NUMBER -1 downto 0);
	DATA_PIN_N_IN   : in std_logic_vector(LINKS_NUMBER -1 downto 0)
   );
end ReceiversWrapper;

architecture Behavioral of ReceiversWrapper is

signal delay_ctrl_ready : std_logic;

begin

delay_ctrl_inst : IDELAYCTRL
port map(
	REFCLK => CLK_DELAY_IN,
	RDY    => delay_ctrl_ready,
	RST    => RESET
);

GenerateInst: for i in 0 to (LINKS_NUMBER-1) generate

	GenerateKCtrl : if i = 0 generate
		ddr_enc_receiverInst : ddr_enc_receiver
		generic map(
			IOSTANDARD_CONF      => IOSTANDARD_CONF(i + 1)
		)
		port map(
			CLK_BIT_IN      => CLK_BIT_IN,    
			CLK_WORD_IN     => CLK_WORD_IN,   
			CLK_DELAY_IN    => CLK_DELAY_IN,  
			DELAY_READY_IN  => delay_ctrl_ready,
			RESET_IN        => RESET, 
			
			DATA_OUT        => DATA_OUT(7+i*8 downto i*8),
			DATA_VALID_OUT  => DATA_VALID_OUT(i),
			DATA_KCTRL_OUT  => DATA_KCTRL_OUT,
			LINK_SYNCED_OUT => LINK_SYNCED_OUT(i),
			CRC_VALID_OUT   => CRC_VALID_OUT(i),
			
			DATA_PIN_P_IN   => DATA_PIN_P_IN(i),
			DATA_PIN_N_IN   => DATA_PIN_N_IN(i)
		);
	end generate GenerateKCtrl;
	
	GenerateData : if i /= 0 generate
		ddr_enc_receiverInst : ddr_enc_receiver
		generic map(
			IOSTANDARD_CONF      => IOSTANDARD_CONF(i + 1)
		)
		port map(
			CLK_BIT_IN      => CLK_BIT_IN,    
			CLK_WORD_IN     => CLK_WORD_IN,   
			CLK_DELAY_IN    => CLK_DELAY_IN, 
			DELAY_READY_IN  => delay_ctrl_ready, 
			RESET_IN        => RESET,
			
			DATA_OUT        => DATA_OUT(7+i*8 downto i*8),
			DATA_VALID_OUT  => DATA_VALID_OUT(i),
			DATA_KCTRL_OUT  => open,
			LINK_SYNCED_OUT => LINK_SYNCED_OUT(i),
			CRC_VALID_OUT   => CRC_VALID_OUT(i),
			
			DATA_PIN_P_IN   => DATA_PIN_P_IN(i),
			DATA_PIN_N_IN   => DATA_PIN_N_IN(i)
		);
	end generate GenerateData;

end generate GenerateInst;





end Behavioral;

