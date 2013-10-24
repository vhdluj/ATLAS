library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;
use work.s7_transmission_components.all;

entity ddr_aurora_buffer is
	port (
		CLK_DDR_IN    : in std_logic;
		CLK_AURORA_IN : in std_logic;
		RESET_IN      : in std_logic;
		SYNCED_IN     : in std_logic;
		
		DDR_DATA_IN : in std_logic_vector(7 downto 0);
		DDR_DV_IN   : in std_logic;
		
		AURORA_DATA_OUT      : out std_logic_vector(0 to 15);
		AURORA_SOF_N_OUT     : out std_logic;
		AURORA_EOF_N_OUT     : out std_logic;
		AURORA_SRC_RDY_N_OUT : out std_logic;
		AURORA_DST_RDY_N_IN  : in std_logic 
	);
end entity ddr_aurora_buffer;

architecture RTL of ddr_aurora_buffer is

signal fifo_din : std_logic_vector(8 downto 0);
signal fifo_dout : std_logic_vector(17 downto 0);
signal fifo_wr_en, fifo_wr_en_q, fifo_wr_en_qq, fifo_wr_en_qqq, fifo_rd_en : std_logic;
signal saved_ctr, fifo_din_q, saved_ctr_q, loaded_ctr : std_logic_vector(7 downto 0);

type states is (IDLE, PREPARE, LOAD_DATA, CLEANUP);
signal current_state, next_state : states;
signal sof : std_logic;
signal src_rdy : std_logic;
signal odd_flag : std_logic := '0';

attribute keep : string;
attribute keep of fifo_din, fifo_wr_en, sof, src_rdy, fifo_dout, fifo_rd_en : signal is "true";

	
begin

process(CLK_DDR_IN)
begin
	if rising_edge(CLK_DDR_IN) then
		if SYNCED_IN = '1' then
			fifo_din_q   <= DDR_DATA_IN;
			if (DDR_DV_IN = '0' and fifo_wr_en_q = '1') then
				fifo_din(8) <= '1';
			else
				fifo_din(8) <= '0';
			end if;
			
			fifo_wr_en_q   <= DDR_DV_IN;
			fifo_wr_en_qq  <= fifo_wr_en_q;
			fifo_wr_en_qqq <= fifo_wr_en_qq;
			
			if (fifo_wr_en_q = '1') then
				fifo_wr_en   <= fifo_wr_en_q;
			elsif (odd_flag = '1' and fifo_din(8) = '1') then
				fifo_wr_en <= '1';
			else
				fifo_wr_en <= '0';
			end if;
				
			fifo_din(7 downto 0) <= fifo_din_q;
		else
			fifo_din <= (others => '0');
			fifo_wr_en <= '0';
		end if;
	end if;
end process;

fifo : fifo_8kx9x18
port map(
	rst    => RESET_IN,
	wr_clk => CLK_DDR_IN,
	rd_clk => CLK_AURORA_IN,
	din    => fifo_din,
	wr_en  => fifo_wr_en,
	rd_en  => fifo_rd_en,
	dout   => fifo_dout,
	full   => open,
	empty  => open
);

process(CLK_DDR_IN)
begin
	if rising_edge(CLK_DDR_IN) then
		if (RESET_IN = '1' or SYNCED_IN = '0') then
			saved_ctr <= x"00";
		elsif (fifo_din(8) = '1') then
			saved_ctr <= saved_ctr + 1;
		else
			saved_ctr <= saved_ctr;
		end if;
	end if;
end process;

odd_flag_proc : process (CLK_DDR_IN) is
begin
	if rising_edge(CLK_DDR_IN) then
		if RESET_IN = '1' or fifo_wr_en_qqq = '0' then
			odd_flag <= '0';
		elsif (fifo_wr_en = '1') then
			odd_flag <= not odd_flag;
		else
			odd_flag <= odd_flag;			
		end if;
	end if;
end process odd_flag_proc;


ctr_sync : signal_sync
generic map(
	WIDTH => 8
)
port map(
	RESET    => RESET_IN,
	CLK0     => CLK_DDR_IN,
	CLK1     => CLK_AURORA_IN,
	D_IN     => saved_ctr,
	D_OUT    => saved_ctr_q
);

	
process(CLK_AURORA_IN)
begin
	if rising_edge(CLK_AURORA_IN) then
		if RESET_IN = '1' or SYNCED_IN = '0' then
			current_state <= IDLE;
		else
			current_state <= next_state;
		end if;
	end if;
end process;

process(current_state, saved_ctr_q, loaded_ctr, AURORA_DST_RDY_N_IN, fifo_dout)
begin
	case current_state is 
		
		when IDLE =>
			if (saved_ctr_q /= loaded_ctr and AURORA_DST_RDY_N_IN = '0') then
				next_state <= PREPARE;
			else
				next_state <= IDLE;
			end if;
			
		when PREPARE =>
			next_state <= LOAD_DATA;
			
		when LOAD_DATA =>
			if (fifo_dout(17) = '1' or fifo_dout(8) = '1') then
				next_state <= CLEANUP;
			else
				next_state <= LOAD_DATA;
			end if;
			
		when CLEANUP =>
			next_state <= IDLE;
			
	end case;
end process ;

fifo_rd_en <= '1' when ((current_state = IDLE) and (saved_ctr_q /= loaded_ctr and AURORA_DST_RDY_N_IN = '0'))
				or (current_state = PREPARE)
				or (current_state = LOAD_DATA)
				else '0';				

process(CLK_AURORA_IN)
begin
	if rising_edge(CLK_AURORA_IN) then
		for i in 0 to 7 loop
			AURORA_DATA_OUT(i) <= fifo_dout(7 - i);
		end loop;
		for i in 8 to 15 loop
			AURORA_DATA_OUT(i) <= fifo_dout(16 - (i - 8));
		end loop;
		
		if (current_state = IDLE) and (saved_ctr_q /= loaded_ctr and AURORA_DST_RDY_N_IN = '0') then
			sof <= '0';
		else
			sof <= '1';
		end if;
		AURORA_SOF_N_OUT <= sof;
		
		if current_state = LOAD_DATA then
			if (fifo_dout(17) = '1' or fifo_dout(8) = '1') then
				src_rdy <= '1';
			else
				src_rdy <= '0';
			end if;
			
			if (fifo_dout(17) = '1' or fifo_dout(8) = '1') then
				AURORA_EOF_N_OUT <= '0';
			else
				AURORA_EOF_N_OUT <= '1';
			end if;
		elsif current_state = PREPARE then
			src_rdy <= '0';
			AURORA_EOF_N_OUT <= '1';
		else
			src_rdy <= '1';
			AURORA_EOF_N_OUT <= '1';
		end if;
		AURORA_SRC_RDY_N_OUT <= src_rdy;
		
	end if;
end process;

process(CLK_AURORA_IN)
begin
	if rising_edge(CLK_AURORA_IN) then
		if (RESET_IN = '1' or SYNCED_IN = '0') then
			loaded_ctr <= x"00";
		elsif (current_state = CLEANUP) then
			loaded_ctr <= loaded_ctr + 1;
		else
			loaded_ctr <= loaded_ctr;
		end if;
	end if;
end process;
	
end architecture RTL;
