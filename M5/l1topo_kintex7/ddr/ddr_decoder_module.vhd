library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity ddr_decoder_module is
port (
	RESET_IN       : in std_logic;
	DCM_DDR_CLK_IN : in std_logic;
	
	ENC_DATA_IN    : in std_logic_vector(9 downto 0);
	DATA_OUT       : out std_logic_vector(7 downto 0);
	DATA_VALID_OUT : out std_logic;
    DATA_KCTRL_OUT : out std_logic;
    LINK_IS_SYNC   : in  std_logic;
    CODE_ERR_OUT   : out std_logic;
    DISP_ERR_OUT   : out std_logic
);
end ddr_decoder_module;

architecture Behavioral of ddr_decoder_module is

signal d_in_enc, d_in_dec : std_logic_vector(7 downto 0);
signal dec_810_kout, crc_ok, crc_dec_en, crc_dec_en_q, synced, code_err, disp_err : std_logic;

begin

  process(DCM_DDR_CLK_IN)
  begin
    if rising_edge(DCM_DDR_CLK_IN) then
    	DATA_OUT        <= d_in_enc;  --dec for crc usage
    	
    	CODE_ERR_OUT <= code_err;
    	DISP_ERR_OUT <= disp_err;
    	
      if (d_in_enc = x"5C" and dec_810_kout = '1') then
        DATA_KCTRL_OUT <= '1';
        DATA_VALID_OUT <= '0';
      else
        DATA_KCTRL_OUT <= '0';
        DATA_VALID_OUT <= crc_dec_en and LINK_IS_SYNC;
      end if;
    end if;
  end process;


  
	--process(DCM_DDR_CLK_IN)
	--begin
	--	if rising_edge(DCM_DDR_CLK_IN) then
	--		DATA_OUT        <= d_in_dec;
	--		DATA_VALID_OUT  <= crc_dec_en;
	--	end if;
	--end process;

	dec_810 : entity work.decode_8b10b_lut_base
	port map(
		CLK              => DCM_DDR_CLK_IN,
		DIN              => ENC_DATA_IN,
		DOUT             => d_in_enc,
		KOUT             => dec_810_kout,
		CE               => '1',
		DISP_IN          => '0',
		SINIT            => '0',
		CODE_ERR         => code_err,
		DISP_ERR         => disp_err,
		ND               => open,
		RUN_DISP         => open,
		SYM_DISP         => open
	);

	crc_dec_en <= not dec_810_kout;

	--dec_crc : entity work.crcDecoder
	--port map(
	--	data_in    => d_in_enc,
	--	crc_en     => crc_dec_en,
	--	rst        => RESET_IN,
	--	clk        => DCM_DDR_CLK_IN,
	--	data_out   => d_in_dec,
	--	crcOK      => crc_ok
	--);


end Behavioral;

