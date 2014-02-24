----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2013 01:32:52
-- Design Name: 
-- Module Name: super_top_virtex7_80gth - Behavioral
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


--library ieee;                                                         
--use ieee.std_logic_1164.all;                                                                             
--use ieee.numeric_std.all;                                             
--use std.textio.all;                                                   
--use ieee.std_logic_textio.all;  
--Library UNISIM;
--use UNISIM.vcomponents.all;   
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.L1TopoDataTypes.all;
use work.L1TopoFunctions.all;

entity L1TopoInfrastructure_690t is
    Generic(    VersionNumber           : std_logic_vector:= x"00000000";
                jet_TOB_phi_bit1        : std_logic:='1';
                cluster_TOB_phi_bit4    : std_logic:='1';    
                cluster_TOB_phi_bit5    : std_logic:='1'                          
  
    );
    Port ( RxP                                 : in std_logic_vector(NumberOfMgts-1 downto 0);
           RxN                                 : in std_logic_vector(NumberOfMgts-1 downto 0);
           TxP                                 : out std_logic_vector(NumberOfMgts-1 downto 0);
           TxN                                 : out std_logic_vector(NumberOfMgts-1 downto 0);
           
           LhcClkInP                         : in std_logic;
           LhcClkInN                         : in std_logic;
           
           MgtRefClkP                         : in std_logic_vector(NumberOfQuads-1 downto 0);--160MHz
           MgtRefClkN                         : in std_logic_vector(NumberOfQuads-1 downto 0);
           
           Version                              : out std_logic_vector(31 downto 0);
           Status                               : out std_logic_vector(31 downto 0);
           Control                              : in std_logic_vector(31 downto 0);
           
           --MGT CONTROL                       
           
            QuadControl                         : in InternalData(NumberOfQuads -1 downto 0);
            ChannelControl                      : in InternalData(NumberOfMgts-1 downto 0);
            
            
           --PBS ports
          
                      
           --reset BRAM counter - for tesing 
           PulseReg                                 : in    std_logic_vector(31 downto 0);                               
           --PLYABACK & SPY INPUT
           PlayBackSpyInputBramAddress              : in  InternalData(NumberOfMgts-1 downto 0);
           PlayBackInputData                        : in  ChannelData(NumberOfMgts-1 downto 0);
           SpyInputData                             : out ChannelData(NumberOfMgts-1 downto 0);
           
           
           --PLYABACK & SPY OUTPUT
           PlayBackSpyOutputBramAddress         : in  InternalData(1-1 downto 0);                     
           PlayBackOutputData                   : in  ChannelData(1-1 downto 0);   
           SpyOutputData                        : out ChannelData(1-1 downto 0);
                      
           
           --Deserializer Ports     
          
           DeserializerControl                  : in InternalData(NumberOfMgts-1 downto 0);

           
           --algo ports                            
         
           Parameters                           : in  ParameterSpace(NumAlgos+3-1 downto 0);
		   
		   Broadcast							: in std_logic;
		   ReadRequest							: in std_logic;
		   BCReset								: in std_logic;
		   
		   SignalOut							: out	std_logic_vector(1 downto 0);
           
           Output                               : out  std_logic_vector(31 downto 0)

      
           
           
           );
end L1TopoInfrastructure_690t;

architecture Behavioral of L1TopoInfrastructure_690t is

--attribute DONT_TOUCH : string;
--attribute DONT_TOUCH of Behavioral : architecture is "TRUE";

--component CRC_PARALLEL is
--    Port ( EnableIn         : in std_logic;
--           DataIn           : in std_logic_vector(127 downto 0);
--           CrcError        : out std_logic
    
--    );
--end component;


--instantiation of the 56gth's
component Virtex7_690_80gth is    
    Port (                
                
                RxP : in std_logic_vector(NumberOfMGTs-1 downto 0);                                       
                RxN : in std_logic_vector(NumberOfMGTs-1 downto 0);                                       
                TxP : out std_logic_vector(NumberOfMGTs-1 downto 0);                                      
                TxN : out std_logic_vector(NumberOfMGTs-1 downto 0);
    
    
                ChannelControl   : in InternalData(NumberOfMGTs-1 downto 0);
                QuadControl      : in InternalData(NumberOfQuads-1 downto 0);
    
                CharIsKIn           : in  InternalData(NumberOfMGTs-1 downto 0); 
                CharIsKOut          : out InternalData(NumberOfMGTs-1 downto 0);  
    
                UsrClkIn            : in std_logic;
                UsrClk2In           : in std_logic;
    
                GtRxDataOut    : out InternalData(NumberOfMGTs-1 downto 0);
                GtTxDataIn     : in  InternalData(NumberOfMGTs-1 downto 0);
             
                                                                                   
                MgtRefClkP : in std_logic_vector(NumberOfQuads-1 downto 0);--160MHz                      
                MgtRefClkN : in std_logic_vector(NumberOfQuads-1 downto 0)     
           
     );
end component;

--stephan's algorithms
component L1TopoAlgorithms is
Port (ClockBus    : in  std_logic_vector(2 downto 0);
         egTobArray  : in  ClusterArray(InputWidthEg-1 downto 0);
         TauTobArray : in  ClusterArray(InputwidthTau-1 downto 0);
         JetTobArray : in  JetArray(InputWidthJet-1 downto 0);
--          jetSelectThreshold : in std_logic_vector(9 downto 0);
--          egSelectThreshold : in std_logic_vector(9 downto 0);
--          tauSelectThreshold : in std_logic_vector(9 downto 0);
         Parameters  : in  ParameterSpace(NumAlgos+3-1 downto 0);
         signedEx    : in  std_logic_vector(14 downto 0);
         signedEy    : in  std_logic_vector(14 downto 0);
         Results     : out std_logic_vector(NumResultBits-1 downto 0);
	  Overflow    : out std_logic_vector(NumAlgos-1 downto 0)
        );
end component;


component CLK_GEN is
port
 (-- Clock in ports
  clk_in1_p         : in     std_logic;
  clk_in1_n         : in     std_logic;
  -- Clock out ports
  clk_out_40          : out    std_logic;
  clk_out_80          : out    std_logic;
  clk_out_160          : out    std_logic;
  clk_out_320          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic
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

component PlaybackSpyMemory_BRAM is
    Port (      BC_CLK_IN               : IN STD_LOGIC;                  
                --PBS ports
                PB_WE_IN               : in std_logic;
                
                PBS_ADDRESS_IN          : in std_logic_vector(7 downto 0);                                                               
                PB_DATA_IN              : in std_logic_vector(127 downto 0);
                SPY_DATA_OUT            : out std_logic_vector(127 downto 0);
                --real time ports
                COUNT_ADDRESS_RESET_IN  : in std_logic;
                DATA_WE_IN              : in std_logic;
                DATA_IN                 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
                DATA_OUT                : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
);
end component;


--____________________________________________________________________________________________________
--_________________________________________________common signals_____________________________________
--____________________________________________________________________________________________________




signal tx_data : InternalData(NumberOfMgts-1 downto 0);
signal rx_data : InternalData(NumberOfMgts-1 downto 0);

signal tx_usrclk : std_logic_vector(NumberOfMgts-1 downto 0);
signal rx_usrclk : std_logic_vector(NumberOfMgts-1 downto 0);

signal LhcClk                  : std_logic;

signal Ov_float                  : std_logic_vector(5 downto 0);
signal K_word_float             : std_logic_vector(7 downto 0);
signal BCID_float               : std_logic_vector (11 downto 0);
signal CRC_float                : std_logic_vector(11 downto 0);



--_________________________________________________________________________________________________________
--______________________________________________SIPO_signals_________________________________________________
--_________________________________________________________________________________________________________

signal ShiftRegDelay        : std_logic_vector(4 downto 0);


--_________________________________________________________________________________________________________
--______________________________________________PB_signals_________________________________________________
--_________________________________________________________________________________________________________

signal pb_en_input              : std_logic;
signal pb_en_output             : std_logic;
signal pb_en_OV                 : std_logic;


type Deserialized_Data_Array is array ( natural range <> ) of std_logic_vector(128-1 downto 0);

signal deserialized_data_0         : Deserialized_Data_Array(NumberOfMgts-1 downto 0);
signal deserialized_data_1         : Deserialized_Data_Array(NumberOfMgts-1 downto 0);
signal deserialized_data_2         : Deserialized_Data_Array(NumberOfMgts-1 downto 0);

--input Playback and Spy
signal bram_input_pb_we         : std_logic;
signal bram_input_data_we       : std_logic;

signal bram_input_count_reset       : std_logic; 
signal bram_input_data          : Deserialized_Data_Array(NumberOfMgts-1 downto 0);

signal pbs_input_address         : InternalData(NumberOfMgts-1 downto 0);
signal pb_input_data             : Deserialized_Data_Array(NumberOfMgts-1 downto 0);
signal spy_input_data            : Deserialized_Data_Array(NumberOfMgts-1 downto 0);

signal pb_input_data_0            : InternalData(NumberOfMgts-1 downto 0);
signal pb_input_data_1            : InternalData(NumberOfMgts-1 downto 0);
signal pb_input_data_2            : InternalData(NumberOfMgts-1 downto 0);
signal pb_input_data_3            : InternalData(NumberOfMgts-1 downto 0);

signal spy_input_data_0           : InternalData(NumberOfMgts-1 downto 0);
signal spy_input_data_1           : InternalData(NumberOfMgts-1 downto 0);
signal spy_input_data_2           : InternalData(NumberOfMgts-1 downto 0);
signal spy_input_data_3           : InternalData(NumberOfMgts-1 downto 0);

--output Playback and Spy

signal bram_output_pb_we        : std_logic;
signal bram_output_data_we      : std_logic;
signal pbs_output_address       : std_logic_vector(31 downto 0);
signal bram_output_count_reset  : std_logic;
signal algo_result              : std_logic_vector(31 downto 0);
signal algo_output_data         : Deserialized_Data_Array(1-1 downto 0);
signal bram_output_data         : Deserialized_Data_Array(1-1 downto 0);
signal pb_output_data           : Deserialized_Data_Array(1-1 downto 0);
signal spy_output_data          : Deserialized_Data_Array(1-1 downto 0);






--___________________CRC________________
signal crc_en           : std_logic;
signal crc_comp			: std_logic;
signal crc_error_detect : std_logic_vector(NumberOfMgts-1 downto 0);
signal crc_error_detect_par : std_logic_vector(NumberOfMgts-1 downto 0);

signal crc_data         : Deserialized_Data_Array(NumberOfMgts-1 downto 0);

--________DESERIALIZER______________
signal DeserializerDelay           : InternalData(NumberOfMgts-1 downto 0);
signal rx_charisk                  : InternalData(NumberOfMgts-1 downto 0);
signal tx_charisk                  : InternalData(NumberOfMgts-1 downto 0);
signal deserialized_charisk        : InternalData(NumberOfMgts-1 downto 0); 


--__________________________________________
--______________mmcm signals________________
--__________________________________________

signal clk_out_320      : std_logic;
signal clk_out_160      : std_logic;
signal clk_out_80       : std_logic;
signal clk_out_40       : std_logic;
signal mmcm_locked      : std_logic;

--_____________________________________________________________________________________
--______________________________________alg. signals___________________________________
--_____________________________________________________________________________________

signal algo_data            : Deserialized_Data_Array(NumberOfMgts-1 downto 0);



signal egTOBs_i         : ClusterArray(InputWidthEg-1 downto 0);
signal tauTOBs_i        : ClusterArray(InputwidthTau-1 downto 0);
signal jetTOBs_i        : JetArray(InputWidthJet -1 downto 0);
signal Parameters_i     : ParameterSpace(NumAlgos+3-1 downto 0);
signal signed_Ex_i      : std_logic_vector(14 downto 0);
signal signed_Ey_i      : std_logic_vector(14 downto 0);
signal tx_data_gt0      : std_logic_vector( 31 downto 0);
signal unsigned_sum_E_float : std_logic_vector(14 downto 0);
signal unsigned_sum_Et_float : std_logic_vector(14 downto 0);
signal signed_Ey_rest_float : std_logic_vector(14 downto 0);
signal signed_Ex_rest_float : std_logic_vector(14 downto 0);

signal overflow             : std_logic_vector(31 downto 0);

signal Output_DDR        : InternalData(1 downto 0); 


signal probe_data       : ChannelData(2 downto 0);
signal data_or			: std_logic_vector(1 downto 0);

signal gnd_vec_32       : std_logic_vector(31 downto 0);

begin

gnd_vec_32  <= (others=>'0');
--__________________________________
--__________SIGNAL_ROUTING__________
--__________________________________



--______________________________
--_______common signals_________
--______________________________
Version     <= VersionNumber;
Status(0)   <= not mmcm_locked;

--___________________________
--_______PBS signals_________
--___________________________
bram_input_data_we      <= Control(0);--enables SPY of input data
pb_en_input             <= Control(1);--enables Playback of input data
bram_output_data_we     <= Control(2);--enables SPY of output data
pb_en_output            <= Control(3);--enables Playback of output data
crc_en                  <= Control(4);--enables CRC
crc_comp				<= not crc_en;

--_______input_______

bram_input_count_reset      <=  PulseReg(0);

Input_Signal_GEN:
for I in 0 to NumberOfMgts-1 generate

pbs_input_address(I)           <= PlayBackSpyInputBramAddress(I); 


pb_input_data(I)(31 downto 0)           <=  PlayBackInputData(I)(0);
pb_input_data(I)(63 downto 32)          <=  PlayBackInputData(I)(1);                            
pb_input_data(I)(95 downto 64)          <=  PlayBackInputData(I)(2);                            
pb_input_data(I)(127 downto 96)         <=  PlayBackInputData(I)(3);                            

                         
SpyInputData(I)(0)              <= spy_input_data(I)(31 downto 0)  ;
SpyInputData(I)(1)              <= spy_input_data(I)(63 downto 32) ; 
SpyInputData(I)(2)              <= spy_input_data(I)(95 downto 64) ; 
SpyInputData(I)(3)              <= spy_input_data(I)(127 downto 96);                             

end generate Input_Signal_GEN;

                         
--______output_______
pbs_output_address       	<=  PlayBackSpyOutputBramAddress(0);

bram_output_count_reset     <=  PulseReg(0);

pb_output_data(0)(31 downto 0)  	<=  PlayBackOutputData(0)(0);
pb_output_data(0)(63 downto 32)  	<=  PlayBackOutputData(0)(1);
pb_output_data(0)(95 downto 64)  	<=  PlayBackOutputData(0)(2);
pb_output_data(0)(127 downto 96)  	<=  PlayBackOutputData(0)(3);


SpyOutputData(0)(0)            <=  spy_output_data(0)(31 downto 0)  ;
SpyOutputData(0)(1)            <=  spy_output_data(0)(63 downto 32) ;
SpyOutputData(0)(2)            <=  spy_output_data(0)(95 downto 64) ;
SpyOutputData(0)(3)            <=  spy_output_data(0)(127 downto 96);







----____________________________

----____COMPONENT INSTANCES_____

----____________________________

--------------------------------------------------------------
----------------------port map--------------------------------
--------------------------------------------------------------
Virtex7All80gth: Virtex7_690_80gth     
port map(
            TxP => TxP,
            TxN => TxN,
            RxP => RxP,
            RxN => RxN,

           
            ChannelControl  =>  ChannelControl,
            QuadControl     =>  QuadControl,
            
            
            CharIsKIn      =>   tx_charisk,
            CharIsKOut      =>  rx_charisk,
                

            UsrClkIn        =>  clk_out_320,
            UsrClk2In       =>  clk_out_160,
 
            GtRxDataOut   => rx_data,
            GtTxDataIn    => tx_data,

            MgtRefClkP => MgtRefClkP, 
            MgtRefClkN => MgtRefClkN
                     
); 



L1TopoAlg: L1TopoAlgorithms 
    Port map(
          ClockBus(0)   =>  clk_out_40,
          ClockBus(1)   =>  clk_out_80,
          ClockBus(2)   =>  clk_out_160,
          egTobArray    =>  egTOBs_i,
          TauTobArray   =>  tauTOBs_i,
          JetTobArray   =>  jetTOBs_i,
          Parameters =>  Parameters_i,
          signedEx   =>  signed_Ex_i,
          signedEy   =>  signed_Ey_i,
          Results    =>  algo_result(NumResultBits -1 downto 0),
		  Overflow   =>  overflow(NumAlgos -1 downto 0)
);

--_______________________________________
--__________algo signals_________________
--_______________________________________



Parameters_i        <=  Parameters;

--when enable is set, OUTPUT_OUT follows data from BRAM
Output_DDR(0)               <=  bram_output_data(0)(31 downto 0)  when pb_en_output='1' else algo_output_data(0)(31 downto 0);
Output_DDR(1)               <=  bram_output_data(0)(63 downto 32) when pb_en_output='1' else algo_output_data(0)(63 downto 32);

--data which will be fed into BRAM and output
algo_output_data(0)<=  gnd_vec_32 & gnd_vec_32 & overflow & algo_result;



--currently 9 alg are implemented, needs to be adjusted
algo_result(31 downto NumResultBits)    <= (others=>'0');--not in use with 9 alg.- may have to be adjusted
overflow(31 downto NumAlgos)            <= (others=>'0');--not in use with 9 alg.- may have to be adjusted

----make data ready to be used by alg.
----JET_TOBs
----Quads 113,114,115 and 116,117,118 (AV9 & AV10)
JET_GEN:
for I in 0 to 16-1 generate

jetTOBs_i( ((4*I)+0) )    <= std_logic_vector_to_TOB( algo_data(I)(127 downto 100),jet_TOB_phi_bit1)   ;
jetTOBs_i( ((4*I)+1) )    <= std_logic_vector_to_TOB( algo_data(I)(99  downto 72 ),jet_TOB_phi_bit1)   ;
jetTOBs_i( ((4*I)+2) )    <= std_logic_vector_to_TOB( algo_data(I)(71  downto 44 ),jet_TOB_phi_bit1)   ;
jetTOBs_i( ((4*I)+3) )    <= std_logic_vector_to_TOB( algo_data(I)(43  downto 16 ),jet_TOB_phi_bit1)   ;

end generate JET_GEN;

--EM_TOBs
--Quads 213,214,215 (AV13)
EM_GEN:

for I in 0 to 12-1 generate

egTOBs_i( ((5*(I))+0) )    <= std_logic_vector_to_TOB( algo_data(I+28)(127 downto 105),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
egTOBs_i( ((5*(I))+1) )    <= std_logic_vector_to_TOB( algo_data(I+28)(104 downto 82 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
egTOBs_i( ((5*(I))+2) )    <= std_logic_vector_to_TOB( algo_data(I+28)(81  downto 59 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
egTOBs_i( ((5*(I))+3) )    <= std_logic_vector_to_TOB( algo_data(I+28)(58  downto 36 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
egTOBs_i( ((5*(I))+4) )    <= std_logic_vector_to_TOB( algo_data(I+28)(35  downto 13 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;

end generate EM_GEN;

--TAU_TOBs 
--Quads 216,217,218 (AV14)
TAU_GEN:
for I in 0 to 12-1 generate

tauTOBs_i( ((5*(I))+0) )    <= std_logic_vector_to_TOB(algo_data(I+40)(127 downto 105),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5 )   ;
tauTOBs_i( ((5*(I))+1) )    <= std_logic_vector_to_TOB(algo_data(I+40)(104 downto 82 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
tauTOBs_i( ((5*(I))+2) )    <= std_logic_vector_to_TOB(algo_data(I+40)(81  downto 59 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;
tauTOBs_i( ((5*(I))+3) )    <= std_logic_vector_to_TOB(algo_data(I+40)(58  downto 36 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5 )   ;
tauTOBs_i( ((5*(I))+4) )    <= std_logic_vector_to_TOB(algo_data(I+40)(35  downto 13 ),cluster_TOB_phi_bit4,cluster_TOB_phi_bit5  )   ;

end generate TAU_GEN;

--Quad 119 (AV11)               
signed_Ey_i(14 downto 8)<=  algo_data(24)(78  downto 72  );
signed_Ey_i(7 downto 0) <=  algo_data(24)(51  downto 44  );                 
signed_Ex_i             <=  algo_data(24)(26  downto 12  );





TTCCLk: CLK_GEN
  port map
   (-- Clock in ports
    clk_in1_p     => LhcClkInP,
    clk_in1_n     => LhcClkInN,
    -- Clock out ports
    clk_out_320 => clk_out_320  ,
    clk_out_160 => clk_out_160  ,
    clk_out_80 => clk_out_80  ,
    clk_out_40  => clk_out_40   ,
    -- Status and control signals
    reset  => '0',
    locked => mmcm_locked
);


--________________________________________________
--______________Deserializers_____________________
--________________________________________________
--synchronizes incoming 32b data at 160MHz with 40MHz clock (128b)

SIPO_GEN:
for I in 0 to NumberOfMgts-1 generate



InputDeserializer: DeserializerCrc 
    Port map(  
            DataIn         =>	rx_data(I),
            DataOut        =>	deserialized_data_0(I),
            
            ChariskIn      =>	rx_charisk(I)(3 downto 0),
            ChariskOut     =>	deserialized_charisk(I)(15 downto 0),
            
            ShiftRegDelayIn  =>	DeserializerDelay(I)(4 downto 0),   
			
			CrcErrorOut	=>	crc_error_detect(I),
			
			CrcEnable   =>  crc_en,
                        
            ClkIn40     =>	clk_out_40,
            ClkIn160    =>	clk_out_160,
			ClkIn320	=>	clk_out_320
			
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
deserialized_data_2(I) <= deserialized_data_1(I) when deserialized_charisk(I)=x"0000" else (deserialized_data_1(I)(127 downto 72) & x"00000" &  deserialized_data_1(I)(51 downto 0));
--data which go into the algorithms. if enabled, BRAM will be fed into alg.
algo_data(I) <= bram_input_data(I) when pb_en_input='1' else deserialized_data_2(I);


end generate SIPO_GEN;

--______________________________________________________________
--______________________BLOCK RAM INSTANCES_____________________
--______________________________________________________________
--__________________________________________
--______________INPUT_PLAYBACK_&_SPY_MEMORY____________
--__________________________________________


BRAM_INPUT_GEN:
for I in 0 to NumberOfMgts-1 generate

PlayBackSpyInputBRAM_i: PlaybackSpyMemory_BRAM
Port map
        (                        
               BC_CLK_IN                        =>  clk_out_40,               
               -- non-real-time path
               PB_WE_IN                         =>  bram_input_pb_we,
                                
               PBS_ADDRESS_IN                   =>  pbs_input_address(I)(7 downto 0),
                                                                         
               PB_DATA_IN                       =>  pb_input_data(I),
               SPY_DATA_OUT                     =>  spy_input_data(I),
               
                               
               -- real-time path              
               COUNT_ADDRESS_RESET_IN           =>   Broadcast,--!
               DATA_WE_IN                       =>   bram_input_data_we,
               DATA_IN                          =>   deserialized_data_0(I),
               DATA_OUT                         =>   bram_input_data(I)
);

end generate BRAM_INPUT_GEN;

--__________________________________________
--_______OUTPUT_PLAYBACK_&_SPY_MEMORY_______
--__________________________________________

PlayBackSpyOutputBRAM_i: PlaybackSpyMemory_BRAM 
Port map
       (       BC_CLK_IN                            =>  clk_out_40,               
                --PBS ports
                PB_WE_IN                            =>  bram_output_pb_we,
                                 
                PBS_ADDRESS_IN                      =>  pbs_output_address(7 downto 0), 

				PB_DATA_IN             =>  pb_output_data(0),
                SPY_DATA_OUT           =>  spy_output_data(0),
				  
                
                                                              
                --real time ports               
                COUNT_ADDRESS_RESET_IN  =>      Broadcast,
                DATA_WE_IN              =>      bram_output_data_we,
                
                DATA_IN                 =>      algo_output_data(0),
                DATA_OUT                =>      bram_output_data(0)
                
);

--__________________________________________
--________Output Multiplexing_______________
--___________________________________________
--Output_DDR(0) are the algo results
--Output_DDR(1) are the algo OV bits
OUTPUT_GEN:
for I in 0 to 31 generate

ODDR_Output: ODDR
   generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
      INIT => '0',   -- Initial value for Q port ('1' or '0')
      SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
   port map (
      Q => Output(I),   -- 1-bit DDR output
      C => clk_out_40,    -- 1-bit clock input
      CE => '1',  -- 1-bit clock enable input
      D1 => Output_DDR(0)(I),  -- 1-bit data input (positive edge)
      D2 => Output_DDR(1)(I),  -- 1-bit data input (negative edge)
      R => '0',    -- 1-bit reset input
      S => '0'     -- 1-bit set input
);

end generate OUTPUT_GEN;



end Behavioral;
