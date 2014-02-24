library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity ddr_bank_bridge is
generic (
	DELAY_GROUP_NAME : string := "delay_group";
	AVAILABLE_LVDS_LINES : integer range 0 to 20 := 1;
	EXCLUDE_DCM_IDELAY_CTRL : boolean
);
port (
	GCLK_40_IN         : in std_logic; -- global buffer input
	DELAY_CLK_IN       : in std_logic;
	EXT_DDR_CLK_IN     : in std_logic; -- only in case of external clocking
	DCM_DDR_CLK_OUT    : out std_logic; -- regional clock output
	DCM_DDR_CLK_X8_OUT : out std_logic; -- regional clock output
	RESET_IN           : in std_logic;
	
	LVDS_IN_P          : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	LVDS_IN_N          : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	DATA_LINES_OUT     : out std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	
	DELAY_INC_IN       : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	DELAY_CE_IN        : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	CTRL_READY_OUT     : out std_logic;
	DCM_LOCKED_OUT     : out std_logic
);
end ddr_bank_bridge;

architecture Behavioral of ddr_bank_bridge is

attribute IODELAY_GROUP : string;

signal clk_40_r, clk_400_r, clk_80_r, clk_300_r : std_logic;
signal clk_40_ub, clk_400_ub, clk_80_ub, clk_300_ub : std_logic;
signal clk_fb : std_logic;
signal delay_ctrl_ready : std_logic;
signal local_data_lines : std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
signal delay_ce_q, delay_inc_q : std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);

begin

	int_clock_gen : if EXCLUDE_DCM_IDELAY_CTRL = FALSE generate
		attribute IODELAY_GROUP of delay_ctrl_inst : label is DELAY_GROUP_NAME;
	begin
	
		clock_inst : entity work.ddr_clock_src
		port map
		(
			-- Clock in ports
			CLK_IN1 => GCLK_40_IN,
			CLKFB_IN => clk_fb,
			CLKFB_OUT => clk_fb,
			-- Clock out ports WITHOUT BUFFERS
			CLK_40_OUT => clk_40_ub,
			CLK_80_OUT => clk_80_ub,
			CLK_400_OUT => clk_400_ub,
			CLK_300_OUT => open,
			-- Status and control signals
			RESET  => '0',
			LOCKED => DCM_LOCKED_OUT
		);



		
		clk_80_bufr : BUFR
		port map(
			I   => clk_80_ub,
			O   => clk_80_r,
			CE  => '1',
			CLR => '0'
		);
		DCM_DDR_CLK_OUT <= clk_80_r;
		
		clk_400_bufr : BUFR
		port map(
			I   => clk_400_ub,
			O   => clk_400_r,
			CE  => '1',
			CLR => '0'
		);
		DCM_DDR_CLK_X8_OUT <= clk_400_r;

		delay_ctrl_inst : IDELAYCTRL
		port map(
			REFCLK => DELAY_CLK_IN,
			RDY    => delay_ctrl_ready,
			RST    => RESET_IN
		);
		CTRL_READY_OUT <= delay_ctrl_ready;
	end generate;
	
	ext_clock_gen : if EXCLUDE_DCM_IDELAY_CTRL = TRUE generate
		DCM_LOCKED_OUT     <= '1';
		DCM_DDR_CLK_OUT    <= '0';
		DCM_DDR_CLK_X8_OUT <= '0';
		CTRL_READY_OUT     <= '1';
		
		clk_80_r <= EXT_DDR_CLK_IN;
	end generate;

	lvds_inputs_gen : for i in 0 to AVAILABLE_LVDS_LINES - 1 generate
		attribute IODELAY_GROUP of delay_n_inst : label is DELAY_GROUP_NAME;
	begin

		ibufds_inst : IBUFDS
		port map(
			I  => LVDS_IN_P(i),
			IB => LVDS_IN_N(i),
			O  => local_data_lines(i)
		);
		
		delay_n_inst : IDELAYE2
		generic map(
			 HIGH_PERFORMANCE_MODE => "TRUE",
			 IDELAY_TYPE           => "VARIABLE",
			 IDELAY_VALUE          => 0,
			 REFCLK_FREQUENCY      => 300.0,
			 SIGNAL_PATTERN        => "DATA"
		)
		port map(
			 CNTVALUEOUT           => open,
			 DATAOUT               => DATA_LINES_OUT(i),
			 C                     => DELAY_CLK_IN,
			 CE                    => delay_ce_q(i),
			 CINVCTRL              => '0',
			 CNTVALUEIN            => "00000",
			 DATAIN                => '0',
			 IDATAIN               => local_data_lines(i),
			 INC                   => delay_inc_q(i),
			 REGRST                => RESET_IN,
			 LD                    => '0',
			 LDPIPEEN              => '0'
		);
		
		d_inc_sync : entity work.pulse_sync
		port map(
			CLK_A_IN       => clk_80_r, 
			RESET_A_IN     => RESET_IN, 
			PULSE_A_IN     => DELAY_INC_IN(i), 
			CLK_B_IN       => DELAY_CLK_IN,
			RESET_B_IN     => RESET_IN, 
			PULSE_B_OUT    => delay_inc_q(i) 
		);

		d_ce_sync : entity work.pulse_sync
		port map(
			CLK_A_IN       => clk_80_r, 
			RESET_A_IN     => RESET_IN, 
			PULSE_A_IN     => DELAY_CE_IN(i), 
			CLK_B_IN       => DELAY_CLK_IN,
			RESET_B_IN     => RESET_IN, 
			PULSE_B_OUT    => delay_ce_q(i) 
		);
		
	end generate lvds_inputs_gen;


end Behavioral;

