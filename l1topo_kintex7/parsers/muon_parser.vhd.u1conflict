library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity muon_parser is
generic (
	TYPE_ID           : std_logic_vector(3 downto 0) := b"0100"
);
port (
	CLK_WR_IN         : in std_logic;
	CLK_RD_IN         : in std_logic;
	RESET_IN          : in std_logic;
	
	BC_OFFSET_IN      : in std_logic_vector(5 downto 0);
	BC_QTY_IN         : in std_logic_vector(5 downto 0);
	
	DATA_IN           : in std_logic_vector(127 downto 0);
	DATA_WE_IN        : in std_logic;
	
	DATA_OUT          : out std_logic_vector(31 downto 0);
	DATA_RE_IN        : in std_logic;
	
	UPDATE_BC_IN      : in std_logic;
	
	DATA_RDY_OUT      : out std_logic;
	TOB_COUNTER_OUT   : out std_logic_vector(2 downto 0);
	CRC_ERR_OUT       : out std_logic;
	FIFO_OVERFLOW_OUT : out std_logic
);
end muon_parser;

architecture Behavioral of muon_parser is

COMPONENT tob_buffer_128x512
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT tob_buffer_32x1024
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

type parse_states is (IDLE, READ_OUT_WORD, WAIT_ONE, SPLIT_INTO_TOBS, SAVE_TOBS, WAIT_FOR_DATA, WAIT_FOR_READOUT, CLEANUP);
signal parse_current_state, parse_next_state : parse_states;

signal input_rd, input_full, input_empty : std_logic;
signal input_dout : std_logic_vector(127 downto 0);
signal output_data : std_logic_vector(31 downto 0);
signal output_wr, output_full, output_empty : std_logic;
signal bc_ctr : integer range 0 to 31;
signal tob_ctr : integer range 0 to 5;
--type tob_array_type is array (5 downto 0) of std_logic_vector(31 downto 0);
--signal tob_array : tob_array_type;
signal tob : std_logic_vector(31 downto 0);
signal bc_qty : integer range 0 to 32;
signal bc_taken : integer range 0 to 16; 

begin

bc_qty <= to_integer(signed(BC_QTY_IN));

input_buffer : tob_buffer_128x512
port map(
    rst    => RESET_IN,
    wr_clk => CLK_WR_IN,
    rd_clk => CLK_RD_IN,
    din    => DATA_IN,
    wr_en  => DATA_WE_IN,
    rd_en  => input_rd,
    dout   => input_dout,
    full   => input_full,
    empty  => input_empty
);

output_buffer : tob_buffer_32x1024
port map(
    rst    => RESET_IN,
    wr_clk => CLK_RD_IN,
    rd_clk => CLK_RD_IN,
    din    => output_data,
    wr_en  => output_wr,
    rd_en  => DATA_RE_IN,
    dout   => DATA_OUT, 
    full   => output_full,
    empty  => output_empty
 );

FIFO_OVERFLOW_OUT <= output_full or input_full;

process(CLK_RD_IN)
begin
	if rising_edge(CLK_RD_IN) then
		if RESET_IN = '1' then
			parse_current_state <= IDLE;
		else
			parse_current_state <= parse_next_state;
		end if;
	end if;
end process;

process(parse_current_state, input_empty, bc_ctr, tob_ctr, output_empty, bc_qty, UPDATE_BC_IN)
begin
	case parse_current_state is 
	
		when IDLE =>
			if (input_empty = '0') then
				parse_next_state <= READ_OUT_WORD;
			else
				parse_next_state <= IDLE;
			end if;
			
		when READ_OUT_WORD =>
			parse_next_state <= WAIT_ONE;
			
		when WAIT_ONE =>
			parse_next_state <= SPLIT_INTO_TOBS;
			
		when SPLIT_INTO_TOBS =>
			parse_next_state <= SAVE_TOBS;
			
		when SAVE_TOBS =>
			 if (tob_ctr = 0) then
				if (bc_ctr = bc_qty) then
					parse_next_state <= WAIT_FOR_DATA;
				else
					parse_next_state <= READ_OUT_WORD;
				end if;
			else
				parse_next_state <= SAVE_TOBS;
			end if;
			
		when WAIT_FOR_DATA =>
			if (output_empty = '0') or (input_dout(15 downto 0) = x"0000") then
				parse_next_state <= WAIT_FOR_READOUT;
			else
				parse_next_state <= WAIT_FOR_DATA;
			end if;
			
		when WAIT_FOR_READOUT =>
			if (bc_taken = bc_qty) then
				parse_next_state <= CLEANUP;
			else
				parse_next_state <= WAIT_FOR_READOUT;
			end if;
			
		when CLEANUP =>
			parse_next_state <= IDLE;			

	end case;
end process;

process(CLK_RD_IN)
begin
	if rising_edge(CLK_RD_IN) then
		if (parse_current_state = READ_OUT_WORD) then
			input_rd <= '1';
		else
			input_rd <= '0';
		end if;
	end if;
end process;

process(CLK_RD_IN)
begin
	if rising_edge(CLK_RD_IN) then
		if (parse_current_state = IDLE) then
			bc_ctr <= 0;
		elsif (parse_current_state = READ_OUT_WORD) then
			bc_ctr <= bc_ctr + 1;
		else
			bc_ctr <= bc_ctr;
		end if;
	end if;
end process;

process(CLK_RD_IN)
begin
	if rising_edge(CLK_RD_IN) then
		if (parse_current_state = IDLE or parse_current_state = READ_OUT_WORD) then
			tob_ctr <= 0;
		elsif (parse_current_state = SAVE_TOBS and tob_ctr /= 5) then
			tob_ctr <= tob_ctr + 1;
		else
			tob_ctr <= tob_ctr;
		end if;
	end if;
end process;

tob(31 downto 28) <= TYPE_ID;
tob(27 downto 16) <= (others => '0');

process(CLK_RD_IN)
begin
	if rising_edge(CLK_RD_IN) then
		if (parse_current_state = SPLIT_INTO_TOBS) then
			tob(15 downto 0) <= input_dout(15 downto 0);
		else
			tob(15 downto 0) <= tob(15 downto 0);
		end if;
	end if;
end process;

output_data <= tob;

process(CLK_RD_IN)
begin
	if rising_edge(CLK_RD_IN) then
		if (input_dout(15 downto 0) /= x"0000") then
			if (parse_current_state = SAVE_TOBS) then
				output_wr <= '1';
			elsif (parse_current_state = SPLIT_INTO_TOBS) then
				output_wr <= '1';
			else
				output_wr <= '0';
			end if;
		else
			output_wr <= '0';
		end if;
	end if;
end process;

TOB_COUNTER_OUT <= b"001" when output_empty = '0' else b"000";
DATA_RDY_OUT    <= '1' when parse_current_state = WAIT_FOR_READOUT else '0';

process(CLK_RD_IN)
begin
	if rising_edge(CLK_RD_IN) then
		if (parse_current_state = IDLE) then
			bc_taken <= 0;
		elsif (parse_current_state = WAIT_FOR_READOUT and UPDATE_BC_IN = '1') then
			bc_taken <= bc_taken + 1;
		else
			bc_taken <= bc_taken;
		end if;
	end if;
end process;

end Behavioral;

