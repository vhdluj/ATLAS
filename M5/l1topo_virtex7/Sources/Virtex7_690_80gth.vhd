----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andreas Reiﬂ (newer development, areiss@students.uni-mainz.de)
-- 
-- Create Date: 16.04.2014 15:08:07
-- Design Name: 
-- Module Name: Virtex7_690_80gth - Behavioral
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

library ieee;                                                                             
use ieee.std_logic_1164.all;                                                                                                                        
use ieee.numeric_std.all;                                                                 

use work.L1TopoGTConfiguration.all;
-- Uncomment the following library declaration if using                                   
-- arithmetic functions with Signed or Unsigned values                                    
use IEEE.NUMERIC_STD.ALL;                                                               

-- Uncomment the following library declaration if instantiating                           
-- any Xilinx leaf cells in this code.                                                    
library UNISIM;                                                                         
use UNISIM.VComponents.all;                                                             

entity Virtex7_690_80gth is
	generic (
	IPCoreVersion: integer:=27--either 27 for 2.7 or 32 for 3.2 
	);
	Port (                                                                                
	RxP 			 : in std_logic_vector(MGTHigh downto MGTLow);                                       
	RxN 			 : in std_logic_vector(MGTHigh downto MGTLow);                                       
	TxP 			 : out std_logic_vector(TxMGTHigh downto TxMGTLow);                                      
	TxN 			 : out std_logic_vector(TxMGTHigh downto TxMGTLow);

	ChannelControl   : in arraySLV32(MGTHigh downto MGTLow);
	QuadControl      : in arraySLV32(QuadHigh downto QuadLow);
	ChannelStatus	 : out arraySLV32(MGTHigh downto MGTLow);

	CharIsKIn        : in  arraySLV4(TxMGTHigh downto TxMGTLow); 
	CharIsKOut       : out arraySLV4(MGTHigh downto MGTLow);

	UsrClkIn         : in std_logic;--320.64 MHz
	UsrClk2In        : in std_logic;--320.64 MHz
	-- TxOutClk 	  	 : out std_logic:='0';--320.64 MHz 
	SYSCLK40		 : in std_logic;--40.08 MHz clock must be present at startup immediately
	
	GtRxDataOut      : out arraySLV32(MGTHigh downto MGTLow);
	GtTxDataIn       : in  arraySLV32(TxMGTHigh downto TxMGTLow);

	-- MgtRefClkP 		 : in std_logic_vector(QuadHigh downto 0);--160.32 MHz                      
	-- MgtRefClkN  	 : in std_logic_vector(QuadHigh downto 0)
	MgtRefClk  	 : in std_logic_vector(QuadHigh downto QuadLow)
	);                                                                                  
end Virtex7_690_80gth;                                                               

architecture Behavioral of Virtex7_690_80gth is                                      

attribute DONT_TOUCH : string;                                                           
attribute DONT_TOUCH of Behavioral : architecture is "TRUE";

constant RxTxDataWidth: integer:=16;
type DataWidthDivBy8 is array (natural range <>) of std_logic_vector(RxTxDataWidth/8-1 downto 0);
type DataWidthDivBy4 is array (natural range <>) of std_logic_vector(RxTxDataWidth/4-1 downto 0);
type arraySLV16 is array (natural range <>) of std_logic_vector(15 downto 0);
type arraySLV2 is array (natural range <>) of std_logic_vector(1 downto 0);
type arraySLV32SDL is array (natural range <>) of std_logic;            	

--Serialiser Deserialiser				
signal SerializerTxByteNumber : std_logic_vector(TxMGTHigh downto TxMGTLow):=(others=>'1');

signal RxDataOut		   : arraySLV16(MGTHigh downto MGTLow);
signal TxDataIn			   : arraySLV16(TxMGTHigh downto TxMGTLow);
signal RxCharIsKOut,RxCharIsCommaOut: arraySLV2(MGTHigh downto MGTLow);
signal TxCharIsKIn 		   : arraySLV2(TxMGTHigh downto TxMGTLow);
-- signal gt_txoutclk_out	   : arraySLV32SDL(TxMGTHigh downto TxMGTLow);

signal gt_txdata_new	   : arraySLV16(TxMGTHigh downto TxMGTLow);
signal gt_txdata32		   : arraySLV32(TxMGTHigh downto TxMGTLow);
-- signal gt_txcharisk        : DataWidthDivBy8(MGTHigh downto MGTLow);
signal gt_txcharisk_new    : DataWidthDivBy8(TxMGTHigh downto TxMGTLow);
signal gt_txcharisk4       : DataWidthDivBy4(TxMGTHigh downto TxMGTLow);

signal gt_rxdata_old  	   : arraySLV16(MGTHigh downto MGTLow);
signal gt_rxdata32		   : arraySLV32(MGTHigh downto MGTLow);
-- signal gt_rxcharisk        : DataWidthDivBy8(MGTHigh downto 0);
signal gt_rxcharisk_old    : DataWidthDivBy8(MGTHigh downto MGTLow);
signal gt_rxcharisk4       : DataWidthDivBy4(MGTHigh downto MGTLow);

-- signal MGTRefClk	       : std_logic_vector(QuadHigh downto 0);
-- signal GTREFCLK_OUT    	   : std_logic_vector(QuadHigh downto 0);

signal Compose32Bit 	   : std_logic_vector(MGTHigh downto MGTLow):=(others=>'0');

attribute DONT_TOUCH of TxDataIn : signal is "TRUE";
attribute DONT_TOUCH of TxCharIsKIn : signal is "TRUE";
attribute DONT_TOUCH of gt_txdata_new : signal is "TRUE";
attribute DONT_TOUCH of gt_txdata32 : signal is "TRUE";
attribute DONT_TOUCH of gt_txcharisk_new : signal is "TRUE";
attribute DONT_TOUCH of gt_txcharisk4 : signal is "TRUE";

begin

IPCore32_Generate: if IPCoreVersion=32 generate
	GEN_Quad_Before : for J in QuadLow to TxQuadLow -1 generate
			GTH_Buffered_J : entity work.GTH_Buffered_Rx_32
			Port Map
			(
			gt0_gthrxn_in => RxN(4*J),
			gt0_gthrxp_in => RxP(4*J),
			gt1_gthrxn_in => RxN(4*J+1),
			gt1_gthrxp_in => RxP(4*J+1),
			gt2_gthrxn_in => RxN(4*J+2),
			gt2_gthrxp_in => RxP(4*J+2),
			gt3_gthrxn_in => RxN(4*J+3),
			gt3_gthrxp_in => RxP(4*J+3),

			ChannelControl0 => ChannelControl(4*J),
			ChannelControl1 => ChannelControl(4*J+1),
			ChannelControl2 => ChannelControl(4*J+2),
			ChannelControl3 => ChannelControl(4*J+3),
			QuadControl => QuadControl(J),
			ChannelStatus0=>ChannelStatus(4*J),
			ChannelStatus1=>ChannelStatus(4*J+1),
			ChannelStatus2=>ChannelStatus(4*J+2),
			ChannelStatus3=>ChannelStatus(4*J+3),
			
			gt0_rxdata_out => RxDataOut(4*J),
			gt0_rxcharisk_out => RxCharIsKOut(4*J),
			gt0_rxchariscomma_out => RxCharIsCommaOut(4*J),
			gt1_rxdata_out => RxDataOut(4*J+1),
			gt1_rxcharisk_out => RxCharIsKOut(4*J+1),
			gt1_rxchariscomma_out => RxCharIsCommaOut(4*J+1),
			gt2_rxdata_out => RxDataOut(4*J+2),
			gt2_rxcharisk_out => RxCharIsKOut(4*J+2),
			gt2_rxchariscomma_out => RxCharIsCommaOut(4*J+2),
			gt3_rxdata_out => RxDataOut(4*J+3),
			gt3_rxcharisk_out => RxCharIsKOut(4*J+3),
			gt3_rxchariscomma_out => RxCharIsCommaOut(4*J+3),
			
			MGTRefClk =>  MGTRefClk(J),

			UsrClkIn => UsrClkIn,
			UsrClk2In => UsrClk2In,
			SYSCLK40 => SYSCLK40--,
			);
			
			-- gt_usrclk_source_J : entity work.gtwizard_0_GT_USRCLK_SOURCE
			-- port map
			-- (
			-- Q0_CLK1_GTREFCLK_PAD_N_IN       =>      MgtRefClkN(J),
			-- Q0_CLK1_GTREFCLK_PAD_P_IN       =>      MgtRefClkP(J),
			-- Q0_CLK1_GTREFCLK_OUT            =>      GTREFCLK_OUT(J)
			-- );
	end generate GEN_Quad_Before ;

	GEN_Quad_Middle : for J in TxQuadLow to TxQuadHigh generate
			GTH_Buffered_J : entity work.GTH_Buffered_32
			Port Map
			(
			gt0_gthrxn_in => RxN(4*J),
			gt0_gthrxp_in => RxP(4*J),
			gt1_gthrxn_in => RxN(4*J+1),
			gt1_gthrxp_in => RxP(4*J+1),
			gt2_gthrxn_in => RxN(4*J+2),
			gt2_gthrxp_in => RxP(4*J+2),
			gt3_gthrxn_in => RxN(4*J+3),
			gt3_gthrxp_in => RxP(4*J+3),
			gt0_gthtxn_out => TxN(4*J),
			gt0_gthtxp_out => TxP(4*J),
			gt1_gthtxn_out => TxN(4*J+1),
			gt1_gthtxp_out => TxP(4*J+1),
			gt2_gthtxn_out => TxN(4*J+2),
			gt2_gthtxp_out => TxP(4*J+2),
			gt3_gthtxn_out => TxN(4*J+3),
			gt3_gthtxp_out => TxP(4*J+3),

			ChannelControl0 => ChannelControl(4*J),
			ChannelControl1 => ChannelControl(4*J+1),
			ChannelControl2 => ChannelControl(4*J+2),
			ChannelControl3 => ChannelControl(4*J+3),
			QuadControl => QuadControl(J),
			ChannelStatus0=>ChannelStatus(4*J),
			ChannelStatus1=>ChannelStatus(4*J+1),
			ChannelStatus2=>ChannelStatus(4*J+2),
			ChannelStatus3=>ChannelStatus(4*J+3),

			gt0_rxdata_out => RxDataOut(4*J),
			gt0_rxcharisk_out => RxCharIsKOut(4*J),
			gt0_rxchariscomma_out => RxCharIsCommaOut(4*J),
			gt1_rxdata_out => RxDataOut(4*J+1),
			gt1_rxcharisk_out => RxCharIsKOut(4*J+1),
			gt1_rxchariscomma_out => RxCharIsCommaOut(4*J+1),
			gt2_rxdata_out => RxDataOut(4*J+2),
			gt2_rxcharisk_out => RxCharIsKOut(4*J+2),
			gt2_rxchariscomma_out => RxCharIsCommaOut(4*J+2),
			gt3_rxdata_out => RxDataOut(4*J+3),
			gt3_rxcharisk_out => RxCharIsKOut(4*J+3),
			gt3_rxchariscomma_out => RxCharIsCommaOut(4*J+3),
			
			gt0_txdata_in => TxDataIn(4*J),
			gt0_txcharisk_in => TxCharIsKIn(4*J),
			gt1_txdata_in => TxDataIn(4*J+1),
			gt1_txcharisk_in => TxCharIsKIn(4*J+1),
			gt2_txdata_in => TxDataIn(4*J+2),
			gt2_txcharisk_in => TxCharIsKIn(4*J+2),
			gt3_txdata_in => TxDataIn(4*J+3),
			gt3_txcharisk_in => TxCharIsKIn(4*J+3),

			MGTRefClk =>  MGTRefClk(J),

			UsrClkIn => UsrClkIn,
			UsrClk2In => UsrClk2In,
			SYSCLK40 => SYSCLK40--,
			);
			
			-- gt_usrclk_source_J : entity work.gtwizard_0_GT_USRCLK_SOURCE
			-- port map
			-- (
			-- Q0_CLK1_GTREFCLK_PAD_N_IN       =>      MgtRefClkN(J),
			-- Q0_CLK1_GTREFCLK_PAD_P_IN       =>      MgtRefClkP(J),
			-- Q0_CLK1_GTREFCLK_OUT            =>      GTREFCLK_OUT(J)
			-- );
	end generate GEN_Quad_Middle;

	--when this generated is used 0 times then a warning will be output like this: [Designutils 20-267] Invalid number of 0 quad Channels. It should lie between 1 - 4.
	GEN_Quad_After : for J in TxQuadHigh+1 to QuadHigh generate
			GTH_Buffered_J : entity work.GTH_Buffered_Rx_32
			Port Map
			(
			gt0_gthrxn_in => RxN(4*J),
			gt0_gthrxp_in => RxP(4*J),
			gt1_gthrxn_in => RxN(4*J+1),
			gt1_gthrxp_in => RxP(4*J+1),
			gt2_gthrxn_in => RxN(4*J+2),
			gt2_gthrxp_in => RxP(4*J+2),
			gt3_gthrxn_in => RxN(4*J+3),
			gt3_gthrxp_in => RxP(4*J+3),

			ChannelControl0 => ChannelControl(4*J),
			ChannelControl1 => ChannelControl(4*J+1),
			ChannelControl2 => ChannelControl(4*J+2),
			ChannelControl3 => ChannelControl(4*J+3),
			QuadControl => QuadControl(J),
			ChannelStatus0=>ChannelStatus(4*J),
			ChannelStatus1=>ChannelStatus(4*J+1),
			ChannelStatus2=>ChannelStatus(4*J+2),
			ChannelStatus3=>ChannelStatus(4*J+3),

			gt0_rxdata_out => RxDataOut(4*J),
			gt0_rxcharisk_out => RxCharIsKOut(4*J),
			gt0_rxchariscomma_out => RxCharIsCommaOut(4*J),
			gt1_rxdata_out => RxDataOut(4*J+1),
			gt1_rxcharisk_out => RxCharIsKOut(4*J+1),
			gt1_rxchariscomma_out => RxCharIsCommaOut(4*J+1),
			gt2_rxdata_out => RxDataOut(4*J+2),
			gt2_rxcharisk_out => RxCharIsKOut(4*J+2),
			gt2_rxchariscomma_out => RxCharIsCommaOut(4*J+2),
			gt3_rxdata_out => RxDataOut(4*J+3),
			gt3_rxcharisk_out => RxCharIsKOut(4*J+3),
			gt3_rxchariscomma_out => RxCharIsCommaOut(4*J+3),
			
			MGTRefClk =>  MGTRefClk(J),

			UsrClkIn => UsrClkIn,
			UsrClk2In => UsrClk2In,
			SYSCLK40 => SYSCLK40--,
			);
			
			-- gt_usrclk_source_J : entity work.gtwizard_0_GT_USRCLK_SOURCE
			-- port map
			-- (
			-- Q0_CLK1_GTREFCLK_PAD_N_IN       =>      MgtRefClkN(J),
			-- Q0_CLK1_GTREFCLK_PAD_P_IN       =>      MgtRefClkP(J),
			-- Q0_CLK1_GTREFCLK_OUT            =>      GTREFCLK_OUT(J)
			-- );
	end generate GEN_Quad_After;
end generate IPCore32_Generate;

IPCore27_Generate: if IPCoreVersion=27 generate
	GEN_Quad_Before : for J in QuadLow to TxQuadLow -1 generate
			GTH_Buffered_J : entity work.GTH_Buffered_Rx_27
			Port Map
			(
			gt0_gthrxn_in => RxN(4*J),
			gt0_gthrxp_in => RxP(4*J),
			gt1_gthrxn_in => RxN(4*J+1),
			gt1_gthrxp_in => RxP(4*J+1),
			gt2_gthrxn_in => RxN(4*J+2),
			gt2_gthrxp_in => RxP(4*J+2),
			gt3_gthrxn_in => RxN(4*J+3),
			gt3_gthrxp_in => RxP(4*J+3),

			ChannelControl0 => ChannelControl(4*J),
			ChannelControl1 => ChannelControl(4*J+1),
			ChannelControl2 => ChannelControl(4*J+2),
			ChannelControl3 => ChannelControl(4*J+3),
			QuadControl => QuadControl(J),
			ChannelStatus0=>ChannelStatus(4*J),
			ChannelStatus1=>ChannelStatus(4*J+1),
			ChannelStatus2=>ChannelStatus(4*J+2),
			ChannelStatus3=>ChannelStatus(4*J+3),
			
			gt0_rxdata_out => RxDataOut(4*J),
			gt0_rxcharisk_out => RxCharIsKOut(4*J),
			gt0_rxchariscomma_out => RxCharIsCommaOut(4*J),
			gt1_rxdata_out => RxDataOut(4*J+1),
			gt1_rxcharisk_out => RxCharIsKOut(4*J+1),
			gt1_rxchariscomma_out => RxCharIsCommaOut(4*J+1),
			gt2_rxdata_out => RxDataOut(4*J+2),
			gt2_rxcharisk_out => RxCharIsKOut(4*J+2),
			gt2_rxchariscomma_out => RxCharIsCommaOut(4*J+2),
			gt3_rxdata_out => RxDataOut(4*J+3),
			gt3_rxcharisk_out => RxCharIsKOut(4*J+3),
			gt3_rxchariscomma_out => RxCharIsCommaOut(4*J+3),
			
			MGTRefClk =>  MGTRefClk(J),

			UsrClkIn => UsrClkIn,
			UsrClk2In => UsrClk2In,
			SYSCLK40 => SYSCLK40--,
			);
			
			-- gt_usrclk_source_J : entity work.gtwizard_0_GT_USRCLK_SOURCE
			-- port map
			-- (
			-- Q0_CLK1_GTREFCLK_PAD_N_IN       =>      MgtRefClkN(J),
			-- Q0_CLK1_GTREFCLK_PAD_P_IN       =>      MgtRefClkP(J),
			-- Q0_CLK1_GTREFCLK_OUT            =>      GTREFCLK_OUT(J)
			-- );
	end generate GEN_Quad_Before ;

	GEN_Quad_Middle : for J in TxQuadLow to TxQuadHigh generate
			GTH_Buffered_J : entity work.GTH_Buffered_27
			Port Map
			(
			gt0_gthrxn_in => RxN(4*J),
			gt0_gthrxp_in => RxP(4*J),
			gt1_gthrxn_in => RxN(4*J+1),
			gt1_gthrxp_in => RxP(4*J+1),
			gt2_gthrxn_in => RxN(4*J+2),
			gt2_gthrxp_in => RxP(4*J+2),
			gt3_gthrxn_in => RxN(4*J+3),
			gt3_gthrxp_in => RxP(4*J+3),
			gt0_gthtxn_out => TxN(4*J),
			gt0_gthtxp_out => TxP(4*J),
			gt1_gthtxn_out => TxN(4*J+1),
			gt1_gthtxp_out => TxP(4*J+1),
			gt2_gthtxn_out => TxN(4*J+2),
			gt2_gthtxp_out => TxP(4*J+2),
			gt3_gthtxn_out => TxN(4*J+3),
			gt3_gthtxp_out => TxP(4*J+3),

			ChannelControl0 => ChannelControl(4*J),
			ChannelControl1 => ChannelControl(4*J+1),
			ChannelControl2 => ChannelControl(4*J+2),
			ChannelControl3 => ChannelControl(4*J+3),
			QuadControl => QuadControl(J),
			ChannelStatus0=>ChannelStatus(4*J),
			ChannelStatus1=>ChannelStatus(4*J+1),
			ChannelStatus2=>ChannelStatus(4*J+2),
			ChannelStatus3=>ChannelStatus(4*J+3),

			gt0_rxdata_out => RxDataOut(4*J),
			gt0_rxcharisk_out => RxCharIsKOut(4*J),
			gt0_rxchariscomma_out => RxCharIsCommaOut(4*J),
			gt1_rxdata_out => RxDataOut(4*J+1),
			gt1_rxcharisk_out => RxCharIsKOut(4*J+1),
			gt1_rxchariscomma_out => RxCharIsCommaOut(4*J+1),
			gt2_rxdata_out => RxDataOut(4*J+2),
			gt2_rxcharisk_out => RxCharIsKOut(4*J+2),
			gt2_rxchariscomma_out => RxCharIsCommaOut(4*J+2),
			gt3_rxdata_out => RxDataOut(4*J+3),
			gt3_rxcharisk_out => RxCharIsKOut(4*J+3),
			gt3_rxchariscomma_out => RxCharIsCommaOut(4*J+3),
			
			gt0_txdata_in => TxDataIn(4*J),
			gt0_txcharisk_in => TxCharIsKIn(4*J),
			gt1_txdata_in => TxDataIn(4*J+1),
			gt1_txcharisk_in => TxCharIsKIn(4*J+1),
			gt2_txdata_in => TxDataIn(4*J+2),
			gt2_txcharisk_in => TxCharIsKIn(4*J+2),
			gt3_txdata_in => TxDataIn(4*J+3),
			gt3_txcharisk_in => TxCharIsKIn(4*J+3),

			MGTRefClk =>  MGTRefClk(J),

			UsrClkIn => UsrClkIn,
			UsrClk2In => UsrClk2In,
			SYSCLK40 => SYSCLK40--,
			);
			
			-- gt_usrclk_source_J : entity work.gtwizard_0_GT_USRCLK_SOURCE
			-- port map
			-- (
			-- Q0_CLK1_GTREFCLK_PAD_N_IN       =>      MgtRefClkN(J),
			-- Q0_CLK1_GTREFCLK_PAD_P_IN       =>      MgtRefClkP(J),
			-- Q0_CLK1_GTREFCLK_OUT            =>      GTREFCLK_OUT(J)
			-- );
	end generate GEN_Quad_Middle;

	--when this generated is used 0 times then a warning will be output like this: [Designutils 20-267] Invalid number of 0 quad Channels. It should lie between 1 - 4.
	GEN_Quad_After : for J in TxQuadHigh+1 to QuadHigh generate
			GTH_Buffered_J : entity work.GTH_Buffered_Rx_27
			Port Map
			(
			gt0_gthrxn_in => RxN(4*J),
			gt0_gthrxp_in => RxP(4*J),
			gt1_gthrxn_in => RxN(4*J+1),
			gt1_gthrxp_in => RxP(4*J+1),
			gt2_gthrxn_in => RxN(4*J+2),
			gt2_gthrxp_in => RxP(4*J+2),
			gt3_gthrxn_in => RxN(4*J+3),
			gt3_gthrxp_in => RxP(4*J+3),

			ChannelControl0 => ChannelControl(4*J),
			ChannelControl1 => ChannelControl(4*J+1),
			ChannelControl2 => ChannelControl(4*J+2),
			ChannelControl3 => ChannelControl(4*J+3),
			QuadControl => QuadControl(J),
			ChannelStatus0=>ChannelStatus(4*J),
			ChannelStatus1=>ChannelStatus(4*J+1),
			ChannelStatus2=>ChannelStatus(4*J+2),
			ChannelStatus3=>ChannelStatus(4*J+3),

			gt0_rxdata_out => RxDataOut(4*J),
			gt0_rxcharisk_out => RxCharIsKOut(4*J),
			gt0_rxchariscomma_out => RxCharIsCommaOut(4*J),
			gt1_rxdata_out => RxDataOut(4*J+1),
			gt1_rxcharisk_out => RxCharIsKOut(4*J+1),
			gt1_rxchariscomma_out => RxCharIsCommaOut(4*J+1),
			gt2_rxdata_out => RxDataOut(4*J+2),
			gt2_rxcharisk_out => RxCharIsKOut(4*J+2),
			gt2_rxchariscomma_out => RxCharIsCommaOut(4*J+2),
			gt3_rxdata_out => RxDataOut(4*J+3),
			gt3_rxcharisk_out => RxCharIsKOut(4*J+3),
			gt3_rxchariscomma_out => RxCharIsCommaOut(4*J+3),
			
			MGTRefClk =>  MGTRefClk(J),

			UsrClkIn => UsrClkIn,
			UsrClk2In => UsrClk2In,
			SYSCLK40 => SYSCLK40--,
			);
			
			-- gt_usrclk_source_J : entity work.gtwizard_0_GT_USRCLK_SOURCE
			-- port map
			-- (
			-- Q0_CLK1_GTREFCLK_PAD_N_IN       =>      MgtRefClkN(J),
			-- Q0_CLK1_GTREFCLK_PAD_P_IN       =>      MgtRefClkP(J),
			-- Q0_CLK1_GTREFCLK_OUT            =>      GTREFCLK_OUT(J)
			-- );
	end generate GEN_Quad_After;
end generate IPCore27_Generate;

--Usage of MGTRefClk 3 or 4
-- MGTRefClk(0)<=GTREFCLK_OUT(0);--MGT 110
-- MGTRefClk(1)<=GTREFCLK_OUT(0);--MGT 111
-- MGTRefClk(2)<=GTREFCLK_OUT(3);--MGT 112

-- MGTRefClk(3)<=GTREFCLK_OUT(3);--MGT 113
-- MGTRefClk(4)<=GTREFCLK_OUT(3);--MGT 114
-- MGTRefClk(5)<=GTREFCLK_OUT(6);--MGT 115

-- MGTRefClk(6)<=GTREFCLK_OUT(6);--MGT 116
-- MGTRefClk(7)<=GTREFCLK_OUT(6);--MGT 117
-- MGTRefClk(8)<=GTREFCLK_OUT(8);--MGT 118

-- MGTRefClk(9)<=GTREFCLK_OUT(8);--MGT 119

-- MGTRefClk(10)<=GTREFCLK_OUT(10);--MGT 210
-- MGTRefClk(11)<=GTREFCLK_OUT(10);--MGT 211
-- MGTRefClk(12)<=GTREFCLK_OUT(13);--MGT 212

-- MGTRefClk(13)<=GTREFCLK_OUT(13);--MGT 213
-- MGTRefClk(14)<=GTREFCLK_OUT(13);--MGT 214
-- MGTRefClk(15)<=GTREFCLK_OUT(16);--MGT 215

-- MGTRefClk(16)<=GTREFCLK_OUT(16);--MGT 216
-- MGTRefClk(17)<=GTREFCLK_OUT(16);--MGT 217
-- MGTRefClk(18)<=GTREFCLK_OUT(18);--MGT 218

-- MGTRefClk(19)<=GTREFCLK_OUT(18);--MGT 219

SecondDeSer : for I in MGTLow to MGTHigh generate

	Compose_I : process(UsrClkIn)
	begin
		if rising_edge(UsrClkIn) then
			Compose32Bit(I)<= not Compose32Bit(I);
			
			if RxCharIsCommaOut(I)(0)='1' then--if the comma is at its allowed position
				Compose32Bit(I)<='0';--next 32 bit word can be false but afterwards it is correct (goal relax timing-->works now)
			end if;
		end if;
	end process;

	SecondDeSerPro_I : process(UsrClkIn)
		-- variable Compose32Bit_I : std_logic:='0';
	begin
		if rising_edge(UsrClkIn) then
			gt_rxdata_old(I)<=RxDataOut(I);
			gt_rxcharisk_old(I)<=RxCharIsKOut(I);
			
			-- Compose32Bit_I:= not Compose32Bit_I;
			
			-- if RxCharIsCommaOut(I)(0)='1' then--if the comma is at its allowed position
				-- Compose32Bit_I:='1';--signal 
			-- end if;
			
			if Compose32Bit(I)='1' then
				gt_rxdata32(I)<=gt_rxdata_old(I)&RxDataOut(I);
				gt_rxcharisk4(I)<=gt_rxcharisk_old(I)&RxCharIsKOut(I);
			end if;
		end if;
	end process;
	
	GtRxDataOut(I) <= gt_rxdata32(I);
	CharIsKOut(I)(3 downto 0) <= gt_rxcharisk4(I);
end generate SecondDeSer;

SerializerTx : for I in TxMGTLow to TxMGTHigh generate
	SerializerTxProcess_I : process(UsrClkIn)
	begin
		if rising_edge(UsrClkIn) then
			SerializerTxByteNumber(I)<= not SerializerTxByteNumber(I);
		end if;
	end process;	
	
	SerializerTxProcessData_I : process(UsrClkIn)
	begin
		if rising_edge(UsrClkIn) then
			if SerializerTxByteNumber(I)='1' then
				TxDataIn(I)<=gt_txdata32(I)(31 downto 16);
				gt_txdata_new(I)<=gt_txdata32(I)(15 downto 0);
			else
				TxDataIn(I)<=gt_txdata_new(I);
			end if;
		end if;
	end process;

	SerializerTxProcessKChar_I : process(UsrClkIn)
	begin
		if rising_edge(UsrClkIn) then
			if SerializerTxByteNumber(I)='1' then
				TxCharIsKIn(I)<=gt_txcharisk4(I)(3 downto 2);
				gt_txcharisk_new(I)<=gt_txcharisk4(I)(1 downto 0);
			else
				TxCharIsKIn(I)<=gt_txcharisk_new(I);
			end if;
		end if;
	end process;

	gt_txdata32(I)   <= GtTxDataIn(I);
	gt_txcharisk4(I) <= CharIsKIn(I)(3 downto 0);
end generate SerializerTx;

--One MGTRefClk for logic, TxoutClk did never work with IPCore of version 3.X
-- TxOutClk<=gt_txoutclk_out(TxOutClkSelection);

end Behavioral;																				
