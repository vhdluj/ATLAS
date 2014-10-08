----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2014 22:29:10
-- Design Name: 
-- Module Name: realtimepath_infrastructure - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity realtimepath_infrastructure is
    Port (
            sysclk40_in, sysclk80_in, sysclk160_in, sysclk320_in: in std_logic;
            
            MgtRefClkP, MgtRefClkN: in std_logic_vector(NumberOfQuads-1 downto 0); --160MHz
            RxP, RxN: in std_logic_vector(NumberOfMgts-1 downto 0);
            TxP, TxN: in std_logic_vector(NumberOfMgts-1 downto 0);
            
            ttc_in: in std_logic;
            
            --IPbus signals
            
            --general
            Version: out std_logic_vector(31 downto 0);
            Status: out std_logic_vector(31 downto 0);
            Control: in std_logic_vector(31 downto 0);
            
            --MGT CONTROLQuadControl: in arraySLV32(NumberOfQuads -1 downto 0);
            ChannelControl: in arraySLV32(NumberOfMgts-1 downto 0);
            
            --PBS ports
            --reset BRAM counter - for tesing 
            PulseReg: in    std_logic_vector(31 downto 0);                               
            --PLYABACK & SPY INPUT
            PlayBackSpyInputBramAddress: in  arraySLV32(NumberOfMgts-1 downto 0);
            PlayBackInputData: in  ChannelData(NumberOfMgts-1 downto 0);
            SpyInputData: out ChannelData(NumberOfMgts-1 downto 0);
            --PLYABACK & SPY OUTPUT
            PlayBackSpyOutputBramAddress: in  arraySLV32(1-1 downto 0);                     
            PlayBackOutputData: in  ChannelData(1-1 downto 0);   
            SpyOutputData: out ChannelData(1-1 downto 0);
                     
            
            --Deserializer Ports
            DeserializerControl: in arraySLV32(NumberOfMgts-1 downto 0);
            
            
            

            egTobArray: out ClusterArray(InputWidthEg-1 downto 0);
            TauTobArray: out ClusterArray(InputwidthTau-1 downto 0);
            JetTobArray: out JetArray(InputWidthJet -1 downto 0);
            signedEx: out std_logic_vector(14 downto 0);
            signedEy: out std_logic_vector(14 downto 0);
            
            algoResults: in std_logic_vector(NumResultBits -1 downto 0);
            algoOverflows: in std_logic_vector(NumResultBits -1 downto 0);
            
            Output_DDR: out arraySLV32(1 downto 0)
            
    );
end realtimepath_infrastructure;






architecture Behavioral of realtimepath_infrastructure is





--instantiation of the 56gtx's
component Virtex7_485_56gtx is    
    Port (                
                
                RxP : in std_logic_vector(NumberOfMGTs-1 downto 0);                                       
                RxN : in std_logic_vector(NumberOfMGTs-1 downto 0);                                       
                TxP : out std_logic_vector(NumberOfMGTs-1 downto 0);                                      
                TxN : out std_logic_vector(NumberOfMGTs-1 downto 0);
    
    
                ChannelControl   : in arraySLV32(NumberOfMGTs-1 downto 0);
                QuadControl      : in arraySLV32(NumberOfQuads-1 downto 0);
    
                CharIsKIn           : in  arraySLV32(NumberOfMGTs-1 downto 0); 
                CharIsKOut          : out arraySLV32(NumberOfMGTs-1 downto 0);  
    
                UsrClkIn            : in std_logic;
                UsrClk2In           : in std_logic;
    
                GtRxDataOut    : out arraySLV32(NumberOfMGTs-1 downto 0);
                GtTxDataIn     : in  arraySLV32(NumberOfMGTs-1 downto 0);
             
                                                                                   
                MgtRefClkP : in std_logic_vector(NumberOfQuads-1 downto 0);--160MHz                      
                MgtRefClkN : in std_logic_vector(NumberOfQuads-1 downto 0)     
           
     );
end component;


component DeserializerCrc is
    Port (  DataIn          : in    std_logic_vector(31 downto 0);
            DataOut         : out   std_logic_vector(127 downto 0);
            
            ChariskIn      : in std_logic_vector(3 downto 0);
            ChariskOut     : out std_logic_vector(15 downto 0);
            
            ShiftRegDelayIn       : in    std_logic_vector(4 downto 0);
			
			CrcErrorOut		: out std_logic;
			
			CrcEnable    : in    std_logic;
                                  
            ClkIn40      : in    std_logic;		
            ClkIn160     : in    STD_LOGIC;
			ClkIn320	 : in    STD_LOGIC
			
          );--USER_CLK
end component;


component playbackspy_blockram is
    Port (  DOA: out std_logic_vector(31 downto 0);
            DOB: out std_logic_vector(31 downto 0);
            ADDRA: in std_logic_vector(7 downto 0);
            ADDRB: in std_logic_vector(7 downto 0);
            CLK: in std_logic;
            DIA: in std_logic_vector(31 downto 0);
            DIB: in std_logic_vector(31 downto 0);
            WEA: in std_logic;
            WEB: in std_logic
         );
end component;








------------------------------------------------------------------------------------
------------------------------------------------------------------------------------


begin




Virtex7All56gtx: Virtex7_485_56gtx     
port map(
			UsrClkIn => sysclk320_in,
            UsrClk2In => sysclk160_in,
			MgtRefClkP => MgtRefClkP, 
            MgtRefClkN => MgtRefClkN,
            TxP => TxP,
            TxN => TxN,
            RxP => RxP,
            RxN => RxN,
			GtRxDataOut => rx_data,
            GtTxDataIn => tx_data,
            ChannelControl => ChannelControl,
            QuadControl => QuadControl,
            CharIsKIn => open,
            CharIsKOut => rx_charisk
); 




--________________________________________________
--______________Deserializers_____________________
--________________________________________________
--synchronizes incoming 32b data at 160MHz with 40MHz clock (128b)

SIPO_GEN:
for I in 0 to NumberOfMgts-1 generate

    process(sysclk160_in) begin
        if rising_edge(sysclk160_in) then 
            rx_data2(I) <= rx_data(I);
            rx_charisk2(I) <= rx_charisk(I)(3 downto 0); 
        end if;
        
    end process;

    process(sysclk160_in) begin
        if rising_edge(sysclk160_in) then
            if ttcBroadcast='1' then 
                playbackSpy_addressCounter <= (others => '0');
            else
                playbackSpy_addressCounter <= playbackSpy_addressCounter + 1;
            end if;
        end if;
    end process;
    
    

    InputPlaybackSpy: playbackspy_blockram
        generic map(
            dataWidth => 36
        )
        Port map(
            CLK => sysclk160_in,
            DIA => rx_charik2(I) & rx_data2(I),
            ADDRA => playbackSpy_addressCounter,
            WEA => inputSpy_enable,
            DOA => inputBram_data(I),
            
            DIB => inputPlayback_data(I),
            ADDRB => playback_address,
            WEB => inputPlaybackData_writeEnable,
            DOB => inputSpy_data(I)
              
        );

    process(sysclk160_in) begin
        if rising_edge(sysclk160_in) then inputBram_data2(I) <= inputBram_data(I); end if;
    end process;

    dataToDeserialise(I) <= inputBram_data2(I)(31 downto 0) when inputPlayback_enable else rx_data(I);
    charIsKToDeserialise(I) <= inputBram_data2(I)(35 downto 32) when inputPlayback_enable else rx_charisk(I)(3 downto 0);

	InputDeserializer: DeserializerCrc 
		Port map(  
				DataIn         =>	dataToDeserialise(I),
				DataOut        =>	deserialized_data_0(I),
				
				ChariskIn      =>	charIsKToDeserialise(I),
				ChariskOut     =>	deserialized_charisk(I)(15 downto 0),
				
				ShiftRegDelayIn  =>	DeserializerDelay(I)(4 downto 0),   
				
				CrcErrorOut	=>	crc_error_detect(I),
				CrcEnable   =>  crc_en,
							
				ClkIn40     =>	sysclk40_in,
				ClkIn160    =>	sysclk160_in,
				ClkIn320	=>	sysclk320_in
				
	);

	DeserializerDelay(I)(4 downto 0)<= "00000";


	reg_proc: process(clk_out_40)

	begin
		if rising_edge(clk_out_40) then
			if crc_error_detect(I)='0' then 
			   deserialized_data_1(I) <= deserialized_data_0(I);
			else
				deserialized_data_1(I) <= (others=>'0'); 
			end if;
		
		end if;
	end process;

	-- in case an alignment word is sent, corresponding data will be 0, so no unwanted data will be fed into algorithms
	--deserialized_data_2(I) <= deserialized_data_1(I) when deserialized_charisk(I)=x"0000" else (deserialized_data_1(I)(127 downto 72) & x"00000" &  deserialized_data_1(I)(51 downto 0));
	algo_data(I) <= deserialized_data_1(I) when deserialized_charisk(I)=x"0000" else (deserialized_data_1(I)(127 downto 72) & x"00000" &  deserialized_data_1(I)(51 downto 0));
	--data which go into the algorithms. if enabled, BRAM will be fed into alg.
	--algo_data(I) <= bram_input_data(I) when pb_en_input='1' else deserialized_data_2(I);


end generate SIPO_GEN;


----make data ready to be used by alg.
----JET_TOBs
----Quads 113,114,115 and 116,117,118 (AV9 & AV10)

JEPCrate <= '0';

JET_GEN:
for I in 0 to 16-1 generate

JetTobArray( ((4*I)+0) )    <= DeserialisedData_to_JetTOB( algo_data(I)(127 downto 100), JEPCrate)   ;
JetTobArray( ((4*I)+1) )    <= DeserialisedData_to_JetTOB( algo_data(I)(99  downto 72 ), JEPCrate)   ;
JetTobArray( ((4*I)+2) )    <= DeserialisedData_to_JetTOB( algo_data(I)(71  downto 44 ), JEPCrate)   ;
JetTobArray( ((4*I)+3) )    <= DeserialisedData_to_JetTOB( algo_data(I)(43  downto 16 ), JEPCrate)   ;

end generate JET_GEN;

--EM_TOBs
--Quads 213,214,215 (AV13)
EM_GEN:

for I in 0 to 12-1 generate

egTobArray( ((5*(I))+0) )    <= std_logic_vector_to_TOB( algo_data(I+28)(127 downto 105),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
egTobArray( ((5*(I))+1) )    <= std_logic_vector_to_TOB( algo_data(I+28)(104 downto 82 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
egTobArray( ((5*(I))+2) )    <= std_logic_vector_to_TOB( algo_data(I+28)(81  downto 59 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
egTobArray( ((5*(I))+3) )    <= std_logic_vector_to_TOB( algo_data(I+28)(58  downto 36 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
egTobArray( ((5*(I))+4) )    <= std_logic_vector_to_TOB( algo_data(I+28)(35  downto 13 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;

end generate EM_GEN;

--TAU_TOBs 
--Quads 216,217,218 (AV14)
TAU_GEN:
for I in 0 to 12-1 generate

TauTobArray( ((5*(I))+0) )    <= std_logic_vector_to_TOB(algo_data(I+40)(127 downto 105),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5 )   ;
TauTobArray( ((5*(I))+1) )    <= std_logic_vector_to_TOB(algo_data(I+40)(104 downto 82 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
TauTobArray( ((5*(I))+2) )    <= std_logic_vector_to_TOB(algo_data(I+40)(81  downto 59 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
TauTobArray( ((5*(I))+3) )    <= std_logic_vector_to_TOB(algo_data(I+40)(58  downto 36 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5 )   ;
TauTobArray( ((5*(I))+4) )    <= std_logic_vector_to_TOB(algo_data(I+40)(35  downto 13 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;

end generate TAU_GEN;

--Quad 119 (AV11)               
signedEy(14 downto 8)<=  algo_data(24)(78  downto 72  );
signedEy(7 downto 0) <=  algo_data(24)(51  downto 44  );                 
signedEx             <=  algo_data(24)(26  downto 12  );



-- end input
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
-- begin output


outBram_din <= algo_result when playbackSpy_addressCounter(1)='0' else algo_overflow;

OutputPlaybackSpy: playbackspy_blockram
        generic map(
            dataWidth => 32
        )
        Port map(
            CLK => sysclk80_in,
            DIA => outputBram_din,
            ADDRA => '0' & playbackSpy_addressCounter(9 downto 1),
            WEA => outputSpy_enable,
            DOA => outputBram_dout,
            
            DIB => outputPlayback_data,
            ADDRB => outputPlaybackSpy_address,
            WEB => outputPlaybackData_writeEnable,
            DOB => outputSpy_data
              
        );

process(sysclk80_in) begin
    if rising_edge(sysclk80_in) then outputBram_dout_reg <= outputBram_dout; end if;
end process;


topoOutput <= (outputBram_dout & outputBram_dout_reg) when outputPlayback_enable else (algo_overflow & algo_result);  


OUTPUT_GEN:
for I in 0 to 31 generate

ODDR_Output: ODDR
   generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
      INIT => '0',   -- Initial value for Q port ('1' or '0')
      SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
   port map (
      Q => topoOutput_DDR(I),   -- 1-bit DDR output
      C => sysclk40_in,    -- 1-bit clock input
      CE => '1',  -- 1-bit clock enable input
      D1 => topoOutput(I),  -- 1-bit data input (positive edge)
      D2 => topoOutput(32+I),  -- 1-bit data input (negative edge)
      R => '0',    -- 1-bit reset input
      S => '0'     -- 1-bit set input
);

end generate OUTPUT_GEN;


end Behavioral;
