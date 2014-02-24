----------------------------------------------------------------------------------
--Author   Pawel Strzempek
--Contact: pawel.strzempek@uj.edu.pl
----------------------------------------------------------------------------------
--DESCRIPTION
--Component which takes data (128 b) and transforms it into TOB (trigger object).
--This comonente is responsible fr TOB of energy building. In each incoming data
--block (128 b) there may be maximally 5 (tobs) x 23 b (each) and 12b CRC. The 
--data are put to inPutFifo from which are take one by one. Each 128 b is divided 
--into 23 bit TOB. If the 23 bit TOB is 0 (23x0bit) then it is discarded and next
--23 bits are taken. After iterarting through all the 128 bits the BC counter is checked.
--BC_counter tells how many of the 128 bit blocks are to be taken into one Slink 
--packet. If BC_cnt = 3 then three  128 bit blocks are taken. Each block is
--searche trough for the TOBs and then next block is taken.  After all blocks
--(according to BC_cnt) were processed then the data ready signal is rised.
--Another component (block builder) checks how many TOBs were found (TOB_cnt)
--read them in and sends update_bc. Then TOB_cnt is updated and the procedure repeats.
--
--As long as there is data ready set and the data is not taken from the component (by 
--setting data_re_in 1) the component waits and is not processing further data. 
--(only input fifo is filling up)
--




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity energy_parser is
generic (
	TYPE_ID           : std_logic_vector(3 downto 0) := b"0010"
);
port (
	CLK_WR_IN         : in std_logic;
	CLK_RD_IN         : in std_logic;--assuming it is faster clock
	RESET_IN          : in std_logic;
	
	DATA_IN           : in std_logic_vector(127 downto 0);
	DATA_WE_IN        : in std_logic;
	
	DATA_OUT          : out std_logic_vector(31 downto 0);
	DATA_RE_IN       : in std_logic;
	
	DATA_RDY_OUT      : out std_logic;
	TOB_COUNTER_OUT   : out std_logic_vector(2 downto 0);
	CRC_ERR_OUT       : out std_logic;
	FIFO_OVERFLOW_OUT : out std_logic;
	
	BC_OFFSET_IN : in std_logic_vector(5 downto 0);
	BC_QTY_IN :    in std_logic_vector(5 downto 0);
	
	UPDATE_BC_IN : in std_logic
);
end energy_parser;

architecture Behavioral of energy_parser is

--FIFO which will store incoming data
COMPONENT tob_buffer_128x512 
  PORT  (
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
PORT
(
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
  
COMPONENT crc
PORT
(
 data_in : in std_logic_vector (127 downto 0);
 rst, clk : in std_logic;
 crc_out : out std_logic_vector (11 downto 0)		
);
END COMPONENT;

signal rst : std_logic  := '0';
signal InFifoRE : std_logic  := '0';
signal dataBlock32  : std_logic_vector(31 downto 0) := (others => '0');
signal dataBlock128  : std_logic_vector(127 downto 0) := (others => '0');
signal inFifoFull : std_logic  := '0';
signal inFifoEmpty : std_logic  := '0';  
signal outFifoFull : std_logic  := '0';
signal outFifoEmpty : std_logic  := '0';  
signal outFifoWE : std_logic  := '0'; 
signal crcFlag : std_logic_vector(11 downto 0)  :=  (others => '0');
signal crcRst : std_logic  := '0';
signal bc_offset : std_logic_vector(5 downto 0) := (others => '0');
signal bc_qty : std_logic_vector(5 downto 0) := (others => '0');
signal TOadded : std_logic  :=  '0';
signal bcq_sig : unsigned (5 downto 0):= (others => '0');
signal ready_cnt : std_logic_vector(5 downto 0)  := (others => '0');

type NIBBLE is array (31 downto 0) of std_logic_vector(2 downto 0)  ;
signal tob_cnt_array : NIBBLE := (others=> (others=>'0'));

 --FSM decryption:
 -- +idle           - initial state
 -- +readIn         - reads the data form the inFifo. It starts when inFifo emty flag goes to 0
 -- +zeroToDetectio - detects if curent taken 23 bits (from 128 b block) are equal zeros. If yes then we
 --	  			  - we skip the TOB concerning it as non existing
 -- +addTO          - adding TOB to output fifo and incrementing tob_cnt(i)
 -- +reduceCnt      - decrement the index which serves to iterate through 128 b block and if the block
 --  			        is over then it checks the BC_cnt. Depending on BC_cnt it takes next 128b block or proceed 
 --  			        to the next state.
 -- +fifoProcessing - waiting for the data to occure in output fifo
 -- +ready          - sets data_rdy_out flag and waits until the data has been read. Then it goes to the idle
 
 type state_t is (idle, readIn,zeroTodetectio, addTO,reduceCnt,fifoProcessing,ready);
 signal state : state_t;
  
begin

--incoming fifo stores incoming words of length 128
incoming_buffor : tob_buffer_128x512 
  port map (
    rst     =>  rst, 
    wr_clk  => CLK_WR_IN,
    rd_clk  => CLK_RD_IN,
    din     => DATA_IN,
    wr_en   => DATA_WE_IN,
    rd_en   => inFifoRE,
    dout    => dataBlock128, 
    full    => inFifoFull,
    empty   => inFifoEmpty
  ); 
  
--outgoing fifo stores 32 bits of ROD energy tob format. 
--FORMAT: 4b - header 5b - reserved 23b - TOB energy  
outgoing_buffor : tob_buffer_32x1024
port map
(
    rst  => rst,
    wr_clk => CLK_RD_IN,
    rd_clk => CLK_RD_IN,
    din    => dataBlock32,
    wr_en  => outFifoWe,
    rd_en  => DATA_RE_IN, 
    dout   => DATA_OUT,  
    full   => outFifoFull,
    empty  => outFifoEmpty
);

checker : crc
port map
(
	data_in  => dataBlock128, 
 	rst  => crcRst,
 	clk  => CLK_RD_IN,
 	crc_out  => crcFlag	
);

 
dataProcessing : process (CLK_RD_IN,rst, state,inFifoEmpty,outFifoEmpty,InFifoRE)
variable offset : integer := 127;
variable tob_indexer : integer  range 0 to 31  := 0;
begin 
	if (rst = '1') then
		state <= idle;
		InFifoRE <= '0';
		crcRst  <= '0';
		outFifoWE  <= '0';
		DATA_RDY_OUT  <= '0';
		offset := 127;
		bcq_sig  <= unsigned(bc_qty);
		tob_indexer  :=  0;
		ready_cnt  <= b"000001";
	elsif rising_edge(CLK_RD_IN) then
		InFifoRE <= '0';
		crcRst  <= '0';
		outFifoWE  <= '0';
		DATA_RDY_OUT  <= '0';
		TOadded  <= '0';
		bcq_sig <= bcq_sig;
		ready_cnt  <=  ready_cnt;
		if(tob_indexer  = 32) then
			 tob_indexer  := 0;
			else
			 tob_indexer  :=  tob_indexer;
		end if;
	
		case state is
		    when idle =>
		    	bcq_sig  <= unsigned(bc_qty);
		    	ready_cnt  <= b"000001";
		    	if(inFifoEmpty = '1') then
				  state <= idle;
				else
				  state  <= readIn;
				  tob_cnt_array(tob_indexer)  <= (others  => '0'); 
				end if;
			when readIn =>
				if(inFifoEmpty = '0' and  InFifoRE  = '1') then --there is data in incoming buffer
					crcRst  <=  '1';
					state  <= zeroTodetectio;
				else
				    InFifoRE <= '1';
					state <= readIn;
				end if;
			when zeroTodetectio  =>	
				    TOadded  <=  TOadded;
				    if ( dataBlock128(offset downto offset-22) = "00000000000000000000000") then
				       state  <=  reduceCnt;
				    else
				       state  <= addTO;
				    end if;
			when addTO => --add trigger object
			        dataBlock32  <= TYPE_ID & "00000" & dataBlock128(offset downto offset-22);
			        outFifoWE <= '1';
					tob_cnt_array(tob_indexer)  <= tob_cnt_array(tob_indexer) +1 ;
					TOadded  <= '1';
					state <= reduceCnt;
			when reduceCnt => 
					TOadded  <= TOadded;
					if(offset /= 35) then
					  offset := offset -23;
					  state  <= zeroTodetectio;
					 elsif (bcq_sig>1) then
					  bcq_sig  <= bcq_sig - 1;
					  offset  := 127;
					  tob_indexer := tob_indexer+1;
					  state  <= readIn;
					else
					  offset  := 127;
					  tob_indexer := tob_indexer+1;
					  state  <= fifoProcessing;
					end if;
			when fifoProcessing  => 
			        TOadded  <= TOadded;
					if(outFifoEmpty = '0' or TOadded = '0') then
						state <= ready;
					else
						state <= fifoProcessing;
					end if;		
			when ready  =>
					if(UPDATE_BC_IN = '1' and ready_cnt = bc_qty) then
			          state  <= idle;
			          DATA_RDY_OUT   <= '0';
			        else
   			          DATA_RDY_OUT  <= '1';
			          state <= ready;
			        end if;        	
			        
			        if(UPDATE_BC_IN = '1') then
			        	ready_cnt  <= ready_cnt +1;
			        else
			            ready_cnt  <= ready_cnt;
			        end if;
		end case;
	end if;
end process;


process (CLK_RD_IN,crcFlag)
variable tob_indexer : integer range 0 to 30  := 0 ; 
begin
	if rising_edge(CLK_RD_IN) then
		FIFO_OVERFLOW_OUT  <= inFifoFull;
		
		if (UPDATE_BC_IN = '1') then--IF we get puls from block builder then we go to the next TOB counter
			tob_indexer := tob_indexer + 1;
		end if;
		--RESETING TOB INDEXER
		if(tob_indexer  = 32) then
			tob_indexer  := 0;
			else
			tob_indexer  := tob_indexer;
		end if;
		
		
		TOB_COUNTER_OUT  <= tob_cnt_array(tob_indexer);--we put to port 	
		
		if(crcFlag = "000000000000") then
		CRC_ERR_OUT <= '0';
		else 
		CRC_ERR_OUT <= '1';
		end if;	
	end if;
end process;

bc_offset  <= BC_OFFSET_IN; 
bc_qty    <=    BC_QTY_IN;


end Behavioral;

