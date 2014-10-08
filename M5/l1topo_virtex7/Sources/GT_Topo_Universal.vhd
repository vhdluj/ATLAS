----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2014 23:22:21
-- Design Name: Andreas Reiß (areiss@students.uni-mainz.de)
-- Module Name: GT_Topo_Universal - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Let the use decide which GT to use and also which version of IP Core
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
--use IEEE.NUMERIC_STD.ALL;

use work.L1TopoGTConfiguration.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GT_Topo_Universal is
    Port (
	RxP 			 : in std_logic_vector(MGTHigh downto MGTLow);                                       
	RxN 			 : in std_logic_vector(MGTHigh downto MGTLow);                                       
	TxP 			 : out std_logic_vector(TxMGTHigh downto TxMGTLow);                                      
	TxN 			 : out std_logic_vector(TxMGTHigh downto TxMGTLow);

	ChannelControl   : in arraySLV32(MGTHigh downto MGTLow);
	QuadControl      : in arraySLV32(QuadHigh downto QuadLow);
	ChannelStatus    : out arraySLV32(MGTHigh downto MGTLow);

	GtTxCharIsK        : in  arraySLV4(TxMGTHigh downto TxMGTLow); 
	GtRxCharIsK       : out arraySLV4(MGTHigh downto MGTLow);

	UsrClkIn         : in std_logic;--320.64 MHz
	UsrClk2In        : in std_logic;--320.64 MHz
	SYSCLK40		 : in std_logic;--40.08 MHz clock must be present at startup immediately
	--TxOutClk not implemented due to problems with GTH Ipcore version 3.2 when using it or just leaving the signal unconnected
	
	GtRxDataOut      : out arraySLV32(MGTHigh downto MGTLow);
	GtTxDataIn       : in  arraySLV32(TxMGTHigh downto TxMGTLow);

	MgtRefClk0P,MgtRefClk0N: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz                      
	MgtRefClk1P,MgtRefClk1N: in std_logic_vector(QuadMax downto QuadLow)--usually 160.32 MHz   
	);
end GT_Topo_Universal;

architecture Behavioral of GT_Topo_Universal is
	signal MGTRefClk: std_logic_vector(QuadHigh downto QuadLow);--usually 160.32 MHz 	
begin
	Init_MGTRefClk :entity work.GT_Topo_Universal_RefClk
	Port Map (
		MgtRefClk0P=>MgtRefClk0P,
		MgtRefClk0N=>MgtRefClk0N,                 
		MgtRefClk1P=>MgtRefClk1P,
		MgtRefClk1N=>MgtRefClk1N,        
		MGTRefClk=>MGTRefClk--MGT reference clock after input buffer		
	);

	GTH_generate: if GTH_On_GTX_Off='1' and GT_Speed_In_kbps=6412800 generate	
		GTH_I : entity work.Virtex7_690_80gth
		Generic Map (
		IPCoreVersion=>GTH_IPCore_Version
		)
		Port Map (
			RxP => RxP,
			RxN => RxN,
			TxP => TxP,
			TxN => TxN,

			ChannelControl => ChannelControl,
			QuadControl => QuadControl,
			ChannelStatus => ChannelStatus,

			CharIsKIn => GtTxCharIsK,
			CharIsKOut => GtRxCharIsK,

			UsrClkIn => UsrClkIn,
			UsrClk2In => UsrClk2In,
			SYSCLK40=> SYSCLK40,
			
			GtRxDataOut => GtRxDataOut,
			GtTxDataIn => GtTxDataIn,

			-- MgtRefClkP => MgtRefClkP,
			-- MgtRefClkN => MgtRefClkN
			MGTRefClk=>MGTRefClk
		);
	end generate GTH_generate;

	GTX_generate: if GTH_On_GTX_Off='0' and GT_Speed_In_kbps=6412800 generate	
		GTX_I : entity work.Virtex7_485_56gtx
		Generic Map (
			IPCoreVersion=>GTX_IPCore_Version
		)
		Port Map(
			RxP => RxP,
			RxN => RxN,
			TxP => TxP,
			TxN => TxN,

			ChannelControl => ChannelControl,
			QuadControl => QuadControl,
			ChannelStatus => ChannelStatus,

			CharIsKIn => GtTxCharIsK,
			CharIsKOut => GtRxCharIsK,

			UsrClkIn => UsrClkIn,
			UsrClk2In => UsrClk2In,
			SYSCLK40=> SYSCLK40,
			
			GtRxDataOut => GtRxDataOut,
			GtTxDataIn => GtTxDataIn,

			-- MgtRefClkP => MgtRefClkP,
			-- MgtRefClkN => MgtRefClkN
			MGTRefClk=>MGTRefClk
		);	
	end generate GTX_generate;

end Behavioral;
