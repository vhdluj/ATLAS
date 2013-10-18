library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;
use work.s7_transmission_components.all;

entity ddr_enc_receiver is
generic (
	IOSTANDARD_CONF      : character := '0'
);
port (
	CLK_BIT_IN      : in std_logic;
	CLK_WORD_IN     : in std_logic;
	CLK_DELAY_IN    : in std_logic;
	RESET_IN        : in std_logic;
	DELAY_READY_IN  : in std_logic;
	
	DATA_OUT        : out std_logic_vector(7 downto 0);
	DATA_VALID_OUT  : out std_logic;
	DATA_KCTRL_OUT  : out std_logic;
	LINK_SYNCED_OUT : out std_logic;
	CRC_VALID_OUT   : out std_logic;
	
	DATA_PIN_P_IN   : in std_logic;
	DATA_PIN_N_IN   : in std_logic
);
end entity ddr_enc_receiver;

architecture RTL of ddr_enc_receiver is

signal dec_810_kout, crc_ok, crc_dec_en, crc_dec_en_q, synced : std_logic;
signal data_in : std_logic_vector(9 downto 0);
signal d_in_enc, d_in_dec : std_logic_vector(7 downto 0);
signal error_ctr : std_logic_vector(15 downto 0);

attribute keep : string;
attribute keep of error_ctr : signal is "true";

begin

process(CLK_WORD_IN)
begin
	if rising_edge(CLK_WORD_IN) then
		DATA_OUT        <= d_in_dec;
		LINK_SYNCED_OUT <= synced;
		CRC_VALID_OUT   <= crc_ok;
		if (d_in_enc = x"50" and crc_dec_en = '0') then
			DATA_KCTRL_OUT <= '1';
			DATA_VALID_OUT <= '1';
		else
			DATA_KCTRL_OUT <= '0';
			DATA_VALID_OUT <= crc_dec_en;
		end if;
	end if;
end process;	

dec_810 : decode_8b10b_lut_base
port map(
	CLK              => CLK_WORD_IN,
	DIN              => data_in,
	DOUT             => d_in_enc,
	KOUT             => dec_810_kout,
	CE               => '1',
	DISP_IN          => '0',
	SINIT            => '0',
	CODE_ERR         => open,
	DISP_ERR         => open,
	ND               => open,
	RUN_DISP         => open,
	SYM_DISP         => open
);

crc_dec_en <= not dec_810_kout;

dec_crc : crcDecoder
port map(
	data_in    => d_in_enc,
	crc_en     => crc_dec_en,
	rst        => RESET_IN,
	clk        => CLK_WORD_IN,
	data_out   => d_in_dec,
	crcOK      => crc_ok
);

input : input_module
generic map (
	IOSTANDARD_CONF => IOSTANDARD_CONF
)
port map(
	CLK_IN         => CLK_WORD_IN,
	CLKX8_IN       => CLK_BIT_IN,
	CLK_DLY_IN     => CLK_DELAY_IN,
	DELAY_READY_IN => DELAY_READY_IN,
	RESET_IN       => RESET_IN,
	DATA_PIN_P_IN  => DATA_PIN_P_IN,
	DATA_PIN_N_IN  => DATA_PIN_N_IN,
	DATA_OUT       => data_in,
	REC_CLK_OUT    => open,
	SYNCED_OUT     => synced
);

process(CLK_WORD_IN)
begin
	if rising_edge(CLK_WORD_IN) then
	
		crc_dec_en_q <= crc_dec_en;
	
		if (RESET_IN = '1') then
			error_ctr <= (others => '0');
		elsif (crc_dec_en_q = '1' and crc_ok = '0' and crc_dec_en = '0') then
			error_ctr <= error_ctr + x"1";
		else
			error_ctr <= error_ctr;
		end if;
	end if;
end process;

end architecture RTL;
