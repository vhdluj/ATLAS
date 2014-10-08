----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.07.2014 12:06:08
-- Design Name: 
-- Module Name: extended_ipbus - Behavioral
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

use work.ipbus.all;
use work.L1TopoDataTypes.all;
use work.L1TopoGTConfiguration.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ipbusModule is
    Port (
        sysclk40: in std_logic;
        sysclk80: in std_logic;
        sysclk160: in std_logic;
        sysclk400: in std_logic;
        sysclk_pll_locked: in std_logic;
        ipbBridgeBusIn: in std_logic_vector(4 downto 0);
        ipbBridgeBusOut: out std_logic_vector(2 downto 0);
        
        ttcBridgeControl: out std_logic_vector(9 downto 0);
        ttcBridgeStatus: in std_logic_vector(12 downto 0);
        ttcBroadcast: in std_logic;
                
        ChannelControl: out arraySLV32(MGTHigh downto MGTLow);
        QuadControl: out arraySLV32(QuadHigh downto QuadLow);
        ChannelStatus: in arraySLV32(MGTHigh downto MGTLow);
        DataShift40MHz: out  arraySLV3(MGTHigh downto MGTLow);--+-25 ns delay, do not expect this to work for large delays
        CRCErrorCounter: in arraySLV32(MGTHigh downto MGTLow);
                
        --GT transmitter signals
        GtTxData: out  arraySLV32(TxMGTHigh downto TxMGTLow);
        GtTxCharIsK: out  arraySLV4(TxMGTHigh downto TxMGTLow);
        
        spyData36BitFromMGTs: in arraySLV36(MGTHigh downto MGTLow);
        enablePlaybackOfMGTs: out std_logic;
        playbackData36BitFakingMGTs: out arraySLV36(MGTHigh downto MGTLow);
        
        spyData128BitFromDeserialisers: in arraySLV128(MGTHigh downto MGTLow);
        enablePlaybackOfDeserialisers: out std_logic;
        playbackData128BitFakingDeserialisers: out arraySLV128(MGTHigh downto MGTLow);
        
        
        SortParameters: out ParameterSpace(NumberOfSortAlgorithms - 1 downto 0);
        AlgoParameters: out ParameterSpace(NumberOfAlgorithms - 1 downto 0);
        
        spyData32BitFromAlgos: in std_logic_vector(31 downto 0);
        enablePlaybackOfAlgos: out std_logic;
        playbackData32BitFakingAlgos: out std_logic_vector(31 downto 0);
        
        ipbBridgeControl: in std_logic_vector(29 downto 0);
        ipbBridgeStatus: out std_logic_vector(24 downto 0);
        
        debugIPBusBridge: out std_logic_vector(239 downto 0);
        
        debugJetArray: in std_logic_vector(127 downto 0);
        debugGenericArray: in std_logic_vector(127 downto 0);
        debugDPhi: in std_logic_vector(dPhiDebugWidth-1 downto 0 )
--        debugPlaybackSpy128: out std_logic_vector(432 downto 0);
--        debugPlaybackSpy32: out std_logic_vector(176 downto 0)
        
        
--        datasource: in std_logic_vector(35 downto 0);
--        results: in std_logic_vector(31 downto 0)
        
    );
end ipbusModule;

architecture Behavioral of ipbusModule is

    signal ipb_rst: std_logic;
    signal ipb_master_write: ipb_wbus;
    signal ipb_master_read: ipb_rbus;
    
    signal ipbBridgeErrorCounter: std_logic_vector(29 downto 0);
    
--    signal idelay_counter_0 :  std_logic_vector(4 downto 0);
--    signal idelay_counter_1 :  std_logic_vector(4 downto 0);
--    signal idelay_counter_2 :  std_logic_vector(4 downto 0);
--    signal idelay_counter_3 :  std_logic_vector(4 downto 0);
--    signal idelay_counter_4 :  std_logic_vector(4 downto 0);
    
begin



ipbBridge: entity work.ipbusBridge
    port map(
        sysclk => sysclk40,
        parallelclk => sysclk80,
        serialclk => sysclk400,
        pll_locked => sysclk_pll_locked,
        ipb_read => ipb_master_read,
        ipbBridgeBusOut => ipbBridgeBusOut,
        ipbBridgeBusIn => ipbBridgeBusIn,
        ipb_write => ipb_master_write,
        control => ipbBridgeControl, --(29 downto 0 => '0'),
        status => ipbBridgeStatus,
        errorCounter_out => ipbBridgeErrorCounter,
        debugIPBusBridge => debugIPBusBridge 
    );



    ipb_rst <= not sysclk_pll_locked;

slaves: entity work.slaves
    port map(
        sysclk40 => sysclk40,
        sysclk80 => sysclk80,
        sysclk160 => sysclk160,
        ipb_rst => ipb_rst,
        ipb_in => ipb_master_write,
        ipb_out => ipb_master_read,
        
        ipbBridgeErrorCounter => ipbBridgeErrorCounter,
        
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
        
        spyData128BitFromDeserialisers => spyData128BitFromDeserialisers,
        enablePlaybackOfDeserialisers => enablePlaybackOfDeserialisers,
        playbackData128BitFakingDeserialisers => playbackData128BitFakingDeserialisers,
        
        SortParameters => SortParameters,
        AlgoParameters => AlgoParameters,
        
        spyData32BitFromAlgos => spyData32BitFromAlgos,
        enablePlaybackOfAlgos => enablePlaybackOfAlgos,
        playbackData32BitFakingAlgos => playbackData32BitFakingAlgos,
        
--        debugPlaybackSpy128 => debugPlaybackSpy128,
--        debugPlaybackSpy32 => debugPlaybackSpy32
        
        
        debugJetArray => debugJetArray,
        debugGenericArray => debugGenericArray,
        debugDPhi => debugDPhi
        
    );


end Behavioral;
