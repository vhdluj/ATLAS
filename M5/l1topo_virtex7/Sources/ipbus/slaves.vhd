-- The ipbus slaves live in this entity - modify according to requirements
--
-- Ports can be added to give ipbus slaves access to the chip top level.
--
-- Dave Newbold, February 2011

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.ipbus.ALL;
use work.L1TopoDataTypes.all;
use work.L1TopoGTConfiguration.all;

entity slaves is
	port(
		sysclk40: in std_logic;
		sysclk80: in std_logic;
		sysclk160: in std_logic;
		ipb_rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		
		ipbBridgeErrorCounter: in std_logic_vector(29 downto 0);
		
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
        
        debugJetArray: in std_logic_vector(127 downto 0);
        debugGenericArray: in std_logic_vector(127 downto 0);
        debugDPhi: in std_logic_vector(dPhiDebugWidth-1 downto 0 )
        
--		debugPlaybackSpy128: out std_logic_vector(432 downto 0);
--		debugPlaybackSpy32: out std_logic_vector(176 downto 0)
		
		
		
--		idelay_counter_0: in std_logic_vector(4 downto 0);
--		idelay_counter_1: in std_logic_vector(4 downto 0);
--		idelay_counter_2: in std_logic_vector(4 downto 0);
--		idelay_counter_3: in std_logic_vector(4 downto 0);
--		idelay_counter_4: in std_logic_vector(4 downto 0)
	);

end slaves;

architecture rtl of slaves is

	constant NSLV: positive := 23;
	signal ipbw: ipb_wbus_array(NSLV-1 downto 0);
	signal ipbr: ipb_rbus_array(NSLV-1 downto 0);
	
	signal ipbBridgeErrorCounter_32bit: std_logic_vector(31 downto 0);
	
	signal ttcIDelayValue_32bit:        std_logic_vector(31 downto 0);
	signal ttcIDelayCurrentValue_32bit: std_logic_vector(31 downto 0);
	signal ttcL1AcceptDelay_32bit:      std_logic_vector(31 downto 0);
	signal ttcErrorCounter_32bit:       std_logic_vector(31 downto 0);
	signal ttcErrorCounterReset_32bit:  std_logic_vector(31 downto 0);
	
	signal ipbusPlaybackCharIsKFakingMGTs: std_logic_vector(31 downto 0);
	signal ipbusSpyCharIsKFromMGTs: std_logic_vector(31 downto 0);
	
	signal ipbusPlaybackCharIsKFakingDeserialisers: std_logic_vector(31 downto 0);
    signal ipbusSpyCharIsKFromDeserialisers: std_logic_vector(31 downto 0);
	
	
    signal ipb_out_int: ipb_rbus;
	signal PlaybackSpyControl: std_logic_vector(31 downto 0);
	
    signal idelay_counter_0_32bit: std_logic_vector(31 downto 0);
    signal idelay_counter_1_32bit: std_logic_vector(31 downto 0);
    signal idelay_counter_2_32bit: std_logic_vector(31 downto 0);
    signal idelay_counter_3_32bit: std_logic_vector(31 downto 0);
    signal idelay_counter_4_32bit: std_logic_vector(31 downto 0);

    
    signal ChannelControl_vector: std_logic_vector( (MGTHigh-MGTLow+1)*32-1 downto 0);
    signal QuadControl_vector: std_logic_vector( (MGTHigh-MGTLow+1)*32-1 downto 0);
    signal ChannelStatus_vector: std_logic_vector( (MGTHigh-MGTLow+1)*32-1 downto 0);
    signal DataShift40MHz_vector: std_logic_vector( (MGTHigh-MGTLow+1)*32-1 downto 0);
    signal CRCErrorCounter_vector: std_logic_vector( (MGTHigh-MGTLow+1)*32-1 downto 0);
    
    signal playbackData128BitFakingDeserialisers_int: arraySLV128(MGTHigh downto MGTLow);
    
    signal fakeDataCounter: std_logic_vector(127 downto 0);
    signal fakeData: arraySLV128(MGTHigh downto MGTLow);
    signal ipbScopeControl: std_logic_vector(31 downto 0);
    signal debugParameters: std_logic_vector(127 downto 0);

begin
    
    fabric: entity work.ipbus_fabric
        generic map(NSLV => NSLV)
        port map(
            ipb_in => ipb_in,
            ipb_out => ipb_out_int,
            ipb_to_slaves => ipbw,
            ipb_from_slaves => ipbr
        );
    
    ipb_out <= ipb_out_int;




    ipbBridgeErrorCounter_32bit <= "00" & ipbBridgeErrorCounter;
    
    slave0: entity work.ipbus_slave_status
        generic map(addr_width => 0)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(0),
            ipbus_out => ipbr(0),
            d => ipbBridgeErrorCounter_32bit
        );
    
    

    
    
    slave1: entity work.ipbus_slave_testram
        generic map(addr_width => 10)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(1),
            ipbus_out => ipbr(1)
        );
  
  

  
    slave2: entity work.ipbus_slave_control
        generic map(addr_width => 0)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(2),
            ipbus_out => ipbr(2),
            q => PlaybackSpyControl
        );
    
    enablePlaybackOfMGTs <= PlaybackSpyControl(3);
    enablePlaybackOfDeserialisers <= PlaybackSpyControl(4);
    enablePlaybackOfAlgos <= PlaybackSpyControl(5);




    GtTX_GEN: for i in TxMGTHigh downto TxMGTLow generate begin   
        GtTxData(i) <= (31 downto 0 => '0');
        GtTxCharIsK(i) <= (3 downto 0 => '0');
    end generate;
    
    
    
    
    
    

   
    slave3: entity work.ipbus_slave_control
        generic map(addr_width => 0)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(3),
            ipbus_out => ipbr(3),
            q => ipbusPlaybackCharIsKFakingMGTs
            
        );





  
  
    slave4: entity work.ipbus_slave_playbackspy32_4
        port map(
            sysclk40 => sysclk40,
            sysclk160 => sysclk160,
            ipbus_in => ipbw(4),
            ipbus_out => ipbr(4),
            
            
            
            spyData36Bit => spyData36BitFromMGTs,
            playbackData36Bit => playbackData36BitFakingMGTs,
            
            ipbusPlaybackCharIsK => ipbusPlaybackCharIsKFakingMGTs,
            ipbusSpyCharIsK => ipbusSpyCharIsKFromMGTs,
            
            enableSpy => PlaybackspyControl(0),
            rewindPlaybackSpy => ttcBroadcast,
            
            master_strobe => ipb_in.ipb_strobe,
            ipbr_master => ipb_out_int,
            ipbr3 => ipbr(3),
            ipbr5 => ipbr(5)
            
        );

        
        
  
  
    slave5: entity work.ipbus_slave_status
        generic map(addr_width => 0)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(5),
            ipbus_out => ipbr(5),
            d => ipbusSpyCharIsKFromMGTs
            
        );

  
  
    process(sysclk40) begin
        if rising_edge(sysclk40) then
            fakeDataCounter <= std_logic_vector(unsigned(fakeDataCounter)+1);
        end if;
    end process;

FAKEDATA_GEN: for i in MGTHigh downto MGTLow generate begin
    fakeData(i) <= fakeDataCounter;
end generate;
      
      
    slave6: entity work.ipbus_slave_playbackspy128
        port map(
            sysclk40 => sysclk40,
            sysclk160 => sysclk160,
            ipbus_in => ipbw(6),
            ipbus_out => ipbr(6),
            
            
            
            spyData128Bit => spyData128BitFromDeserialisers,
            playbackData128Bit => playbackData128BitFakingDeserialisers_int,
           
           
            enableSpy => PlaybackspyControl(1),
            
            enableAddressIncrement => '1',
            enableAddressWrapAround => '0',
            rewindPlaybackSpy => ttcBroadcast
            
            
--            debugPlaybackSpy128 => debugPlaybackSpy128
        );


    playbackData128BitFakingDeserialisers <= playbackData128BitFakingDeserialisers_int;
  
  
  
    slave7: entity work.ipbus_slave_parameters
        port map(
            clk => sysclk40,
            ipbus_in => ipbw(7),
            ipbus_out => ipbr(7),
            SortParameters => SortParameters,
            AlgoParameters => AlgoParameters,
            debug => debugParameters
        );
  
  
  
  
    slave8: entity work.ipbus_slave_playbackspy32
        port map(
            sysclk40 => sysclk40,
            ipbus_in => ipbw(8),
            ipbus_out => ipbr(8),
            
            spyData32Bit => spyData32BitFromAlgos,
            playbackData32Bit => playbackData32BitFakingAlgos,
            enableSpy => PlaybackspyControl(2),
            rewindPlaybackSpy => ttcBroadcast
            
--            debugPlaybackSpy32 => debugPlaybackSpy32
            
        );
        
        
    
    slave9: entity work.ipbus_slave_control_N
        generic map(numberOfRegisters => (MGTHigh-MGTLow+1) )
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(9),
            ipbus_out => ipbr(9),
            q => ChannelControl_vector
        );
  
  
    ChannelControl_GEN: for i in (MGTHigh-MGTLow) downto 0 generate begin   
        ChannelControl(MGTLow+i) <= ChannelControl_vector(i*32+31 downto i*32);
    end generate;
  

    
    slave10: entity work.ipbus_slave_control_N
        generic map(numberOfRegisters => (MGTHigh-MGTLow+1) )
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(10),
            ipbus_out => ipbr(10),
            q => QuadControl_vector
        );
  
  
    QuadControl_GEN: for i in (QuadHigh-QuadLow) downto 0 generate begin   
        QuadControl(QuadLow+i) <= QuadControl_vector(i*32+31 downto i*32);
    end generate;  
  
  
  
  
  
  
  
    ChannelStatus_GEN: for i in (MGTHigh-MGTLow) downto 0 generate begin   
       ChannelStatus_vector(i*32+31 downto i*32) <= ChannelStatus(MGTLow+i);
    end generate;
    
    
    
    slave11: entity work.ipbus_slave_status_N
        generic map(numberOfRegisters => (MGTHigh-MGTLow+1) )
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(11),
            ipbus_out => ipbr(11),
            d => ChannelStatus_vector
        );
        
        
        
   
   
   slave12: entity work.ipbus_slave_control_N
        generic map(numberOfRegisters => (MGTHigh-MGTLow+1) )
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(12),
            ipbus_out => ipbr(12),
            q => DataShift40MHz_vector
        );
  
  
    DataShift40MHz_GEN: for i in (MGTHigh-MGTLow) downto 0 generate begin   
        DataShift40MHz(MGTLow+i) <= DataShift40MHz_vector(i*32+2 downto i*32);
    end generate;
        
        
        
    
    
    CRCErrorCounter_GEN: for i in (MGTHigh-MGTLow) downto 0 generate begin   
       CRCErrorCounter_vector(i*32+31 downto i*32) <= CRCErrorCounter(MGTLow+i);
    end generate;
    
        
        
    slave13: entity work.ipbus_slave_status_N
        generic map(numberOfRegisters => (MGTHigh-MGTLow+1) )
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(13),
            ipbus_out => ipbr(13),
            d => CRCErrorCounter_vector
        );    
        
        
        
    slave14: entity work.ipbus_slave_control
        generic map(addr_width => 0)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(14),
            ipbus_out => ipbr(14),
            q => ttcIDelayValue_32bit
        );
    
    ttcBridgeControl(4 downto 0) <= ttcIDelayValue_32bit(4 downto 0);
    
    
    
    ttcIDelayCurrentValue_32bit <= (31 downto 5 => '0') & ttcBridgeStatus(4 downto 0); 
    
    slave15: entity work.ipbus_slave_status
        generic map(addr_width => 0)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(15),
            ipbus_out => ipbr(15),
            d => ttcIDelayCurrentValue_32bit
        );
    

  
    ttcErrorCounter_32bit <= (31 downto 8 => '0') & ttcBridgeStatus(12 downto 5);  
  
    slave16: entity work.ipbus_slave_status
        generic map(addr_width => 0)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(16),
            ipbus_out => ipbr(16),
            d => ttcErrorCounter_32bit
        );


    slave17: entity work.ipbus_slave_reg_pulse
        generic map(addr_width => 0)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(17),
            ipbus_out => ipbr(17),
            q => ttcErrorCounterReset_32bit
        );

    ttcBridgeControl(5) <= ttcErrorCounterReset_32bit(0);
    
    
    slave18: entity work.ipbus_slave_ipbScope
        port map(
            sysclk40 => sysclk40,
            sysclk160 => sysclk160,
            ipbus_in => ipbw(18),
            ipbus_out => ipbr(18),
            
            control => ipbScopeControl,
            probeData => debugJetArray,
            rewind => ttcBroadcast
        );
        
    
    slave19: entity work.ipbus_slave_ipbScope
        port map(
            sysclk40 => sysclk40,
            sysclk160 => sysclk160,
            ipbus_in => ipbw(19),
            ipbus_out => ipbr(19),
            
            control => ipbScopeControl,
            probeData => debugGenericArray,
            rewind => ttcBroadcast
        );


    slave20: entity work.ipbus_slave_ipbScope
        port map(
            sysclk40 => sysclk40,
            sysclk160 => sysclk160,
            ipbus_in => ipbw(20),
            ipbus_out => ipbr(20),
            
            control => ipbScopeControl,
            probeData => debugDPhi, --playbackData128BitFakingDeserialisers_int(MGTLow),
            rewind => ttcBroadcast
        );


    slave21: entity work.ipbus_slave_control
        generic map(addr_width => 0)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(21),
            ipbus_out => ipbr(21),
            q => ipbScopeControl
        );

    slave22: entity work.ipbus_slave_status
        generic map(addr_width => 2)
        port map(
            clk => sysclk40,
            reset => ipb_rst,
            ipbus_in => ipbw(22),
            ipbus_out => ipbr(22),
            d => debugParameters
        );


end rtl;