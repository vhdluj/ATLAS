library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity output_module is
port (
	CLK_IN         : in std_logic;
	CLKX8_IN       : in std_logic;
	RESET_IN       : in std_logic;
	DATA_PIN_P_OUT : out std_logic;
	DATA_PIN_N_OUT : out std_logic;
	DATA_IN        : in std_logic_vector(9 downto 0);
	REC_CLK_OUT    : out std_logic;
	SYNCED_OUT     : out std_logic
);
end output_module;

architecture Behavioral of output_module is

-- Before the buffer
signal data_out_to_pins_int      : std_logic;
-- Between the delay and serdes
signal data_out_to_pins_predelay : std_logic;

signal oserdes_d                 : std_logic_vector(9 downto 0);
signal shift1, shift2 : std_logic := '0';

begin

obufds_inst : OBUFDS
generic map (
	IOSTANDARD => "LVDS_25")
port map (
	O          => DATA_PIN_P_OUT,
	OB         => DATA_PIN_N_OUT,
	I          => data_out_to_pins_int
);

data_out_to_pins_int    <= data_out_to_pins_predelay;

-- declare the oserdes
oserdese2_master : OSERDESE2
generic map (
	DATA_RATE_OQ   => "DDR",
	DATA_RATE_TQ   => "SDR",
	DATA_WIDTH     => 10,

	TRISTATE_WIDTH => 1,
	SERDES_MODE    => "MASTER"
)
port map (
	D1             => oserdes_d(0),
	D2             => oserdes_d(1),
	D3             => oserdes_d(2),
	D4             => oserdes_d(3),
	D5             => oserdes_d(4),
	D6             => oserdes_d(5),
	D7             => oserdes_d(6),
	D8             => oserdes_d(7),
	T1             => '0',
	T2             => '0',
	T3             => '0',
	T4             => '0',
	SHIFTIN1       => shift1,
	SHIFTIN2       => shift2,
	SHIFTOUT1      => open,
	SHIFTOUT2      => open,
	OCE            => '1',
	CLK            => CLKX8_IN,
	CLKDIV         => CLK_IN,
	OQ             => data_out_to_pins_predelay,
	TQ             => open,
	OFB            => open,
	TBYTEIN        => '0',
	TBYTEOUT       => open,
	TFB            => open,
	TCE            => '0',
	RST            => RESET_IN
);

oserdese2_slave : OSERDESE2
generic map (
	DATA_RATE_OQ   => "DDR",
	DATA_RATE_TQ   => "SDR",
	DATA_WIDTH     => 10,

	TRISTATE_WIDTH => 1,
	SERDES_MODE    => "SLAVE"
)
port map (
	D1             => '0',
	D2             => '0',
	D3             => oserdes_d(8),
	D4             => oserdes_d(9),
	D5             => '0',
	D6             => '0',
	D7             => '0',
	D8             => '0',
	T1             => '0',
	T2             => '0',
	T3             => '0',
	T4             => '0',
	SHIFTIN1       => '0',
	SHIFTIN2       => '0',
	SHIFTOUT1      => shift1,
	SHIFTOUT2      => shift2,
	OCE            => '1',
	CLK            => CLKX8_IN,
	CLKDIV         => CLK_IN,
	OQ             => open,
	TQ             => open,
	OFB            => open,
	TBYTEIN        => '0',
	TBYTEOUT       => open,
	TFB            => open,
	TCE            => '0',
	RST            => RESET_IN
);

oserdes_d <= DATA_IN;

end Behavioral;

