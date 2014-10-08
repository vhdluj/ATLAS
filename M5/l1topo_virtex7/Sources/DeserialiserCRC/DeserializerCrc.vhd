------------------------------------------------------------------------------
-- Company: 
-- Engineer: Patric Kiese (main conception and code), 
			 -- Andreas D. Rei� (tidy up, automatic shif_reg_delay/128 Bit alignment, just_done outputs for easier debugging added,
			 -- optional low latency mode added, areiss@students.uni-mainz.de)

-- Create Date: 2013
-- Design Name: 
-- Module Name: DeserializerCrc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 

-- Dependencies: 

-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:

------------------------------------------------------------------------------

library UNISIM;
use UNISIM.VComponents.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use std.textio.all;
-- use ieee.std_logic_textio.all;

use work.L1TopoGTConfiguration.all;

entity DeserializerCrc is
	Generic
	(
		ReduceDeserializerCrcLatencyFrom5To4: std_logic:='0';--reduces the minimum latency of the DeserializerCrc from 5 to 4 160 MHz Ticks
		OptimizeFlipFlopPlacementInLatency5Mode: std_logic:='1'--relaxes Timing at critical Flip Flops
	);
	Port
	(
		GtRxData : in  std_logic_vector(31 downto 0);
		Data128 : out std_logic_vector(127 downto 0);
		ChariskIn : in  std_logic_vector(3 downto 0);
		ChariskOut : out std_logic_vector(15 downto 0);
		Data128AndChariK128_Just_Done: out std_logic;--for easier debugging and understanding of timing
		CrcError : out std_logic;
		CRC_Just_Done : out std_logic;--for easier debugging and understanding of timing
		-- DataShift40MHz  : in  std_logic_vector(2 downto 0):="000";--+-25 ns delay, do not expect this to work for lagre delays
		shift_reg_delay : in  std_logic_vector(4 downto 0);
		clockBus: in std_logic_vector(3 downto 0);
		
		spyData36BitFromMGTs: out std_logic_vector(35 downto 0);
        enablePlaybackOfMGTs: in std_logic;
        playbackData36BitFakingMGTs: in std_logic_vector(35 downto 0)
        
	);
end DeserializerCrc;

architecture Behavioral of DeserializerCrc is
	attribute DONT_TOUCH : string;
	attribute shreg_extract : string;
	attribute DONT_TOUCH of Behavioral : architecture is "TRUE";

	signal parallel_data    : std_logic_vector(127 downto 0);
	signal parallel_data_sr : std_logic_vector(127 downto 0);
	signal charisk          : std_logic_vector(15 downto 0);
	signal data_in,data_in2          : std_logic_vector(31 downto 0);
	signal charisk_in       : std_logic_vector(3 downto 0);
	-- signal shif_reg_delay: std_logic_vector(4 downto 0);

	signal delayed_data,delayed_data2     : std_logic_vector(31 downto 0);
	signal delayed_charisk  : std_logic_vector(3 downto 0);
	signal charisk_sr		: std_logic_vector(15 downto 0);
	
	signal reg_clk			: std_logic:='0';
	signal error			: std_logic:='0';
	signal Data128AndChariK128_Just_Done2,CRC_Just_Done2: std_logic:='0';
	
	signal SubShift: unsigned(2 downto 0):="000";
	signal shift_register	: std_logic_vector(3 downto 0):=(others=>'0');
	signal mask				: std_logic_vector(3 downto 0):="0111";--7

	signal counter			: integer range 0 to 15 :=0;
	signal subtick,subtick2			: integer range 0 to 7	:=0;
	signal rx_subtick_counter: unsigned(2 downto 0);
	signal ShiftTemp1: unsigned(4 downto 0):="00000";
	
	attribute DONT_TOUCH of parallel_data : signal is "TRUE";
	attribute DONT_TOUCH of charisk : signal is "TRUE";	
	
	attribute shreg_extract of ChariskOut : signal is "no";
	attribute shreg_extract of charisk_sr : signal is "no";
	
	attribute shreg_extract of parallel_data_sr : signal is "no";
	attribute shreg_extract of Data128 : signal is "no";
	
	attribute shreg_extract of error : signal is "no";
	attribute shreg_extract of CrcError : signal is "no";
	
	attribute shreg_extract of Data128AndChariK128_Just_Done : signal is "no";
	attribute shreg_extract of Data128AndChariK128_Just_Done2 : signal is "no";
	
	attribute shreg_extract of CRC_Just_Done : signal is "no";
	attribute shreg_extract of CRC_Just_Done2 : signal is "no";
	
	attribute shreg_extract of shift_reg_delay : signal is "no";
	
	
	
	signal delayed_or_faked_data: std_logic_vector(35 downto 0);
	
	
begin
	charisk_in<= ChariskIn;
	
	-- FFshif_reg_delay: process (SysClk160)--relax timing
	-- begin
		-- if rising_edge(SysClk160) then
			-- shif_reg_delay2<=shift_reg_delay;
		-- end if;
	-- end process;
	
	
	SHIFT_REG_GEN: for I in 0 to 31 generate
		SRLC32E_inst: SRLC32E
		generic map
		(
			INIT => X"00000000"
		)
		port map 
		(
			Q => delayed_data(I),-- SRL data output
			Q31 => open,-- SRL cascade output pin
			A => shift_reg_delay,-- 5-bit shift depth select input
			CE => '1',-- Clock enable input
			CLK => clockBus(2),-- Clock input
			D => data_in(I)-- SRL data input
		);
	end generate SHIFT_REG_GEN;

	SHIFT_REG_GEN2: for I in 0 to 3 generate
		SRLC32E_inst: SRLC32E
		generic map 
		(
			INIT => X"00000000"
		)
		port map (
			Q => delayed_charisk(I),-- SRL data output
			Q31 => open,-- SRL cascade output pin
			A => shift_reg_delay ,-- 5-bit shift depth select input
			CE => '1',-- Clock enable input
			CLK => clockBus(2),-- Clock input
			D => charisk_in(I)-- SRL data input
		);
	end generate SHIFT_REG_GEN2;

	CrcCheck: entity work.CRC_CHECK_32b 
	port map
	(
		DATA_in               	=> delayed_data2,
		CRC_ERR               	=> error,
		CRC_Just_Done			=> CRC_Just_Done2,
		clockBus                => clockBus,
		rx_subtick_counter    	=> rx_subtick_counter
	);

	rx_subtick_counter<=to_unsigned(subtick2,3);	
	
	ClkToDataProc: process(clockBus(0))
	begin
		if rising_edge(clockBus(0)) then
			reg_clk<= not reg_clk;	
		end if;
		
	end process;

	ShiftProcess: process(clockBus(2))
	begin
		if rising_edge(clockBus(2)) then
			shift_register(0)<= reg_clk;
			shift_register(1)<= shift_register(0);
			shift_register(2)<= shift_register(1);
			shift_register(3)<= shift_register(2);
		end if;
	end process;

	CounterProc: process(clockBus(2))
	begin
		if rising_edge(clockBus(2)) then
			-- if ChariskIn(0)='1' then--alternative ChariskIn=="0001"
				-- counter<=0;--alternative 6
			-- els
			if shift_register=mask then
				counter<=0;
			else
				counter<=counter+1;
			end if;
		end if;
	end process;

	DelayProc: process(clockBus(2))
	begin
		if rising_edge(clockBus(2)) then
			if counter=3 or counter=7 then
				parallel_data_sr(127 downto 32)<= parallel_data(127 downto 32);-- when counter=3 or counter=7;
				parallel_data_sr(31  downto  0)<= delayed_data;-- when counter=3 or counter=7;
				charisk_sr(15 downto 4)<= charisk(15 downto 4);-- when counter=3 or counter=7 ;
				charisk_sr(3 downto 0)<= delayed_charisk;-- when counter=3 or counter=7;
				Data128AndChariK128_Just_Done2<='1';
			else
				Data128AndChariK128_Just_Done2<='0';
			end if;
		end if;
	end process;



    spyData36BitFromMGTs <= delayed_charisk & delayed_data;
    delayed_or_faked_data <= playbackData36BitFakingMGTs when enablePlaybackOfMGTs='1' else delayed_charisk & delayed_data;    

	DeserProc: process(clockBus(2))
		begin
			if rising_edge(clockBus(2)) then
				case counter is
					when 0 =>	parallel_data(127 downto 96) <= delayed_or_faked_data(31 downto 0);
								charisk(15 downto 12) <= delayed_or_faked_data(35 downto 32);
								subtick<=2;
					when 1 =>	parallel_data(95 downto 64)<= delayed_or_faked_data(31 downto 0);
								charisk(11 downto 8)<=delayed_or_faked_data(35 downto 32);
								subtick<=1;	
					when 2 =>	parallel_data(63 downto 32)<= delayed_or_faked_data(31 downto 0);
								charisk(7 downto 4)<=delayed_or_faked_data(35 downto 32);
								subtick<=0;
					when 3 =>	parallel_data(31 downto 0)<= delayed_or_faked_data(31 downto 0);
								charisk(3 downto 0)<=delayed_or_faked_data(35 downto 32);
								subtick<=3;
					when 4 =>	parallel_data(127 downto 96)<= delayed_or_faked_data(31 downto 0);
								charisk(15 downto 12)<=delayed_or_faked_data(35 downto 32);
								subtick<=2;
					when 5 =>	parallel_data(95 downto 64)<= delayed_or_faked_data(31 downto 0);
								charisk(11 downto 8)<=delayed_or_faked_data(35 downto 32);
								subtick<=1;
					when 6 =>	parallel_data(63 downto 32)	<= delayed_or_faked_data(31 downto 0);
								charisk(7 downto 4)<=delayed_or_faked_data(35 downto 32);
								subtick<=0;
					when 7 =>	parallel_data(31 downto 0)	<= delayed_or_faked_data(31 downto 0);
								charisk(3 downto 0)<=delayed_or_faked_data(35 downto 32);
								subtick<=3;
					when others =>	parallel_data<= (others=>'0');
									charisk<= (others=>'0');
									subtick<=5;
				end case;
			end if;
	end process;	
	
	StandardCRC: if OptimizeFlipFlopPlacementInLatency5Mode='0' or (ReduceDeserializerCrcLatencyFrom5To4='1' and OptimizeFlipFlopPlacementInLatency5Mode='1') generate	
		HighLatency: if ReduceDeserializerCrcLatencyFrom5To4='0' generate	
			delayed_data2<=delayed_data;
			subtick2<=subtick;
			data_in<=data_in2;
			
			OutputProc: process(clockBus(2))
			begin
				if rising_edge(clockBus(2)) then	  
					Data128<=parallel_data_sr;-- when counter=3 or counter=7;
					ChariskOut<=charisk_sr;-- when counter=3 or counter=7;
					Data128AndChariK128_Just_Done<=Data128AndChariK128_Just_Done2;

					CrcError<=error;
					CRC_Just_Done<=CRC_Just_Done2;
					data_in2<=GtRxData;
				end if;
			end process;
		end generate HighLatency;	
		
		LowLatency: if ReduceDeserializerCrcLatencyFrom5To4='1' generate
			subtick2<=subtick;
			data_in2<=GtRxData;
			data_in<=data_in2;
			CrcError<=error;
			CRC_Just_Done<=CRC_Just_Done2;	
			Data128<=parallel_data_sr;-- when counter=3 or counter=7;
			ChariskOut<=charisk_sr;-- when counter=3 or counter=7;
			Data128AndChariK128_Just_Done<=Data128AndChariK128_Just_Done2;
			delayed_data2<=delayed_data;
		end generate LowLatency;
	end generate StandardCRC;
	
	OptimizedCRC: if OptimizeFlipFlopPlacementInLatency5Mode='1' and ReduceDeserializerCrcLatencyFrom5To4='0' generate	
		CrcError<=error;
		CRC_Just_Done<=CRC_Just_Done2;
		data_in<=data_in2;
		data_in2<=GtRxData;
	
		OutputProc: process(clockBus(2))
		begin
			if rising_edge(clockBus(2)) then  
				Data128<=parallel_data_sr;-- when counter=3 or counter=7;
				ChariskOut<=charisk_sr;-- when counter=3 or counter=7;
				Data128AndChariK128_Just_Done<=Data128AndChariK128_Just_Done2;
				delayed_data2<=delayed_data;--ff to mitigate timing problems with crc check
				subtick2<=subtick;
			end if;
		end process;		
	end generate OptimizedCRC;	
end Behavioral;

