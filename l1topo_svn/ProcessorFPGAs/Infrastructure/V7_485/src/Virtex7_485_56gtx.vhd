library ieee;                                                                             
use ieee.std_logic_1164.all;                                                                                                                        
use ieee.numeric_std.all;                                                                 
use std.textio.all;                                                                       
use ieee.std_logic_textio.all;
use work.L1TopoDataTypes.all;
use work.L1TopoFunctions.all;                                                            
-- Uncomment the following library declaration if using                                   
-- arithmetic functions with Signed or Unsigned values                                    
--use IEEE.NUMERIC_STD.ALL;                                                               
                                                                                          
-- Uncomment the following library declaration if instantiating                           
-- any Xilinx leaf cells in this code.                                                    
library UNISIM;                                                                         
use UNISIM.VComponents.all;                                                             
                                                                                          
                                                                                          
entity Virtex7_485_56gtx is                                                         
    Port (                                                                                
           RxP : in std_logic_vector(NumberOfMGTs-1 downto 0);                                       
           RxN : in std_logic_vector(NumberOfMGTs-1 downto 0);                                       
           TxP : out std_logic_vector(NumberOfMGTs-1 downto 0);                                      
           TxN : out std_logic_vector(NumberOfMGTs-1 downto 0);
           
           
           
           ChannelControl   : in InternalData(NumberOfMGTs-1 downto 0);
           QuadControl      : in InternalData(NumberOfQuads-1 downto 0);
           
           CharIsKIn           : in  InternalData(NumberOfMGTs-1 downto 0); 
           CharIsKOut          : out InternalData(NumberOfMGTs-1 downto 0);
          
           
           UsrClkIn         : in std_logic;
           UsrClk2In        : in std_logic;
           
           GtRxDataOut    : out InternalData(NumberOfMGTs-1 downto 0);
           GtTxDataIn     : in  InternalData(NumberOfMGTs-1 downto 0);
                    
                                                                                          
           MgtRefClkP : in std_logic_vector(NumberOfQuads-1 downto 0);--160MHz                      
           MgtRefClkN : in std_logic_vector(NumberOfQuads-1 downto 0)                               
                                                                                         
     );                                                                                  
end Virtex7_485_56gtx;                                                               
                                                                                         
architecture Behavioral of Virtex7_485_56gtx is                                      
                                                                                         
                                                                                         
--attribute DONT_TOUCH : string;                                                           
--attribute DONT_TOUCH of Behavioral : architecture is "TRUE";                             
--component declaration                                
--take component for GMTS from instantiation template from GT_wizard  
component startup_counter is
	generic	( max_count : integer:=256 --shouldn't exceed 256
	);
    Port ( PowerUpIn : in STD_LOGIC;
			Qpll_locked : in std_logic;
			clkIn		: in std_logic;
			ResetOut	: out std_logic
	);
end component;


component gtx_quad_no_buffer 
generic
(
    -- Simulation attributes
    WRAPPER_SIM_GTRESET_SPEEDUP     : string     :=  "FALSE";        -- Set to "true" to speed up sim reset
    RX_DFE_KL_CFG2_IN               : bit_vector :=  X"3010D90C";
    PMA_RSV_IN                      : bit_vector :=  x"00018480"
);
port
(
    --_________________________________________________________________________
    --_________________________________________________________________________
    --GT0  (X0Y0)
    --____________________________CHANNEL PORTS________________________________
    ---------------------------- Channel - DRP Ports  --------------------------
    gt0_drpaddr_in                          : in   std_logic_vector(8 downto 0);
    gt0_drpclk_in                           : in   std_logic;
    gt0_drpdi_in                            : in   std_logic_vector(15 downto 0);
    gt0_drpdo_out                           : out  std_logic_vector(15 downto 0);
    gt0_drpen_in                            : in   std_logic;
    gt0_drprdy_out                          : out  std_logic;
    gt0_drpwe_in                            : in   std_logic;
    ------------------------------- Loopback Ports -----------------------------
    gt0_loopback_in                         : in   std_logic_vector(2 downto 0);
    ------------------------------ Power-Down Ports ----------------------------
    gt0_rxpd_in                             : in   std_logic_vector(1 downto 0);
    gt0_txpd_in                             : in   std_logic_vector(1 downto 0);
    --------------------- RX Initialization and Reset Ports --------------------
    gt0_rxuserrdy_in                        : in   std_logic;
    -------------------------- RX Margin Analysis Ports ------------------------
    gt0_eyescandataerror_out                : out  std_logic;
    ------------------------- Receive Ports - CDR Ports ------------------------
    gt0_rxcdrlock_out                       : out  std_logic;
    ------------------ Receive Ports - FPGA RX Interface Ports -----------------
    gt0_rxusrclk_in                         : in   std_logic;
    gt0_rxusrclk2_in                        : in   std_logic;
    ------------------ Receive Ports - FPGA RX interface Ports -----------------
    gt0_rxdata_out                          : out  std_logic_vector(31 downto 0);
    ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
    gt0_rxdisperr_out                       : out  std_logic_vector(3 downto 0);
    gt0_rxnotintable_out                    : out  std_logic_vector(3 downto 0);
    --------------------------- Receive Ports - RX AFE -------------------------
    gt0_gtxrxp_in                           : in   std_logic;
    ------------------------ Receive Ports - RX AFE Ports ----------------------
    gt0_gtxrxn_in                           : in   std_logic;
    ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    gt0_rxdlyen_in                          : in   std_logic;
    gt0_rxdlysreset_in                      : in   std_logic;
    gt0_rxdlysresetdone_out                 : out  std_logic;
    gt0_rxphalign_in                        : in   std_logic;
    gt0_rxphaligndone_out                   : out  std_logic;
    gt0_rxphalignen_in                      : in   std_logic;
    gt0_rxphdlyreset_in                     : in   std_logic;
    gt0_rxphmonitor_out                     : out  std_logic_vector(4 downto 0);
    gt0_rxphslipmonitor_out                 : out  std_logic_vector(4 downto 0);
    -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
    gt0_rxmcommaalignen_in                  : in   std_logic;
    gt0_rxpcommaalignen_in                  : in   std_logic;
    -------------------- Receive Ports - RX Equailizer Ports -------------------
    gt0_rxlpmhfhold_in                      : in   std_logic;
    gt0_rxlpmlfhold_in                      : in   std_logic;
    --------------- Receive Ports - RX Fabric Output Control Ports -------------
    gt0_rxoutclk_out                        : out  std_logic;
    ------------- Receive Ports - RX Initialization and Reset Ports ------------
    gt0_gtrxreset_in                        : in   std_logic;
    gt0_rxpmareset_in                       : in   std_logic;
    ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
    gt0_rxcharisk_out                       : out  std_logic_vector(3 downto 0);
    -------------- Receive Ports -RX Initialization and Reset Ports ------------
    gt0_rxresetdone_out                     : out  std_logic;
    ------------------------ TX Configurable Driver Ports ----------------------
    gt0_txpostcursor_in                     : in   std_logic_vector(4 downto 0);
    gt0_txprecursor_in                      : in   std_logic_vector(4 downto 0);
    --------------------- TX Initialization and Reset Ports --------------------
    gt0_gttxreset_in                        : in   std_logic;
    gt0_txuserrdy_in                        : in   std_logic;
    ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
    gt0_txusrclk_in                         : in   std_logic;
    gt0_txusrclk2_in                        : in   std_logic;
    ------------------ Transmit Ports - TX Buffer Bypass Ports -----------------
    gt0_txdlyen_in                          : in   std_logic;
    gt0_txdlysreset_in                      : in   std_logic;
    gt0_txdlysresetdone_out                 : out  std_logic;
    gt0_txphalign_in                        : in   std_logic;
    gt0_txphaligndone_out                   : out  std_logic;
    gt0_txphalignen_in                      : in   std_logic;
    gt0_txphdlyreset_in                     : in   std_logic;
    gt0_txphinit_in                         : in   std_logic;
    gt0_txphinitdone_out                    : out  std_logic;
    --------------- Transmit Ports - TX Configurable Driver Ports --------------
    gt0_txdiffctrl_in                       : in   std_logic_vector(3 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    gt0_txdata_in                           : in   std_logic_vector(31 downto 0);
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    gt0_gtxtxn_out                          : out  std_logic;
    gt0_gtxtxp_out                          : out  std_logic;
    ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    gt0_txoutclk_out                        : out  std_logic;
    gt0_txoutclkfabric_out                  : out  std_logic;
    gt0_txoutclkpcs_out                     : out  std_logic;
    --------------------- Transmit Ports - TX Gearbox Ports --------------------
    gt0_txcharisk_in                        : in   std_logic_vector(3 downto 0);
    ------------- Transmit Ports - TX Initialization and Reset Ports -----------
    gt0_txresetdone_out                     : out  std_logic;

    --GT1  (X0Y1)
    --____________________________CHANNEL PORTS________________________________
    ---------------------------- Channel - DRP Ports  --------------------------
    gt1_drpaddr_in                          : in   std_logic_vector(8 downto 0);
    gt1_drpclk_in                           : in   std_logic;
    gt1_drpdi_in                            : in   std_logic_vector(15 downto 0);
    gt1_drpdo_out                           : out  std_logic_vector(15 downto 0);
    gt1_drpen_in                            : in   std_logic;
    gt1_drprdy_out                          : out  std_logic;
    gt1_drpwe_in                            : in   std_logic;
    ------------------------------- Loopback Ports -----------------------------
    gt1_loopback_in                         : in   std_logic_vector(2 downto 0);
    ------------------------------ Power-Down Ports ----------------------------
    gt1_rxpd_in                             : in   std_logic_vector(1 downto 0);
    gt1_txpd_in                             : in   std_logic_vector(1 downto 0);
    --------------------- RX Initialization and Reset Ports --------------------
    gt1_rxuserrdy_in                        : in   std_logic;
    -------------------------- RX Margin Analysis Ports ------------------------
    gt1_eyescandataerror_out                : out  std_logic;
    ------------------------- Receive Ports - CDR Ports ------------------------
    gt1_rxcdrlock_out                       : out  std_logic;
    ------------------ Receive Ports - FPGA RX Interface Ports -----------------
    gt1_rxusrclk_in                         : in   std_logic;
    gt1_rxusrclk2_in                        : in   std_logic;
    ------------------ Receive Ports - FPGA RX interface Ports -----------------
    gt1_rxdata_out                          : out  std_logic_vector(31 downto 0);
    ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
    gt1_rxdisperr_out                       : out  std_logic_vector(3 downto 0);
    gt1_rxnotintable_out                    : out  std_logic_vector(3 downto 0);
    --------------------------- Receive Ports - RX AFE -------------------------
    gt1_gtxrxp_in                           : in   std_logic;
    ------------------------ Receive Ports - RX AFE Ports ----------------------
    gt1_gtxrxn_in                           : in   std_logic;
    ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    gt1_rxdlyen_in                          : in   std_logic;
    gt1_rxdlysreset_in                      : in   std_logic;
    gt1_rxdlysresetdone_out                 : out  std_logic;
    gt1_rxphalign_in                        : in   std_logic;
    gt1_rxphaligndone_out                   : out  std_logic;
    gt1_rxphalignen_in                      : in   std_logic;
    gt1_rxphdlyreset_in                     : in   std_logic;
    gt1_rxphmonitor_out                     : out  std_logic_vector(4 downto 0);
    gt1_rxphslipmonitor_out                 : out  std_logic_vector(4 downto 0);
    -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
    gt1_rxmcommaalignen_in                  : in   std_logic;
    gt1_rxpcommaalignen_in                  : in   std_logic;
    -------------------- Receive Ports - RX Equailizer Ports -------------------
    gt1_rxlpmhfhold_in                      : in   std_logic;
    gt1_rxlpmlfhold_in                      : in   std_logic;
    --------------- Receive Ports - RX Fabric Output Control Ports -------------
    gt1_rxoutclk_out                        : out  std_logic;
    ------------- Receive Ports - RX Initialization and Reset Ports ------------
    gt1_gtrxreset_in                        : in   std_logic;
    gt1_rxpmareset_in                       : in   std_logic;
    ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
    gt1_rxcharisk_out                       : out  std_logic_vector(3 downto 0);
    -------------- Receive Ports -RX Initialization and Reset Ports ------------
    gt1_rxresetdone_out                     : out  std_logic;
    ------------------------ TX Configurable Driver Ports ----------------------
    gt1_txpostcursor_in                     : in   std_logic_vector(4 downto 0);
    gt1_txprecursor_in                      : in   std_logic_vector(4 downto 0);
    --------------------- TX Initialization and Reset Ports --------------------
    gt1_gttxreset_in                        : in   std_logic;
    gt1_txuserrdy_in                        : in   std_logic;
    ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
    gt1_txusrclk_in                         : in   std_logic;
    gt1_txusrclk2_in                        : in   std_logic;
    ------------------ Transmit Ports - TX Buffer Bypass Ports -----------------
    gt1_txdlyen_in                          : in   std_logic;
    gt1_txdlysreset_in                      : in   std_logic;
    gt1_txdlysresetdone_out                 : out  std_logic;
    gt1_txphalign_in                        : in   std_logic;
    gt1_txphaligndone_out                   : out  std_logic;
    gt1_txphalignen_in                      : in   std_logic;
    gt1_txphdlyreset_in                     : in   std_logic;
    gt1_txphinit_in                         : in   std_logic;
    gt1_txphinitdone_out                    : out  std_logic;
    --------------- Transmit Ports - TX Configurable Driver Ports --------------
    gt1_txdiffctrl_in                       : in   std_logic_vector(3 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    gt1_txdata_in                           : in   std_logic_vector(31 downto 0);
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    gt1_gtxtxn_out                          : out  std_logic;
    gt1_gtxtxp_out                          : out  std_logic;
    ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    gt1_txoutclk_out                        : out  std_logic;
    gt1_txoutclkfabric_out                  : out  std_logic;
    gt1_txoutclkpcs_out                     : out  std_logic;
    --------------------- Transmit Ports - TX Gearbox Ports --------------------
    gt1_txcharisk_in                        : in   std_logic_vector(3 downto 0);
    ------------- Transmit Ports - TX Initialization and Reset Ports -----------
    gt1_txresetdone_out                     : out  std_logic;

    --GT2  (X0Y2)
    --____________________________CHANNEL PORTS________________________________
    ---------------------------- Channel - DRP Ports  --------------------------
    gt2_drpaddr_in                          : in   std_logic_vector(8 downto 0);
    gt2_drpclk_in                           : in   std_logic;
    gt2_drpdi_in                            : in   std_logic_vector(15 downto 0);
    gt2_drpdo_out                           : out  std_logic_vector(15 downto 0);
    gt2_drpen_in                            : in   std_logic;
    gt2_drprdy_out                          : out  std_logic;
    gt2_drpwe_in                            : in   std_logic;
    ------------------------------- Loopback Ports -----------------------------
    gt2_loopback_in                         : in   std_logic_vector(2 downto 0);
    ------------------------------ Power-Down Ports ----------------------------
    gt2_rxpd_in                             : in   std_logic_vector(1 downto 0);
    gt2_txpd_in                             : in   std_logic_vector(1 downto 0);
    --------------------- RX Initialization and Reset Ports --------------------
    gt2_rxuserrdy_in                        : in   std_logic;
    -------------------------- RX Margin Analysis Ports ------------------------
    gt2_eyescandataerror_out                : out  std_logic;
    ------------------------- Receive Ports - CDR Ports ------------------------
    gt2_rxcdrlock_out                       : out  std_logic;
    ------------------ Receive Ports - FPGA RX Interface Ports -----------------
    gt2_rxusrclk_in                         : in   std_logic;
    gt2_rxusrclk2_in                        : in   std_logic;
    ------------------ Receive Ports - FPGA RX interface Ports -----------------
    gt2_rxdata_out                          : out  std_logic_vector(31 downto 0);
    ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
    gt2_rxdisperr_out                       : out  std_logic_vector(3 downto 0);
    gt2_rxnotintable_out                    : out  std_logic_vector(3 downto 0);
    --------------------------- Receive Ports - RX AFE -------------------------
    gt2_gtxrxp_in                           : in   std_logic;
    ------------------------ Receive Ports - RX AFE Ports ----------------------
    gt2_gtxrxn_in                           : in   std_logic;
    ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    gt2_rxdlyen_in                          : in   std_logic;
    gt2_rxdlysreset_in                      : in   std_logic;
    gt2_rxdlysresetdone_out                 : out  std_logic;
    gt2_rxphalign_in                        : in   std_logic;
    gt2_rxphaligndone_out                   : out  std_logic;
    gt2_rxphalignen_in                      : in   std_logic;
    gt2_rxphdlyreset_in                     : in   std_logic;
    gt2_rxphmonitor_out                     : out  std_logic_vector(4 downto 0);
    gt2_rxphslipmonitor_out                 : out  std_logic_vector(4 downto 0);
    -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
    gt2_rxmcommaalignen_in                  : in   std_logic;
    gt2_rxpcommaalignen_in                  : in   std_logic;
    -------------------- Receive Ports - RX Equailizer Ports -------------------
    gt2_rxlpmhfhold_in                      : in   std_logic;
    gt2_rxlpmlfhold_in                      : in   std_logic;
    --------------- Receive Ports - RX Fabric Output Control Ports -------------
    gt2_rxoutclk_out                        : out  std_logic;
    ------------- Receive Ports - RX Initialization and Reset Ports ------------
    gt2_gtrxreset_in                        : in   std_logic;
    gt2_rxpmareset_in                       : in   std_logic;
    ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
    gt2_rxcharisk_out                       : out  std_logic_vector(3 downto 0);
    -------------- Receive Ports -RX Initialization and Reset Ports ------------
    gt2_rxresetdone_out                     : out  std_logic;
    ------------------------ TX Configurable Driver Ports ----------------------
    gt2_txpostcursor_in                     : in   std_logic_vector(4 downto 0);
    gt2_txprecursor_in                      : in   std_logic_vector(4 downto 0);
    --------------------- TX Initialization and Reset Ports --------------------
    gt2_gttxreset_in                        : in   std_logic;
    gt2_txuserrdy_in                        : in   std_logic;
    ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
    gt2_txusrclk_in                         : in   std_logic;
    gt2_txusrclk2_in                        : in   std_logic;
    ------------------ Transmit Ports - TX Buffer Bypass Ports -----------------
    gt2_txdlyen_in                          : in   std_logic;
    gt2_txdlysreset_in                      : in   std_logic;
    gt2_txdlysresetdone_out                 : out  std_logic;
    gt2_txphalign_in                        : in   std_logic;
    gt2_txphaligndone_out                   : out  std_logic;
    gt2_txphalignen_in                      : in   std_logic;
    gt2_txphdlyreset_in                     : in   std_logic;
    gt2_txphinit_in                         : in   std_logic;
    gt2_txphinitdone_out                    : out  std_logic;
    --------------- Transmit Ports - TX Configurable Driver Ports --------------
    gt2_txdiffctrl_in                       : in   std_logic_vector(3 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    gt2_txdata_in                           : in   std_logic_vector(31 downto 0);
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    gt2_gtxtxn_out                          : out  std_logic;
    gt2_gtxtxp_out                          : out  std_logic;
    ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    gt2_txoutclk_out                        : out  std_logic;
    gt2_txoutclkfabric_out                  : out  std_logic;
    gt2_txoutclkpcs_out                     : out  std_logic;
    --------------------- Transmit Ports - TX Gearbox Ports --------------------
    gt2_txcharisk_in                        : in   std_logic_vector(3 downto 0);
    ------------- Transmit Ports - TX Initialization and Reset Ports -----------
    gt2_txresetdone_out                     : out  std_logic;

    --GT3  (X0Y3)
    --____________________________CHANNEL PORTS________________________________
    ---------------------------- Channel - DRP Ports  --------------------------
    gt3_drpaddr_in                          : in   std_logic_vector(8 downto 0);
    gt3_drpclk_in                           : in   std_logic;
    gt3_drpdi_in                            : in   std_logic_vector(15 downto 0);
    gt3_drpdo_out                           : out  std_logic_vector(15 downto 0);
    gt3_drpen_in                            : in   std_logic;
    gt3_drprdy_out                          : out  std_logic;
    gt3_drpwe_in                            : in   std_logic;
    ------------------------------- Loopback Ports -----------------------------
    gt3_loopback_in                         : in   std_logic_vector(2 downto 0);
    ------------------------------ Power-Down Ports ----------------------------
    gt3_rxpd_in                             : in   std_logic_vector(1 downto 0);
    gt3_txpd_in                             : in   std_logic_vector(1 downto 0);
    --------------------- RX Initialization and Reset Ports --------------------
    gt3_rxuserrdy_in                        : in   std_logic;
    -------------------------- RX Margin Analysis Ports ------------------------
    gt3_eyescandataerror_out                : out  std_logic;
    ------------------------- Receive Ports - CDR Ports ------------------------
    gt3_rxcdrlock_out                       : out  std_logic;
    ------------------ Receive Ports - FPGA RX Interface Ports -----------------
    gt3_rxusrclk_in                         : in   std_logic;
    gt3_rxusrclk2_in                        : in   std_logic;
    ------------------ Receive Ports - FPGA RX interface Ports -----------------
    gt3_rxdata_out                          : out  std_logic_vector(31 downto 0);
    ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
    gt3_rxdisperr_out                       : out  std_logic_vector(3 downto 0);
    gt3_rxnotintable_out                    : out  std_logic_vector(3 downto 0);
    --------------------------- Receive Ports - RX AFE -------------------------
    gt3_gtxrxp_in                           : in   std_logic;
    ------------------------ Receive Ports - RX AFE Ports ----------------------
    gt3_gtxrxn_in                           : in   std_logic;
    ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    gt3_rxdlyen_in                          : in   std_logic;
    gt3_rxdlysreset_in                      : in   std_logic;
    gt3_rxdlysresetdone_out                 : out  std_logic;
    gt3_rxphalign_in                        : in   std_logic;
    gt3_rxphaligndone_out                   : out  std_logic;
    gt3_rxphalignen_in                      : in   std_logic;
    gt3_rxphdlyreset_in                     : in   std_logic;
    gt3_rxphmonitor_out                     : out  std_logic_vector(4 downto 0);
    gt3_rxphslipmonitor_out                 : out  std_logic_vector(4 downto 0);
    -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
    gt3_rxmcommaalignen_in                  : in   std_logic;
    gt3_rxpcommaalignen_in                  : in   std_logic;
    -------------------- Receive Ports - RX Equailizer Ports -------------------
    gt3_rxlpmhfhold_in                      : in   std_logic;
    gt3_rxlpmlfhold_in                      : in   std_logic;
    --------------- Receive Ports - RX Fabric Output Control Ports -------------
    gt3_rxoutclk_out                        : out  std_logic;
    ------------- Receive Ports - RX Initialization and Reset Ports ------------
    gt3_gtrxreset_in                        : in   std_logic;
    gt3_rxpmareset_in                       : in   std_logic;
    ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
    gt3_rxcharisk_out                       : out  std_logic_vector(3 downto 0);
    -------------- Receive Ports -RX Initialization and Reset Ports ------------
    gt3_rxresetdone_out                     : out  std_logic;
    ------------------------ TX Configurable Driver Ports ----------------------
    gt3_txpostcursor_in                     : in   std_logic_vector(4 downto 0);
    gt3_txprecursor_in                      : in   std_logic_vector(4 downto 0);
    --------------------- TX Initialization and Reset Ports --------------------
    gt3_gttxreset_in                        : in   std_logic;
    gt3_txuserrdy_in                        : in   std_logic;
    ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
    gt3_txusrclk_in                         : in   std_logic;
    gt3_txusrclk2_in                        : in   std_logic;
    ------------------ Transmit Ports - TX Buffer Bypass Ports -----------------
    gt3_txdlyen_in                          : in   std_logic;
    gt3_txdlysreset_in                      : in   std_logic;
    gt3_txdlysresetdone_out                 : out  std_logic;
    gt3_txphalign_in                        : in   std_logic;
    gt3_txphaligndone_out                   : out  std_logic;
    gt3_txphalignen_in                      : in   std_logic;
    gt3_txphdlyreset_in                     : in   std_logic;
    gt3_txphinit_in                         : in   std_logic;
    gt3_txphinitdone_out                    : out  std_logic;
    --------------- Transmit Ports - TX Configurable Driver Ports --------------
    gt3_txdiffctrl_in                       : in   std_logic_vector(3 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    gt3_txdata_in                           : in   std_logic_vector(31 downto 0);
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    gt3_gtxtxn_out                          : out  std_logic;
    gt3_gtxtxp_out                          : out  std_logic;
    ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    gt3_txoutclk_out                        : out  std_logic;
    gt3_txoutclkfabric_out                  : out  std_logic;
    gt3_txoutclkpcs_out                     : out  std_logic;
    --------------------- Transmit Ports - TX Gearbox Ports --------------------
    gt3_txcharisk_in                        : in   std_logic_vector(3 downto 0);
    ------------- Transmit Ports - TX Initialization and Reset Ports -----------
    gt3_txresetdone_out                     : out  std_logic;


    --____________________________COMMON PORTS________________________________
    ---------------------- Common Block  - Ref Clock Ports ---------------------
    gt0_gtrefclk0_common_in                 : in   std_logic;
    ------------------------- Common Block - QPLL Ports ------------------------
    gt0_qplllock_out                        : out  std_logic;
    gt0_qplllockdetclk_in                   : in   std_logic;
    gt0_qpllpd_in                           : in   std_logic;
    gt0_qpllrefclklost_out                  : out  std_logic;
    gt0_qpllreset_in                        : in   std_logic

);
end component;

 
                                                          
--_________________________________________________________________________ 					
--_________________________________________________________________________ 					
--GTH                                                                							
--____________________________CHANNEL PORTS________________________________ 					
--------------------------------- CPLL Ports -------------------------------					
--_________________________________________________________________________ 					
--_________________________TYPES___________________________________________ 					
--_________________________________________________________________________ 					
             	                 	
--Control types
    --pre and post cursor
    type MGTCursor is array(natural range <>) of std_logic_vector( 4 downto 0);      
    --diff.-control
    type MGTDiffControl is array(natural range <>) of std_logic_vector(3 downto 0);  
    --loopback 
    type LoopbackMode is array(natural range <>) of std_logic_vector(2 downto 0);
    --komma indication
    type CharIsK     is array(natural range <>) of std_logic_vector(3 downto 0);
		--TX power down
	type PD     is array(natural range <>) of std_logic_vector(1 downto 0);
             	

------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------						
type rxdisperr       				is array (natural range <>) of std_logic_vector(3 downto 0);	
type rxnotintable    				is array (natural range <>) of std_logic_vector(3 downto 0);	

type monitor 	is array (natural range <>) of std_logic_vector(4 downto 0);	
 
signal    gt_rxdlyen                          :   std_logic_vector(NumberOfMgts-1 downto 0);
signal    gt_rxdlysreset                      :  std_logic_vector(NumberOfMgts-1 downto 0);
signal    gt_rxdlysresetdone                 :   std_logic_vector(NumberOfMgts-1 downto 0);
signal    gt_rxphalign                        :  std_logic_vector(NumberOfMgts-1 downto 0);
signal    gt_rxphaligndone                   :   std_logic_vector(NumberOfMgts-1 downto 0);
signal    gt_rxphalignen                      :   std_logic_vector(NumberOfMgts-1 downto 0);
signal    gt_rxphdlyreset                     :   std_logic_vector(NumberOfMgts-1 downto 0);
	
signal    gt_rxphmonitor                     :  monitor(NumberOfMgts-1 downto 0);
signal    gt_rxphslipmonitor                 :  monitor(NumberOfMgts-1 downto 0);

	
signal	   gt_txdlyen                      		:   std_logic_vector(NumberOfMgts-1 downto 0);
signal     gt_txdlysreset                      :   std_logic_vector(NumberOfMgts-1 downto 0);
signal     gt_txdlysresetdone                 :   std_logic_vector(NumberOfMgts-1 downto 0);
signal     gt_txphalign                        :   std_logic_vector(NumberOfMgts-1 downto 0);
signal     gt_txphaligndone                   :   std_logic_vector(NumberOfMgts-1 downto 0);
signal     gt_txphalignen                      :   std_logic_vector(NumberOfMgts-1 downto 0);
signal     gt_txphdlyreset                     :   std_logic_vector(NumberOfMgts-1 downto 0);
signal     gt_txphinit                         :   std_logic_vector(NumberOfMgts-1 downto 0);
signal     gt_txphinitdone                    :   std_logic_vector(NumberOfMgts-1 downto 0);                	
  							
--_________________________SIGNALS_________________________________________ 									
--_________________________________________________________________________ 									
signal gt_cpllfbclklost                   :  std_logic_vector(NumberOfMgts-1 downto 0);           
signal gt_cplllock                        :  std_logic_vector(NumberOfMgts-1 downto 0);           
signal gt_cplllockdetclk                  :  std_logic_vector(NumberOfMgts-1 downto 0);           
signal gt_cpllpd                          :  std_logic_vector(NumberOfMgts-1 downto 0)	;           
signal gt_cpllrefclklost                  :  std_logic_vector(NumberOfMgts-1 downto 0);           
signal gt_cpllreset                       :  std_logic_vector(NumberOfMgts-1 downto 0);           
-------------------------- Channel - Clocking Ports ------------------------								
signal gt_gtrefclk0                       :  std_logic_vector(NumberOfMgts-1 downto 0);           
	
------------------------------- Loopback Ports -----------------------------								
signal gt_loopback                        :    LoopbackMode(NumberOfMgts-1 downto 0);
------------------------------ Power-Down Ports ----------------------------
signal    gt_txpd                         : 	PD(NumberOfMgts-1 downto 0);
signal    gt_rxpd                         : 	PD(NumberOfMgts-1 downto 0);

signal 		gt_rx_power_up						: std_logic_vector(NumberOfMgts-1 downto 0);
signal 		gt_tx_power_up					: std_logic_vector(NumberOfMgts-1 downto 0);
		
--------------------- RX Initialization and Reset Ports --------------------								
signal gt_rxuserrdy                       :    std_logic_vector(NumberOfMgts-1 downto 0);        	
-------------------------- RX Margin Analysis Ports ------------------------								
signal gt_eyescandataerror                :   std_logic_vector(NumberOfMgts-1 downto 0);    	
------------------------- Receive Ports - CDR Ports ------------------------								
signal gt_rxcdrlock                       :   std_logic_vector(NumberOfMgts-1 downto 0);   	
------------------ Receive Ports - FPGA RX Interface Ports -----------------								
signal gt_rxusrclk                        :    std_logic_vector(NumberOfMgts-1 downto 0);    	
signal gt_rxusrclk2                       :    std_logic_vector(NumberOfMgts-1 downto 0);    	
------------------ Receive Ports - FPGA RX interface Ports -----------------								
signal gt_rxdata                          :   InternalData(NumberOfMgts-1 downto 0);		
------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------								
signal gt_rxdisperr                       :   rxdisperr(NumberOfMgts-1 downto 0);		
signal gt_rxnotintable                    :   rxnotintable(NumberOfMgts-1 downto 0);		
------------------------ Receive Ports - RX AFE Ports ----------------------								
signal gt_gthrxn                          :    std_logic_vector(NumberOfMgts-1 downto 0);     	
-------------- Receive Ports - RX Byte and Word Alignment Ports ------------								
signal gt_rxmcommaalignen                 :   std_logic_vector(NumberOfMgts-1 downto 0);      	
signal gt_rxpcommaalignen                 :   std_logic_vector(NumberOfMgts-1 downto 0);     	
-------------------- Receive Ports - RX Equailizer Ports -------------------								
signal gt_rxlpmhfhold                     :    std_logic_vector(NumberOfMgts-1 downto 0);      	
signal gt_rxlpmlfhold                     :    std_logic_vector(NumberOfMgts-1 downto 0);      	
--------------- Receive Ports - RX Fabric Output Control Ports -------------								
signal gt_rxoutclk                        :   std_logic_vector(NumberOfMgts-1 downto 0);     	
------------- Receive Ports - RX Initialization and Reset Ports ------------								
signal gt_gtrxreset                       :    std_logic_vector(NumberOfMgts-1 downto 0);    	
------------------- Receive Ports - RX8B/10B Decoder Ports -----------------								
signal gt_rxcharisk                       :   CharIsK(NumberOfMgts-1 downto 0);		
------------------------ Receive Ports -RX AFE Ports -----------------------								
signal gt_gthrxp                          :    std_logic_vector(NumberOfMgts-1 downto 0);    	
-------------- Receive Ports -RX Initialization and Reset Ports ------------								
signal gt_rxresetdone                     :   std_logic_vector(NumberOfMgts-1 downto 0);      	
------------------------ TX Configurable Driver Ports ----------------------								
signal gt_txpostcursor                    :    MGTCursor(NumberOfMgts-1 downto 0);		
signal gt_txprecursor                     :    MGTCursor(NumberOfMgts-1 downto 0);		
--------------------- TX Initialization and Reset Ports --------------------								
signal gt_gttxreset                       :   std_logic_vector(NumberOfMgts-1 downto 0);       
signal gt_txuserrdy                       :   std_logic_vector(NumberOfMgts-1 downto 0);       
------------------ Transmit Ports - FPGA TX Interface Ports ----------------								
signal gt_txusrclk                        :    std_logic_vector(NumberOfMgts-1 downto 0);       
signal gt_txusrclk2                       :    std_logic_vector(NumberOfMgts-1 downto 0);       
--------------- Transmit Ports - TX Configurable Driver Ports --------------								
signal gt_txdiffctrl                      :   MGTDiffControl(NumberOfMgts-1 downto 0);		
------------------ Transmit Ports - TX Data Path interface -----------------								
signal gt_txdata                          :   InternalData(NumberOfMgts-1 downto 0);		
---------------- Transmit Ports - TX Driver and OOB signaling --------------								
signal gt_gthtxn                          :   std_logic_vector(NumberOfMgts-1 downto 0);       
signal gt_gthtxp                          :   std_logic_vector(NumberOfMgts-1 downto 0);       
----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------								
signal gt_txoutclk                        :   std_logic_vector(NumberOfMgts-1 downto 0);       
signal gt_txoutclkfabric                  :   std_logic_vector(NumberOfMgts-1 downto 0);       
signal gt_txoutclkpcs                     :   std_logic_vector(NumberOfMgts-1 downto 0);       
------------- Transmit Ports - TX Initialization and Reset Ports -----------								
signal gt_txresetdone                     :   std_logic_vector(NumberOfMgts-1 downto 0);       
----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------								
signal gt_txcharisk                       :    CharIsK(NumberOfMgts-1 downto 0);		



--____________________________COMMON PORTS________________________________   	
---------------------- Common Block  - Ref Clock Ports --------------------- 
signal gt_gtrefclk0_common                 :   std_logic_vector(NumberOfQuads-1 downto 0);                    
------------------------- Common Block - QPLL Ports ------------------------ 
signal gt_qplllock                        :   std_logic_vector(NumberOfQuads-1 downto 0);                
signal gt_qplllockdetclk                  :  	std_logic_vector(NumberOfQuads-1 downto 0); 
signal gt_qpllpd                          :     std_logic_vector(NumberOfQuads-1 downto 0);
signal gt_qpll_power_up                          :     std_logic_vector(NumberOfQuads-1 downto 0);                     
signal gt_qpllrefclklost                  :   std_logic_vector(NumberOfQuads-1 downto 0);                
signal gt_qpllreset                       :  	std_logic_vector(NumberOfQuads-1 downto 0);                 
--____________________________FSM-PORTS________________________________   
signal gt_common_cpllreset                     : std_logic_vector(NumberOfQuads-1 downto 0); 
signal gt_common_cplllock                      : std_logic_vector(NumberOfQuads-1 downto 0); 


signal gt_startupdone                   		 : std_logic_vector(NumberOfMgts-1 downto 0); 
signal gt_reset                        		 : std_logic_vector(NumberOfMgts-1 downto 0); 
--____________________________CLK_SRC-PORTS________________________________   
signal gt_gtrefclk0_N                     :	std_logic_vector(NumberOfQuads-1 downto 0);                   
signal gt_gtrefclk0_P                     :	std_logic_vector(NumberOfQuads-1 downto 0);
signal gt_gtrefclk                            :	std_logic_vector(NumberOfQuads-1 downto 0); 


signal gte_out	 :  std_logic_vector(NumberOfQuads-1 downto 0);

                   

signal usr_clk                             : std_logic;
signal usr_clk2                             : std_logic;

type gt_drpdo_array       			is array (natural range <>) of std_logic_vector(15 downto 0);

signal gt_drpclk    : std_logic_vector(NumberOfMgts-1 downto 0); 
signal gt_drpdo     : gt_drpdo_array(NumberOfMgts-1 downto 0); 
signal gt_drprdy    : std_logic_vector(NumberOfMgts-1 downto 0);
signal gt_rxpmareset   : std_logic_vector(NumberOfMgts-1 downto 0);
signal tied_to_ground_vec   : std_logic_vector(NumberOfMgts-1 downto 0) :=(others =>'0');


begin
gt_rxpmareset<= tied_to_ground_vec;
																					
--_________________________________________________________________________ 									
--________________________PORT MAPS_________________________________________ 									
--_________________________________________________________________________ 



									
GTX_GEN:
for I in 0 to NumberOfQuads-1 generate


--IBUFDS_GTE2                                                
ibufds_i_0: IBUFDS_GTE2                           
   port map                                                   
   (                                                          
       O               => 	gte_out(I),               
       ODIV2           =>    open,                            
       CEB             => 	'0',                            
       I               => 	MgtRefClkP(I),      
       IB              => 	MgtRefClkN(I)       
   ); 

   
Quad_start: startup_counter 
	generic	map( max_count =>256 --shouldn't exceed 256
	)
    Port map( 	PowerUpIn => gt_qpll_power_up(I),
			Qpll_locked =>'1',
			clkIn		=> usr_clk,
			ResetOut	=> gt_qpllreset(I)
	);
	
	
Rx_Tx_start_GEN:
for Y in 0 to 4-1 generate
	
RX_start: startup_counter 
	generic	map( max_count =>256 --shouldn't exceed 256
	)
    Port map(  PowerUpIn => gt_rx_power_up((4*I)+Y),
			Qpll_locked =>gt_qplllock(I),
			clkIn		=> usr_clk,
			ResetOut	=> gt_gtrxreset((4*I)+Y)
	);

TX_start: startup_counter 
	generic	map( max_count =>256 --shouldn't exceed 256
	)
    Port map(  PowerUpIn 	=> 	gt_tx_power_up((4*I)+Y),
			Qpll_locked =>	gt_qplllock(I),
			clkIn		=>  usr_clk,
			ResetOut	=>  gt_gttxreset((4*I)+Y)
	);

-- enables comma_alignment, when receiver is ready	
gt_rxmcommaalignen((4*I)+Y)<=gt_rxresetdone((4*I)+Y);
gt_rxpcommaalignen((4*I)+Y)<=gt_rxresetdone((4*I)+Y);		

--gt_rxmcommaalignen((4*I)+Y)<='1';
--gt_rxpcommaalignen((4*I)+Y)<='1';
end generate Rx_Tx_start_GEN;
	
GTX_QUAD_i: gtx_quad_no_buffer
    generic map
    (
        -- Simulation attributes
        WRAPPER_SIM_GTRESET_SPEEDUP =>  "FALSE"         -- Speedup is turned on for simulation
    ) 
    port map
(
    --_____________________________________________________________________    
  --_____________________________________________________________________    
  --GT0  (X0Y0)                                                              
  --____________________________CHANNEL PORTS________________________________
 ---------------------------- Channel - DRP Ports  --------------------------
     gt0_drpaddr_in                  =>      (others=>'0'),                 
     gt0_drpclk_in                   =>      '0',                  
     gt0_drpdi_in                    =>      (others=>'0'),                   
     gt0_drpdo_out                   =>      gt_drpdo((4*I)+0) ,                  
     gt0_drpen_in                    =>      '0',                   
     gt0_drprdy_out                  =>      gt_drprdy((4*I)+0),                 
     gt0_drpwe_in                    =>      '0',                   
 ------------------------------- Loopback Ports -----------------------------
     gt0_loopback_in                 =>      gt_loopback((4*I)+0),                
------------------------------ Power-Down Ports ---------------------------- 
	  gt0_rxpd_in                     =>      gt_rxpd((4*I)+0), 
 	  gt0_txpd_in                     =>		gt_txpd((4*I)+0), 
 --------------------- RX Initialization and Reset Ports --------------------
     gt0_rxuserrdy_in                =>      '1',               
 -------------------------- RX Margin Analysis Ports ------------------------
     gt0_eyescandataerror_out        =>      gt_eyescandataerror((4*I)+0),       
 ------------------------- Receive Ports - CDR Ports ------------------------
     gt0_rxcdrlock_out               =>      gt_rxcdrlock((4*I)+0),              
 ------------------ Receive Ports - FPGA RX Interface Ports -----------------
     gt0_rxusrclk_in                 =>     usr_clk,                
     gt0_rxusrclk2_in                =>      usr_clk2,               
 ------------------ Receive Ports - FPGA RX interface Ports -----------------
     gt0_rxdata_out                  =>      gt_rxdata((4*I)+0),                 
 ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
     gt0_rxdisperr_out               =>      gt_rxdisperr((4*I)+0),              
     gt0_rxnotintable_out            =>      gt_rxnotintable((4*I)+0),           
 --------------------------- Receive Ports - RX AFE -------------------------
     gt0_gtxrxp_in                   =>      RxP((4*I)+0),
   ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    gt0_rxdlyen_in                   => gt_rxdlyen((4*I)+0)          ,
    gt0_rxdlysreset_in               => gt_rxdlysreset((4*I)+0)      ,
    gt0_rxdlysresetdone_out          => gt_rxdlysresetdone((4*I)+0) ,
    gt0_rxphalign_in                 => gt_rxphalign((4*I)+0)        ,
    gt0_rxphaligndone_out            => gt_rxphaligndone((4*I)+0)   ,
    gt0_rxphalignen_in               => gt_rxphalignen((4*I)+0)      ,
    gt0_rxphdlyreset_in              => gt_rxphdlyreset((4*I)+0)     ,
    gt0_rxphmonitor_out              => gt_rxphmonitor((4*I)+0)     ,
    gt0_rxphslipmonitor_out          => gt_rxphslipmonitor((4*I)+0) ,	 	 
 ------------------------ Receive Ports - RX AFE Ports ----------------------
     gt0_gtxrxn_in                   =>      RxN((4*I)+0),                  
 -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
     gt0_rxmcommaalignen_in          =>      gt_rxmcommaalignen((4*I)+0),         
     gt0_rxpcommaalignen_in          =>      gt_rxpcommaalignen((4*I)+0),         
 -------------------- Receive Ports - RX Equailizer Ports -------------------
     gt0_rxlpmhfhold_in              =>      '0',             
     gt0_rxlpmlfhold_in              =>      '0',             
 --------------- Receive Ports - RX Fabric Output Control Ports -------------
     gt0_rxoutclk_out                =>      gt_rxoutclk((4*I)+0),               
 ------------- Receive Ports - RX Initialization and Reset Ports ------------
     gt0_gtrxreset_in                =>      gt_gtrxreset((4*I)+0),               
     gt0_rxpmareset_in               =>      '0',              
 ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
     gt0_rxcharisk_out               =>      gt_rxcharisk((4*I)+0),              
 -------------- Receive Ports -RX Initialization and Reset Ports ------------
     gt0_rxresetdone_out             =>      gt_rxresetdone((4*I)+0),            
 ------------------------ TX Configurable Driver Ports ----------------------
     gt0_txpostcursor_in             =>      gt_txpostcursor((4*I)+0),            
     gt0_txprecursor_in              =>      gt_txprecursor((4*I)+0),             
 --------------------- TX Initialization and Reset Ports --------------------
     gt0_gttxreset_in                =>      gt_gttxreset((4*I)+0),               
     gt0_txuserrdy_in                =>      '1',               
 ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
     gt0_txusrclk_in                 =>      usr_clk,                
     gt0_txusrclk2_in                =>      usr_clk2,
    ------------------ Transmit Ports - TX Buffer Bypass Ports -----------------
    gt0_txdlyen_in                   => gt_txdlyen((4*I)+0)          ,
    gt0_txdlysreset_in               => gt_txdlysreset((4*I)+0)      ,
    gt0_txdlysresetdone_out          => gt_txdlysresetdone((4*I)+0) ,
    gt0_txphalign_in                 => gt_txphalign((4*I)+0)        ,
    gt0_txphaligndone_out            => gt_txphaligndone((4*I)+0)   ,
    gt0_txphalignen_in               => gt_txphalignen((4*I)+0)      ,
    gt0_txphdlyreset_in              => gt_txphdlyreset((4*I)+0)     ,
    gt0_txphinit_in                  => gt_txphinit((4*I)+0)         ,
    gt0_txphinitdone_out             => gt_txphinitdone((4*I)+0)    , 
 --------------- Transmit Ports - TX Configurable Driver Ports --------------
     gt0_txdiffctrl_in               =>      gt_txdiffctrl((4*I)+0),              
 ------------------ Transmit Ports - TX Data Path interface -----------------
     gt0_txdata_in                   =>      gt_txdata((4*I)+0),                  
 ---------------- Transmit Ports - TX Driver and OOB signaling --------------
     gt0_gtxtxn_out                  =>      TxN((4*I)+0),                 
     gt0_gtxtxp_out                  =>      TxP((4*I)+0),                 
 ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
     gt0_txoutclk_out                =>      gt_txoutclk((4*I)+0),               
     gt0_txoutclkfabric_out          =>      gt_txoutclkfabric((4*I)+0),         
     gt0_txoutclkpcs_out             =>      gt_txoutclkpcs((4*I)+0),            
 --------------------- Transmit Ports - TX Gearbox Ports --------------------
     gt0_txcharisk_in                =>      gt_txcharisk((4*I)+0),                      
 ------------- Transmit Ports - TX Initialization and Reset Ports -----------
     gt0_txresetdone_out             =>      gt_txresetdone((4*I)+0),                    
                                                                             
  --_____________________________________________________________________    
  --_____________________________________________________________________    
  --GT1  (X0Y0)                                                              
  --____________________________CHANNEL PORTS________________________________
 ---------------------------- Channel - DRP Ports  --------------------------
     gt1_drpaddr_in                  =>      (others=>'0'),                 
     gt1_drpclk_in                   =>      '0',                  
     gt1_drpdi_in                    =>      (others=>'0'),                   
     gt1_drpdo_out                   =>      gt_drpdo((4*I)+1) ,                  
     gt1_drpen_in                    =>      '0',                   
     gt1_drprdy_out                  =>      gt_drprdy((4*I)+1),                 
     gt1_drpwe_in                    =>      '0',                   
 ------------------------------- Loopback Ports -----------------------------
     gt1_loopback_in                 =>      gt_loopback((4*I)+1),                
------------------------------ Power-Down Ports ---------------------------- 
	  gt1_rxpd_in                     =>      gt_rxpd((4*I)+1), 
 	  gt1_txpd_in                     =>		gt_txpd((4*I)+1), 
 --------------------- RX Initialization and Reset Ports --------------------
     gt1_rxuserrdy_in                =>      '1',               
 -------------------------- RX Margin Analysis Ports ------------------------
     gt1_eyescandataerror_out        =>      gt_eyescandataerror((4*I)+1),       
 ------------------------- Receive Ports - CDR Ports ------------------------
     gt1_rxcdrlock_out               =>      gt_rxcdrlock((4*I)+1),              
 ------------------ Receive Ports - FPGA RX Interface Ports -----------------
     gt1_rxusrclk_in                 =>     usr_clk,                
     gt1_rxusrclk2_in                =>      usr_clk2,               
 ------------------ Receive Ports - FPGA RX interface Ports -----------------
     gt1_rxdata_out                  =>      gt_rxdata((4*I)+1),                 
 ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
     gt1_rxdisperr_out               =>      gt_rxdisperr((4*I)+1),              
     gt1_rxnotintable_out            =>      gt_rxnotintable((4*I)+1),           
 --------------------------- Receive Ports - RX AFE -------------------------
     gt1_gtxrxp_in                   =>      RxP((4*I)+1),
   ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    gt1_rxdlyen_in                    => gt_rxdlyen((4*I)+1)          ,
    gt1_rxdlysreset_in                => gt_rxdlysreset((4*I)+1)      ,
    gt1_rxdlysresetdone_out           => gt_rxdlysresetdone((4*I)+1) ,
    gt1_rxphalign_in                  => gt_rxphalign((4*I)+1)        ,
    gt1_rxphaligndone_out             => gt_rxphaligndone((4*I)+1)   ,
    gt1_rxphalignen_in                => gt_rxphalignen((4*I)+1)      ,
    gt1_rxphdlyreset_in               => gt_rxphdlyreset((4*I)+1)     ,
    gt1_rxphmonitor_out               => gt_rxphmonitor((4*I)+1)     ,
    gt1_rxphslipmonitor_out           => gt_rxphslipmonitor((4*I)+1) ,	 	 
 ------------------------ Receive Ports - RX AFE Ports ----------------------
     gt1_gtxrxn_in                   =>      RxN((4*I)+1),                  
 -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
     gt1_rxmcommaalignen_in          =>      gt_rxmcommaalignen((4*I)+1),         
     gt1_rxpcommaalignen_in          =>      gt_rxpcommaalignen((4*I)+1),         
 -------------------- Receive Ports - RX Equailizer Ports -------------------
     gt1_rxlpmhfhold_in              =>      '0',             
     gt1_rxlpmlfhold_in              =>      '0',             
 --------------- Receive Ports - RX Fabric Output Control Ports -------------
     gt1_rxoutclk_out                =>      gt_rxoutclk((4*I)+1),               
 ------------- Receive Ports - RX Initialization and Reset Ports ------------
     gt1_gtrxreset_in                =>      gt_gtrxreset((4*I)+1),               
     gt1_rxpmareset_in               =>      '0',              
 ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
     gt1_rxcharisk_out               =>      gt_rxcharisk((4*I)+1),              
 -------------- Receive Ports -RX Initialization and Reset Ports ------------
     gt1_rxresetdone_out             =>      gt_rxresetdone((4*I)+1),            
 ------------------------ TX Configurable Driver Ports ----------------------
     gt1_txpostcursor_in             =>      gt_txpostcursor((4*I)+1),            
     gt1_txprecursor_in              =>      gt_txprecursor((4*I)+1),             
 --------------------- TX Initialization and Reset Ports --------------------
     gt1_gttxreset_in                =>      gt_gttxreset((4*I)+1),               
     gt1_txuserrdy_in                =>      '1',               
 ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
     gt1_txusrclk_in                 =>      usr_clk,                
     gt1_txusrclk2_in                =>      usr_clk2,
    ------------------ Transmit Ports - TX Buffer Bypass Ports -----------------
    gt1_txdlyen_in                    => gt_txdlyen((4*I)+1)          ,
    gt1_txdlysreset_in                => gt_txdlysreset((4*I)+1)      ,
    gt1_txdlysresetdone_out           => gt_txdlysresetdone((4*I)+1) ,
    gt1_txphalign_in                  => gt_txphalign((4*I)+1)        ,
    gt1_txphaligndone_out             => gt_txphaligndone((4*I)+1)   ,
    gt1_txphalignen_in                => gt_txphalignen((4*I)+1)      ,
    gt1_txphdlyreset_in               => gt_txphdlyreset((4*I)+1)     ,
    gt1_txphinit_in                   => gt_txphinit((4*I)+1)         ,
    gt1_txphinitdone_out              => gt_txphinitdone((4*I)+1)    ,
 --------------- Transmit Ports - TX Configurable Driver Ports --------------
     gt1_txdiffctrl_in               =>      gt_txdiffctrl((4*I)+1),              
 ------------------ Transmit Ports - TX Data Path interface -----------------
     gt1_txdata_in                   =>      gt_txdata((4*I)+1),                  
 ---------------- Transmit Ports - TX Driver and OOB signaling --------------
     gt1_gtxtxn_out                  =>      TxN((4*I)+1),                 
     gt1_gtxtxp_out                  =>      TxP((4*I)+1),                 
 ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
     gt1_txoutclk_out                =>      gt_txoutclk((4*I)+1),               
     gt1_txoutclkfabric_out          =>      gt_txoutclkfabric((4*I)+1),         
     gt1_txoutclkpcs_out             =>      gt_txoutclkpcs((4*I)+1),            
 --------------------- Transmit Ports - TX Gearbox Ports --------------------
     gt1_txcharisk_in                =>      gt_txcharisk((4*I)+1),                      
 ------------- Transmit Ports - TX Initialization and Reset Ports -----------
     gt1_txresetdone_out             =>      gt_txresetdone((4*I)+1),                    
                                                                             
  --_____________________________________________________________________    
  --_____________________________________________________________________    
  --GT2  (X0Y0)                                                              
  --____________________________CHANNEL PORTS________________________________
 ---------------------------- Channel - DRP Ports  --------------------------
     gt2_drpaddr_in                  =>      (others=>'0'),                 
     gt2_drpclk_in                   =>      '0',                  
     gt2_drpdi_in                    =>      (others=>'0'),                   
     gt2_drpdo_out                   =>      gt_drpdo((4*I)+2) ,                  
     gt2_drpen_in                    =>      '0',                   
     gt2_drprdy_out                  =>      gt_drprdy((4*I)+2),                 
     gt2_drpwe_in                    =>      '0',                   
 ------------------------------- Loopback Ports -----------------------------
     gt2_loopback_in                 =>      gt_loopback((4*I)+2),                
------------------------------ Power-Down Ports ---------------------------- 
	  gt2_rxpd_in                     =>      gt_rxpd((4*I)+2), 
 	  gt2_txpd_in                     =>		gt_txpd((4*I)+2), 
 --------------------- RX Initialization and Reset Ports --------------------
     gt2_rxuserrdy_in                =>      '1',               
 -------------------------- RX Margin Analysis Ports ------------------------
     gt2_eyescandataerror_out        =>      gt_eyescandataerror((4*I)+2),       
 ------------------------- Receive Ports - CDR Ports ------------------------
     gt2_rxcdrlock_out               =>      gt_rxcdrlock((4*I)+2),              
 ------------------ Receive Ports - FPGA RX Interface Ports -----------------
     gt2_rxusrclk_in                 =>     usr_clk,                
     gt2_rxusrclk2_in                =>      usr_clk2,               
 ------------------ Receive Ports - FPGA RX interface Ports -----------------
     gt2_rxdata_out                  =>      gt_rxdata((4*I)+2),                 
 ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
     gt2_rxdisperr_out               =>      gt_rxdisperr((4*I)+2),              
     gt2_rxnotintable_out            =>      gt_rxnotintable((4*I)+2),           
 --------------------------- Receive Ports - RX AFE -------------------------
     gt2_gtxrxp_in                   =>      RxP((4*I)+2),                  
 ------------------------ Receive Ports - RX AFE Ports ----------------------
     gt2_gtxrxn_in                   =>      RxN((4*I)+2),
   ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    gt2_rxdlyen_in                    => gt_rxdlyen((4*I)+2)          ,
    gt2_rxdlysreset_in                => gt_rxdlysreset((4*I)+2)      ,
    gt2_rxdlysresetdone_out           => gt_rxdlysresetdone((4*I)+2) ,
    gt2_rxphalign_in                  => gt_rxphalign((4*I)+2)        ,
    gt2_rxphaligndone_out             => gt_rxphaligndone((4*I)+2)   ,
    gt2_rxphalignen_in                => gt_rxphalignen((4*I)+2)      ,
    gt2_rxphdlyreset_in               => gt_rxphdlyreset((4*I)+2)     ,
    gt2_rxphmonitor_out               => gt_rxphmonitor((4*I)+2)     ,
    gt2_rxphslipmonitor_out           => gt_rxphslipmonitor((4*I)+2) ,	 	 
 -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
     gt2_rxmcommaalignen_in          =>      gt_rxmcommaalignen((4*I)+2),         
     gt2_rxpcommaalignen_in          =>      gt_rxpcommaalignen((4*I)+2),         
 -------------------- Receive Ports - RX Equailizer Ports -------------------
     gt2_rxlpmhfhold_in              =>      '0',             
     gt2_rxlpmlfhold_in              =>      '0',             
 --------------- Receive Ports - RX Fabric Output Control Ports -------------
     gt2_rxoutclk_out                =>      gt_rxoutclk((4*I)+2),               
 ------------- Receive Ports - RX Initialization and Reset Ports ------------
     gt2_gtrxreset_in                =>      gt_gtrxreset((4*I)+2),               
     gt2_rxpmareset_in               =>      '0',              
 ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
     gt2_rxcharisk_out               =>      gt_rxcharisk((4*I)+2),              
 -------------- Receive Ports -RX Initialization and Reset Ports ------------
     gt2_rxresetdone_out             =>      gt_rxresetdone((4*I)+2),            
 ------------------------ TX Configurable Driver Ports ----------------------
     gt2_txpostcursor_in             =>      gt_txpostcursor((4*I)+2),            
     gt2_txprecursor_in              =>      gt_txprecursor((4*I)+2),             
 --------------------- TX Initialization and Reset Ports --------------------
     gt2_gttxreset_in                =>      gt_gttxreset((4*I)+2),               
     gt2_txuserrdy_in                =>      '1',               
 ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
     gt2_txusrclk_in                 =>      usr_clk,                
     gt2_txusrclk2_in                =>      usr_clk2,
    ------------------ Transmit Ports - TX Buffer Bypass Ports -----------------
    gt2_txdlyen_in                     => gt_txdlyen((4*I)+2)          ,
    gt2_txdlysreset_in                 => gt_txdlysreset((4*I)+2)      ,
    gt2_txdlysresetdone_out            => gt_txdlysresetdone((4*I)+2) ,
    gt2_txphalign_in                   => gt_txphalign((4*I)+2)        ,
    gt2_txphaligndone_out              => gt_txphaligndone((4*I)+2)   ,
    gt2_txphalignen_in                 => gt_txphalignen((4*I)+2)      ,
    gt2_txphdlyreset_in                => gt_txphdlyreset((4*I)+2)     ,
    gt2_txphinit_in                    => gt_txphinit((4*I)+2)         ,
    gt2_txphinitdone_out               => gt_txphinitdone((4*I)+2)    , 
 --------------- Transmit Ports - TX Configurable Driver Ports --------------
     gt2_txdiffctrl_in               =>      gt_txdiffctrl((4*I)+2),              
 ------------------ Transmit Ports - TX Data Path interface -----------------
     gt2_txdata_in                   =>      gt_txdata((4*I)+2),                  
 ---------------- Transmit Ports - TX Driver and OOB signaling --------------
     gt2_gtxtxn_out                  =>      TxN((4*I)+2),                 
     gt2_gtxtxp_out                  =>      TxP((4*I)+2),                 
 ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
     gt2_txoutclk_out                =>      gt_txoutclk((4*I)+2),               
     gt2_txoutclkfabric_out          =>      gt_txoutclkfabric((4*I)+2),         
     gt2_txoutclkpcs_out             =>      gt_txoutclkpcs((4*I)+2),            
 --------------------- Transmit Ports - TX Gearbox Ports --------------------
     gt2_txcharisk_in                =>      gt_txcharisk((4*I)+2),                      
 ------------- Transmit Ports - TX Initialization and Reset Ports -----------
     gt2_txresetdone_out             =>      gt_txresetdone((4*I)+2),                    
                                                                             
  --_____________________________________________________________________    
  --_____________________________________________________________________    
  --GT3  (X0Y0)                                                              
  --____________________________CHANNEL PORTS________________________________
 ---------------------------- Channel - DRP Ports  --------------------------
     gt3_drpaddr_in                  =>      (others=>'0'),                 
     gt3_drpclk_in                   =>      '0',                  
     gt3_drpdi_in                    =>      (others=>'0'),                   
     gt3_drpdo_out                   =>      gt_drpdo((4*I)+3) ,                  
     gt3_drpen_in                    =>      '0',                   
     gt3_drprdy_out                  =>      gt_drprdy((4*I)+3),                 
     gt3_drpwe_in                    =>      '0',                   
 ------------------------------- Loopback Ports -----------------------------
     gt3_loopback_in                 =>      gt_loopback((4*I)+3),                
------------------------------ Power-Down Ports ---------------------------- 
	  gt3_rxpd_in                     =>      gt_rxpd((4*I)+3), 
 	  gt3_txpd_in                     =>		gt_txpd((4*I)+3), 
 --------------------- RX Initialization and Reset Ports --------------------
     gt3_rxuserrdy_in                =>      '1',               
 -------------------------- RX Margin Analysis Ports ------------------------
     gt3_eyescandataerror_out        =>      gt_eyescandataerror((4*I)+3),       
 ------------------------- Receive Ports - CDR Ports ------------------------
     gt3_rxcdrlock_out               =>      gt_rxcdrlock((4*I)+3),              
 ------------------ Receive Ports - FPGA RX Interface Ports -----------------
     gt3_rxusrclk_in                 =>     usr_clk,                
     gt3_rxusrclk2_in                =>      usr_clk2,               
 ------------------ Receive Ports - FPGA RX interface Ports -----------------
     gt3_rxdata_out                  =>      gt_rxdata((4*I)+3),                 
 ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
     gt3_rxdisperr_out               =>      gt_rxdisperr((4*I)+3),              
     gt3_rxnotintable_out            =>      gt_rxnotintable((4*I)+3),           
 --------------------------- Receive Ports - RX AFE -------------------------
     gt3_gtxrxp_in                   =>      RxP((4*I)+3),
   ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    gt3_rxdlyen_in                  => gt_rxdlyen((4*I)+3)          ,
    gt3_rxdlysreset_in              => gt_rxdlysreset((4*I)+3)      ,
    gt3_rxdlysresetdone_out         => gt_rxdlysresetdone((4*I)+3) ,
    gt3_rxphalign_in                => gt_rxphalign((4*I)+3)        ,
    gt3_rxphaligndone_out           => gt_rxphaligndone((4*I)+3)   ,
    gt3_rxphalignen_in              => gt_rxphalignen((4*I)+3)      ,
    gt3_rxphdlyreset_in             => gt_rxphdlyreset((4*I)+3)     ,
    gt3_rxphmonitor_out             => gt_rxphmonitor((4*I)+3)     ,
    gt3_rxphslipmonitor_out         => gt_rxphslipmonitor((4*I)+3) ,	 
 ------------------------ Receive Ports - RX AFE Ports ----------------------
     gt3_gtxrxn_in                   =>      RxN((4*I)+3),                  
 -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
     gt3_rxmcommaalignen_in          =>      gt_rxmcommaalignen((4*I)+3),         
     gt3_rxpcommaalignen_in          =>      gt_rxpcommaalignen((4*I)+3),         
 -------------------- Receive Ports - RX Equailizer Ports -------------------
     gt3_rxlpmhfhold_in              =>      '0',             
     gt3_rxlpmlfhold_in              =>      '0',             
 --------------- Receive Ports - RX Fabric Output Control Ports -------------
     gt3_rxoutclk_out                =>      gt_rxoutclk((4*I)+3),               
 ------------- Receive Ports - RX Initialization and Reset Ports ------------
     gt3_gtrxreset_in                =>      gt_gtrxreset((4*I)+3),               
     gt3_rxpmareset_in               =>      '0',              
 ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
     gt3_rxcharisk_out               =>      gt_rxcharisk((4*I)+3),              
 -------------- Receive Ports -RX Initialization and Reset Ports ------------
     gt3_rxresetdone_out             =>      gt_rxresetdone((4*I)+3),            
 ------------------------ TX Configurable Driver Ports ----------------------
     gt3_txpostcursor_in             =>      gt_txpostcursor((4*I)+3),            
     gt3_txprecursor_in              =>      gt_txprecursor((4*I)+3),             
 --------------------- TX Initialization and Reset Ports --------------------
     gt3_gttxreset_in                =>      gt_gttxreset((4*I)+3),               
     gt3_txuserrdy_in                =>      '1',               
 ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
     gt3_txusrclk_in                 =>      usr_clk,                
     gt3_txusrclk2_in                =>      usr_clk2,
    ------------------ Transmit Ports - TX Buffer Bypass Ports -----------------
    gt3_txdlyen_in                   => gt_txdlyen((4*I)+3)          ,
    gt3_txdlysreset_in               => gt_txdlysreset((4*I)+3)      ,
    gt3_txdlysresetdone_out          => gt_txdlysresetdone((4*I)+3) ,
    gt3_txphalign_in                 => gt_txphalign((4*I)+3)        ,
    gt3_txphaligndone_out            => gt_txphaligndone((4*I)+3)   ,
    gt3_txphalignen_in               => gt_txphalignen((4*I)+3)      ,
    gt3_txphdlyreset_in              => gt_txphdlyreset((4*I)+3)     ,
    gt3_txphinit_in                  => gt_txphinit((4*I)+3)         ,
    gt3_txphinitdone_out             => gt_txphinitdone((4*I)+3)    ,
 --------------- Transmit Ports - TX Configurable Driver Ports --------------
     gt3_txdiffctrl_in               =>      gt_txdiffctrl((4*I)+3),              
 ------------------ Transmit Ports - TX Data Path interface -----------------
     gt3_txdata_in                   =>      gt_txdata((4*I)+3),                  
 ---------------- Transmit Ports - TX Driver and OOB signaling --------------
     gt3_gtxtxn_out                  =>      TxN((4*I)+3),                 
     gt3_gtxtxp_out                  =>      TxP((4*I)+3),                 
 ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
     gt3_txoutclk_out                =>      gt_txoutclk((4*I)+3),               
     gt3_txoutclkfabric_out          =>      gt_txoutclkfabric((4*I)+3),         
     gt3_txoutclkpcs_out             =>      gt_txoutclkpcs((4*I)+3),            
 --------------------- Transmit Ports - TX Gearbox Ports --------------------
     gt3_txcharisk_in                =>      gt_txcharisk((4*I)+3),                      
 ------------- Transmit Ports - TX Initialization and Reset Ports -----------
     gt3_txresetdone_out             =>      gt_txresetdone((4*I)+3),                    
                                                                             
    
    --____________________________COMMON PORTS________________________________
    ---------------------- Common Block  - Ref Clock Ports ---------------------
        gt0_gtrefclk0_common_in         =>      gt_gtrefclk(I),
    ------------------------- Common Block - QPLL Ports ------------------------
        gt0_qplllock_out                =>      gt_qplllock(I),
        gt0_qplllockdetclk_in           =>      '0',
        gt0_qpllpd_in                   =>      gt_qpllpd(I),
        gt0_qpllrefclklost_out          =>      gt_qpllrefclklost(I),
        gt0_qpllreset_in                =>      gt_qpllreset(I)

);
   	
	
end generate GTX_GEN;


--assign the ref_clks (virtex7 485) to TTC_CLK
--banks 113,114,115
gt_gtrefclk(0)<=gte_out(0);
gt_gtrefclk(1)<=gte_out(0);
gt_gtrefclk(2)<=gte_out(3);
--banks 116,117,118
gt_gtrefclk(3)<=gte_out(3);
gt_gtrefclk(4)<=gte_out(3);
gt_gtrefclk(5)<=gte_out(5);
--bank 119
gt_gtrefclk(6)<=gte_out(5);
--banks 213,214,215
gt_gtrefclk(7)<=gte_out(7);
gt_gtrefclk(8)<=gte_out(7);
gt_gtrefclk(9)<=gte_out(10);
--banks 216,217,218
gt_gtrefclk(10)<=gte_out(10);
gt_gtrefclk(11)<=gte_out(10);
gt_gtrefclk(12)<=gte_out(12);
--bank 219
gt_gtrefclk(13)<=gte_out(12);


--assign the ref_clks (virtex7 690)
--
--gt_gtrefclk(0)<=
--gt_gtrefclk(1)<=
--gt_gtrefclk(2)<=
--
--gt_gtrefclk(3)<=
--gt_gtrefclk(4)<=
--gt_gtrefclk(5)<=
--
--gt_gtrefclk(6)<=
--gt_gtrefclk(7)<=
--gt_gtrefclk(8)<=
--
--gt_gtrefclk(9)<=
--
--gt_gtrefclk(10)<=
--gt_gtrefclk(11)<=
--gt_gtrefclk(12)<=
--
--gt_gtrefclk(13)<=
--gt_gtrefclk(14)<=
--gt_gtrefclk(15)<=
--
--gt_gtrefclk(16)<=
--gt_gtrefclk(17)<=
--gt_gtrefclk(18)<=
--
--gt_gtrefclk(19)<=


--GEN FSMS  

-- Startup_fsms are required to get the MGT's ready.                                                    
Quad_Control_GEN:                                                        
for I in 0 to NumberOfQuads-1 generate                                 

    gt_qpllpd(I) 		 <= not QuadControl(I)(0);--converting power up to power down
    gt_qpll_power_up(I)  <=     QuadControl(I)(0);     
	--gt_qpllpd(I) 		 <='0';
end generate Quad_Control_GEN;

												

DATA_ROUTING_GEN:                                                        
for I in 0 to NumberOfMgts-1 generate  
    GtRxDataOut(I)  	<=		gt_rxdata(I); 								 
    gt_txdata(I)		<=		GtTxDataIn(I);  
end generate DATA_ROUTING_GEN;
										

ChannelControl_GEN:
for I in 0 to NumberOfMgts-1 generate
    gt_loopback(I)     	<=  ChannelControl(I)(2 downto 0);
    gt_txprecursor(I)  	<=  ChannelControl(I)(7 downto 3);
    gt_txpostcursor(I) 	<=  ChannelControl(I)(12 downto 8);
    gt_txdiffctrl(I)   	<=  ChannelControl(I)(16 downto 13);
	gt_rx_power_up(I)			<=	ChannelControl(I)(17);
	gt_tx_power_up(I)			<=	ChannelControl(I)(18);

	--power_up is basically not power_down

	gt_rxpd(I)<=  "11" when gt_rx_power_up(I)='0' else "00";
    gt_txpd(I)<=  "11" when gt_tx_power_up(I)='0' else "00";	
	

	
end generate ChannelControl_GEN;



CharIsK_GEN:
for I in 0 to NumberOfMgts-1 generate
    CharIsKOut(I)(3 downto 0)      <=  gt_rxcharisk(I);
    gt_txcharisk(I)                <= CharIsKIn(I)(3 downto 0);
end generate CharIsK_GEN;

usr_clk<=UsrClkIn;
usr_clk2<=UsrClk2In;


end Behavioral;																				
