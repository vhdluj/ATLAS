----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andreas Rei� (areiss@students.uni-mainz.de)
-- 
-- Create Date: 11.06.2014 12:15:57
-- Design Name: 
-- Module Name: GT_Inout - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: merges and reorganizes DeserializerCrc, DeserializerCRCAutoAlign128Bit, GT_Topo_Universal ... to make code better readable and the design meet timing
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

use work.L1TopoGTConfiguration.all;

entity GT_Inout is
	Generic
	(
	ReduceDeserializerCrcLatencyFrom5To4: std_logic:='0';--reduces the minimum latency of the DeserializerCrc from 5 to 4 160 MHz Ticks
	OptimizeFlipFlopPlacementInLatency5Mode: std_logic:='1';--relaxes Timing at critical Flip Flops
	Add160MHzFFsAfterDeserializerCrc: std_logic:='0';--for easier timing constraints
	SynchronizeRxData128AndCharisk128To40MHzFF: std_logic:='1';--synchronize the 128 bit data words to 40 MHz rising edge
	AddTxInputFFIn160MHz: std_logic:='1';--add incoming Tx FF
	MakeData128AndCRC128To0WhenCRCErrorIs1: std_logic:='0';--synchronize the 128 bit data words to 40 MHz rising edge
	UseGTDummies: std_logic:='0'--'1' use a simple dummy GT loopback transmitter on channel TxMGTLow, which is connected to all dummy receiver channels, instead of the real ones; only for simulation purpose
	);
    Port 
	(
	--physical connection to FPGA pins
	RxP: in std_logic_vector(MGTHigh downto MGTLow);
	RxN: in std_logic_vector(MGTHigh downto MGTLow);
	TxP: out std_logic_vector(TxMGTHigh downto TxMGTLow);
	TxN: out std_logic_vector(TxMGTHigh downto TxMGTLow);
	MgtRefClk0P: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz
	MgtRefClk0N: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz
	MgtRefClk1P: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz
	MgtRefClk1N: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz

	--internal FPGA clock signals after MMCM
	UsrClkIn: in std_logic;--320.64 MHz at the moment
	UsrClk2In: in std_logic;--320.64 MHz at the moment
	SYSCLK40: in std_logic;--40.08 MHz clock must be present at startup immediately
	clockBus: in std_logic_vector(3 downto 0);
	
	--GT transmitter signals
	GtTxData: in  arraySLV32(TxMGTHigh downto TxMGTLow);
	GtTxCharIsK: in  arraySLV4(TxMGTHigh downto TxMGTLow); 

	--IP Bus/VIO related signals
	ChannelControl: in arraySLV32(MGTHigh downto MGTLow);
	QuadControl: in arraySLV32(QuadHigh downto QuadLow);
	ChannelStatus: out arraySLV32(MGTHigh downto MGTLow);
	DataShift40MHz: in  arraySLV3(MGTHigh downto MGTLow);--+-25 ns delay, do not expect this to work for large delays
	CRCError_Amount: out arraySLV32(MGTHigh downto MGTLow);
	
	--Data for algorithms (and CRC)--> this are the only signals needed for algorithms
	Data128: out arraySLV128(MGTHigh downto MGTLow);
	
	--Debug ports, leave open when you do not want to debug and want to save some logic resources
	Charisk128: out arraySLV16(MGTHigh downto MGTLow);
	GtRxData: out arraySLV32(MGTHigh downto MGTLow);
	GtRxCharIsK: out arraySLV4(MGTHigh downto MGTLow);
	Data128AndChariK128_Just_Done: out arraySL(MGTHigh downto MGTLow);--for easier debugging and understanding of timing
	CrcError: out arraySL(MGTHigh downto MGTLow);
	CRC_Just_Done: out arraySL(MGTHigh downto MGTLow);--for easier debugging and understanding of timing
	
	spyData36BitFromMGTs: out arraySLV36(MGTHigh downto MGTLow);
    enablePlaybackOfMGTs: in std_logic;
    playbackData36BitFakingMGTs: in arraySLV36(MGTHigh downto MGTLow)
	
	);
end GT_Inout;

architecture Behavioral of GT_Inout is
	attribute DONT_TOUCH : string; 
	attribute shreg_extract : string;	
	attribute keep : string;	
	attribute DONT_TOUCH of Behavioral : architecture is "TRUE";
	
	--Align128Bit
	signal Channel_I: integer range 0 to 127:=MGTLow;
	-- signal DeadTime: unsigned(15 downto 0):=(others=>'0');
	signal DeadTimeSTD: std_logic_vector(15 downto 0):=(others=>'0');
	signal shift_reg_delay,shift_reg_delay2: arraySLV5(MGTHigh downto MGTLow);
	signal Charisk128_0,Charisk128_1,Charisk128_2,Charisk128_3: arraySLV16(MGTHigh downto MGTLow);

	--Gen_DeserializerCrc
	signal GtRxData2: arraySLV32(MGTHigh downto MGTLow);
	signal Data128_2,Data128_3: arraySLV128(MGTHigh downto MGTLow);
	signal GtRxCharIsK2: arraySLV4(MGTHigh downto MGTLow);
	signal Data128AndChariK128_Just_Done2,Data128AndChariK128_Just_Done3,CrcError2,CrcError3,CRC_Just_Done2,CRC_Just_Done3: arraySL(MGTHigh downto MGTLow);
	
	--Virtex7_4gt
	signal GtTxCharIsK2: arraySLV4(TxMGTHigh downto TxMGTLow); 
	signal GtTxData2: arraySLV32(TxMGTHigh downto TxMGTLow);
	
	--Align128BitFF
	signal Charisk128Align,Charisk128Align2: arraySLV4(MGTHigh downto MGTLow);
	signal SubShift0,SubShift1,SubShift2,SubShift3: std_logic_vector(1 downto 0):="00";
	signal SubShift0D,SubShift1D,SubShift2D,SubShift3D: std_logic_vector(1 downto 0):="00";
	signal ChannelsRingOff,ChannelsRingOffD,Data128AndChariK128_Just_Done3SLV,CrcError3SLV,CRC_Just_Done3SLV: std_logic_vector(0 downto 0):="0";
	signal ChannelSTD,ChannelSTD_D: std_logic_vector(6 downto 0):=std_logic_vector(to_unsigned(MGTLow,7));
	
	COMPONENT vio_128_bit_align_debug
	  PORT (
		clk : IN STD_LOGIC;
		probe_in0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		probe_in1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		probe_in2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		probe_out0 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		probe_out1 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		probe_out2 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		probe_out3 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		probe_out4 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		probe_out5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		probe_out6 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	  );
	END COMPONENT;
	ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	ATTRIBUTE SYN_BLACK_BOX OF vio_128_bit_align_debug : COMPONENT IS TRUE;
	ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
	ATTRIBUTE BLACK_BOX_PAD_PIN OF vio_128_bit_align_debug : COMPONENT IS "clk,probe_in0[3:0],probe_in1[4:0],probe_in2[15:0],probe_out0[1:0],probe_out1[1:0],probe_out2[1:0],probe_out3[1:0],probe_out4[0:0],probe_out5[6:0],probe_out6[2:0]";

	
	COMPONENT ila_crc
	  PORT (
		clk : IN STD_LOGIC;
		probe1 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		probe7 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		probe2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		probe3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		probe8 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		probe9 : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	  );
	END COMPONENT;
	-- ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	ATTRIBUTE SYN_BLACK_BOX OF ila_crc : COMPONENT IS TRUE;
	-- ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
	ATTRIBUTE BLACK_BOX_PAD_PIN OF ila_crc : COMPONENT IS "clk,probe1[127:0],probe7[4:0],probe0[31:0],probe2[3:0],probe3[15:0],probe4[0:0],probe5[0:0],probe6[0:0],probe8[31:0],probe9[3:0]";

	
	signal Charisk128AlignChannel: std_logic_vector(3 downto 0);
	signal ManualFineShift: std_logic_vector(2 downto 0):="000";
	signal Channelshift_reg_delay: std_logic_vector(4 downto 0);
	
	attribute keep of Charisk128AlignChannel: signal is "TRUE";
	attribute keep of Channelshift_reg_delay: signal is "TRUE";
	attribute keep of SubShift0: signal is "TRUE";
	attribute keep of SubShift1: signal is "TRUE";
	attribute keep of SubShift2: signal is "TRUE";
	attribute keep of SubShift3: signal is "TRUE";
	attribute keep of ChannelSTD: signal is "TRUE";
	attribute keep of ChannelsRingOff: signal is "TRUE";
	attribute keep of DeadTimeSTD: signal is "TRUE";
	attribute keep of ManualFineShift: signal is "TRUE";
	
	attribute keep of GtRxData2: signal is "TRUE";
	attribute keep of Data128_3: signal is "TRUE";
	attribute keep of GtRxCharIsK2: signal is "TRUE";
	attribute keep of Charisk128_3: signal is "TRUE";
	attribute keep of Data128AndChariK128_Just_Done3: signal is "TRUE";
	attribute keep of CrcError3: signal is "TRUE";
	attribute keep of CRC_Just_Done3: signal is "TRUE";
	attribute keep of shift_reg_delay: signal is "TRUE";
	attribute keep of Data128AndChariK128_Just_Done3SLV: signal is "TRUE";
	attribute keep of CrcError3SLV: signal is "TRUE";
	attribute keep of CRC_Just_Done3SLV: signal is "TRUE";

	attribute shreg_extract of Charisk128_3 :signal is "NO";	
	attribute shreg_extract of Charisk128Align2 :signal is "NO";	
	attribute shreg_extract of Charisk128Align :signal is "NO";	
	attribute shreg_extract of shift_reg_delay2 :signal is "NO";	
	attribute shreg_extract of shift_reg_delay :signal is "NO";	
	-- attribute shreg_extract of DeadTime :signal is "NO";	
	
begin
	Align128BitP_I_gen: for Channel_I in MGTLow to MGTHigh generate	
		Align128Bit: process (clockBus(0))--one process which aligns successively all GT channels
			variable SubShift: unsigned(1 downto 0):="00";
			variable SubShift2: unsigned(1 downto 0):="00";
			variable SubShift3: unsigned(1 downto 0):="00";
			variable DeadTime: unsigned(3 downto 0):=(others=>'1');
		begin
			if rising_edge(clockBus(0)) then
				if DeadTime = "1111" then--to give shift_reg_delay2 init values
					shift_reg_delay2(Channel_I)<=(others=>'0');
					DeadTime:=DeadTime+1;
				elsif DeadTime/="1110" then
					DeadTime:=DeadTime+1;
				end if;
				
				if DeadTime="1110" then
						if (Charisk128Align(Channel_I)="1000") then--alternative charisk_sr =b"0001_0000_0000_0001" but consumes more logic
							SubShift:="01";--SubShift0D;
							DeadTime:="0000";
						-- elsif (Charisk128Align(Channel_I)="0100")then--alternative charisk_sr =b"0000_0001_0000_0000" but consumes more logic
							-- SubShift:="00";--SubShift1D;
						elsif (Charisk128Align(Channel_I)="0010")then--alternative charisk_sr =b"0000_0000_0001_0000" but consumes more logic
							SubShift:="11";--keep setting
							DeadTime:="0000";
						elsif (Charisk128Align(Channel_I)="0001")then --alternative charisk_sr =b"0000_0000_0000_0001" but consumes more logic
							SubShift:="10";--SubShift3D;
							DeadTime:="0000";
						else
							SubShift:="00";
						end if;
						-- shift_reg_delay2(Channel_I)<= DataShift40MHz(Channel_I) & SubShift;--<=DataShift40MHz(Channel_I) + SubShift
						
						-- if ManualFineShift(2)='0' then
							if shift_reg_delay2(Channel_I)(1 downto 0)="00" or shift_reg_delay2(Channel_I)(1 downto 0)="01" or shift_reg_delay2(Channel_I)(1 downto 0)="10" or shift_reg_delay2(Channel_I)(1 downto 0)="11" then
								SubShift2:=unsigned(shift_reg_delay2(Channel_I)(1 downto 0));
							else
								SubShift2:="00";
							end if;
							SubShift3:=SubShift2+SubShift;
							-- SubShift3:=SubShift;
							shift_reg_delay2(Channel_I)(4 downto 2)<=DataShift40MHz(Channel_I);
							shift_reg_delay2(Channel_I)(1 downto 0)<= std_logic_vector(SubShift3);
						-- elsif ManualFineShift(2)='1' then
							-- shift_reg_delay2(Channel_I)<= "000" & ManualFineShift(1 downto 0);--<=DataShift40MHz(Channel_I) + SubShift
						-- end if;
						
						-- if Channel_I=MGTHigh and ChannelsRingOffD="0" then
							-- Channel_I<=MGTLow;
						-- elsif (ChannelsRingOffD="0") then
							-- Channel_I<=Channel_I+1;
						-- elsif (ChannelsRingOffD="1") then
							-- Channel_I<=to_integer(unsigned(ChannelSTD_D));
						-- end if;
				end if;
				shift_reg_delay(Channel_I)<=shift_reg_delay2(Channel_I);
				-- Charisk128AlignChannel<=Charisk128Align(Channel_I);
				-- Channelshift_reg_delay<=shift_reg_delay2(Channel_I);
			end if;
		end process;
	end generate Align128BitP_I_gen;
	
	-- vio_128_bit_align_debug_I : vio_128_bit_align_debug
	-- PORT MAP (
	-- clk => clockBus(0),
	-- probe_in0 => Charisk128AlignChannel,
	-- probe_in1 => Channelshift_reg_delay,
	-- probe_in2 => DeadTimeSTD,
	-- probe_out0 => SubShift0,--0
	-- probe_out1 => SubShift1,--1
	-- probe_out2 => SubShift2,--2
	-- probe_out3 => SubShift3,--3
	-- probe_out4 => ChannelsRingOff,
	-- probe_out5 => ChannelSTD,
	-- probe_out6 => ManualFineShift
	-- );

	-- Align128Shifts: process (clockBus(0))--one process which aligns successively all GT channels
	-- begin
		-- if rising_edge(clockBus(0)) then	
			-- -- SubShift0D<=SubShift0;
			-- -- SubShift1D<=SubShift1;
			-- -- SubShift2D<=SubShift2;
			-- -- SubShift3D<=SubShift3;
			-- ChannelsRingOffD<=ChannelsRingOff;
			-- ChannelSTD_D<=ChannelSTD;
			-- -- DeadTimeSTD<=std_logic_vector(DeadTime);
		-- end if;
	-- end process;
	
	Align128BitFF_I_generate: for I in MGTLow to MGTHigh generate	
		Align128BitFF_I: process (clockBus(0))--one process which aligns successively all GT channels
		begin
			if rising_edge(clockBus(0)) then
				Charisk128Align(I)(0)<=Charisk128_1(I)(0);
				Charisk128Align(I)(1)<=Charisk128_1(I)(4);
				Charisk128Align(I)(2)<=Charisk128_1(I)(8);
				Charisk128Align(I)(3)<=Charisk128_1(I)(12);
				-- Charisk128Align(I)<=Charisk128Align2(I);
			end if;
		end process;
	end generate Align128BitFF_I_generate;

--	ila_crc_I : ila_crc
--	PORT MAP (
--	clk => clockBus(2),
--	probe0 => GtRxData2(MGTLow),
--	probe1 => Data128_3(MGTLow),
--	probe2 => GtRxCharIsK2(MGTLow),
--	probe3 => Charisk128_3(MGTLow),
--	probe4 => Data128AndChariK128_Just_Done3SLV,
--	probe5 => CrcError3SLV,
--	probe6 => CRC_Just_Done3SLV,
--	probe7 => shift_reg_delay(MGTLow),
--	probe8 => GtTxData(MGTLow),
--    probe9 => GtTxCharIsK(MGTLow)
--	);
	
	Data128AndChariK128_Just_Done3SLV(0)<=Data128AndChariK128_Just_Done3(MGTLow);
	CrcError3SLV(0)<=CrcError3(MGTLow);
	CRC_Just_Done3SLV(0)<=CRC_Just_Done3(MGTLow);

	CRC_Error_Counter_gen: for Channel_I in MGTLow to MGTHigh generate	
		CRC_Error_Counter_I: process (clockBus(0))
			variable NoOfCRCError: unsigned(31 downto 0):=(others=>'0');
		begin
			if rising_edge(clockBus(0)) then
				if ChannelControl(Channel_I)(31)='1' then
					NoOfCRCError:=(others=>'0');				
				elsif CrcError2(Channel_I)='1' then
					NoOfCRCError:=NoOfCRCError+1;
				end if;
				CRCError_Amount(Channel_I)<=std_logic_vector(NoOfCRCError);
			end if;
		end process;
	end generate CRC_Error_Counter_gen;
	
	Gen_DeserializerCrc: for I in MGTLow to MGTHigh generate	
		DeserializerCrc_I :entity work.DeserializerCrc
		Generic Map (
		ReduceDeserializerCrcLatencyFrom5To4=>ReduceDeserializerCrcLatencyFrom5To4,
		OptimizeFlipFlopPlacementInLatency5Mode=>OptimizeFlipFlopPlacementInLatency5Mode
		)
		Port Map(
			GtRxData=> GtRxData2(I),--
			Data128=> Data128_3(I),--
			ChariskIn=> GtRxCharIsK2(I),
			ChariskOut=> Charisk128_3(I),--
			Data128AndChariK128_Just_Done=> Data128AndChariK128_Just_Done3(I),--
			CrcError=> CrcError3(I),--
			CRC_Just_Done=>CRC_Just_Done3(I),--
			shift_reg_delay=>shift_reg_delay(I),
			clockBus=> clockBus,--
			
			spyData36BitFromMGTs => spyData36BitFromMGTs(I),
            enablePlaybackOfMGTs => enablePlaybackOfMGTs,
            playbackData36BitFakingMGTs => playbackData36BitFakingMGTs(I)
            
		);
		
		Add160MHzFFsAfterDeserializerCrc_generate_I: if Add160MHzFFsAfterDeserializerCrc='1' generate
			OutputFF160MHz: process(clockBus(2))
			begin
				if rising_edge(clockBus(2)) then	  
					Data128_2(I)<=Data128_3(I);
					Charisk128_2(I)<=Charisk128_3(I);
					Data128AndChariK128_Just_Done2(I)<=Data128AndChariK128_Just_Done3(I);
					CrcError2(I)<=CrcError3(I);
					CRC_Just_Done2(I)<=CRC_Just_Done3(I);
				end if;
			end process;
		end generate Add160MHzFFsAfterDeserializerCrc_generate_I;
		
		DoNotAdd160MHzFFsAfterDeserializerCrc_generate_I: if Add160MHzFFsAfterDeserializerCrc='0' generate
			Data128_2(I)<=Data128_3(I);
			Charisk128_2(I)<=Charisk128_3(I);
			Data128AndChariK128_Just_Done2(I)<=Data128AndChariK128_Just_Done3(I);
			CrcError2(I)<=CrcError3(I);
			CRC_Just_Done2(I)<=CRC_Just_Done3(I);
		end generate DoNotAdd160MHzFFsAfterDeserializerCrc_generate_I;
	end generate Gen_DeserializerCrc;
	
	GT_Topo_Universal_gen: if UseGTDummies='0' generate
		Virtex7_4gt : entity work.GT_Topo_Universal
			Port Map (
			RxP => RxP,--
			RxN => RxN,--
			TxP => TxP,--
			TxN => TxN,--

			ChannelControl => ChannelControl,--
			QuadControl => QuadControl,--
			ChannelStatus => ChannelStatus,--

			GtTxCharIsK => GtTxCharIsK2,--
			GtRxCharIsK => GtRxCharIsK2,--

			UsrClkIn => UsrClkIn,--
			UsrClk2In => UsrClk2In,--
			SYSCLK40=> SYSCLK40,--
			
			GtRxDataOut => GtRxData2,--
			GtTxDataIn => GtTxData2,--

			MgtRefClk0P=>MgtRefClk0P,--
			MgtRefClk0N=>MgtRefClk0N,--           
			MgtRefClk1P=>MgtRefClk1P,--
			MgtRefClk1N=>MgtRefClk1N-- 
		);
	end generate GT_Topo_Universal_gen;
	
	UseGTDummies_gen: if UseGTDummies='1' generate
		AllChannels: for I in MGTLow to MGTHigh generate	
			GtRxCharIsK2(I)<=GtTxCharIsK2(TxMGTLow);--receive only from channel TxMGTLow
			GtRxData2(I)<=GtTxData2(TxMGTLow);--receive only from channel TxMGTLow
			ChannelStatus(I)<=(others=>'0');
		end generate AllChannels;
		TxP<=(others=>'1');
		TxN<=(others=>'0');
	end generate UseGTDummies_gen;	
	
	SynchronizeTo40MHZ_generate1: if SynchronizeRxData128AndCharisk128To40MHzFF='1' generate	
		ZeroData128OrNot: for I in MGTLow to MGTHigh generate	
			ZeroData128: if MakeData128AndCRC128To0WhenCRCErrorIs1='1' generate	
				SynchronizeTo40MHz: process(clockBus(0))
				begin
					if rising_edge(clockBus(0)) then	  
						if CrcError2(I)='1' then
							Data128(I)<=(others=>'0');
							Charisk128_1(I)<=(others=>'0');
						else
							Data128(I)<=Data128_2(I);
							Charisk128_1(I)<=Charisk128_2(I);
						end if;
						CRC_Just_Done(I)<=CRC_Just_Done2(I);
						CrcError(I)<=CrcError2(I);
						Data128AndChariK128_Just_Done(I)<=Data128AndChariK128_Just_Done2(I);
						GtRxData(I)<=GtRxData2(I);
						GtRxCharIsK(I)<=GtRxCharIsK2(I);
					end if;
				end process;
			end generate ZeroData128;
		end generate ZeroData128OrNot;
		
		DoNotZeroData128: if MakeData128AndCRC128To0WhenCRCErrorIs1='0' generate	
			SynchronizeTo40MHz: process(clockBus(0))
			begin
				if rising_edge(clockBus(0)) then	  
					Data128<=Data128_2;
					Charisk128_1<=Charisk128_2;
					CRC_Just_Done<=CRC_Just_Done2;
					CrcError<=CrcError2;
					Data128AndChariK128_Just_Done<=Data128AndChariK128_Just_Done2;
					GtRxData<=GtRxData2;
					GtRxCharIsK<=GtRxCharIsK2;
				end if;
			end process;
		end generate DoNotZeroData128;
	end generate SynchronizeTo40MHZ_generate1;
	
	SynchronizeTo40MHZ_generate0: if SynchronizeRxData128AndCharisk128To40MHzFF='0' generate	
		ZeroData128OrNot: for I in MGTLow to MGTHigh generate
			ZeroData128: if MakeData128AndCRC128To0WhenCRCErrorIs1='1' generate	
				Data128(I)<=Data128_2(I) when CrcError2(I)='0' else (others=>'0');
				Charisk128_1(I)<=Charisk128_2(I) when CrcError2(I)='0' else (others=>'0');
				CRC_Just_Done(I)<=CRC_Just_Done2(I);
				CrcError(I)<=CrcError2(I);
				Data128AndChariK128_Just_Done(I)<=Data128AndChariK128_Just_Done2(I);
				GtRxData(I)<=GtRxData2(I);
				GtRxCharIsK(I)<=GtRxCharIsK2(I);
			end generate ZeroData128;		
		end generate ZeroData128OrNot;
		
		DoNotZeroData128: if MakeData128AndCRC128To0WhenCRCErrorIs1='0' generate	  
			Data128<= Data128_2;
			Charisk128_1<=Charisk128_2;
			CRC_Just_Done<=CRC_Just_Done2;
			CrcError<=CrcError2;
			Data128AndChariK128_Just_Done<=Data128AndChariK128_Just_Done2;
			GtRxData<=GtRxData2;
			GtRxCharIsK<=GtRxCharIsK2;
		end generate DoNotZeroData128;			
	end generate SynchronizeTo40MHZ_generate0;	
	
	Charisk128<=Charisk128_1;
	
	TxInputFF_generate1: if AddTxInputFFIn160MHz='1' generate
		AddTxFF: process(clockBus(2))
		begin
			if rising_edge(clockBus(2)) then
				GtTxData2<=GtTxData;
				GtTxCharIsK2<=GtTxCharIsK;
			end if;
		end process;
	end generate TxInputFF_generate1;	
	
	TxInputFF_generate0: if AddTxInputFFIn160MHz='0' generate	
		GtTxData2<=GtTxData;
		GtTxCharIsK2<=GtTxCharIsK;
	end generate TxInputFF_generate0;
end Behavioral;
