----------------------------------------------------------------------------------
-- Company: Johannes Gutenberg-Universitaet Mainz
-- Engineer: Christian Kahra
-- 
-- Create Date: 14.07.2014 16:06:32
-- Design Name: L1TopoProcessor
-- Module Name: top_L1TopoProcessor - Behavioral
-- Project Name: Atlas Level-1 Topological Processor
-- Target Devices: 
-- Tool Versions: Vivado 14.2
-- Description: top module
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
use IEEE.NUMERIC_STD.ALL;

use work.L1TopoDataTypes.all;
use work.L1TopoFunctions.all;
use work.L1TopoGTConfiguration.all;

use work.rod_l1_topo_types_const.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity top_L1TopoProcessor is
  generic(
  LINES_NUMBER      : integer := NUMBER_OF_ROS_OUTPUT_BUSES;
  SIMULATION        : boolean := false;
  ENABLE_IPBUS      : boolean := false;
  ENABLE_ALGORITHMS : boolean := false;
  ENABLE_GT         : boolean := false;
  ENABLE_ROD        : boolean := true
  );
    Port ( 
        GCK1_CLK_P, GCK1_CLK_N: in std_logic;
        GCK2_CLK_P, GCK2_CLK_N: in std_logic;
        
        MGT3_CLK_P, MGT3_CLK_N: in std_logic_vector(10 downto 10);
        MGT4_CLK_P, MGT4_CLK_N: in std_logic_vector(10 downto 10);
        
--        RxP : in std_logic_vector(MGTHigh downto MGTLow);
--        RxN : in std_logic_vector(MGTHigh downto MGTLow);
--        TxP : out std_logic_vector(TxMGTHigh downto TxMGTLow);
--        TxN : out std_logic_vector(TxMGTHigh downto TxMGTLow);
--        MgtRefClk0P,MgtRefClk0N: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz                      
--        MgtRefClk1P,MgtRefClk1N: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz

--        OPTO8_P, OPTO8_N: in std_logic_vector(11 downto 0);
        OPTO9_P, OPTO9_N: in std_logic_vector(11 downto 8);
--        OPTO10_P, OPTO10_N: in std_logic_vector(11 downto 0);
--        OPTO11_P, OPTO11_N: in std_logic_vector(11 downto 0);
--        OPTO12_P, OPTO12_N: in std_logic_vector(11 downto 0);
--        OPTO13_P, OPTO13_N: in std_logic_vector(11 downto 0);
--        OPTO14_P, OPTO14_N: in std_logic_vector(11 downto 0);

        OPTO_T2_P, OPTO_T2_N: out std_logic_vector(11 downto 8);
  
  -- ipbus      
        CTRLBUS_P_21, CTRLBUS_N_21: out std_logic;
        CTRLBUS_P_22, CTRLBUS_N_22: out std_logic;
        CTRLBUS_P_23, CTRLBUS_N_23: out std_logic;
        CTRLBUS_P_24, CTRLBUS_N_24: in std_logic;
        CTRLBUS_P_25, CTRLBUS_N_25: in std_logic;
        CTRLBUS_P_26, CTRLBUS_N_26: in std_logic;
        CTRLBUS_P_28, CTRLBUS_N_28: in std_logic;
        CTRLBUS_P_40, CTRLBUS_N_40: in std_logic;
  -- ttc bridge     
        --CTRLBUS_P_27, CTRLBUS_N_27: in std_logic;
        CTRLBUS_P_39, CTRLBUS_N_39 : in std_logic;
  -- ipbus delays      
--        CTRLBUS_P_30, CTRLBUS_N_30: in std_logic;
--        CTRLBUS_P_31, CTRLBUS_N_31: in std_logic;
--        CTRLBUS_P_32, CTRLBUS_N_32: in std_logic;
--        CTRLBUS_P_33, CTRLBUS_N_33: in std_logic;
--        CTRLBUS_P_34, CTRLBUS_N_34: in std_logic;
   
        --ROD INTERFACE
        CTRLBUS_P : out std_logic_vector(LINES_NUMBER-1 downto 0);  --ROD DATA_LINES 
        CTRLBUS_N : out std_logic_vector(LINES_NUMBER-1 downto 0);
  
  -- 37  
        KINTEX_READY_P_IN : in std_logic;
        KINTEX_READY_N_IN : in std_logic;
  -- 38  
        BUSY_TO_KINTEX_P : out std_logic;
        BUSY_TO_KINTEX_N : out std_logic;
  -- 41  
        L1_ACCEPTED_IN_P : in std_logic;
        L1_ACCEPTED_IN_N : in std_logic
        
        
--        EXT_V7_P_02, EXT_V7_N_02: out std_logic;
--        EXT_V7_P_03, EXT_V7_N_03: out std_logic;
--        EXT_V7_P_04, EXT_V7_N_04: out std_logic;
--        EXT_V7_P_05, EXT_V7_N_05: out std_logic;
--        EXT_V7_P_06, EXT_V7_N_06: out std_logic;
--        EXT_V7_P_07, EXT_V7_N_07: out std_logic;
--        EXT_V7_P_08, EXT_V7_N_08: out std_logic;
--        EXT_V7_P_09, EXT_V7_N_09: out std_logic;
--        EXT_V7_P_10, EXT_V7_N_10: out std_logic;
--        EXT_V7_P_11, EXT_V7_N_11: out std_logic;
--        EXT_V7_P_12, EXT_V7_N_12: out std_logic;
--        EXT_V7_P_13, EXT_V7_N_13: out std_logic;
--        EXT_V7_P_14, EXT_V7_N_14: out std_logic;
--        EXT_V7_P_15, EXT_V7_N_15: out std_logic;
--        EXT_V7_P_16, EXT_V7_N_16: out std_logic;
--        EXT_V7_P_17, EXT_V7_N_17: out std_logic
        
    );
end top_L1TopoProcessor;

architecture Behavioral of top_L1TopoProcessor is

    attribute dont_touch: string;

    signal gck1: std_logic;
    signal gck2: std_logic;
    signal sysclk40 : std_logic;
    signal sysclk80 : std_logic;
    signal sysclk160: std_logic;
    signal sysclk200: std_logic;
    signal sysclk320: std_logic;
    signal sysclk400: std_logic;
    signal clockBus : std_logic_vector(3 downto 0);
    
    signal sysclk_pll_locked: std_logic;


    signal MgtRefClk0P, MgtRefClk0N: std_logic_vector(QuadHigh downto QuadLow);
	signal MgtRefClk1P, MgtRefClk1N: std_logic_vector(QuadHigh downto QuadLow);


    signal RxP, RxN: std_logic_vector(MGTHigh downto MGTLow);
    signal TxP, TxN: std_logic_vector(TXMGTHigh downto TXMGTLow);


    signal ipbusBridgeBusIn,  ipbusBridgeBusIn_p,  ipbusBridgeBusIn_n : std_logic_vector(4 downto 0);
    signal ipbusBridgeBusOut, ipbusBridgeBusOut_p, ipbusBridgeBusOut_n: std_logic_vector(2 downto 0);
    
    signal ttcBridgeIn, ttcBridgeIn_p, ttcBridgeIn_n: std_logic;
    signal ttcBridgeControl: std_logic_vector(9 downto 0);
    signal ttcBridgeStatus: std_logic_vector(12 downto 0);
    signal ttcBroadcast, ttcL1Accept, ttcBunchCounterReset: std_logic;
    
    signal outOfBand, outOfBand_reg, outOfBand_p, outOfBand_n: std_logic_vector(4 downto 0);
          
--    signal L1Accept, ttc_bunchcounter_reset, ttc_broadcast_01xxxx: std_logic; 

--    signal results: std_logic_vector(31 downto 0);
--    signal ctp, ctp_p, ctp_n: std_logic_vector(15 downto 0);


    signal receivedData128BitFromDeserialisers : arraySLV128(MGTHigh downto MGTLow);
    signal muxedData128BitToAlgorithms         : arraySLV128(MGTHigh downto MGTLow);
        

    signal ChannelControl  : arraySLV32(MGTHigh downto MGTLow);
	signal QuadControl     : arraySLV32(QuadHigh downto QuadLow);
	signal ChannelStatus   : arraySLV32(MGTHigh downto MGTLow);
	signal DataShift40MHz  : arraySLV3(MGTHigh downto MGTLow);
	signal CRCErrorCounter : arraySLV32(MGTHigh downto MGTLow);


    signal GtTxData    : arraySLV32(TxMGTHigh downto TxMGTLow);
    signal GtTxCharIsK : arraySLV4(TxMGTHigh downto TxMGTLow);

    signal spyData36BitFromMGTs:  arraySLV36(MGTHigh downto MGTLow);
    signal enablePlaybackOfMGTs:  std_logic;
    signal playbackData36BitFakingMGTs:  arraySLV36(MGTHigh downto MGTLow);
     
    
    
    
    signal enablePlaybackOfDeserialisers:  std_logic;
    signal playbackData128BitFakingDeserialisers:  arraySLV128(MGTHigh downto MGTLow);
    
    
    signal SortParameters: ParameterSpace(NumberOfSortAlgorithms - 1 downto 0);
    signal AlgoParameters: ParameterSpace(NumberOfAlgorithms - 1 downto 0);
    
    
    --algo ports                            
    signal emTOBs    :  ClusterArray(InputWidthEM  - 1 downto 0);
    signal tauTOBs   :  ClusterArray(InputWidthTau - 1 downto 0);
    signal jetTOBs   :  JetArray    (InputWidthJet - 1 downto 0);
    signal muTOBs    :  MuonArray   (InputWidthMU  - 1 downto 0);
    signal signed_Ex :  std_logic_vector(14 downto 0);
    signal signed_Ey :  std_logic_vector(14 downto 0);
    
    signal AlgoResults:  std_logic_vector(NumberOfResultBits - 1 downto 0);
    signal AlgoOverflow: std_logic_vector(NumberOfOverflowBits - 1 downto 0);
    
    
    signal spyData32BitFromAlgos: std_logic_vector(31 downto 0);
    signal enablePlaybackOfAlgos: std_logic;
    signal playbackData32BitFakingAlgos: std_logic_vector(31 downto 0);
    
    signal ipbBridgeStatus: std_logic_vector(24 downto 0);
    signal ipbBridgeControl: std_logic_vector(29 downto 0);
    signal ipbBridgeControl_reg: std_logic_vector(24 downto 0);
    
--    signal debugTTCBridge: std_logic_vector(17 downto 0);
--    attribute dont_touch of debugTTCBridge: signal is "true";
    
    signal debugIPBusBridge: std_logic_vector(269 downto 0);
    attribute dont_touch of debugIPBusBridge: signal is "true";
    
    signal debugGenericArray: std_logic_vector(127 downto 0);
    signal debugJetArray: std_logic_vector(127 downto 0);
    signal debugDPhi: std_logic_vector(dPhiDebugWidth-1 downto 0 );
    
--    signal debugPlaybackSpy128: std_logic_vector(432 downto 0);
--    attribute dont_touch of debugPlaybackSpy128: signal is "true";
    
--    signal debugPlaybackSpy32: std_logic_vector(176 downto 0);
--    attribute dont_touch of debugPlaybackSpy32: signal is "true";

    signal rod_reset, kintex_ready, l1_accepted_in, l0_busy : std_logic := '0';
    
    signal number_of_slices : slice_parameters_array_u;
    signal lvl0_offset      : slice_parameters_array_u;
  
    signal cntr_for_ros_roi_bus : in_data_array := (others => (others => '0'));  --dummy cntr for tests
  
    signal out_data              : std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0)          := (others => '0');
    signal data_valid_out        : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0) := (others => '0');
    signal special_character_out : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0) := (others => '0');
    signal global_reset_cnt      : unsigned(15 downto 0)                                   := (others => '0');

begin


--input mapping


    MgtRefClk0P(QuadLow) <= MGT3_CLK_P(10);
	MgtRefClk0N(QuadLow) <= MGT3_CLK_N(10);
	MgtRefClk1P(QuadLow) <= MGT4_CLK_P(10);
	MgtRefClk1N(QuadLow) <= MGT4_CLK_N(10);

RXMGTMap_GEN: for i in MGTHigh downto MGTLow generate begin
    RxP(i) <= OPTO9_P(i-MGTLow+8);
    RxN(i) <= OPTO9_N(i-MGTLow+8);  
end generate;


    ipbusBridgeBusIn_p(0)  <= CTRLBUS_P_24;
	ipbusBridgeBusIn_n(0)  <= CTRLBUS_N_24;
	ipbusBridgeBusIn_p(1)  <= CTRLBUS_P_25;
	ipbusBridgeBusIn_n(1)  <= CTRLBUS_N_25;
	ipbusBridgeBusIn_p(2)  <= CTRLBUS_P_26;
	ipbusBridgeBusIn_n(2)  <= CTRLBUS_N_26;
	ipbusBridgeBusIn_p(3)  <= CTRLBUS_P_28;
    ipbusBridgeBusIn_n(3)  <= CTRLBUS_N_28;
    ipbusBridgeBusIn_p(4)  <= CTRLBUS_P_40;
    ipbusBridgeBusIn_n(4)  <= CTRLBUS_N_40;


--    ttcBridgeIn_p <= CTRLBUS_P_27;
--    ttcBridgeIn_n <= CTRLBUS_N_27;
    ttcBridgeIn_p <= CTRLBUS_P_39;
    ttcBridgeIn_n <= CTRLBUS_N_39;

--    outOfBand_p(0) <= CTRLBUS_P_30;
--    outOfBand_n(0) <= CTRLBUS_N_30;
--    outOfBand_p(1) <= CTRLBUS_P_31;
--    outOfBand_n(1) <= CTRLBUS_N_31;
--    outOfBand_p(2) <= CTRLBUS_P_32;
--    outOfBand_n(2) <= CTRLBUS_N_32;
--    outOfBand_p(3) <= CTRLBUS_P_33;
--    outOfBand_n(3) <= CTRLBUS_N_33;
--    outOfBand_p(4) <= CTRLBUS_P_34;
--    outOfBand_n(4) <= CTRLBUS_N_34;


--input buffer

GCK1_IBUFGDS: IBUFGDS
	port map(
		I  => GCK1_CLK_P,
		IB => GCK1_CLK_N,
		O  => gck1
);


GCK2_IBUFGDS: IBUFGDS
	port map(
		I  => GCK2_CLK_P,
		IB => GCK2_CLK_N,
		O  => gck2
);


IPBUSBRIDGE_IN_IBUFDS_GEN: for i in 4 downto 0 generate
	IPBUSBRIDGE_IN_IBUFDS: IBUFDS
		port map(
			I  => ipbusBridgeBusIn_p(i),
			IB => ipbusBridgeBusIn_n(i),
			O  => ipbusBridgeBusIn(i)
		);
		
		
--	OOB_IBUFDS: IBUFDS
--	   port map(
--	       I  => outOfBand_p(i),
--	       IB => outOfBand_n(i),
--	       O  => outOfBand(i)
--	   );	
		
	end generate;




TTC_CTRLBUS_IBUFDS: IBUFDS
	port map(
		I => ttcBridgeIn_p,
		IB => ttcBridgeIn_n,
		O => ttcBridgeIn
	);





--sub modules

clk: entity work.clocks
	port map(
		gck1			=> gck1,
		gck2			=> gck2,
		sysclk40_out	=> sysclk40,
		sysclk80_out	=> sysclk80,
		sysclk160_out	=> sysclk160,
		sysclk200_out	=> sysclk200,
		sysclk320_out	=> sysclk320,
		sysclk400_out   => sysclk400,
		
		sysclk_pll_locked_out => sysclk_pll_locked
	); 


    clockBus(0) <= sysclk40;--40MHz
	clockBus(1) <= sysclk80;--80MHz
	clockBus(2) <= sysclk160;--160MHz
	clockBus(3) <= sysclk320;--320MHz




ttc: entity work.ttcBridge
	port map(
		sysclk40 => sysclk40,
		sysclk80 => sysclk80,
		sysclk200 => sysclk200,
		sysclk_pll_locked => sysclk_pll_locked,
		serialData => ttcBridgeIn,
		control => ttcBridgeControl,
		status => ttcBridgeStatus,
		ttcL1Accept => ttcL1Accept,
		ttcBroadcast => ttcBroadcast,
		ttcBunchCounterReset => ttcBunchCounterReset
		
--		debugTTCBridge => debugTTCBridge 
	);






ipb: entity work.ipbusModule
    port map(
        sysclk40 => sysclk40,
        sysclk80 => sysclk80,
        sysclk160 => sysclk160,
        sysclk400 => sysclk400,
        
        sysclk_pll_locked => sysclk_pll_locked,
        
        ipbBridgeBusIn => ipbusBridgeBusIn,
        ipbBridgeBusOut => ipbusBridgeBusOut,
        
        ttcBridgeControl => ttcBridgeControl,
        ttcBridgeStatus => ttcBridgeStatus,
        ttcBroadcast => ttcBroadcast,
                        
        ChannelControl => ChannelControl,
        QuadControl => QuadControl,
        ChannelStatus => ChannelStatus,
        DataShift40MHz => DataShift40MHz,
        CRCErrorCounter => CRCErrorCounter,
        
        GtTxData => GtTxData,
        GtTxCharIsK => GtTxCharIsK,
        
        
        spyData36BitFromMGTs => spyData36BitFromMGTs,
        enablePlaybackOfMGTs => enablePlaybackOfMGTs,
        playbackData36BitFakingMGTs => playbackData36BitFakingMGTs,
        
        spyData128BitFromDeserialisers => receivedData128BitFromDeserialisers,
        enablePlaybackOfDeserialisers => enablePlaybackOfDeserialisers,
        playbackData128BitFakingDeserialisers => playbackData128BitFakingDeserialisers,
        
        
        
        SortParameters => SortParameters,
        AlgoParameters => AlgoParameters,
        
        
        spyData32BitFromAlgos => spyData32BitFromAlgos,
        enablePlaybackOfAlgos => enablePlaybackOfAlgos,
        playbackData32BitFakingAlgos => playbackData32BitFakingAlgos,
        
        ipbBridgeControl => ipbBridgeControl,
        ipbBridgeStatus => ipbBridgeStatus,

        
        debugIPBusBridge => debugIPBusBridge(239 downto 0),
--        debugPlaybackSpy128 => debugPlaybackSpy128,
--        debugPlaybackSpy32 => debugPlaybackSpy32
        
        
        debugJetArray => debugJetArray,
        debugGenericArray => debugGenericArray,
        debugDPhi => debugDPhi
        
    );





GT_Inout_I: entity work.GT_Inout
    Port map
	(
	--physical connection to FPGA pins
	RxP => RxP,
	RxN => RxN,
	TxP => TxP,
	TxN => TxN,
	MgtRefClk0P => MgtRefClk0P,
	MgtRefClk0N => MgtRefClk0N,
	MgtRefClk1P => MgtRefClk1P,
	MgtRefClk1N => MgtRefClk1N,

	--internal FPGA clock signals after MMCM
	UsrClkIn => sysclk320,
	UsrClk2In => sysclk320,
	SYSCLK40 => sysclk40,
	clockBus => clockBus,
	
	--GT transmitter signals
	GtTxData => GtTxData,
	GtTxCharIsK => GtTxCharIsK,

	--IP Bus/VIO related signals
	ChannelControl => ChannelControl,
	QuadControl => QuadControl,
	ChannelStatus => ChannelStatus,
	DataShift40MHz => DataShift40MHz,
	CRCError_Amount	=>CRCErrorCounter,
	
	--Data for algorithms (and CRC)--> this are the only signals needed for algorithms
	Data128 => receivedData128BitFromDeserialisers,
	
	--Debug ports, leave open when you do not want to debug and want to save some logic resources
--	Charisk128 => Charisk128,--
--	GtRxData => GtRxData,--
--	GtRxCharIsK => GtRxCharIsK,--
--	Data128AndChariK128_Just_Done => Data128AndChariK128_Just_Done,--
--	CrcError => CrcError,--
--	CRC_Just_Done => CRC_Just_Done,--
	
	spyData36BitFromMGTs => spyData36BitFromMGTs,
    enablePlaybackOfMGTs => enablePlaybackOfMGTs,
    playbackData36BitFakingMGTs => playbackData36BitFakingMGTs
	
	);



    muxedData128BitToAlgorithms <= receivedData128BitFromDeserialisers when enablePlaybackOfDeserialisers='0' else playbackData128BitFakingDeserialisers;




    ----make data ready to be used by alg.
    
    ----JET_TOBs
    -- Avago(Quad): AV2(113, 114, 115), AV3(116, 117, 118) 
    -- AV4(119), AV6(213, 214, 215), AV7(216, 217, 218), AV4(219)
    --JET_GEN: for MGT in 24-1 downto 0 generate begin
    JET_GEN: for MGT in 12 downto 12 generate 
        constant jetMGT: natural := MGT-12;
    begin
        jetTOBs( 4*jetMGT + 0 ) <= DeserialisedData_to_JetTOB(muxedData128BitToAlgorithms(MGT)(127 downto 100), '0');
        jetTOBs( 4*jetMGT + 1 ) <= DeserialisedData_to_JetTOB(muxedData128BitToAlgorithms(MGT)(99 downto 72), '0');
        jetTOBs( 4*jetMGT + 2 ) <= DeserialisedData_to_JetTOB(muxedData128BitToAlgorithms(MGT)(71 downto 44), '0');
        jetTOBs( 4*jetMGT + 3 ) <= DeserialisedData_to_JetTOB(muxedData128BitToAlgorithms(MGT)(43 downto 16), '0');
    end generate JET_GEN;
    
    
    -- AV6(213, 214, 215)
    --EM_GEN: for MGT in 40-1 downto 28 generate
    EM_GEN: for MGT in 13 downto 13 generate
        constant emMGT: natural := MGT-13;
    begin
        emTOBs( 5*emMGT + 0 ) <= DeserialisedData_to_ClusterTOB(muxedData128BitToAlgorithms(MGT)(127 downto 105), "00");
        emTOBs( 5*emMGT + 1 ) <= DeserialisedData_to_ClusterTOB(muxedData128BitToAlgorithms(MGT)(104 downto 82), "00");
        emTOBs( 5*emMGT + 2 ) <= DeserialisedData_to_ClusterTOB(muxedData128BitToAlgorithms(MGT)(81 downto 59), "00");
        emTOBs( 5*emMGT + 3 ) <= DeserialisedData_to_ClusterTOB(muxedData128BitToAlgorithms(MGT)(58 downto 36), "00");
        emTOBs( 5*emMGT + 4 ) <= DeserialisedData_to_ClusterTOB(muxedData128BitToAlgorithms(MGT)(35 downto 13), "00");
    end generate EM_GEN;
    
    
    -- AV7(216, 217, 218)
    --TAU_GEN: for MGT in 52-1 downto 40 generate
    TAU_GEN: for MGT in 14 downto 14 generate
        constant tauMGT: natural := MGT-14;
    begin
        tauTOBs( 5*tauMGT + 0 ) <= DeserialisedData_to_ClusterTOB(muxedData128BitToAlgorithms(MGT)(127 downto 105), "00");
        tauTOBs( 5*tauMGT + 1 ) <= DeserialisedData_to_ClusterTOB(muxedData128BitToAlgorithms(MGT)(104 downto 82), "00");
        tauTOBs( 5*tauMGT + 2 ) <= DeserialisedData_to_ClusterTOB(muxedData128BitToAlgorithms(MGT)(81 downto 59), "00");
        tauTOBs( 5*tauMGT + 3 ) <= DeserialisedData_to_ClusterTOB(muxedData128BitToAlgorithms(MGT)(58 downto 36), "00");
        tauTOBs( 5*tauMGT + 4 ) <= DeserialisedData_to_ClusterTOB(muxedData128BitToAlgorithms(MGT)(35 downto 13), "00");
    end generate TAU_GEN;
    
    
--    -- AV4(119)
--    --MU_GEN : for MGT in 28-1 downto 24 generate
--    MU_GEN : for MGT in 36-1 downto 32 generate
--        --constant muMGT: natural := MGT-24;
--        constant muMGT: natural := MGT-32;
--    begin
--        muTOBs( 4*muMGT + 0 ) <= DeserialisedData_to_MyonTOB(muxedData128BitToAlgorithms(MGT)(127 downto 120));
--        muTOBs( 4*muMGT + 1 ) <= DeserialisedData_to_MyonTOB(muxedData128BitToAlgorithms(MGT)(119 downto 112));
--        muTOBs( 4*muMGT + 2 ) <= DeserialisedData_to_MyonTOB(muxedData128BitToAlgorithms(MGT)(111 downto 104));
--        muTOBs( 4*muMGT + 3 ) <= DeserialisedData_to_MyonTOB(muxedData128BitToAlgorithms(MGT)(103 downto 96));
--    end generate MU_GEN;
    
    
    
    -- AV4(219)
    signed_Ey(14 downto 8)<=  muxedData128BitToAlgorithms(15)(78  downto 72  );  --24
    signed_Ey(7 downto 0) <=  muxedData128BitToAlgorithms(15)(51  downto 44  );                 
    signed_Ex             <=  muxedData128BitToAlgorithms(15)(26  downto 12  );



DEBUGJET_GEN: for i in InputWidthJet-1 downto 0 generate 
    constant tobWidth: natural := JetEt1BitWidth + JetEt2BitWidth + JetEtaBitWidth + JetPhiBitWidth;
    constant e12: natural := JetEt1BitWidth + JetEt2BitWidth;
    constant e12Eta: natural := e12 + JetEtaBitWidth;
begin

    debugJetArray(i*tobWidth + JetEt2BitWidth-1 downto i*tobWidth) <= jetTOBs(i).Et2;
    debugJetArray(i*tobWidth + e12-1 downto i*tobWidth + JetEt2BitWidth) <= jetTOBs(i).Et1;
    debugJetArray(i*tobWidth + e12Eta-1 downto i*tobWidth + e12) <= jetTOBs(i).Eta;
    debugJetArray((i+1)*tobWidth-1 downto i*tobWidth + e12Eta) <= jetTOBs(i).Phi;

end generate;
    
debugJetArray(127 downto InputWidthJet*(JetEt1BitWidth + JetEt2BitWidth + JetEtaBitWidth + JetPhiBitWidth)) <= (others => '0');

    
algo: entity work.L1TopoAlgorithms
    port map(
        ClockBus => ClockBus(2 downto 0),
        JetTobArray => jetTOBs,
        EmTobArray => emTOBs,
        TauTobArray => tauTOBs,
        signedEx => signed_Ex,
        signedEy => signed_Ey,
        AlgoParameters => AlgoParameters,
        SortParameters => SortParameters,
        Results => AlgoResults,
        Overflow => AlgoOverflow,
        
        debugGenericArray => debugGenericArray,
        debugDPhi => debugDPhi
    );


    spyData32BitFromAlgos <= (31 downto NumberOfResultBits => '0') &  AlgoResults;




--output buffer

IPBUSBRIDGE_OUT_OBUFDS_GEN: for i in 2 downto 0 generate
	IPBUSBRIDGE_OUT_OBUFDS: OBUFDS
		port map(
			I  => ipbusBridgeBusOut(i),
			O  => ipbusBridgeBusOut_p(i),
			OB => ipbusBridgeBusOut_n(i)
		);
	end generate;




--RESULTS_ODDR_OBUFDS_GEN: for i in 15 downto 0 generate begin

--    results(i) <= '0';
--    results(16+i) <= '0';

--  RESULTS_ODDR: ODDR
--    generic map(
--      DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
--      INIT => '0',   -- Initial value for Q port ('1' or '0')
--      SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
--    port map (
--      Q => ctp(i),   -- 1-bit DDR output
--      C => sysclk40,    -- 1-bit clock input
--      CE => '1',  -- 1-bit clock enable input   
--      D1 => results(i),  -- 1-bit data input (positive edge)
--      D2 => results(16+i),  -- 1-bit data input (negative edge)
--      R => '0',    -- 1-bit reset input
--      S => '0'     -- 1-bit set input
--    );
    
    
--  RESULTS_OBUFDS: OBUFDS
--    port map(
--        I => ctp(i),
--        O => ctp_p(i),
--        OB => ctp_n(i)
--    );
    
--end generate;





--output mapping


TXMGTMap_GEN: for i in TxMGTHigh downto TxMGTLow generate begin
    OPTO_T2_P(i-TxMGTLow+8) <= TxP(i);
    OPTO_T2_N(i-TxMGTLow+8) <= TxN(i);  
end generate;




    CTRLBUS_P_21 <= ipbusBridgeBusOut_p(0);
	CTRLBUS_N_21 <= ipbusBridgeBusOut_n(0);
	CTRLBUS_P_22 <= ipbusBridgeBusOut_p(1);
	CTRLBUS_N_22 <= ipbusBridgeBusOut_n(1);
	CTRLBUS_P_23 <= ipbusBridgeBusOut_p(2);
	CTRLBUS_N_23 <= ipbusBridgeBusOut_n(2);


--debugging


--vio_idelayload: entity work.vio_ipb
--    port map(
--        clk => sysclk40,
--        probe_in0 => ipbBridgeStatus,
--        probe_out0 => ipbBridgeControl(24 downto 0)
--    );



IDELAYLOAD_GEN: for i in 4 downto 0 generate

--process(sysclk40) begin
--    if rising_edge(sysclk40) then
--          outOfBand_reg(i) <= outOfBand(i);
--          if outOfBand_reg(i)='0' and  outOfBand(i)='1' then ipbBridgeControl(25+i) <= '1';
--          else ipbBridgeControl(25+i) <= '0';
--          end if;
----        ipbBridgeControl_reg(i*5+4 downto i*5) <= ipbBridgeControl(i*5+4 downto i*5);
----        if ipbBridgeControl_reg(i*5+4 downto i*5) /= ipbBridgeControl(i*5+4 downto i*5) then ipbBridgeControl(25+i) <= '1';
----        else ipbBridgeControl(25+i) <= '0';
----        end if;
--    end if;
--end process;

ipbBridgeControl(25+i) <= '0';

end generate;





debugIPBusBridge(264 downto 240) <= ipbBridgeStatus;
debugIPBusBridge(269 downto 265) <= ipbBridgeControl(29 downto 25);

ILA_IPB: entity work.ila_ipbusBridge
    port map(
        clk => sysclk80,
        probe0 => debugIPBusBridge(31 downto 0),
        probe1(0) => debugIPBusBridge(32),
        probe2(0) => debugIPBusBridge(33),
        probe3 => debugIPBusBridge(47 downto 34),
        probe4 => debugIPBusBridge(71 downto 48),
        probe5 => debugIPBusBridge(74 downto 72),
        probe6 => debugIPBusBridge(76 downto 75),
        probe7 => debugIPBusBridge(116 downto 77),
        probe8 => debugIPBusBridge(148 downto 117),
        probe9 => debugIPBusBridge(180 downto 149),
        probe10(0) => debugIPBusBridge(181),
        probe11(0) => debugIPBusBridge(182),
        probe12 => debugIPBusBridge(196 downto 183),
        probe13 => debugIPBusBridge(201 downto 197),
        probe14 => debugIPBusBridge(206 downto 202),
        probe15 => debugIPBusBridge(210 downto 207),
        probe16 => debugIPBusBridge(214 downto 211),
        probe17 => debugIPBusBridge(218 downto 215),
        probe18 => debugIPBusBridge(222 downto 219),
        probe19 => debugIPBusBridge(226 downto 223),
        probe20 => debugIPBusBridge(231 downto 227),
        probe21(0) => debugIPBusBridge(232),
        probe22(0) => debugIPBusBridge(233),
        probe23(0) => debugIPBusBridge(234),
        probe24(0) => debugIPBusBridge(235),
        probe25(0) => debugIPBusBridge(236),
        probe26(0) => debugIPBusBridge(237),
        probe27 => debugIPBusBridge(239 downto 238),
        probe28 => debugIPBusBridge(244 downto 240),
        probe29 => debugIPBusBridge(249 downto 245),
        probe30 => debugIPBusBridge(254 downto 250),
        probe31 => debugIPBusBridge(259 downto 255),
        probe32 => debugIPBusBridge(264 downto 260),
        probe33 => debugIPBusBridge(269 downto 265)
    );


  -----------------------------------------------------------------------------
  -- ROD 
  -----------------------------------------------------------------------------
  OBUFDS_BUSY_OUT : OBUFDS
      generic map (IOSTANDARD => "DEFAULT")
      port map (I             => l0_busy, O => BUSY_TO_KINTEX_P, OB => BUSY_TO_KINTEX_N);
    IBUFDS_L1ACCPETED_IN : IBUFDS
      generic map (DIFF_TERM => true, IBUF_LOW_PWR => false, IOSTANDARD => "DEFAULT")
      port map (O            => l1_accepted_in, I => L1_ACCEPTED_IN_P, IB => L1_ACCEPTED_IN_N);
    IBUFDS_inst_0 : IBUFDS
      generic map (DIFF_TERM => true, IBUF_LOW_PWR => false, IOSTANDARD => "DEFAULT")
      port map (O            => kintex_ready, I => KINTEX_READY_P_IN, IB => KINTEX_READY_N_IN);
  
  

    rod_reset <= (not sysclk_pll_locked) or (not kintex_ready);
    
    -- test registers -  should be connected to IPbus
    GENERATE_CNTRS_FOR_ROS_ROI_DATA : for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1 generate
      CNTR_FOR_ROS_ROI_BUS_PROC : process (sysclk40)
      begin
        if rising_edge(sysclk40) then
          --for j in 0 to 7 loop
          --  cntr_for_ros_roi_bus(i)((j+1)*16-1 downto j*16+12) <= std_logic_vector(to_unsigned(j,4));
          --  cntr_for_ros_roi_bus(i)((j+1)*16-1-8 downto j*16) <= std_logic_vector(unsigned(cntr_for_ros_roi_bus(i)((j+1)*16-1-8 downto j*16)) + 1);
          --end loop;
          cntr_for_ros_roi_bus(i) <= (others => '1');
          --cntr_for_ros_roi_bus(i) <= std_logic_vector(to_unsigned(i, cntr_for_ros_roi_bus(i)'length));
          --cntr_for_ros_roi_bus(i) <= x"fedcba98765432100123456789abcdef";
        end if;
      end process CNTR_FOR_ROS_ROI_BUS_PROC;
    end generate GENERATE_CNTRS_FOR_ROS_ROI_DATA;

    ASSIGN_NUMBER_OF_SLICES : for i in 0 to NUMBER_OF_SLICES'length-1 generate
      number_of_slices(i) <= to_unsigned(5, NUMBER_OF_SLICES(0)'length);  --to_unsigned(((i mod 16)+1), NUMBER_OF_SLICES(0)'length);
      lvl0_offset(i)      <= to_unsigned(i mod 6, LVL0_OFFSET(0)'length);  --to_unsigned(i mod 8, LVL0_OFFSET(0)'length);
    end generate ASSIGN_NUMBER_OF_SLICES;
    -- end of test registers

    L1TOPO_TO_DDR_INST : entity work.l1topo_to_ddr
      generic map (
        MAKE_SYNCH_INPUT => 0)
      port map (
        RESET                 => rod_reset,
        DATA_IN_CLK           => sysclk40,
        DATA_OUT_CLK          => sysclk80,
        NUMBER_OF_SLICES      => number_of_slices,
        SLICE_CHANGES_APROVED => kintex_ready,
        LVL0_ACCEPTED         => l1_accepted_in,
        LVL0_VALID            => '1',
        LVL0_GLOBAL_OFFSET    => x"a0",
        LVL0_FULL_THR         => x"03",
        LVL0_OFFSET           => lvl0_offset,
        ROS_ROI_IN_DATA       => cntr_for_ros_roi_bus,
        DATA_VALID_IN         => "1",
        OUT_DATA              => out_data,
        DATA_VALID_OUT        => data_valid_out,
        L0_BUSY               => l0_busy,
        SPECIAL_CHARACTER_OUT => special_character_out);

    TRANSMITTERS_WRAPPER_INST : entity work.TransmittersWrapper
      generic map(
        LINKS_NUMBER => LINES_NUMBER,
        SIMULATION   => SIMULATION
        )
      port map(
        RESET          => rod_reset,
        CLK_BIT_IN     => sysclk400,
        CLK_WORD_IN    => sysclk80,
        DATA_IN        => out_data,
        DATA_VALID_IN  => data_valid_out,
        DATA_KCTRL_IN  => special_character_out,
        DATA_PIN_P_OUT => CTRLBUS_P,
        DATA_PIN_N_OUT => CTRLBUS_N);





end Behavioral;
