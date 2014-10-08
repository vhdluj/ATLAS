----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andreas D. Reiß (areiss@students.uni-mainz.de)
-- 
-- Create Date: 28.04.2014 13:00:00
-- Design Name: 
-- Module Name: Topo485T_690T - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

use work.L1TopoDataTypes.all;
use work.L1TopoGTConfiguration.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity Topo485T_690T is
    Port (
		RxP,RxN: in std_logic_vector(MGTHigh downto MGTLow);--MGT113--(23 downto 12);--MGT 115 To 113
		TxP,TxN: out std_logic_vector(TxMGTHigh downto TxMGTLow);--MGT113--(23 downto 12);--MGT 115 To 113
		LhcClkInP,LhcClkInN: in std_logic;--CrystalClock 40.08 MHz
		MgtRefClk0P,MgtRefClk0N: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz                      
		MgtRefClk1P,MgtRefClk1N: in std_logic_vector(QuadMax downto QuadLow)--usually 160.32 MHz   
	);
end Topo485T_690T;

architecture Behavioral of Topo485T_690T is
	attribute DONT_TOUCH : string; 
	attribute shreg_extract : string;	
	attribute DONT_TOUCH of Behavioral : architecture is "TRUE";

	signal SysClk40,SysClk80,SysClk160,SysClk320: std_logic;
	signal LHCClk40Vio: std_logic;
	signal lockedTxOut,lockedLHC: std_logic;
	-- signal resetTxOut: std_logic;
	-- signal resetTxOutSLV: std_logic_vector(0 downto 0);
	
	--Virtex7_485_56gtx start	
	signal ChannelControl,ChannelControl2 : arraySLV32(MGTHigh downto MGTLow);
	signal QuadControl,QuadControl2    : arraySLV32(QuadHigh downto QuadLow);
	signal ChannelStatus,ChannelStatus2  : arraySLV32(MGTHigh downto MGTLow);

	signal GtTxCharIsK      : arraySLV4(TxMGTHigh downto TxMGTLow);
	signal GtRxCharIsK,GtRxCharIsK2,GtRxCharIsK3,GtRxCharIsK4,GtRxCharIsK5,GtRxCharIsK6: arraySLV4(MGTHigh downto MGTLow);
	signal GtRxData,GtRxData2,GtRxData3,GtRxData4,GtRxData5,GtRxData6: arraySLV32(MGTHigh downto MGTLow);
	signal GtTxData     : arraySLV32(TxMGTHigh downto TxMGTLow);
	
	signal counter_send_std: std_logic_vector(7 downto 0);
	signal counter_send: integer range 0 to 255:=0;

	signal VIOTxCharIsKIn,VIOTxCharIsKIn2,CRC_char_flag_out: std_logic_vector(3 downto 0);
	signal VIO_GT_ChannelStatus,CRC_data_out: std_logic_vector(31 downto 0);
	-- signal TxCharIsKIn: arraySLV4(MGTHigh downto MGTLow);
	
	--BER
	signal BER_Errors: arraySLV32(MGTHigh downto MGTLow);--Number of errors
	
	signal TimeInSecondsElapsedSTDLV: std_logic_vector(31 downto 0):=(others=>'0');
	signal TimerAndBERReset: std_logic:='0';
	signal TimerAndBERResetSTDLV: std_logic_vector(0 downto 0):=(others=>'0');
	signal VIO_DataShift40MHz: std_logic_vector(2 downto 0):="000";
	signal DataShift40MHz: arraySLV3(MGTHigh downto MGTLow);
	
	signal Data128AndChariK128_Just_Done,CrcError,CrcError2,CRC_Just_Done: arraySL(MGTHigh downto MGTLow);
	ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
		
	COMPONENT vio_0
	PORT (
	clk : IN STD_LOGIC;
	probe_in0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	probe_in1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	probe_in2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	probe_in3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	probe_in4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	probe_in5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	probe_in6 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	probe_in7 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	probe_in8 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	probe_in9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe_in10 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	probe_out0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	probe_out1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	probe_out2 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	probe_out3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	probe_out4 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	probe_out5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	probe_out6 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe_out7 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	probe_out8 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
	END COMPONENT;
	ATTRIBUTE SYN_BLACK_BOX OF vio_0 : COMPONENT IS TRUE;
	ATTRIBUTE BLACK_BOX_PAD_PIN OF vio_0 : COMPONENT IS "clk,probe_in0[31:0],probe_in1[3:0],probe_in2[31:0],probe_in3[3:0],probe_in4[7:0],probe_in5[31:0],probe_in6[31:0],probe_in7[31:0],probe_in8[127:0],probe_in9[0:0],probe_in10[15:0],probe_out0[3:0],probe_out1[2:0],probe_out2[2:0],probe_out3[7:0],probe_out4[1:0],probe_out5[7:0],probe_out6[0:0],probe_out7[1:0],probe_out8[2:0]";

	-- COMPONENT ila_0
	  -- PORT (
		-- clk : IN STD_LOGIC;
		-- probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		-- probe1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		-- probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		-- probe3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		-- probe4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	  -- );
	-- END COMPONENT;
	-- ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	-- ATTRIBUTE SYN_BLACK_BOX OF ila_0 : COMPONENT IS TRUE;
	-- ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
	-- ATTRIBUTE BLACK_BOX_PAD_PIN OF ila_0 : COMPONENT IS "clk,probe0[31:0],probe1[3:0],probe2[31:0],probe3[3:0],probe4[7:0]";
	
	-- signal probe_out0: std_logic_vector(1 downto 0);
	signal AllLoopbackMode: std_logic_vector(2 downto 0);
	signal QuadQPLLPower_SoftReset,VIO_Channel_TxReset_RxReset: std_logic_vector(1 downto 0) :=(others=>'0');
	signal ChannelRxpower_TxPower_RxBufferReset: std_logic_vector(2 downto 0) :=(others=>'0');
	signal Channel,Quad: std_logic_vector(7 downto 0);
	signal Data128,Data128_2 : arraySLV128(MGTHigh downto MGTLow);
	signal Charisk128,Charisk128_2 : arraySLV16(MGTHigh downto MGTLow);
	signal VIO_CrcError : std_logic_vector(0 downto 0);
	signal VIO_DataOut : std_logic_vector(127 downto 0);
	signal VIO_ChariskOut : std_logic_vector(15 downto 0);
	signal clockBus: std_logic_vector(3 downto 0);
	signal VIOCharIsKIn,ILACharIsKIn      : std_logic_vector(3 downto 0);
	signal VIOCharIsKOut,ILACharIsKOut    : std_logic_vector(3 downto 0);
	signal VIOGtRxDataOut,ILAGtRxDataOut  : std_logic_vector(31 downto 0);
	signal VIOGtTxDataIn,ILAGtTxDataIn    : std_logic_vector(31 downto 0);		
	signal VIO_Channel_BER     	  		  : std_logic_vector(31 downto 0);
	
	--try to keep VIO Ports as they are
	attribute keep : string;
	attribute keep of VIOCharIsKIn: signal is "TRUE";
	attribute keep of ILACharIsKIn: signal is "TRUE";
	attribute keep of VIOCharIsKOut: signal is "TRUE";
	attribute keep of ILACharIsKOut: signal is "TRUE";
	attribute keep of VIOGtRxDataOut: signal is "TRUE";
	attribute keep of ILAGtRxDataOut: signal is "TRUE";
	attribute keep of VIOGtTxDataIn: signal is "TRUE";
	attribute keep of ILAGtTxDataIn: signal is "TRUE";
	attribute keep of Channel: signal is "TRUE";
	attribute keep of Quad: signal is "TRUE";
	attribute keep of ChannelRxpower_TxPower_RxBufferReset: signal is "TRUE";
	attribute keep of QuadQPLLPower_SoftReset: signal is "TRUE";
	attribute keep of AllLoopbackMode: signal is "TRUE";
	attribute keep of TimerAndBERResetSTDLV: signal is "TRUE";
	attribute keep of TimeInSecondsElapsedSTDLV: signal is "TRUE";
	attribute keep of VIO_Channel_BER: signal is "TRUE";
	attribute keep of VIO_Channel_TxReset_RxReset: signal is "TRUE";
	attribute keep of VIOTxCharIsKIn: signal is "TRUE";
	attribute keep of VIO_GT_ChannelStatus: signal is "TRUE";
	attribute keep of VIO_DataOut: signal is "TRUE";
	attribute keep of VIO_ChariskOut: signal is "TRUE";
	attribute keep of VIO_CrcError: signal is "TRUE";
	
	attribute DONT_TOUCH of ChannelStatus: signal is "TRUE";	
	-- attribute DONT_TOUCH of ChannelStatus2: signal is "TRUE";	
	-- attribute DONT_TOUCH of ChannelStatus3: signal is "TRUE";	
	
	attribute shreg_extract of GtRxData : signal is "no";
	attribute shreg_extract of GtRxData2 : signal is "no";
	attribute shreg_extract of GtRxData3 : signal is "no";
	attribute shreg_extract of GtRxData4 : signal is "no";
	attribute shreg_extract of GtRxData5 : signal is "no";
	attribute shreg_extract of GtRxData6 : signal is "no";
	attribute shreg_extract of GtRxCharIsK : signal is "no";
	attribute shreg_extract of GtRxCharIsK2 : signal is "no";
	attribute shreg_extract of GtRxCharIsK3 : signal is "no";
	attribute shreg_extract of GtRxCharIsK4 : signal is "no";
	attribute shreg_extract of GtRxCharIsK5 : signal is "no";
	attribute shreg_extract of GtRxCharIsK6 : signal is "no";
	attribute shreg_extract of ChannelStatus : signal is "no";
	attribute shreg_extract of ChannelStatus2 : signal is "no";
	-- attribute shreg_extract of ChannelStatus3 : signal is "no";
	-- attribute shreg_extract of ChannelControl3 : signal is "no";
	attribute shreg_extract of ChannelControl2 : signal is "no";
	attribute shreg_extract of ChannelControl : signal is "no";
	attribute shreg_extract of QuadControl2 : signal is "no";
	attribute shreg_extract of QuadControl : signal is "no";
	
	component clk_wiz_1
	port
	 (-- Clock in ports
	  LHCClkIn_p         : in     std_logic;
	  LHCClkIn_n         : in     std_logic;
	  -- Clock out ports
	  SysClk40          : out    std_logic;
	  SysClk80          : out    std_logic;
	  SysClk160          : out    std_logic;
	  SysClk320          : out    std_logic;
	  -- Status and control signals
	  locked            : out    std_logic
	 );
	end component;

	-- ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	ATTRIBUTE SYN_BLACK_BOX OF clk_wiz_1 : COMPONENT IS TRUE;


	-- ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
	ATTRIBUTE BLACK_BOX_PAD_PIN OF clk_wiz_1 : COMPONENT IS "LHCClkIn_p,LHCClkIn_n,SysClk40,SysClk80,SysClk160,SysClk320,locked";

	-- COMPONENT ila_40MHz
	-- PORT (
	-- clk : IN STD_LOGIC;
	-- probe0 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	-- probe1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	-- probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
	-- );
	-- END COMPONENT;
	-- ATTRIBUTE SYN_BLACK_BOX OF ila_40MHz : COMPONENT IS TRUE;
	-- ATTRIBUTE BLACK_BOX_PAD_PIN OF ila_40MHz : COMPONENT IS "clk,probe0[127:0],probe1[15:0],probe2[0:0]";

begin
	clk_wiz_1_i : clk_wiz_1
	   port map ( 
	   -- Clock in ports
	   LHCClkIn_p => LHCClkInP,
	   LHCClkIn_n => LHCClkInN,
	  -- Clock out ports  
	   SysClk40 => SysClk40,
	   SysClk80 => SysClk80,
	   SysClk160 => SysClk160,
	   SysClk320 => SysClk320,
	  -- Status and control signals                
	   locked => lockedLHC            
	 );	 
     
	clockBus(0)<=SysClk40;--40MHz
	clockBus(1)<=SysClk80;--80MHz
	clockBus(2)<=SysClk160;--160MHz
	clockBus(3)<=SysClk320;--320MHz

	ConfigureAndMonitorMGTs40 : process (SysClk40)--relax timing by using a process with an additional flip flop
		variable Channel_I,Quad_I: integer range 0 to 255:=0;	
	begin
		if rising_edge(SysClk40) then
			ChannelStatus2<=ChannelStatus;
			-- ChannelStatus3<=ChannelStatus2;
			ChannelControl<=ChannelControl2;
			-- ChannelControl2<=ChannelControl3;
			QuadControl<=QuadControl2;
			
			CrcError2<=CrcError;
			Data128_2<=Data128;
			Charisk128_2<=Charisk128;
			
			Channel_I:=to_integer(unsigned(Channel));
			Quad_I:=to_integer(unsigned(Quad));
			
			if Quad_I >=QuadLow and Quad_I <= QuadHigh then
				QuadControl2(Quad_I)(1) <=QuadQPLLPower_SoftReset(1);--SoftReset_N
				QuadControl2(Quad_I)(0) <=QuadQPLLPower_SoftReset(0);--QPLL power up
				QuadControl2(Quad_I)(31 downto 2) <= (others=>'1');				
			end if;
			
			if Channel_I >=MGTLow and Channel_I <= MGTHigh then
				ChannelControl2(Channel_I)(2 downto 0) <=AllLoopbackMode;
				ChannelControl2(Channel_I)(16 downto 3) <= "1100"& "00011" & "00111";--diff output swing: 850 mV, post cursor 0.68 dB, pre cursor 1.67 dB, Loopback mode: PMA Loopback
				ChannelControl2(Channel_I)(17) <= ChannelRxpower_TxPower_RxBufferReset(2);--rx power up
				ChannelControl2(Channel_I)(18) <= ChannelRxpower_TxPower_RxBufferReset(1);--tx power up
				-- ChannelControl2(Channel_I)(19)<=VIO_Channel_TxReset_RxReset(1);--tx reset
				-- ChannelControl2(Channel_I)(20)<=VIO_Channel_TxReset_RxReset(0);--rx reset
				ChannelControl2(Channel_I)(21) <= ChannelRxpower_TxPower_RxBufferReset(0);--Rx buffer reset
				ChannelControl2(Channel_I)(31 downto 22) <= (others=>'0');
				VIOGtRxDataOut<=GtRxData6(Channel_I);
				VIOCharIsKOut<=GtRxCharIsK6(Channel_I);
				VIO_GT_ChannelStatus<=ChannelStatus2(Channel_I);
				VIOTxCharIsKIn2<=VIOTxCharIsKIn;
				VIO_Channel_BER<=BER_Errors(Channel_I);		
				DataShift40MHz(Channel_I)<=VIO_DataShift40MHz;
				VIO_CrcError(0)<=CrcError2(Channel_I);
				VIO_DataOut<=Data128_2(Channel_I);
				VIO_ChariskOut<=Charisk128_2(Channel_I);			
			end if;
			
			if Channel_I >=TxMGTLow and Channel_I <= TxMGTHigh then
				VIOGtTxDataIn<=GtTxData(Channel_I);
				VIOCharIsKIn<=GtTxCharIsK(Channel_I);
			end if;			
		end if;
	end process;		
		
	ConfigureAndMonitorMGTs160 : process (SysClk160)--relax timing by using a process with an additional flip flop
		variable Channel_I: integer range 0 to 255:=0;	
	begin
		if rising_edge(SysClk160) then
			GtRxData2<=GtRxData;
			GtRxData3<=GtRxData2;
			GtRxData4<=GtRxData3;
			GtRxData5<=GtRxData4;
			GtRxData6<=GtRxData5;
			GtRxCharIsK2<=GtRxCharIsK;
			GtRxCharIsK3<=GtRxCharIsK2;
			GtRxCharIsK4<=GtRxCharIsK3;
			GtRxCharIsK5<=GtRxCharIsK4;
			GtRxCharIsK6<=GtRxCharIsK5;
			
			-- Channel_I:=to_integer(unsigned(Channel));
			
			-- if Channel_I >=MGTLow and Channel_I <= MGTHigh then
				-- ILAGtRxDataOut<=GtRxData3(Channel_I);
				-- ILACharIsKOut<=GtRxCharIsK3(Channel_I);		
			-- end if;
			
			-- if Channel_I >=TxMGTLow and Channel_I <= TxMGTHigh then
				-- ILAGtTxDataIn<=GtTxData(Channel_I);
				-- ILACharIsKIn<=GtTxCharIsK(Channel_I);
			-- end if;			
		end if;
	end process;	
	
	SendReceiveMGT : process (SysClk160)
	begin
		if rising_edge(SysClk160) then
				if counter_send < 255 then
					counter_send<=counter_send+1;
				else
					counter_send<=0;
				end if;
		end if;
	end process;
	
	counter_send_std<=std_logic_vector(to_unsigned(counter_send,8));
	
	Signal_VIOs: for I in TxMGTLow to TxMGTHigh generate	
		-- GtTxCharIsK(I)(3 downto 0)<=VIOTxCharIsKIn2;
		-- GtTxData(I)(31 downto 0)<=counter_send_std&counter_send_std&counter_send_std&"10111100" when VIOTxCharIsKIn2(0)='1' else counter_send_std&counter_send_std&counter_send_std&counter_send_std;--"10111100" =xBC
		-- GetCRCDataROM_I : entity work.GetCRCDataROM
		-- Port Map
		-- (
			-- clk40_in      => SysClk40,
			-- clk160_in     => SysClk160,
			-- shiftSubCtr   => "00",
			-- data_out      => GtTxData(I)(31 downto 0),
			-- char_flag_out => GtTxCharIsK(I)(3 downto 0)
		-- );	
		GtTxData(I)(31 downto 0)<=CRC_data_out;
		GtTxCharIsK(I)(3 downto 0)<=CRC_char_flag_out;
	end generate Signal_VIOs;		
	
	GetCRCDataROM_I : entity work.GetCRCDataROM
	Port Map
	(
		clockBus=>clockBus,
		data32_out=>CRC_data_out,
		char_flag_out=>CRC_char_flag_out
	);
	
	-- Gen_BER: for I in MGTLow to MGTHigh generate	
	-- Gen_BER: for I in 12 to 12 generate
		-- BER_Check_I : entity work.BER_Check
		-- Port map(
			-- WordClock=>SysClk160,
			-- RxData=>GtRxData2(I),
			-- CharIsK=>GtRxCharIsK2(I),
			-- BER_Reset=>TimerAndBERReset,
			-- BER_Errors=>BER_Errors(I)
		-- );
	-- end generate Gen_BER;

	GT_Inout_I: entity work.GT_Inout
    Port map
	(
	--physical connection to FPGA pins
	RxP => RxP,--
	RxN => RxN,--
	TxP => TxP,--
	TxN => TxN,--
	MgtRefClk0P => MgtRefClk0P,--
	MgtRefClk0N => MgtRefClk0N,--
	MgtRefClk1P => MgtRefClk1P,--
	MgtRefClk1N => MgtRefClk1N,--

	--internal FPGA clock signals after MMCM
	UsrClkIn => SysClk320,--
	UsrClk2In => SysClk320,--
	SYSCLK40 => SYSCLK40,--
	clockBus => clockBus,--
	
	--GT transmitter signals
	GtTxData => GtTxData,--
	GtTxCharIsK => GtTxCharIsK,--

	--IP Bus/VIO related signals
	ChannelControl => ChannelControl,--
	QuadControl => QuadControl,--
	ChannelStatus => ChannelStatus,--
	DataShift40MHz => DataShift40MHz,--
	
	--Data for algorithms (and CRC)--> this are the only signals needed for algorithms
	Data128 => Data128,--
	
	--Debug ports, leave open when you do not want to debug and want to save some logic resources
	Charisk128 => Charisk128,--
	GtRxData => GtRxData,--
	GtRxCharIsK => GtRxCharIsK,--
	Data128AndChariK128_Just_Done => Data128AndChariK128_Just_Done,--
	CrcError => CrcError,--
	CRC_Just_Done => CRC_Just_Done--
	);
	
	Timer_I : entity work.Timer
	Generic map(
		OneTickClockCycles=>160320000
	)
	Port map(
		Clock=>SysClk160,
		Timer_Reset=>TimerAndBERReset,
		TimeInSecondsElapsedSTDLV=>TimeInSecondsElapsedSTDLV
	);
	
	TimerAndBERReset<=TimerAndBERResetSTDLV(0);
	
	vio_0_i : vio_0
	PORT MAP 
	(
		CLK => SysClk40,
		PROBE_IN0 => VIOGtRxDataOut,
		PROBE_IN1 => VIOCharIsKOut,
		PROBE_IN2 => VIOGtTxDataIn,
		PROBE_IN3 => VIOCharIsKIn,
		PROBE_IN4 => counter_send_std,
		probe_in5 => TimeInSecondsElapsedSTDLV,
		probe_in6 => VIO_Channel_BER,
		probe_in7 => VIO_GT_ChannelStatus,
		probe_in8 => VIO_DataOut,
		probe_in9 => VIO_CrcError,
		probe_in10 => VIO_ChariskOut,
		PROBE_OUT0 => VIOTxCharIsKIn,
		PROBE_OUT1 => AllLoopbackMode,
		PROBE_OUT2 => ChannelRxpower_TxPower_RxBufferReset,
		PROBE_OUT3 => Channel,
		PROBE_OUT4 => QuadQPLLPower_SoftReset,
		PROBE_OUT5 => Quad,
		probe_out6 => TimerAndBERResetSTDLV,
		probe_out7 => VIO_Channel_TxReset_RxReset,
		probe_out8 => VIO_DataShift40MHz
	);	
	
	-- ila_0_i : ila_0
	-- PORT MAP 
	-- (
		-- CLK => SysClk160,
		-- PROBE0 => ILAGtRxDataOut,
		-- PROBE1 => ILACharIsKOut,
		-- PROBE2 => ILAGtTxDataIn,
		-- PROBE3 => ILACharIsKIn,
		-- PROBE4 => counter_send_std
	-- );
	
	-- ila_40MHz_i : ila_40MHz
	-- PORT MAP 
	-- (
		-- CLK => SysClk40,
		-- PROBE0 => VIO_DataOut,
		-- PROBE1 => VIO_ChariskOut,
		-- PROBE2 => VIO_CrcError
	-- );
end Behavioral;
