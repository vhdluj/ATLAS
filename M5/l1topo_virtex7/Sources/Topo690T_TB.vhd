----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andreas D. Reiﬂ (areiss@students.uni-mainz.de)
-- 
-- Create Date: 28.04.2014 13:00:00
-- Design Name: 
-- Module Name: Topo690T - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity Topo690T_TB is
end Topo690T_TB;

architecture Behavioral of Topo690T_TB is
	constant BC_TIME : time := 25 ns;

	signal SysClk40,SysClk80,SysClk160,SysClk320: std_logic:='0';
	signal GtTxCharIsK: arraySLV4(TxMGTHigh downto TxMGTLow);
	signal GtRxCharIsK,GtRxCharIsK2,GtRxCharIsK3,GtRxCharIsK4,GtRxCharIsK5,GtRxCharIsK6: arraySLV4(MGTHigh downto MGTLow);
	signal GtRxData,GtRxData2,GtRxData3,GtRxData4,GtRxData5,GtRxData6: arraySLV32(MGTHigh downto MGTLow);
	signal GtTxData: arraySLV32(TxMGTHigh downto TxMGTLow);
	signal Data128AndChariK128_Just_Done,CrcError,CrcError2,CRC_Just_Done: arraySL(MGTHigh downto MGTLow);
	signal Data128,Data128_2: arraySLV128(MGTHigh downto MGTLow);
	signal Charisk128,Charisk128_2: arraySLV16(MGTHigh downto MGTLow);
	signal CRC_char_flag_out: std_logic_vector(3 downto 0);
	signal CRC_data_out: std_logic_vector(31 downto 0);
	signal VIO_CrcError: std_logic_vector(0 downto 0);
	signal VIO_DataOut: std_logic_vector(127 downto 0);
	signal VIO_ChariskOut: std_logic_vector(15 downto 0);
	signal clockBus: std_logic_vector(3 downto 0):="0000";
	signal VIOCharIsKIn: std_logic_vector(3 downto 0);
	signal VIOCharIsKOut: std_logic_vector(3 downto 0);
	signal VIOGtRxDataOut: std_logic_vector(31 downto 0);
	signal VIOGtTxDataIn: std_logic_vector(31 downto 0);

	signal Channel: std_logic_vector(7 downto 0):=std_logic_vector(to_unsigned(12,8));
	signal DataShift40MHz: arraySLV3(MGTHigh downto MGTLow);
	
	signal ChannelControl: arraySLV32(MGTHigh downto MGTLow);
	signal QuadControl: arraySLV32(QuadHigh downto QuadLow);
begin

	-- clockBus clocks
	clk40_process0 : process
	begin
		clockBus(0) <= not clockBus(0);
		wait for BC_TIME / 2;
	end process;

	clk80_process0 : process
	begin
		clockBus(1) <= not clockBus(1);
		wait for BC_TIME / 4;
	end process;

	clk160_process0 : process
	begin
		clockBus(2) <= not clockBus(2);
		wait for BC_TIME / 8;
	end process;
	
	clk320_process0 : process
	begin
		clockBus(3) <= not clockBus(3);
		wait for BC_TIME / 16;
	end process;	
	
	-- SysClk clocks
	clk40_process1 : process
	begin
		SysClk40 <= not SysClk40;
		wait for BC_TIME / 2;
	end process;

	clk80_process1 : process
	begin
		SysClk80 <= not SysClk80;
		wait for BC_TIME / 4;
	end process;

	clk160_process1 : process
	begin
		SysClk160 <= not SysClk160;
		wait for BC_TIME / 8;
	end process;
	
	clk320_process1 : process
	begin
		SysClk320 <= not SysClk320;
		wait for BC_TIME / 16;
	end process;

	ConfigureAndMonitorMGTs40 : process (SysClk40)--relax timing by using a process with an additional flip flop
		variable Channel_I: integer range 0 to 255:=0;	
	begin
		if rising_edge(SysClk40) then			
			CrcError2<=CrcError;
			Data128_2<=Data128;
			Charisk128_2<=Charisk128;
			
			Channel_I:=to_integer(unsigned(Channel));
			
			if Channel_I >=MGTLow and Channel_I <= MGTHigh then
				VIOGtRxDataOut<=GtRxData6(Channel_I);
				VIOCharIsKOut<=GtRxCharIsK6(Channel_I);
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
		end if;
	end process;	
	
	Signal_VIOs: for I in TxMGTLow to TxMGTHigh generate	
		GtTxData(I)(31 downto 0)<=CRC_data_out;
		GtTxCharIsK(I)(3 downto 0)<=CRC_char_flag_out;
	end generate Signal_VIOs;		

	Quad_gen: for I in QuadLow to QuadHigh generate	
		QuadControl(I)<=(others=>'0');
	end generate Quad_gen;
	
	Channel_gen: for I in MGTLow to MGTHigh generate	
		ChannelControl(I)<=(others=>'0');
		DataShift40MHz(I)<=(others=>'0');
	end generate Channel_gen;
	
	GetCRCDataROM_I : entity work.GetCRCDataROM
	Port Map
	(
		clockBus=>clockBus,
		data32_out=>CRC_data_out,
		char_flag_out=>CRC_char_flag_out
	);

	GT_Inout_I: entity work.GT_Inout
    Port map
	(
	--physical connection to FPGA pins
	RxP => (others=>'0'),--
	RxN => (others=>'0'),--
	TxP => open,--
	TxN => open,--
	MgtRefClk0P => (others=>'0'),--
	MgtRefClk0N => (others=>'0'),--
	MgtRefClk1P => (others=>'0'),--
	MgtRefClk1N => (others=>'0'),--

	--internal FPGA clock signals after MMCM
	UsrClkIn => SysClk320,--
	UsrClk2In => SysClk320,--
	SYSCLK40 => SYSCLK40,--
	clockBus => clockBus,--
	
	--GT transmitter signals
	GtTxData => GtTxData,--
	GtTxCharIsK => GtTxCharIsK,--

	--IP Bus/VIO related signals
	ChannelControl=>ChannelControl,--
	QuadControl => QuadControl,--
	ChannelStatus => open,--
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
end Behavioral;
