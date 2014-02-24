library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity block_builder is
generic (
	FIBERS_QTY : integer range 0 to 80 := 1;
	DECODING   : std_logic_vector(3 downto 0) := b"0001"	
);
port (
	CLK_IN        : in std_logic;
	RESET_IN      : in std_logic;
	
	BC_OFFSET_IN  : in std_logic_vector(5 downto 0);
	BC_QTY_IN     : in std_logic_vector(5 downto 0);
	
	DATA_IN       : in std_logic_vector(FIBERS_QTY * 32 - 1 downto 0);
	DATA_RDY_IN   : in std_logic_vector(FIBERS_QTY - 1 downto 0);
	DATA_SIZES_IN : in std_logic_vector(FIBERS_QTY * 3 - 1 downto 0);
	DATA_RE_OUT   : out std_logic_vector(FIBERS_QTY - 1 downto 0);
	UPDATE_BC_OUT : out std_logic_vector(FIBERS_QTY - 1 downto 0);
	
	DATA_OUT      : out std_logic_vector(31 downto 0);
	DATA_RE_IN    : in std_logic;
	READY_OUT     : out std_logic; -- SLink packet ready (not output fifo empty signal)
	
	BC_SLINK      : in std_logic_vector(31 downto 0) --banch crossing number which is integrated into slink header		
);
end entity block_builder;

architecture RTL of block_builder is

component tob_buffer_32x1024 IS
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
end component;

type constr_states is (IDLE, PREPARE_BLOCK,BUILD_SLINK_HDR,BUILD_B_HDR, BUILD_S_HDR, READOUT_PARSER, SKIP_TO_NEXT,BUILD_SLINK_TRL, CLEANUP);
signal constr_current_state, constr_next_state : constr_states;
signal ones, zeros : std_logic_vector(FIBERS_QTY - 1 downto 0);
signal output_data : std_logic_vector(31 downto 0);
signal output_wr, output_full, output_empty, output_wr_q : std_logic := '0';
signal fibers_left : integer range 0 to 80;
signal fiber_ptr : integer range 0 to 80;
signal fiber_size_left : std_logic_vector(2 downto 0);
signal local_rd : std_logic_vector(FIBERS_QTY - 1 downto 0);
signal block_nr : integer range 0 to 32;
signal bc_qty : integer range 0 to 16;
signal offset : integer range 0 to 16;

--begin pseudo Slink implementation
constant beginOfFragment : std_logic_vector(31 downto 0)  := x"B0F00000";--starting slink packet marker
constant startHeaderMarker : std_logic_vector(31 downto 0) := x"EE1234EE";
constant headerSize : std_logic_vector(31 downto 0) := x"00000009";
constant majorFormatVersion : std_logic_vector(31 downto 0)  := x"03001000";
constant IDs : std_logic_vector(31 downto 0) := x"00710000";
constant runType : std_logic_vector(31 downto 0)  := x"0F000001";
constant eventCounterID : std_logic_vector(31 downto 0)  := x"01000001";
signal   ROD_BCN : std_logic_vector(31 downto 0)  := x"00000001";
constant level1TriggerType : std_logic_vector(31 downto 0)  := x"00000001";--??
constant DetectorSpecyficEvent : std_logic_vector(31 downto 0)  := x"00000001";--??

constant numberOfStatusElements : std_logic_vector(31 downto 0)  := x"00000000";
signal numberOfDataElements : std_logic_vector(31 downto 0) := x"00000000";
signal statusBlockPosition : std_logic_vector(31 downto 0) := x"00000000";
constant EoF : std_logic_vector(31 downto 0) := x"E0F00000";--final marker

signal slinkHdr : std_logic_vector(319 downto 0)  := (others => '0');
signal slinkTrl : std_logic_vector(127 downto 0)  := (others => '0');

signal slinkHdrCnt : integer range 0 to 10  := 0;
signal slinkTrlCnt : integer range 0 to 4  := 0;
signal TOBcnt : std_logic_vector(31 downto 0) := (others => '0');
--end pseudo Slink implementation

begin
--begin pseudo Slink implementation
slinkHdr  <=  DetectorSpecyficEvent & level1TriggerType & ROD_BCN & eventCounterID & runType & IDs & majorFormatVersion & headerSize & startHeaderMarker & beginOfFragment;
slinkTrl  <= EoF & statusBlockPosition & numberOfDataElements & numberOfStatusElements;

ROD_BCN  <=  BC_SLINK;
numberOfDataElements  <= TOBcnt;

--end pseudo Slink implementation

READY_OUT <= not output_empty;

bc_qty <= to_integer(signed(BC_QTY_IN));
offset <= to_integer(signed(BC_OFFSET_IN));

ones  <= (others => '1');
zeros <= (others => '0');

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if (RESET_IN = '1') then
			constr_current_state <= IDLE;
		else
			constr_current_state <= constr_next_state;
		end if;
	end if;
end process;

process(constr_current_state, DATA_RDY_IN, fibers_left, fiber_size_left, fiber_ptr, block_nr,slinkHdrCnt,slinkTrlCnt)
begin
	case constr_current_state is 
		
		when IDLE =>
			if (DATA_RDY_IN = ones) then
				constr_next_state <= BUILD_SLINK_HDR;
			else
				constr_next_state <= IDLE;
			end if;

		--begin pseudo Slink implementation
		when BUILD_SLINK_HDR  => 
		    if(slinkHdrCnt < 9) then
		    	constr_next_state  <= BUILD_SLINK_HDR;
		    else
		    	constr_next_state  <= PREPARE_BLOCK;
		    end if;
		--end pseudo Slink implementation

		when PREPARE_BLOCK =>
			constr_next_state <= BUILD_B_HDR;
		
		when BUILD_B_HDR =>
			constr_next_state <= BUILD_S_HDR;
			
		when BUILD_S_HDR =>
			if (fibers_left < 7) then
				constr_next_state <= SKIP_TO_NEXT;
			else
				constr_next_state <= BUILD_S_HDR;
			end if;
		
		when SKIP_TO_NEXT =>
			constr_next_state <= READOUT_PARSER;
			
		when READOUT_PARSER =>
			if (fiber_size_left = "000") then
				if (fiber_ptr = 0) then
					constr_next_state <= CLEANUP;
				else
					constr_next_state <= SKIP_TO_NEXT;
				end if;
			else
				constr_next_state <= READOUT_PARSER;
			end if; 
		
		when CLEANUP =>
			if (block_nr = bc_qty) then
				constr_next_state <= BUILD_SLINK_TRL;
			else
				constr_next_state <= PREPARE_BLOCK;
			end if;
		--begin pseudo Slink implementation
		when BUILD_SLINK_TRL  =>
			 if(slinkTrlCnt < 3) then
		    	constr_next_state  <= BUILD_SLINK_TRL;
		    else
		    	constr_next_state  <= IDLE;
		    end if;	
			
		--end pseudo Slink implementation	
	end case;
end process; 

output : tob_buffer_32x1024
port map(
	rst    => RESET_IN,
	wr_clk => CLK_IN,
	rd_clk => CLK_IN,
	din    => output_data,
	wr_en  => output_wr,
	rd_en  => DATA_RE_IN,
	dout   => DATA_OUT,
	full   => output_full,
	empty  => output_empty
);

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if (constr_current_state = IDLE) then
			output_data <= (others => '0');
		--begin pseudo Slink implementation
		elsif(constr_current_state = BUILD_SLINK_HDR) then	
			output_data  <= slinkHdr(32*(slinkHdrCnt+1)-1 downto 32*slinkHdrCnt);
		--end pseudo Slink implementation			
		elsif (constr_current_state = BUILD_B_HDR) then
			output_data(31 downto 28) <= b"0001";
			output_data(27 downto 24) <= DECODING;
			output_data(23 downto 16) <= std_logic_vector(to_unsigned(FIBERS_QTY, 8));
			output_data(15 downto 8)  <= (others => '0'); -- CRC
			output_data(7 downto 6)	  <= (others => '0'); -- reserved
			if (offset > block_nr) then -- offset sign
				output_data(7)        <= '0';
			else
				output_data(7)        <= '1';
			end if;
			output_data(4 downto 1)   <= std_logic_vector(to_unsigned((offset - block_nr), 4)); -- offset value
			if (block_nr = bc_qty) then -- last block flag
				output_data(0)        <= '1';
			else
				output_data(0)        <= '0';
			end if;
		elsif (constr_current_state = BUILD_S_HDR) then
			output_data(31 downto 28) <= b"0101";
			for i in 0 to 6 loop
				if (fibers_left - i > 0) then
					output_data(27 - i * 4) <= '0'; -- status flag
					output_data(26 - i * 4 downto 24 - i * 4) <= DATA_SIZES_IN(((fibers_left - i) * 3) - 1 downto (((fibers_left - i) * 3) - 3));
				else
					output_data(27 - i * 4) <= '0'; -- status flag
					output_data(26 - i * 4 downto 24 - i * 4) <= (others => '0');
				end if;
			end loop;
		elsif (constr_current_state = READOUT_PARSER or constr_current_state = SKIP_TO_NEXT) then
			output_data <= DATA_IN(fiber_ptr * 32 + 31 downto fiber_ptr * 32);
		--begin pseudo Slink implementation
		elsif(constr_current_state = BUILD_SLINK_TRL) then		
			output_data  <= slinkTrl(32*(slinkTrlCnt+1)-1 downto 32*slinkTrlCnt);
		--end pseudo Slink implementation
		else
			output_data <= output_data;
		end if;
	end if;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if (constr_current_state = PREPARE_BLOCK) then
			fibers_left <= FIBERS_QTY;
		elsif (constr_current_state = BUILD_S_HDR) then
			fibers_left <= fibers_left - 7;
		else
			fibers_left <= fibers_left;
		end if;
	end if;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if (constr_current_state = PREPARE_BLOCK) then
			fiber_ptr <= FIBERS_QTY - 1;
		elsif ((constr_current_state = READOUT_PARSER) and (fiber_size_left(2 downto 0) = "000") and fiber_ptr > 0) then
			fiber_ptr <= fiber_ptr - 1;
		else
			fiber_ptr <= fiber_ptr;
		end if;
	end if;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if ((constr_current_state = READOUT_PARSER) and (fiber_size_left(2 downto 0) = "000")) then
			UPDATE_BC_OUT(fiber_ptr) <= '1';
		else
			UPDATE_BC_OUT <= (others => '0');
		end if;
	end if;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if (constr_current_state = IDLE) then
			fiber_size_left <= b"000";
		elsif (constr_current_state = SKIP_TO_NEXT) then
			fiber_size_left <= DATA_SIZES_IN(fiber_ptr * 3 + 2 downto fiber_ptr * 3);
		elsif (constr_current_state = READOUT_PARSER) then
			fiber_size_left <= fiber_size_left - 1;
		else
			fiber_size_left <= fiber_size_left;
		end if;
	end if;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if ((constr_current_state = READOUT_PARSER and fiber_size_left > "001") or constr_current_state = SKIP_TO_NEXT) then
			if (DATA_SIZES_IN(fiber_ptr * 3 + 2 downto fiber_ptr * 3) = "000") then
				local_rd <= (others => '0');
			else
				local_rd(fiber_ptr) <= '1';
			end if;
		else
			local_rd <= (others => '0');
		end if;
	end if;
end process;

DATA_RE_OUT <= local_rd;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then		
	TOBcnt  <= TOBcnt;
	--begin pseudo Slink implementation
		if(constr_current_state = BUILD_SLINK_HDR) then
			output_wr <= '1';
			output_wr_q <= '0';
     --end pseudo Slink implementation
		elsif (constr_current_state = BUILD_B_HDR) then
			output_wr <= '1';
			output_wr_q <= '0';
		elsif (constr_current_state = BUILD_S_HDR) then
			output_wr <= '1';
			output_wr_q <= '0';
		elsif (constr_current_state = READOUT_PARSER) then
			if (local_rd /= zeros) then
				output_wr_q <= '1';
				TOBcnt  <= TOBcnt + 1;
			else
				output_wr_q <= '0';
			end if;
			output_wr <= output_wr_q;
	--begin pseudo Slink implementation		
		elsif (constr_current_state = IDLE) then
				TOBcnt  <= (others => '0');
	--end pseudo Slink implementation
		else
			output_wr <= '0';
			output_wr_q <= output_wr_q;
		end if;
	end if;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if (constr_current_state = IDLE) then
			block_nr <= 0;
		elsif (constr_current_state = PREPARE_BLOCK) then
			block_nr <= block_nr + 1;
		else
			block_nr <= block_nr;
		end if;
	end if;
end process;

--begin pseudo Slink implementation
process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if (constr_current_state = BUILD_SLINK_HDR) then
			slinkHdrCnt  <= slinkHdrCnt + 1;
		else
			slinkHdrCnt  <=  0;
		end if;
	end if;
end process;
--end pseudo Slink implementation
--begin pseudo Slink implementation
process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if (constr_current_state = BUILD_SLINK_TRL) then
			slinkTrlCnt  <= slinkTrlCnt + 1;
		else
			slinkTrlCnt  <= 0;
		end if;
	end if;
end process;
--end pseudo Slink implementation
end architecture RTL;
