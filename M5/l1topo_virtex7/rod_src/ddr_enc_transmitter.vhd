library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;

entity ddr_enc_transmitter is
port (
	CLK_BIT_IN     : in std_logic;
	CLK_WORD_IN    : in std_logic;
	RESET_IN       : in std_logic;
	
	DATA_IN        : in std_logic_vector(7 downto 0);
	DATA_VALID_IN  : in std_logic;
	DATA_KCTRL_IN  : in std_logic;
	
	DATA_PIN_P_OUT : out std_logic;
	DATA_PIN_N_OUT : out std_logic
);
end entity ddr_enc_transmitter;

architecture RTL of ddr_enc_transmitter is

signal data_in_local, d_out_crc : std_logic_vector(7 downto 0);
signal d_out_enc : std_logic_vector(9 downto 0);

signal crc_in_en_local, crc_out_en, enc_810_kin : std_logic;
signal local_cntr : unsigned( 7 downto 0) := (others => '0');
signal local_reset : std_logic;

begin

process(CLK_WORD_IN)
begin
  if rising_edge(CLK_WORD_IN) then
		--data_in_local   <= DATA_IN;
		--if (DATA_KCTRL_IN = '1' and DATA_VALID_IN = '1') then
		--	data_in_local   <= DATA_IN;--x"";
		--	crc_in_en_local <= '0';
		--else
		--	data_in_local   <= DATA_IN;
		--	crc_in_en_local <= DATA_VALID_IN;
		--end if;
		
		
          if DATA_KCTRL_IN = '1' then
            enc_810_kin   <= '1';
            data_in_local <= DATA_IN;
          elsif DATA_VALID_IN = '0' and RESET_IN = '1' then
            enc_810_kin   <= '1';
            data_in_local <= x"bc"; --x"1C";
          elsif DATA_VALID_IN = '0' and RESET_IN = '0' then
            enc_810_kin   <= '1';
            data_in_local <= x"bc"; --x"1c";
          else
            enc_810_kin   <= '0';
            data_in_local <= DATA_IN;
          end if;
			 
      end if;
end process;

--enc_crc : crc
--port map(
--	data_in    => data_in_local,
--	crc_en     => crc_in_en_local,
--	rst        => RESET_IN,
--	clk        => CLK_WORD_IN,
--	data_out   => d_out_crc,
--	enable_out => crc_out_en
--);

--enc_810_kin --<= not crc_in_en_local; --crc_out_en;

enc_810 : entity work.encode_8b10b_lut_base
port map(
	DIN               => data_in_local, --d_out_crc,
	KIN               => enc_810_kin,
	CLK               => CLK_WORD_IN,
	DOUT              => d_out_enc,
	CE                => '1',
	FORCE_CODE        => '0',
	FORCE_DISP        => '0',
	DISP_IN           => '0',
	DISP_OUT          => open,
	KERR              => open,
	ND                => open
);

--DDR_DEBUG_INST :  entity work.ddr_debug
--  port map(
--    clk => CLK_WORD_IN,
--    probe0(9 downto 0) =>  d_out_enc,
--    probe0(10) => DATA_KCTRL_IN,
--    probe0(11) => RESET_IN
--    );


LOCAL_DDR_RST : process (CLK_WORD_IN)
begin
  if rising_edge(CLK_WORD_IN) then
    if RESET_IN = '1' and local_cntr < x"e" then
      local_cntr <= local_cntr + 1;
      local_reset <= '1';
    elsif RESET_IN = '0' then
      local_cntr <= (others => '0');
      local_reset <= '0';
    else
      local_cntr <= local_cntr;
      local_reset <= '0';
    end if;
  end if;
end process LOCAL_DDR_RST;

output : entity work.output_module
port map (
	CLK_IN         => CLK_WORD_IN,
	CLKX8_IN       => CLK_BIT_IN,
	RESET_IN       => local_reset,
	DATA_PIN_P_OUT => DATA_PIN_P_OUT,
	DATA_PIN_N_OUT => DATA_PIN_N_OUT,
	DATA_IN        => d_out_enc,
	REC_CLK_OUT    => open,
	SYNCED_OUT     => open
);

	
end architecture RTL;
