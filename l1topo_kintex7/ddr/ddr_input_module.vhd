library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity ddr_input_module is
port(
	RESET_IN          : in std_logic;
	DCM_DDR_CLK_IN    : in std_logic;
	DCM_DDR_CLK_X8_IN : in std_logic;
	
	DATA_LINE_IN      : in std_logic;
	DELAY_CE_OUT      : out std_logic;
	DELAY_INC_OUT     : out std_logic;
	
	CTRL_READY_IN     : in std_logic;
	
	DATA_OUT          : out std_logic_vector(9 downto 0);
	SYNCED_OUT        : out std_logic;
	
	-- debug ports:
	DBG_STATE_OUT     : out std_logic_vector(3 downto 0);
	DBG_REG_DATA_OUT  : out std_logic_vector(9 downto 0);
	DBG_BITSLIP_OUT   : out std_logic_vector(3 downto 0);
	DBG_INC_OUT       : out std_logic_vector(7 downto 0);
	DBG_PAUSE_OUT     : out std_logic_vector(7 downto 0);
	DBG_STEP_OUT      : out std_logic_vector(7 downto 0)	
);
end ddr_input_module;

architecture Behavioral of ddr_input_module is

type align_states is (IDLE, PAUSE_A_WHILE, PREPARE, INC_DELAY1, INC_DELAY2,INC_DELAY3, WAIT_8CYCLES1, WAIT_8CYCLES2, FOUND_1ST_TRANS, FOUND_STABLE, STABLE_REGION, FOUND_2ND_TRANS, RETURN_BY_HALF, ALIGNED, MATCH_WINDOW, LINK_READY);
signal align_current_state, align_next_state : align_states;

signal clk_in_int_inv : std_logic;
signal shift1, shift2 : std_logic;
signal iserdes_q      : std_logic_vector(9 downto 0);
signal sync_shift_reg : std_logic_vector(7 downto 0);
signal start_check, check_done : std_logic;
signal bitslips_ctr : integer range 0 to 10;
signal step_ctr, inc_ctr, pause_ctr : integer range 0 to 31 := 10;
signal previous_data, registered_data : std_logic_vector(9 downto 0);
signal synced : std_logic;
signal state : std_logic_vector(3 downto 0);

begin

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
		CLK               => DCM_DDR_CLK_X8_IN,                             -- Fast clock driven by MMCM
		CLKB              => clk_in_int_inv,                     -- Locally inverted clock
		CLKDIV            => DCM_DDR_CLK_IN,                         -- Slow clock driven by MMCM
		CLKDIVP           => '0',
		D                 => '0', --data_in_from_pins_delay, -- 1-bit Input signal from IOB.
		DDLY              => DATA_LINE_IN,
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
		CLK               => DCM_DDR_CLK_X8_IN,                             -- Fast clock driven by MMCM
		CLKB              => clk_in_int_inv,                     -- Locally inverted clock
		CLKDIV            => DCM_DDR_CLK_IN,                         -- Slow clock driven by MMCM
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

	DATA_OUT <= iserdes_q;

	clk_in_int_inv <= not DCM_DDR_CLK_X8_IN;
	
	ALIGN_MACHINE_PROC : process(DCM_DDR_CLK_IN)
	begin
		if rising_edge(DCM_DDR_CLK_IN) then
			if RESET_IN = '1' then
				align_current_state <= IDLE;
			else
				align_current_state <= align_next_state;
			end if;
		end if;
	end process ALIGN_MACHINE_PROC;

	ALIGN_MACHINE : process(registered_data, CTRL_READY_IN, inc_ctr, iserdes_q, step_ctr, pause_ctr, synced, check_done)
	begin
		case align_current_state is
		
			when IDLE =>
				state <= x"0";
				if (CTRL_READY_IN = '1') then
					align_next_state <= PAUSE_A_WHILE; --PREPARE;
				else
					align_next_state <= IDLE;
				end if;
				
			when PAUSE_A_WHILE =>
				state <= x"1";
				if (pause_ctr = 0) then
					align_next_state <= PREPARE;
				else
					align_next_state <= PAUSE_A_WHILE;
				end if;
				
			when PREPARE =>
				state <= x"2";
				if (check_done = '1') then
					align_next_state <= INC_DELAY1;
				else
					align_next_state <= PREPARE;
				end if;
				
			when INC_DELAY1 =>
				state <= x"3";
				align_next_state <= WAIT_8CYCLES1;
				
			when WAIT_8CYCLES1 =>
				state <= x"4";
				if (pause_ctr = 0) then
					if (check_done = '1' and registered_data /= previous_data) then
						align_next_state <= FOUND_1ST_TRANS;
					elsif (check_done = '1' and registered_data = previous_data) then
						align_next_state <= INC_DELAY1;
					else
						align_next_state <= WAIT_8CYCLES1;
					end if;
				else
					align_next_state <= WAIT_8CYCLES1;
				end if;
				
			when FOUND_1ST_TRANS =>
				state <= x"5";
				align_next_state <= INC_DELAY2;
				
			when INC_DELAY2 =>
				state <= x"6";
				align_next_state <= STABLE_REGION;--WAIT_8CYCLES2;
				
			when STABLE_REGION  => 
				state <= x"7";
				if (pause_ctr = 0) then
					if (check_done = '1' and registered_data = previous_data) then
						align_next_state  <= FOUND_STABLE;
					elsif (check_done = '1' and registered_data /= previous_data) then
						align_next_state <= INC_DELAY2;
					else
						align_next_state <= STABLE_REGION;
					end if;
				else
					align_next_state <= STABLE_REGION;
				end if;
				
			when FOUND_STABLE  =>
				state <= x"8";
				align_next_state   <=  INC_DELAY3;
				
			when INC_DELAY3  =>
				state <= x"9";
				align_next_state  <= WAIT_8CYCLES2;
			
			when WAIT_8CYCLES2 =>
				state <= x"a";
				if (pause_ctr = 0) then
					if (check_done = '1' and registered_data /= previous_data) then
						if (inc_ctr / 2 < 2) then
							align_next_state <= IDLE;
						else
							align_next_state <= FOUND_2ND_TRANS;
						end if;
					elsif (check_done = '1' and registered_data = previous_data) then
						align_next_state <= INC_DELAY3;
					else
						align_next_state <= WAIT_8CYCLES2;
					end if;
				else
					align_next_state <= WAIT_8CYCLES2;
				end if;
				
			when FOUND_2ND_TRANS =>
				state <= x"b";
				align_next_state <= RETURN_BY_HALF;
				
			when RETURN_BY_HALF =>
				state <= x"c";
				if (inc_ctr / 2 = step_ctr) then
					align_next_state <= ALIGNED;
				else
					align_next_state <= RETURN_BY_HALF;
				end if;
			
			when ALIGNED =>
				state <= x"d";
				align_next_state <= MATCH_WINDOW;
				
			when MATCH_WINDOW =>
				state <= x"e";
				if (synced = '1') then
					align_next_state <= LINK_READY;
				elsif (bitslips_ctr = 10) then
					align_next_state <= PREPARE;
				else
					align_next_state <= MATCH_WINDOW;
				end if;
				
			when LINK_READY =>
				state <= x"f";
				align_next_state <= LINK_READY;
		
		end case;
	end process ALIGN_MACHINE;

	process(DCM_DDR_CLK_IN)
	begin
		if rising_edge(DCM_DDR_CLK_IN) then
			if (RESET_IN = '1') then
				start_check <= '0';
			elsif (align_current_state = PAUSE_A_WHILE and pause_ctr = 1) then
				start_check <= '1';
			elsif (align_current_state = WAIT_8CYCLES1 and pause_ctr = 1) then
				start_check <= '1';
			elsif (align_current_state = WAIT_8CYCLES2 and pause_ctr = 1) then
				start_check <= '1';
			elsif (align_current_state = STABLE_REGION and pause_ctr = 1) then
				start_check <= '1';
			else
				start_check <= '0';
			end if;
		end if;
	end process;

	process(DCM_DDR_CLK_IN)
	begin
		if rising_edge(DCM_DDR_CLK_IN) then
			if RESET_IN = '1' then
				inc_ctr   <= 0;
				pause_ctr <= 31;
				step_ctr  <= 0;
			elsif align_current_state = IDLE then
				inc_ctr   <= 0;
				pause_ctr <= 31;
				step_ctr  <= 0;
			elsif align_current_state = PAUSE_A_WHILE then
				if (pause_ctr > 0) then
					pause_ctr <= pause_ctr - 1;
				else
					pause_ctr <= pause_ctr;
				end if;
				inc_ctr   <= 0;
				step_ctr  <= 0;
			elsif align_current_state = PREPARE then
				pause_ctr <= 0;
				inc_ctr   <= 0;
				step_ctr  <= 0;
			elsif align_current_state = WAIT_8CYCLES1 then
				if (pause_ctr > 0) then
					pause_ctr <= pause_ctr - 1;
				else
					pause_ctr <= pause_ctr;
				end if;
				inc_ctr   <= 0;
				step_ctr  <= 0;
			elsif align_current_state = WAIT_8CYCLES2 then
				if (pause_ctr > 0) then
					pause_ctr <= pause_ctr - 1;
				else
					pause_ctr <= pause_ctr;
				end if;
				inc_ctr   <= inc_ctr;
				step_ctr  <= 0;
			elsif align_current_state = STABLE_REGION then
				if (pause_ctr > 0) then
					pause_ctr <= pause_ctr - 1;
				else
					pause_ctr <= pause_ctr;
				end if;
				inc_ctr   <= 0;
				step_ctr  <= 0;		
			elsif align_current_state = INC_DELAY1 then
				pause_ctr <= 8;
				inc_ctr   <= 0;
				step_ctr  <= 0;
			elsif align_current_state = INC_DELAY2 then
				pause_ctr <= 8;
				inc_ctr   <= 0;
				step_ctr  <= 0;	
			elsif align_current_state = INC_DELAY3 then
				pause_ctr <= 8;
				inc_ctr   <= inc_ctr + 1;
				step_ctr  <= 0;	
			elsif align_current_state = RETURN_BY_HALF then
				inc_ctr   <= inc_ctr;
				pause_ctr <= pause_ctr;
				step_ctr  <= step_ctr + 1;
			elsif align_current_state = MATCH_WINDOW then
				inc_ctr   <= 0;
				pause_ctr <= 31;
				step_ctr  <= 0;
			else
				inc_ctr   <= inc_ctr;
				pause_ctr <= pause_ctr;
				step_ctr  <= step_ctr;
			end if;
		end if;
	end process;

	process(DCM_DDR_CLK_IN)
	begin
		if rising_edge(DCM_DDR_CLK_IN) then
			if RESET_IN = '1' then
				DELAY_INC_OUT <= '0';
				DELAY_CE_OUT  <= '0';
			elsif (align_current_state = INC_DELAY1) then
				DELAY_INC_OUT <= '1';
				DELAY_CE_OUT  <= '1';
			elsif (align_current_state = INC_DELAY2) then
				DELAY_INC_OUT <= '1';
				DELAY_CE_OUT  <= '1';
			elsif (align_current_state = INC_DELAY3) then
				DELAY_INC_OUT <= '1';
				DELAY_CE_OUT  <= '1';
			elsif (align_current_state = RETURN_BY_HALF) then
				DELAY_CE_OUT  <= '1';
				DELAY_INC_OUT <= '0';
			else
				DELAY_INC_OUT <= '0';
				DELAY_CE_OUT  <= '0';
			end if;
		end if;
	end process;
	
	stability_checker_inst : entity work.ddr_stability_checker
	port map(
		CLK_IN              => DCM_DDR_CLK_IN,
		RESET_IN            => RESET_IN,
		DATA_IN             => iserdes_q,
		START_CHECK_IN      => start_check,
		CHECK_DONE_OUT      => check_done,
		REGISTERED_DATA_OUT => registered_data
	);
	
	process(DCM_DDR_CLK_IN)
	begin
		if rising_edge(DCM_DDR_CLK_IN) then
			if (align_current_state = IDLE) then
				previous_data <= iserdes_q;
			elsif (align_current_state /= IDLE and check_done = '1') then
				previous_data <= registered_data; --iserdes_q;
			else
				previous_data <= previous_data;
			end if;
		end if;
	end process;
	
	process(DCM_DDR_CLK_IN)
	begin
		if rising_edge(DCM_DDR_CLK_IN) then
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
	
	process(DCM_DDR_CLK_IN)
	begin
		if rising_edge(DCM_DDR_CLK_IN) then
			if RESET_IN = '1' or synced = '1' then
				sync_shift_reg <= "00000001";
			elsif (align_current_state = MATCH_WINDOW) then
				sync_shift_reg <= sync_shift_reg(6 downto 0) & sync_shift_reg(7);
			else
				sync_shift_reg <= sync_shift_reg;
			end if;
		end if;
	end process;

	process(DCM_DDR_CLK_IN)
	begin
		if rising_edge(DCM_DDR_CLK_IN) then
			if RESET_IN = '1' then
				synced <= '0';
			elsif (iserdes_q = ("00" & x"bc") and sync_shift_reg(5) = '1') then
				synced <= '1';
			else
				synced <= synced;
			end if;
		end if;
	end process;
	SYNCED_OUT <= '1' when align_current_state = LINK_READY else '0'; --synced;
	
	
	-- debug ports:
	DBG_STATE_OUT    <= state;
	DBG_REG_DATA_OUT <= registered_data;
	DBG_BITSLIP_OUT  <= std_logic_vector(to_unsigned(bitslips_ctr, 4));
	DBG_INC_OUT      <= std_logic_vector(to_unsigned(inc_ctr, 8));
	DBG_PAUSE_OUT    <= std_logic_vector(to_unsigned(pause_ctr, 8));
	DBG_STEP_OUT     <= std_logic_vector(to_unsigned(step_ctr, 8));

end Behavioral;

