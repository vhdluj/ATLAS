library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity input_module is
generic (
	IOSTANDARD_CONF : character := '0'
);
port (
	CLK_IN         : in std_logic;
	CLK_DLY_IN     : in std_logic;
	DELAY_READY_IN : in std_logic;
	CLKX8_IN       : in std_logic;
	RESET_IN       : in std_logic;
	DATA_PIN_P_IN  : in std_logic;
	DATA_PIN_N_IN  : in std_logic;
	DATA_OUT       : out std_logic_vector(9 downto 0);
	REC_CLK_OUT    : out std_logic;
	SYNCED_OUT     : out std_logic
);
end input_module;

architecture Behavioral of input_module is

-- After the buffer
signal data_in_from_pins_int     : std_logic;
-- Between the delay and serdes
signal data_in_from_pins_delay   : std_logic;

signal clk_in_int_inv           : std_logic;

signal iserdes_q                 : std_logic_vector(9 downto 0);

signal delay_inc, delay_ce : std_logic;

signal synced : std_logic;
signal sync_shift_reg : std_logic_vector(7 downto 0);
signal registered_data : std_logic_vector(9 downto 0);
signal step_ctr, inc_ctr, pause_ctr : integer range 0 to 31 := 10;
signal state : std_logic_vector(3 downto 0);
signal shift1, shift2 : std_logic;
signal bitslips_ctr : integer range 0 to 10;

--type align_states is (IDLE, INC_DELAY_1EDGE, FIND_STABLE_DATA, INC_DELAY_2EDGE, RETURN_BY_HALF, ALIGNED, PREPARE, MATCH_WINDOW, LINK_READY);
type align_states is (IDLE, PREPARE, INC_DELAY1, INC_DELAY2, WAIT_8CYCLES1, WAIT_8CYCLES2, FOUND_1ST_TRANS, FOUND_2ND_TRANS, RETURN_BY_HALF, ALIGNED, MATCH_WINDOW, LINK_READY);
signal align_current_state, align_next_state : align_states;

attribute keep : string;
attribute keep of delay_inc, delay_ce, registered_data, state : signal is "true";

begin

buf_lvds25_gen : if (IOSTANDARD_CONF = '1') generate
	ibufds_inst : IBUFDS
	generic map (
		DIFF_TERM  => TRUE,             -- Differential termination
		IBUF_LOW_PWR => FALSE,
		IOSTANDARD => "LVDS_25"
		)
	port map (
		I          => DATA_PIN_P_IN,
		IB         => DATA_PIN_N_IN,
		O          => data_in_from_pins_int
	);
end generate buf_lvds25_gen;

buf_lvds_gen : if (IOSTANDARD_CONF = '0') generate
	ibufds_inst : IBUFDS
	generic map (
		DIFF_TERM  => TRUE,             -- Differential termination
		IBUF_LOW_PWR => FALSE,
		IOSTANDARD => "LVDS"
		)
	port map (
		I          => DATA_PIN_P_IN,
		IB         => DATA_PIN_N_IN,
		O          => data_in_from_pins_int
	);
end generate buf_lvds_gen;

--data_in_from_pins_delay <= data_in_from_pins_int;

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
    DATAOUT               => data_in_from_pins_delay,
    C                     => CLK_DLY_IN,
    CE                    => delay_ce,
    CINVCTRL              => '0',
    CNTVALUEIN            => "00000",
    DATAIN                => '0',
    IDATAIN               => data_in_from_pins_int,
    INC                   => delay_inc,
    REGRST                => RESET_IN,
    LD                    => '0',
    LDPIPEEN              => '0'
);

 -- declare the iserdes
iserdese2_master : ISERDESE2
generic map (
	DATA_RATE         => "DDR",
	DATA_WIDTH        => 10,
	INTERFACE_TYPE    => "NETWORKING", 
	DYN_CLKDIV_INV_EN => "FALSE",
	DYN_CLK_INV_EN    => "FALSE",
	NUM_CE            => 2,
	OFB_USED          => "FALSE",
	IOBDELAY          => "IFD",                             -- Use input at D to output the data on Q1-Q6
	SERDES_MODE       => "MASTER"
)
port map (
	Q1                => iserdes_q(9),
	Q2                => iserdes_q(8),
	Q3                => iserdes_q(7),
	Q4                => iserdes_q(6),
	Q5                => iserdes_q(5),
	Q6                => iserdes_q(4),
	Q7                => iserdes_q(3),
	Q8                => iserdes_q(2),
	SHIFTOUT1         => shift1,
	SHIFTOUT2         => shift2,
	BITSLIP           => sync_shift_reg(7),                            -- 1-bit Invoke Bitslip. This can be used with any 
																			-- DATA_WIDTH, cascaded or not.
	CE1               => '1',                       -- 1-bit Clock enable input
	CE2               => '1',                       -- 1-bit Clock enable input
	CLK               => CLKX8_IN,                             -- Fast clock driven by MMCM
	CLKB              => clk_in_int_inv,                     -- Locally inverted clock
	CLKDIV            => CLK_IN,                         -- Slow clock driven by MMCM
	CLKDIVP           => '0',
	D                 => '0', --data_in_from_pins_delay, -- 1-bit Input signal from IOB.
	DDLY              => data_in_from_pins_delay,
	RST               => RESET_IN,                           -- 1-bit Asynchronous reset only.
	SHIFTIN1          => '0',
	SHIFTIN2          => '0',
	-- unused connections
	DYNCLKDIVSEL      => '0',
	DYNCLKSEL         => '0',
	OFB               => '0',
	OCLK              => '0',
	OCLKB             => '0',
	O                 => open                   -- unregistered output of ISERDESE1
);

iserdese2_slave : ISERDESE2
generic map (
	DATA_RATE         => "DDR",
	DATA_WIDTH        => 10,
	INTERFACE_TYPE    => "NETWORKING", 
	DYN_CLKDIV_INV_EN => "FALSE",
	DYN_CLK_INV_EN    => "FALSE",
	NUM_CE            => 2,
	OFB_USED          => "FALSE",
	IOBDELAY          => "IFD",                             -- Use input at D to output the data on Q1-Q6
	SERDES_MODE       => "SLAVE"
)
port map (
	Q1                => open,
	Q2                => open,
	Q3                => iserdes_q(1),
	Q4                => iserdes_q(0),
	Q5                => open,
	Q6                => open,
	Q7                => open,
	Q8                => open,
	SHIFTOUT1         => open,
	SHIFTOUT2         => open,
	BITSLIP           => sync_shift_reg(7),                            -- 1-bit Invoke Bitslip. This can be used with any 
																			-- DATA_WIDTH, cascaded or not.
	CE1               => '1',                       -- 1-bit Clock enable input
	CE2               => '1',                       -- 1-bit Clock enable input
	CLK               => CLKX8_IN,                             -- Fast clock driven by MMCM
	CLKB              => clk_in_int_inv,                     -- Locally inverted clock
	CLKDIV            => CLK_IN,                         -- Slow clock driven by MMCM
	CLKDIVP           => '0',
	D                 => '0', --data_in_from_pins_delay, -- 1-bit Input signal from IOB.
	DDLY              => '0',
	RST               => RESET_IN,                           -- 1-bit Asynchronous reset only.
	SHIFTIN1          => shift1,
	SHIFTIN2          => shift2,
	-- unused connections
	DYNCLKDIVSEL      => '0',
	DYNCLKSEL         => '0',
	OFB               => '0',
	OCLK              => '0',
	OCLKB             => '0',
	O                 => open                   -- unregistered output of ISERDESE1
);


clk_in_int_inv <= not CLKX8_IN;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if RESET_IN = '1' or synced = '1' then
			sync_shift_reg <= "00000001";
		elsif (align_current_state = MATCH_WINDOW) then
			sync_shift_reg <= sync_shift_reg(6 downto 0) & sync_shift_reg(7);
		else
			sync_shift_reg <= sync_shift_reg;
		end if;
	end if;
end process;

ALIGN_MACHINE_PROC : process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if RESET_IN = '1' then
			align_current_state <= IDLE;
		else
			align_current_state <= align_next_state;
		end if;
	end if;
end process ALIGN_MACHINE_PROC;

ALIGN_MACHINE : process(registered_data, DELAY_READY_IN, inc_ctr, iserdes_q, step_ctr, pause_ctr, synced)
begin
	case align_current_state is
	
		when IDLE =>
			state <= x"0";
			if (DELAY_READY_IN = '1') then
				align_next_state <= PREPARE;
			else
				align_next_state <= IDLE;
			end if;
			
		when PREPARE =>
			state <= x"1";
			if (pause_ctr = 0) then
				align_next_state <= INC_DELAY1;
			else
				align_next_state <= PREPARE;
			end if;
			
		when INC_DELAY1 =>
			state <= x"2";
			align_next_state <= WAIT_8CYCLES1;
			
		when WAIT_8CYCLES1 =>
			state <= x"3";
			if (pause_ctr = 0) then
				if (registered_data /= iserdes_q) then
					align_next_state <= FOUND_1ST_TRANS;
				else
					align_next_state <= INC_DELAY1;
				end if;
			else
				align_next_state <= WAIT_8CYCLES1;
			end if;
			
		when FOUND_1ST_TRANS =>
			state <= x"4";
			align_next_state <= INC_DELAY2;
			
		when INC_DELAY2 =>
			state <= x"5";
			align_next_state <= WAIT_8CYCLES2;
			
		when WAIT_8CYCLES2 =>
			state <= x"6";
			if (pause_ctr = 0) then
				if (registered_data /= iserdes_q) then
					if (inc_ctr / 2 < 2) then
						align_next_state <= IDLE;
					else
						align_next_state <= FOUND_2ND_TRANS;
					end if;
				else
					align_next_state <= INC_DELAY2;
				end if;
			else
				align_next_state <= WAIT_8CYCLES2;
			end if;
			
		when FOUND_2ND_TRANS =>
			state <= x"7";
			align_next_state <= RETURN_BY_HALF;
			
		when RETURN_BY_HALF =>
			state <= x"8";
			if (inc_ctr / 2 = step_ctr) then
				align_next_state <= ALIGNED;
			else
				align_next_state <= RETURN_BY_HALF;
			end if;
		
		when ALIGNED =>
			state <= x"9";
			align_next_state <= MATCH_WINDOW;
			
		when MATCH_WINDOW =>
			state <= x"a";
			if (synced = '1') then
				align_next_state <= LINK_READY;
			elsif (bitslips_ctr = 10) then
				align_next_state <= PREPARE;
			else
				align_next_state <= MATCH_WINDOW;
			end if;
			
		when LINK_READY =>
			state <= x"b";
			align_next_state <= LINK_READY;
	
	end case;
end process ALIGN_MACHINE;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if RESET_IN = '1' then
			inc_ctr   <= 0;
			pause_ctr <= 31;
			step_ctr  <= 0;
		elsif align_current_state = PREPARE then
			pause_ctr <= pause_ctr - 1;
			inc_ctr   <= 0;
			step_ctr  <= 0;
		elsif align_current_state = WAIT_8CYCLES1 then
			pause_ctr <= pause_ctr - 1;
			inc_ctr   <= 0;
			step_ctr  <= 0;
		elsif align_current_state = WAIT_8CYCLES2 then
			pause_ctr <= pause_ctr - 1;
			inc_ctr   <= inc_ctr;
			step_ctr  <= 0;
		elsif align_current_state = INC_DELAY1 then
			pause_ctr <= 8;
			inc_ctr   <= 0;
			step_ctr  <= 0;
		elsif align_current_state = INC_DELAY2 then
			pause_ctr <= 8;
			inc_ctr   <= inc_ctr + 1;
			step_ctr  <= 0;	
		elsif align_current_state = RETURN_BY_HALF then
			inc_ctr   <= inc_ctr;
			pause_ctr <= pause_ctr;
			step_ctr  <= step_ctr + 1;
		else
			inc_ctr   <= inc_ctr;
			pause_ctr <= pause_ctr;
			step_ctr  <= step_ctr;
		end if;
	end if;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if RESET_IN = '1' then
			delay_inc <= '0';
			delay_ce  <= '0';
		elsif (align_current_state = INC_DELAY1) then
			delay_inc <= '1';
			delay_ce  <= '1';
		elsif (align_current_state = INC_DELAY2) then
			delay_inc <= '1';
			delay_ce  <= '1';
		elsif (align_current_state = RETURN_BY_HALF) then
			delay_ce  <= '1';
			delay_inc <= '0';
		else
			delay_inc <= '0';
			delay_ce  <= '0';
		end if;
	end if;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if (align_current_state = INC_DELAY1 or align_current_state = INC_DELAY2) then
			registered_data <= iserdes_q;
		elsif (align_current_state = FOUND_1ST_TRANS) then
			registered_data <= iserdes_q;
		else
			registered_data <= registered_data;
		end if;
	end if;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if RESET_IN = '1' then
			synced <= '0';
		elsif (iserdes_q = ("00" & x"bc") and sync_shift_reg(5) = '1') then
			synced <= '1';
		else
			synced <= synced;
		end if;
	end if;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if (RESET_IN = '1') then
			bitslips_ctr <= 0;
		elsif (align_current_state = PREPARE) then
			bitslips_ctr <= 0;
		elsif (align_current_state = MATCH_WINDOW and sync_shift_reg(7) = '1') then
			bitslips_ctr <= bitslips_ctr + 1;
		else
			bitslips_ctr <= bitslips_ctr;
		end if;
	end if;
end process;

DATA_OUT <= iserdes_q;

SYNCED_OUT <= synced;

end Behavioral;


