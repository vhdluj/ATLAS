----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andreas Reiﬂ (areiss@students.uni-mainz.de)
-- 
-- Create Date: 23.04.2014 15:08:07
-- Design Name: 
-- Module Name: GTH_Buffered - Behavioral
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

use work.L1TopoGTConfiguration.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity GTH_Buffered_32 is
	Generic(
	EXAMPLE_SIM_GTRESET_SPEEDUP  : string    := "FALSE";     -- simulation setting for GT SecureIP model
	SYSCLKPeriod: integer:=25--appoximate clock period in ns
	);
    Port 
	(
	gt0_gthrxn_in,gt0_gthrxp_in: in std_logic;
	gt1_gthrxn_in,gt1_gthrxp_in: in std_logic;
	gt2_gthrxn_in,gt2_gthrxp_in: in std_logic;
	gt3_gthrxn_in,gt3_gthrxp_in: in std_logic;
	
	gt0_gthtxn_out,gt0_gthtxp_out: out std_logic;
	gt1_gthtxn_out,gt1_gthtxp_out: out std_logic;
	gt2_gthtxn_out,gt2_gthtxp_out: out std_logic;
	gt3_gthtxn_out,gt3_gthtxp_out: out std_logic;
	
	QuadControl,ChannelControl0,ChannelControl1,ChannelControl2,ChannelControl3 : in  std_logic_vector(32 - 1 downto 0);
	ChannelStatus0,ChannelStatus1,ChannelStatus2,ChannelStatus3 : out  std_logic_vector(32 - 1 downto 0);
	
	gt0_rxdata_out,gt1_rxdata_out,gt2_rxdata_out,gt3_rxdata_out: out std_logic_vector(15 downto 0);
	gt0_rxcharisk_out,gt1_rxcharisk_out,gt2_rxcharisk_out,gt3_rxcharisk_out: out std_logic_vector(1 downto 0);
	gt0_rxchariscomma_out,gt1_rxchariscomma_out,gt2_rxchariscomma_out,gt3_rxchariscomma_out: out std_logic_vector(1 downto 0);
	
	gt0_txdata_in,gt1_txdata_in,gt2_txdata_in,gt3_txdata_in: in std_logic_vector(15 downto 0);
	gt0_txcharisk_in,gt1_txcharisk_in,gt2_txcharisk_in,gt3_txcharisk_in: in std_logic_vector(1 downto 0);
	
	MGTRefClk: in std_logic;
	
	UsrClkIn,UsrClk2In,SYSCLK40 : in std_logic--;
	
	-- gt0_txoutclk_out,gt1_txoutclk_out,gt2_txoutclk_out,gt3_txoutclk_out : out std_logic
	);
end GTH_Buffered_32;

architecture Behavioral of GTH_Buffered_32 is
	signal probe_out0: std_logic_vector(3 downto 0);
	
	signal  GT0_QPLLPD_IN,gt0_qpllreset_i,gt0_qpllreset_t,commonreset_i :   std_logic;
	
	signal  tied_to_ground_i                : std_logic;
    signal  tied_to_ground_vec_i            : std_logic_vector(63 downto 0);
    signal  tied_to_vcc_i                   : std_logic;
    signal  tied_to_vcc_vec_i               : std_logic_vector(7 downto 0);

	signal gt0_rx_power_up,gt0_tx_power_up : std_logic;
	signal gt1_rx_power_up,gt1_tx_power_up : std_logic;
	signal gt2_rx_power_up,gt2_tx_power_up : std_logic;
	signal gt3_rx_power_up,gt3_tx_power_up : std_logic;

	signal SYSCLK_IN                               : std_logic;
	signal SOFT_RESET_IN                           : std_logic;
	signal DONT_RESET_ON_DATA_ERROR_IN             : std_logic;
	signal GT0_TX_FSM_RESET_DONE_OUT               : std_logic;
	signal GT0_RX_FSM_RESET_DONE_OUT               : std_logic;
	signal GT0_DATA_VALID_IN                       : std_logic;
	signal GT1_TX_FSM_RESET_DONE_OUT               : std_logic;
	signal GT1_RX_FSM_RESET_DONE_OUT               : std_logic;
	signal GT1_DATA_VALID_IN                       : std_logic;
	signal GT2_TX_FSM_RESET_DONE_OUT               : std_logic;
	signal GT2_RX_FSM_RESET_DONE_OUT               : std_logic;
	signal GT2_DATA_VALID_IN                       : std_logic;
	signal GT3_TX_FSM_RESET_DONE_OUT               : std_logic;
	signal GT3_RX_FSM_RESET_DONE_OUT               : std_logic;
	signal GT3_DATA_VALID_IN                       : std_logic;
	--_________________________________________________________________________
	--GT0  (X0Y0)
	--____________________________CHANNEL PORTS________________________________
	---------------------------- Channel - DRP Ports  --------------------------
	signal gt0_drpaddr_in                          : std_logic_vector(8 downto 0);
	signal gt0_drpclk_in                           : std_logic;
	signal gt0_drpdi_in                            : std_logic_vector(15 downto 0);
	signal gt0_drpdo_out                           : std_logic_vector(15 downto 0);
	signal gt0_drpen_in                            : std_logic;
	signal gt0_drprdy_out                          : std_logic;
	signal gt0_drpwe_in                            : std_logic;
	------------------------------- Loopback Ports -----------------------------
	signal gt0_loopback_in                         : std_logic_vector(2 downto 0);
	------------------------------ Power-Down Ports ----------------------------
	signal gt0_rxpd_in                             : std_logic_vector(1 downto 0);
	signal gt0_txpd_in                             : std_logic_vector(1 downto 0);
	--------------------- RX Initialization and Reset Ports --------------------
	signal gt0_eyescanreset_in                     : std_logic;
	signal gt0_rxuserrdy_in                        : std_logic;
	-------------------------- RX Margin Analysis Ports ------------------------
	signal gt0_eyescandataerror_out                : std_logic;
	signal gt0_eyescantrigger_in                   : std_logic;
	------------------- Receive Ports - Digital Monitor Ports ------------------
	signal gt0_dmonitorout_out                     : std_logic_vector(14 downto 0);
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	signal gt0_rxusrclk_in                         : std_logic;
	signal gt0_rxusrclk2_in                        : std_logic;
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	-- signal gt0_rxdata_out                          : std_logic_vector(15 downto 0);
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	signal gt0_rxdisperr_out                       : std_logic_vector(1 downto 0);
	signal gt0_rxnotintable_out                    : std_logic_vector(1 downto 0);
	------------------------ Receive Ports - RX AFE Ports ----------------------
	-- signal gt0_gthrxn_in                           : std_logic;
    ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    signal gt0_rxbufreset_in                       : std_logic;
    signal gt0_rxbufstatus_out                     : std_logic_vector(2 downto 0);
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	signal gt0_rxmcommaalignen_in                  : std_logic;
	signal gt0_rxpcommaalignen_in                  : std_logic;
	--------------------- Receive Ports - RX Equalizer Ports -------------------
	signal gt0_rxmonitorout_out                    : std_logic_vector(6 downto 0);
	signal gt0_rxmonitorsel_in                     : std_logic_vector(1 downto 0);
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	signal gt0_rxoutclk_out                        : std_logic;
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	signal gt0_gtrxreset_in                        : std_logic;
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	-- signal gt0_rxchariscomma_out                   : std_logic_vector(1 downto 0);
	-- signal gt0_rxcharisk_out                       : std_logic_vector(1 downto 0);
	------------------------ Receive Ports -RX AFE Ports -----------------------
	-- signal gt0_gthrxp_in                           : std_logic;
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	signal gt0_rxresetdone_out                     : std_logic;
	------------------------ TX Configurable Driver Ports ----------------------
	signal gt0_txpostcursor_in                     : std_logic_vector(4 downto 0);
	signal gt0_txprecursor_in                      : std_logic_vector(4 downto 0);
	--------------------- TX Initialization and Reset Ports --------------------
	signal gt0_gttxreset_in                        : std_logic;
	signal gt0_txuserrdy_in                        : std_logic;
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	signal gt0_txusrclk_in                         : std_logic;
	signal gt0_txusrclk2_in                        : std_logic;
    ---------------------- Transmit Ports - TX Buffer Ports --------------------
    signal gt0_txbufstatus_out                     : std_logic_vector(1 downto 0);
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	signal gt0_txdiffctrl_in                       : std_logic_vector(3 downto 0);
	------------------ Transmit Ports - TX Data Path interface -----------------
	-- signal gt0_txdata_in                           : std_logic_vector(15 downto 0);
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	-- signal gt0_gthtxn_out                          : std_logic;
	-- signal gt0_gthtxp_out                          : std_logic;
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	signal gt0_txoutclk_out                        : std_logic;
	signal gt0_txoutclkfabric_out                  : std_logic;
	signal gt0_txoutclkpcs_out                     : std_logic;
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	signal gt0_txresetdone_out                     : std_logic;
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	-- signal gt0_txcharisk_in                        : std_logic_vector(1 downto 0);
	--GT1  (X0Y1)
	--____________________________CHANNEL PORTS________________________________
	---------------------------- Channel - DRP Ports  --------------------------
	signal gt1_drpaddr_in                          : std_logic_vector(8 downto 0);
	signal gt1_drpclk_in                           : std_logic;
	signal gt1_drpdi_in                            : std_logic_vector(15 downto 0);
	signal gt1_drpdo_out                           : std_logic_vector(15 downto 0);
	signal gt1_drpen_in                            : std_logic;
	signal gt1_drprdy_out                          : std_logic;
	signal gt1_drpwe_in                            : std_logic;
	------------------------------- Loopback Ports -----------------------------
	signal gt1_loopback_in                         : std_logic_vector(2 downto 0);
	------------------------------ Power-Down Ports ----------------------------
	signal gt1_rxpd_in                             : std_logic_vector(1 downto 0);
	signal gt1_txpd_in                             : std_logic_vector(1 downto 0);
	--------------------- RX Initialization and Reset Ports --------------------
	signal gt1_eyescanreset_in                     : std_logic;
	signal gt1_rxuserrdy_in                        : std_logic;
	-------------------------- RX Margin Analysis Ports ------------------------
	signal gt1_eyescandataerror_out                : std_logic;
	signal gt1_eyescantrigger_in                   : std_logic;
	------------------- Receive Ports - Digital Monitor Ports ------------------
	signal gt1_dmonitorout_out                     : std_logic_vector(14 downto 0);
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	signal gt1_rxusrclk_in                         : std_logic;
	signal gt1_rxusrclk2_in                        : std_logic;
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	-- signal gt1_rxdata_out                          : std_logic_vector(15 downto 0);
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	signal gt1_rxdisperr_out                       : std_logic_vector(1 downto 0);
	signal gt1_rxnotintable_out                    : std_logic_vector(1 downto 0);
	------------------------ Receive Ports - RX AFE Ports ----------------------
	-- signal gt1_gthrxn_in                           : std_logic;
    ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    signal gt1_rxbufreset_in                       : std_logic;
    signal gt1_rxbufstatus_out                     : std_logic_vector(2 downto 0);
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	signal gt1_rxmcommaalignen_in                  : std_logic;
	signal gt1_rxpcommaalignen_in                  : std_logic;
	--------------------- Receive Ports - RX Equalizer Ports -------------------
	signal gt1_rxmonitorout_out                    : std_logic_vector(6 downto 0);
	signal gt1_rxmonitorsel_in                     : std_logic_vector(1 downto 0);
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	signal gt1_rxoutclk_out                        : std_logic;
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	signal gt1_gtrxreset_in                        : std_logic;
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	-- signal gt1_rxchariscomma_out                   : std_logic_vector(1 downto 0);
	-- signal gt1_rxcharisk_out                       : std_logic_vector(1 downto 0);
	------------------------ Receive Ports -RX AFE Ports -----------------------
	-- signal gt1_gthrxp_in                           : std_logic;
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	signal gt1_rxresetdone_out                     : std_logic;
	------------------------ TX Configurable Driver Ports ----------------------
	signal gt1_txpostcursor_in                     : std_logic_vector(4 downto 0);
	signal gt1_txprecursor_in                      : std_logic_vector(4 downto 0);
	--------------------- TX Initialization and Reset Ports --------------------
	signal gt1_gttxreset_in                        : std_logic;
	signal gt1_txuserrdy_in                        : std_logic;
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	signal gt1_txusrclk_in                         : std_logic;
	signal gt1_txusrclk2_in                        : std_logic;
    ---------------------- Transmit Ports - TX Buffer Ports --------------------
    signal gt1_txbufstatus_out                     : std_logic_vector(1 downto 0);
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	signal gt1_txdiffctrl_in                       : std_logic_vector(3 downto 0);
	------------------ Transmit Ports - TX Data Path interface -----------------
	-- signal gt1_txdata_in                           : std_logic_vector(15 downto 0);
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	-- signal gt1_gthtxn_out                          : std_logic;
	-- signal gt1_gthtxp_out                          : std_logic;
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	signal gt1_txoutclk_out                        : std_logic;
	signal gt1_txoutclkfabric_out                  : std_logic;
	signal gt1_txoutclkpcs_out                     : std_logic;
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	signal gt1_txresetdone_out                     : std_logic;
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	-- signal gt1_txcharisk_in                        : std_logic_vector(1 downto 0);
	--GT2  (X0Y2)
	--____________________________CHANNEL PORTS________________________________
	---------------------------- Channel - DRP Ports  --------------------------
	signal gt2_drpaddr_in                          : std_logic_vector(8 downto 0);
	signal gt2_drpclk_in                           : std_logic;
	signal gt2_drpdi_in                            : std_logic_vector(15 downto 0);
	signal gt2_drpdo_out                           : std_logic_vector(15 downto 0);
	signal gt2_drpen_in                            : std_logic;
	signal gt2_drprdy_out                          : std_logic;
	signal gt2_drpwe_in                            : std_logic;
	------------------------------- Loopback Ports -----------------------------
	signal gt2_loopback_in                         : std_logic_vector(2 downto 0);
	------------------------------ Power-Down Ports ----------------------------
	signal gt2_rxpd_in                             : std_logic_vector(1 downto 0);
	signal gt2_txpd_in                             : std_logic_vector(1 downto 0);
	--------------------- RX Initialization and Reset Ports --------------------
	signal gt2_eyescanreset_in                     : std_logic;
	signal gt2_rxuserrdy_in                        : std_logic;
	-------------------------- RX Margin Analysis Ports ------------------------
	signal gt2_eyescandataerror_out                : std_logic;
	signal gt2_eyescantrigger_in                   : std_logic;
	------------------- Receive Ports - Digital Monitor Ports ------------------
	signal gt2_dmonitorout_out                     : std_logic_vector(14 downto 0);
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	signal gt2_rxusrclk_in                         : std_logic;
	signal gt2_rxusrclk2_in                        : std_logic;
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	-- signal gt2_rxdata_out                          : std_logic_vector(15 downto 0);
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	signal gt2_rxdisperr_out                       : std_logic_vector(1 downto 0);
	signal gt2_rxnotintable_out                    : std_logic_vector(1 downto 0);
	------------------------ Receive Ports - RX AFE Ports ----------------------
	-- signal gt2_gthrxn_in                           : std_logic;
    ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    signal gt2_rxbufreset_in                       : std_logic;
    signal gt2_rxbufstatus_out                     : std_logic_vector(2 downto 0);
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	signal gt2_rxmcommaalignen_in                  : std_logic;
	signal gt2_rxpcommaalignen_in                  : std_logic;
	--------------------- Receive Ports - RX Equalizer Ports -------------------
	signal gt2_rxmonitorout_out                    : std_logic_vector(6 downto 0);
	signal gt2_rxmonitorsel_in                     : std_logic_vector(1 downto 0);
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	signal gt2_rxoutclk_out                        : std_logic;
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	signal gt2_gtrxreset_in                        : std_logic;
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	-- signal gt2_rxchariscomma_out                   : std_logic_vector(1 downto 0);
	-- signal gt2_rxcharisk_out                       : std_logic_vector(1 downto 0);
	------------------------ Receive Ports -RX AFE Ports -----------------------
	-- signal gt2_gthrxp_in                           : std_logic;
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	signal gt2_rxresetdone_out                     : std_logic;
	------------------------ TX Configurable Driver Ports ----------------------
	signal gt2_txpostcursor_in                     : std_logic_vector(4 downto 0);
	signal gt2_txprecursor_in                      : std_logic_vector(4 downto 0);
	--------------------- TX Initialization and Reset Ports --------------------
	signal gt2_gttxreset_in                        : std_logic;
	signal gt2_txuserrdy_in                        : std_logic;
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	signal gt2_txusrclk_in                         : std_logic;
	signal gt2_txusrclk2_in                        : std_logic;
    ---------------------- Transmit Ports - TX Buffer Ports --------------------
    signal gt2_txbufstatus_out                     : std_logic_vector(1 downto 0);
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	signal gt2_txdiffctrl_in                       : std_logic_vector(3 downto 0);
	------------------ Transmit Ports - TX Data Path interface -----------------
	-- signal gt2_txdata_in                           : std_logic_vector(15 downto 0);
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	-- signal gt2_gthtxn_out                          : std_logic;
	-- signal gt2_gthtxp_out                          : std_logic;
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	signal gt2_txoutclk_out                        : std_logic;
	signal gt2_txoutclkfabric_out                  : std_logic;
	signal gt2_txoutclkpcs_out                     : std_logic;
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	signal gt2_txresetdone_out                     : std_logic;
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	-- signal gt2_txcharisk_in                        : std_logic_vector(1 downto 0);
	--GT3  (X0Y3)
	--____________________________CHANNEL PORTS________________________________
	---------------------------- Channel - DRP Ports  --------------------------
	signal gt3_drpaddr_in                          : std_logic_vector(8 downto 0);
	signal gt3_drpclk_in                           : std_logic;
	signal gt3_drpdi_in                            : std_logic_vector(15 downto 0);
	signal gt3_drpdo_out                           : std_logic_vector(15 downto 0);
	signal gt3_drpen_in                            : std_logic;
	signal gt3_drprdy_out                          : std_logic;
	signal gt3_drpwe_in                            : std_logic;
	------------------------------- Loopback Ports -----------------------------
	signal gt3_loopback_in                         : std_logic_vector(2 downto 0);
	------------------------------ Power-Down Ports ----------------------------
	signal gt3_rxpd_in                             : std_logic_vector(1 downto 0);
	signal gt3_txpd_in                             : std_logic_vector(1 downto 0);
	--------------------- RX Initialization and Reset Ports --------------------
	signal gt3_eyescanreset_in                     : std_logic;
	signal gt3_rxuserrdy_in                        : std_logic;
	-------------------------- RX Margin Analysis Ports ------------------------
	signal gt3_eyescandataerror_out                : std_logic;
	signal gt3_eyescantrigger_in                   : std_logic;
	------------------- Receive Ports - Digital Monitor Ports ------------------
	signal gt3_dmonitorout_out                     : std_logic_vector(14 downto 0);
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	signal gt3_rxusrclk_in                         : std_logic;
	signal gt3_rxusrclk2_in                        : std_logic;
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	-- signal gt3_rxdata_out                          : std_logic_vector(15 downto 0);
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	signal gt3_rxdisperr_out                       : std_logic_vector(1 downto 0);
	signal gt3_rxnotintable_out                    : std_logic_vector(1 downto 0);
	------------------------ Receive Ports - RX AFE Ports ----------------------
	-- signal gt3_gthrxn_in                           : std_logic;
    ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    signal gt3_rxbufreset_in                       : std_logic;
    signal gt3_rxbufstatus_out                     : std_logic_vector(2 downto 0);
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	signal gt3_rxmcommaalignen_in                  : std_logic;
	signal gt3_rxpcommaalignen_in                  : std_logic;
	--------------------- Receive Ports - RX Equalizer Ports -------------------
	signal gt3_rxmonitorout_out                    : std_logic_vector(6 downto 0);
	signal gt3_rxmonitorsel_in                     : std_logic_vector(1 downto 0);
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	signal gt3_rxoutclk_out                        : std_logic;
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	signal gt3_gtrxreset_in                        : std_logic;
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	-- signal gt3_rxchariscomma_out                   : std_logic_vector(1 downto 0);
	-- signal gt3_rxcharisk_out                       : std_logic_vector(1 downto 0);
	------------------------ Receive Ports -RX AFE Ports -----------------------
	-- signal gt3_gthrxp_in                           : std_logic;
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	signal gt3_rxresetdone_out                     : std_logic;
	------------------------ TX Configurable Driver Ports ----------------------
	signal gt3_txpostcursor_in                     : std_logic_vector(4 downto 0);
	signal gt3_txprecursor_in                      : std_logic_vector(4 downto 0);
	--------------------- TX Initialization and Reset Ports --------------------
	signal gt3_gttxreset_in                        : std_logic;
	signal gt3_txuserrdy_in                        : std_logic;
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	signal gt3_txusrclk_in                         : std_logic;
	signal gt3_txusrclk2_in                        : std_logic;
    ---------------------- Transmit Ports - TX Buffer Ports --------------------
    signal gt3_txbufstatus_out                     : std_logic_vector(1 downto 0);
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	signal gt3_txdiffctrl_in                       : std_logic_vector(3 downto 0);
	------------------ Transmit Ports - TX Data Path interface -----------------
	-- signal gt3_txdata_in                           : std_logic_vector(15 downto 0);
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	-- signal gt3_gthtxn_out                          : std_logic;
	-- signal gt3_gthtxp_out                          : std_logic;
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	signal gt3_txoutclk_out                        : std_logic;
	signal gt3_txoutclkfabric_out                  : std_logic;
	signal gt3_txoutclkpcs_out                     : std_logic;
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	signal gt3_txresetdone_out                     : std_logic;
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	-- signal gt3_txcharisk_in                        : std_logic_vector(1 downto 0);
	--____________________________COMMON PORTS________________________________
	signal GT0_QPLLLOCK_IN : std_logic;
	signal GT0_QPLLREFCLKLOST_IN  : std_logic;
	signal GT0_QPLLRESET_OUT  : std_logic;
	signal GT0_QPLLOUTCLK_IN  : std_logic;
	signal GT0_QPLLOUTREFCLK_IN : std_logic;

	component gtwizard_32 
	port
	(
		SYSCLK_IN                               : in   std_logic;
		SOFT_RESET_IN                           : in   std_logic;
		DONT_RESET_ON_DATA_ERROR_IN             : in   std_logic;
		GT0_TX_FSM_RESET_DONE_OUT               : out  std_logic;
		GT0_RX_FSM_RESET_DONE_OUT               : out  std_logic;
		GT0_DATA_VALID_IN                       : in   std_logic;
		GT1_TX_FSM_RESET_DONE_OUT               : out  std_logic;
		GT1_RX_FSM_RESET_DONE_OUT               : out  std_logic;
		GT1_DATA_VALID_IN                       : in   std_logic;
		GT2_TX_FSM_RESET_DONE_OUT               : out  std_logic;
		GT2_RX_FSM_RESET_DONE_OUT               : out  std_logic;
		GT2_DATA_VALID_IN                       : in   std_logic;
		GT3_TX_FSM_RESET_DONE_OUT               : out  std_logic;
		GT3_RX_FSM_RESET_DONE_OUT               : out  std_logic;
		GT3_DATA_VALID_IN                       : in   std_logic;

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
		gt0_eyescanreset_in                     : in   std_logic;
		gt0_rxuserrdy_in                        : in   std_logic;
		-------------------------- RX Margin Analysis Ports ------------------------
		gt0_eyescandataerror_out                : out  std_logic;
		gt0_eyescantrigger_in                   : in   std_logic;
		------------------- Receive Ports - Digital Monitor Ports ------------------
		gt0_dmonitorout_out                     : out  std_logic_vector(14 downto 0);
		------------------ Receive Ports - FPGA RX Interface Ports -----------------
		gt0_rxusrclk_in                         : in   std_logic;
		gt0_rxusrclk2_in                        : in   std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		gt0_rxdata_out                          : out  std_logic_vector(15 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		gt0_rxdisperr_out                       : out  std_logic_vector(1 downto 0);
		gt0_rxnotintable_out                    : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		gt0_gthrxn_in                           : in   std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		gt0_rxbufreset_in                       : in   std_logic;
		gt0_rxbufstatus_out                     : out  std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		gt0_rxmcommaalignen_in                  : in   std_logic;
		gt0_rxpcommaalignen_in                  : in   std_logic;
		--------------------- Receive Ports - RX Equalizer Ports -------------------
		gt0_rxmonitorout_out                    : out  std_logic_vector(6 downto 0);
		gt0_rxmonitorsel_in                     : in   std_logic_vector(1 downto 0);
		--------------- Receive Ports - RX Fabric Output Control Ports -------------
		gt0_rxoutclk_out                        : out  std_logic;
		------------- Receive Ports - RX Initialization and Reset Ports ------------
		gt0_gtrxreset_in                        : in   std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		gt0_rxchariscomma_out                   : out  std_logic_vector(1 downto 0);
		gt0_rxcharisk_out                       : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		gt0_gthrxp_in                           : in   std_logic;
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
		---------------------- Transmit Ports - TX Buffer Ports --------------------
		gt0_txbufstatus_out                     : out  std_logic_vector(1 downto 0);
		--------------- Transmit Ports - TX Configurable Driver Ports --------------
		gt0_txdiffctrl_in                       : in   std_logic_vector(3 downto 0);
		------------------ Transmit Ports - TX Data Path interface -----------------
		gt0_txdata_in                           : in   std_logic_vector(15 downto 0);
		---------------- Transmit Ports - TX Driver and OOB signaling --------------
		gt0_gthtxn_out                          : out  std_logic;
		gt0_gthtxp_out                          : out  std_logic;
		----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
		gt0_txoutclk_out                        : out  std_logic;
		gt0_txoutclkfabric_out                  : out  std_logic;
		gt0_txoutclkpcs_out                     : out  std_logic;
		------------- Transmit Ports - TX Initialization and Reset Ports -----------
		gt0_txresetdone_out                     : out  std_logic;
		----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
		gt0_txcharisk_in                        : in   std_logic_vector(1 downto 0);

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
		gt1_eyescanreset_in                     : in   std_logic;
		gt1_rxuserrdy_in                        : in   std_logic;
		-------------------------- RX Margin Analysis Ports ------------------------
		gt1_eyescandataerror_out                : out  std_logic;
		gt1_eyescantrigger_in                   : in   std_logic;
		------------------- Receive Ports - Digital Monitor Ports ------------------
		gt1_dmonitorout_out                     : out  std_logic_vector(14 downto 0);
		------------------ Receive Ports - FPGA RX Interface Ports -----------------
		gt1_rxusrclk_in                         : in   std_logic;
		gt1_rxusrclk2_in                        : in   std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		gt1_rxdata_out                          : out  std_logic_vector(15 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		gt1_rxdisperr_out                       : out  std_logic_vector(1 downto 0);
		gt1_rxnotintable_out                    : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		gt1_gthrxn_in                           : in   std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		gt1_rxbufreset_in                       : in   std_logic;
		gt1_rxbufstatus_out                     : out  std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		gt1_rxmcommaalignen_in                  : in   std_logic;
		gt1_rxpcommaalignen_in                  : in   std_logic;
		--------------------- Receive Ports - RX Equalizer Ports -------------------
		gt1_rxmonitorout_out                    : out  std_logic_vector(6 downto 0);
		gt1_rxmonitorsel_in                     : in   std_logic_vector(1 downto 0);
		--------------- Receive Ports - RX Fabric Output Control Ports -------------
		gt1_rxoutclk_out                        : out  std_logic;
		------------- Receive Ports - RX Initialization and Reset Ports ------------
		gt1_gtrxreset_in                        : in   std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		gt1_rxchariscomma_out                   : out  std_logic_vector(1 downto 0);
		gt1_rxcharisk_out                       : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		gt1_gthrxp_in                           : in   std_logic;
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
		---------------------- Transmit Ports - TX Buffer Ports --------------------
		gt1_txbufstatus_out                     : out  std_logic_vector(1 downto 0);
		--------------- Transmit Ports - TX Configurable Driver Ports --------------
		gt1_txdiffctrl_in                       : in   std_logic_vector(3 downto 0);
		------------------ Transmit Ports - TX Data Path interface -----------------
		gt1_txdata_in                           : in   std_logic_vector(15 downto 0);
		---------------- Transmit Ports - TX Driver and OOB signaling --------------
		gt1_gthtxn_out                          : out  std_logic;
		gt1_gthtxp_out                          : out  std_logic;
		----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
		gt1_txoutclk_out                        : out  std_logic;
		gt1_txoutclkfabric_out                  : out  std_logic;
		gt1_txoutclkpcs_out                     : out  std_logic;
		------------- Transmit Ports - TX Initialization and Reset Ports -----------
		gt1_txresetdone_out                     : out  std_logic;
		----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
		gt1_txcharisk_in                        : in   std_logic_vector(1 downto 0);

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
		gt2_eyescanreset_in                     : in   std_logic;
		gt2_rxuserrdy_in                        : in   std_logic;
		-------------------------- RX Margin Analysis Ports ------------------------
		gt2_eyescandataerror_out                : out  std_logic;
		gt2_eyescantrigger_in                   : in   std_logic;
		------------------- Receive Ports - Digital Monitor Ports ------------------
		gt2_dmonitorout_out                     : out  std_logic_vector(14 downto 0);
		------------------ Receive Ports - FPGA RX Interface Ports -----------------
		gt2_rxusrclk_in                         : in   std_logic;
		gt2_rxusrclk2_in                        : in   std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		gt2_rxdata_out                          : out  std_logic_vector(15 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		gt2_rxdisperr_out                       : out  std_logic_vector(1 downto 0);
		gt2_rxnotintable_out                    : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		gt2_gthrxn_in                           : in   std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		gt2_rxbufreset_in                       : in   std_logic;
		gt2_rxbufstatus_out                     : out  std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		gt2_rxmcommaalignen_in                  : in   std_logic;
		gt2_rxpcommaalignen_in                  : in   std_logic;
		--------------------- Receive Ports - RX Equalizer Ports -------------------
		gt2_rxmonitorout_out                    : out  std_logic_vector(6 downto 0);
		gt2_rxmonitorsel_in                     : in   std_logic_vector(1 downto 0);
		--------------- Receive Ports - RX Fabric Output Control Ports -------------
		gt2_rxoutclk_out                        : out  std_logic;
		------------- Receive Ports - RX Initialization and Reset Ports ------------
		gt2_gtrxreset_in                        : in   std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		gt2_rxchariscomma_out                   : out  std_logic_vector(1 downto 0);
		gt2_rxcharisk_out                       : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		gt2_gthrxp_in                           : in   std_logic;
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
		---------------------- Transmit Ports - TX Buffer Ports --------------------
		gt2_txbufstatus_out                     : out  std_logic_vector(1 downto 0);
		--------------- Transmit Ports - TX Configurable Driver Ports --------------
		gt2_txdiffctrl_in                       : in   std_logic_vector(3 downto 0);
		------------------ Transmit Ports - TX Data Path interface -----------------
		gt2_txdata_in                           : in   std_logic_vector(15 downto 0);
		---------------- Transmit Ports - TX Driver and OOB signaling --------------
		gt2_gthtxn_out                          : out  std_logic;
		gt2_gthtxp_out                          : out  std_logic;
		----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
		gt2_txoutclk_out                        : out  std_logic;
		gt2_txoutclkfabric_out                  : out  std_logic;
		gt2_txoutclkpcs_out                     : out  std_logic;
		------------- Transmit Ports - TX Initialization and Reset Ports -----------
		gt2_txresetdone_out                     : out  std_logic;
		----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
		gt2_txcharisk_in                        : in   std_logic_vector(1 downto 0);

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
		gt3_eyescanreset_in                     : in   std_logic;
		gt3_rxuserrdy_in                        : in   std_logic;
		-------------------------- RX Margin Analysis Ports ------------------------
		gt3_eyescandataerror_out                : out  std_logic;
		gt3_eyescantrigger_in                   : in   std_logic;
		------------------- Receive Ports - Digital Monitor Ports ------------------
		gt3_dmonitorout_out                     : out  std_logic_vector(14 downto 0);
		------------------ Receive Ports - FPGA RX Interface Ports -----------------
		gt3_rxusrclk_in                         : in   std_logic;
		gt3_rxusrclk2_in                        : in   std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		gt3_rxdata_out                          : out  std_logic_vector(15 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		gt3_rxdisperr_out                       : out  std_logic_vector(1 downto 0);
		gt3_rxnotintable_out                    : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		gt3_gthrxn_in                           : in   std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		gt3_rxbufreset_in                       : in   std_logic;
		gt3_rxbufstatus_out                     : out  std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		gt3_rxmcommaalignen_in                  : in   std_logic;
		gt3_rxpcommaalignen_in                  : in   std_logic;
		--------------------- Receive Ports - RX Equalizer Ports -------------------
		gt3_rxmonitorout_out                    : out  std_logic_vector(6 downto 0);
		gt3_rxmonitorsel_in                     : in   std_logic_vector(1 downto 0);
		--------------- Receive Ports - RX Fabric Output Control Ports -------------
		gt3_rxoutclk_out                        : out  std_logic;
		------------- Receive Ports - RX Initialization and Reset Ports ------------
		gt3_gtrxreset_in                        : in   std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		gt3_rxchariscomma_out                   : out  std_logic_vector(1 downto 0);
		gt3_rxcharisk_out                       : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		gt3_gthrxp_in                           : in   std_logic;
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
		---------------------- Transmit Ports - TX Buffer Ports --------------------
		gt3_txbufstatus_out                     : out  std_logic_vector(1 downto 0);
		--------------- Transmit Ports - TX Configurable Driver Ports --------------
		gt3_txdiffctrl_in                       : in   std_logic_vector(3 downto 0);
		------------------ Transmit Ports - TX Data Path interface -----------------
		gt3_txdata_in                           : in   std_logic_vector(15 downto 0);
		---------------- Transmit Ports - TX Driver and OOB signaling --------------
		gt3_gthtxn_out                          : out  std_logic;
		gt3_gthtxp_out                          : out  std_logic;
		----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
		gt3_txoutclk_out                        : out  std_logic;
		gt3_txoutclkfabric_out                  : out  std_logic;
		gt3_txoutclkpcs_out                     : out  std_logic;
		------------- Transmit Ports - TX Initialization and Reset Ports -----------
		gt3_txresetdone_out                     : out  std_logic;
		----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
		gt3_txcharisk_in                        : in   std_logic_vector(1 downto 0);


		--____________________________COMMON PORTS________________________________
		GT0_QPLLLOCK_IN : in std_logic;
		GT0_QPLLREFCLKLOST_IN  : in std_logic;
		GT0_QPLLRESET_OUT  : out std_logic;
		 GT0_QPLLOUTCLK_IN  : in std_logic;
		 GT0_QPLLOUTREFCLK_IN : in std_logic

	);
	end component;
	ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	ATTRIBUTE SYN_BLACK_BOX OF gtwizard_32 : COMPONENT IS TRUE;
	ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
	ATTRIBUTE BLACK_BOX_PAD_PIN OF gtwizard_32 : COMPONENT IS "SYSCLK_IN,SOFT_RESET_IN,DONT_RESET_ON_DATA_ERROR_IN,GT0_TX_FSM_RESET_DONE_OUT,GT0_RX_FSM_RESET_DONE_OUT,GT0_DATA_VALID_IN,GT1_TX_FSM_RESET_DONE_OUT,GT1_RX_FSM_RESET_DONE_OUT,GT1_DATA_VALID_IN,GT2_TX_FSM_RESET_DONE_OUT,GT2_RX_FSM_RESET_DONE_OUT,GT2_DATA_VALID_IN,GT3_TX_FSM_RESET_DONE_OUT,GT3_RX_FSM_RESET_DONE_OUT,GT3_DATA_VALID_IN,gt0_drpaddr_in,gt0_drpclk_in,gt0_drpdi_in,gt0_drpdo_out,gt0_drpen_in,gt0_drprdy_out,gt0_drpwe_in,gt0_loopback_in,gt0_rxpd_in,gt0_txpd_in,gt0_eyescanreset_in,gt0_rxuserrdy_in,gt0_eyescandataerror_out,gt0_eyescantrigger_in,gt0_dmonitorout_out,gt0_rxusrclk_in,gt0_rxusrclk2_in,gt0_rxdata_out,gt0_rxdisperr_out,gt0_rxnotintable_out,gt0_gthrxn_in,gt0_rxbufreset_in,gt0_rxbufstatus_out,gt0_rxmcommaalignen_in,gt0_rxpcommaalignen_in,gt0_rxmonitorout_out,gt0_rxmonitorsel_in,gt0_rxoutclk_out,gt0_gtrxreset_in,gt0_rxchariscomma_out,gt0_rxcharisk_out,gt0_gthrxp_in,gt0_rxresetdone_out,gt0_txpostcursor_in,gt0_txprecursor_in,gt0_gttxreset_in,gt0_txuserrdy_in,gt0_txusrclk_in,gt0_txusrclk2_in,gt0_txbufstatus_out,gt0_txdiffctrl_in,gt0_txdata_in,gt0_gthtxn_out,gt0_gthtxp_out,gt0_txoutclk_out,gt0_txoutclkfabric_out,gt0_txoutclkpcs_out,gt0_txresetdone_out,gt0_txcharisk_in,gt1_drpaddr_in,gt1_drpclk_in,gt1_drpdi_in,gt1_drpdo_out,gt1_drpen_in,gt1_drprdy_out,gt1_drpwe_in,gt1_loopback_in,gt1_rxpd_in,gt1_txpd_in,gt1_eyescanreset_in,gt1_rxuserrdy_in,gt1_eyescandataerror_out,gt1_eyescantrigger_in,gt1_dmonitorout_out,gt1_rxusrclk_in,gt1_rxusrclk2_in,gt1_rxdata_out,gt1_rxdisperr_out,gt1_rxnotintable_out,gt1_gthrxn_in,gt1_rxbufreset_in,gt1_rxbufstatus_out,gt1_rxmcommaalignen_in,gt1_rxpcommaalignen_in,gt1_rxmonitorout_out,gt1_rxmonitorsel_in,gt1_rxoutclk_out,gt1_gtrxreset_in,gt1_rxchariscomma_out,gt1_rxcharisk_out,gt1_gthrxp_in,gt1_rxresetdone_out,gt1_txpostcursor_in,gt1_txprecursor_in,gt1_gttxreset_in,gt1_txuserrdy_in,gt1_txusrclk_in,gt1_txusrclk2_in,gt1_txbufstatus_out,gt1_txdiffctrl_in,gt1_txdata_in,gt1_gthtxn_out,gt1_gthtxp_out,gt1_txoutclk_out,gt1_txoutclkfabric_out,gt1_txoutclkpcs_out,gt1_txresetdone_out,gt1_txcharisk_in,gt2_drpaddr_in,gt2_drpclk_in,gt2_drpdi_in,gt2_drpdo_out,gt2_drpen_in,gt2_drprdy_out,gt2_drpwe_in,gt2_loopback_in,gt2_rxpd_in,gt2_txpd_in,gt2_eyescanreset_in,gt2_rxuserrdy_in,gt2_eyescandataerror_out,gt2_eyescantrigger_in,gt2_dmonitorout_out,gt2_rxusrclk_in,gt2_rxusrclk2_in,gt2_rxdata_out,gt2_rxdisperr_out,gt2_rxnotintable_out,gt2_gthrxn_in,gt2_rxbufreset_in,gt2_rxbufstatus_out,gt2_rxmcommaalignen_in,gt2_rxpcommaalignen_in,gt2_rxmonitorout_out,gt2_rxmonitorsel_in,gt2_rxoutclk_out,gt2_gtrxreset_in,gt2_rxchariscomma_out,gt2_rxcharisk_out,gt2_gthrxp_in,gt2_rxresetdone_out,gt2_txpostcursor_in,gt2_txprecursor_in,gt2_gttxreset_in,gt2_txuserrdy_in,gt2_txusrclk_in,gt2_txusrclk2_in,gt2_txbufstatus_out,gt2_txdiffctrl_in,gt2_txdata_in,gt2_gthtxn_out,gt2_gthtxp_out,gt2_txoutclk_out,gt2_txoutclkfabric_out,gt2_txoutclkpcs_out,gt2_txresetdone_out,gt2_txcharisk_in,gt3_drpaddr_in,gt3_drpclk_in,gt3_drpdi_in,gt3_drpdo_out,gt3_drpen_in,gt3_drprdy_out,gt3_drpwe_in,gt3_loopback_in,gt3_rxpd_in,gt3_txpd_in,gt3_eyescanreset_in,gt3_rxuserrdy_in,gt3_eyescandataerror_out,gt3_eyescantrigger_in,gt3_dmonitorout_out,gt3_rxusrclk_in,gt3_rxusrclk2_in,gt3_rxdata_out,gt3_rxdisperr_out,gt3_rxnotintable_out,gt3_gthrxn_in,gt3_rxbufreset_in,gt3_rxbufstatus_out,gt3_rxmcommaalignen_in,gt3_rxpcommaalignen_in,gt3_rxmonitorout_out,gt3_rxmonitorsel_in,gt3_rxoutclk_out,gt3_gtrxreset_in,gt3_rxchariscomma_out,gt3_rxcharisk_out,gt3_gthrxp_in,gt3_rxresetdone_out,gt3_txpostcursor_in,gt3_txprecursor_in,gt3_gttxreset_in,gt3_txuserrdy_in,gt3_txusrclk_in,gt3_txusrclk2_in,gt3_txbufstatus_out,gt3_txdiffctrl_in,gt3_txdata_in,gt3_gthtxn_out,gt3_gthtxp_out,gt3_txoutclk_out,gt3_txoutclkfabric_out,gt3_txoutclkpcs_out,gt3_txresetdone_out,gt3_txcharisk_in,GT0_QPLLLOCK_IN,GT0_QPLLREFCLKLOST_IN,GT0_QPLLRESET_OUT,GT0_QPLLOUTCLK_IN,GT0_QPLLOUTREFCLK_IN ";

	-- COMPONENT vio_gtx
	  -- PORT (
		-- clk : IN STD_LOGIC;
		-- probe_in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		-- probe_out0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	  -- );
	-- END COMPONENT;
	-- ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	-- ATTRIBUTE SYN_BLACK_BOX OF vio_gtx : COMPONENT IS TRUE;
	-- ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
	-- ATTRIBUTE BLACK_BOX_PAD_PIN OF vio_gtx : COMPONENT IS "clk,probe_in0[7:0],probe_out0[3:0]";
	
begin
	tied_to_ground_i                             <= '0';
	tied_to_ground_vec_i                         <= x"0000000000000000";
	tied_to_vcc_i                                <= '1';
	tied_to_vcc_vec_i                            <= "11111111";

	SYSCLK_IN<=SYSCLK40;
	DONT_RESET_ON_DATA_ERROR_IN <= tied_to_ground_i;--ed	
	
	--must be '1' to allow for GT0_RX_FSM_RESET_DONE_OUT='1'
	GT0_DATA_VALID_IN <='1';--probe_out0(3);
	GT1_DATA_VALID_IN <='1';--probe_out0(3);
	GT2_DATA_VALID_IN <='1';--probe_out0(3);
	GT3_DATA_VALID_IN <='1';--probe_out0(3);
	
	-- enables comma_alignment, when receiver is ready, TODO: needs to be checked	
	gt0_rxmcommaalignen_in <= GT0_RX_FSM_RESET_DONE_OUT;--similar to gtx
	gt0_rxpcommaalignen_in <= GT0_RX_FSM_RESET_DONE_OUT;
	gt1_rxmcommaalignen_in <= GT1_RX_FSM_RESET_DONE_OUT;
	gt1_rxpcommaalignen_in <= GT1_RX_FSM_RESET_DONE_OUT;
	gt2_rxmcommaalignen_in <= GT2_RX_FSM_RESET_DONE_OUT;
	gt2_rxpcommaalignen_in <= GT2_RX_FSM_RESET_DONE_OUT;
	gt3_rxmcommaalignen_in <= GT3_RX_FSM_RESET_DONE_OUT;
	gt3_rxpcommaalignen_in <= GT3_RX_FSM_RESET_DONE_OUT;
	-- gt0_rxmcommaalignen_in <= gt0_rxresetdone_out;
	-- gt0_rxpcommaalignen_in <= gt0_rxresetdone_out;
	-- gt1_rxmcommaalignen_in <= gt1_rxresetdone_out;
	-- gt1_rxpcommaalignen_in <= gt1_rxresetdone_out;
	-- gt2_rxmcommaalignen_in <= gt2_rxresetdone_out;
	-- gt2_rxpcommaalignen_in <= gt2_rxresetdone_out;
	-- gt3_rxmcommaalignen_in <= gt3_rxresetdone_out;
	-- gt3_rxpcommaalignen_in <= gt3_rxresetdone_out;

	gt0_drpclk_in<=SYSCLK40;
	gt1_drpclk_in<=SYSCLK40;
	gt2_drpclk_in<=SYSCLK40;
	gt3_drpclk_in<=SYSCLK40;
	
	gt0_drpaddr_in <= (others => '0');
	gt0_drpdi_in <= (others => '0');
	gt0_drpen_in <= '0';
	gt0_drpwe_in <= '0';
	gt1_drpaddr_in <= (others => '0');
	gt1_drpdi_in <= (others => '0');
	gt1_drpen_in <= '0';
	gt1_drpwe_in <= '0';
	gt2_drpaddr_in <= (others => '0');
	gt2_drpdi_in <= (others => '0');
	gt2_drpen_in <= '0';
	gt2_drpwe_in <= '0';
	gt3_drpaddr_in <= (others => '0');
	gt3_drpdi_in <= (others => '0');
	gt3_drpen_in <= '0';
	gt3_drpwe_in <= '0';
	
	GT0_QPLLPD_IN <= not QuadControl(0); --converting power up to power down
	SOFT_RESET_IN<=not QuadControl(1);--probe_out0(0);--user reset can be pulled at any time
	
	gt0_loopback_in <= ChannelControl0(2 downto 0);
	gt1_loopback_in <= ChannelControl1(2 downto 0);
	gt2_loopback_in <= ChannelControl2(2 downto 0);
	gt3_loopback_in <= ChannelControl3(2 downto 0);
	
	gt0_txprecursor_in  <= ChannelControl0(7 downto 3);
	gt1_txprecursor_in  <= ChannelControl1(7 downto 3);
	gt2_txprecursor_in  <= ChannelControl2(7 downto 3);
	gt3_txprecursor_in  <= ChannelControl3(7 downto 3);
	
	gt0_txpostcursor_in <= ChannelControl0(12 downto 8);
	gt1_txpostcursor_in <= ChannelControl1(12 downto 8);
	gt2_txpostcursor_in <= ChannelControl2(12 downto 8);
	gt3_txpostcursor_in <= ChannelControl3(12 downto 8);
	
	gt0_txdiffctrl_in <= ChannelControl0(16 downto 13);
	gt1_txdiffctrl_in <= ChannelControl1(16 downto 13);
	gt2_txdiffctrl_in <= ChannelControl2(16 downto 13);
	gt3_txdiffctrl_in <= ChannelControl3(16 downto 13);
	
	gt0_rx_power_up  <= ChannelControl0(17);
	gt0_tx_power_up  <= ChannelControl0(18);
	gt1_rx_power_up  <= ChannelControl1(17);
	gt1_tx_power_up  <= ChannelControl1(18);
	gt2_rx_power_up  <= ChannelControl2(17);
	gt2_tx_power_up  <= ChannelControl2(18);
	gt3_rx_power_up  <= ChannelControl3(17);
	gt3_tx_power_up  <= ChannelControl3(18);
	
	--power_up is basically not power_down
	gt0_rxpd_in <= "11" when gt0_rx_power_up = '0' else "00";
	gt0_txpd_in <= "11" when gt0_tx_power_up = '0' else "00";
	gt1_rxpd_in <= "11" when gt1_rx_power_up = '0' else "00";
	gt1_txpd_in <= "11" when gt1_tx_power_up = '0' else "00";
	gt2_rxpd_in <= "11" when gt2_rx_power_up = '0' else "00";
	gt2_txpd_in <= "11" when gt2_tx_power_up = '0' else "00";
	gt3_rxpd_in <= "11" when gt3_rx_power_up = '0' else "00";
	gt3_txpd_in <= "11" when gt3_tx_power_up = '0' else "00";

	--don't care, ignored in IP core 3.2
	gt0_rxuserrdy_in<='1';--probe_out0(2);--like GTX
	gt1_rxuserrdy_in<='1';--probe_out0(2);--like GTX
	gt2_rxuserrdy_in<='1';--probe_out0(2);--like GTX
	gt3_rxuserrdy_in<='1';--probe_out0(2);--like GTX
	
	gt0_txuserrdy_in<='1';--probe_out0(2);--like GTX
	gt1_txuserrdy_in<='1';--probe_out0(2);--like GTX
	gt2_txuserrdy_in<='1';--probe_out0(2);--like GTX
	gt3_txuserrdy_in<='1';--probe_out0(2);--like GTX
	
	gt0_eyescanreset_in<=tied_to_ground_i;
	gt0_eyescantrigger_in<=tied_to_ground_i;
	gt0_gtrxreset_in<=ChannelControl3(20);
	gt0_gttxreset_in<=ChannelControl3(19);
	gt1_eyescanreset_in<=tied_to_ground_i;
	gt1_eyescantrigger_in<=tied_to_ground_i;
	gt1_gtrxreset_in<=ChannelControl3(20);
	gt1_gttxreset_in<=ChannelControl3(19);
	gt2_eyescanreset_in<=tied_to_ground_i;
	gt2_eyescantrigger_in<=tied_to_ground_i;
	gt2_gtrxreset_in<=ChannelControl3(20);
	gt2_gttxreset_in<=ChannelControl3(19);
	gt3_eyescanreset_in<=tied_to_ground_i;
	gt3_eyescantrigger_in<=tied_to_ground_i;
	gt3_gtrxreset_in<=ChannelControl3(20);
	gt3_gttxreset_in<=ChannelControl3(19);
	
	gt0_rxbufreset_in<=ChannelControl3(21);
	gt1_rxbufreset_in<=ChannelControl3(21);
	gt2_rxbufreset_in<=ChannelControl3(21);
	gt3_rxbufreset_in<=ChannelControl3(21);
	
	gt0_rxmonitorsel_in<="00";
	gt1_rxmonitorsel_in<="00";
	gt2_rxmonitorsel_in<="00";
	gt3_rxmonitorsel_in<="00";
	
	gt0_rxusrclk_in <= UsrClkIn;
	gt0_rxusrclk2_in<= UsrClk2In;
	gt1_rxusrclk_in <= UsrClkIn;
	gt1_rxusrclk2_in<= UsrClk2In;
	gt2_rxusrclk_in <= UsrClkIn;
	gt2_rxusrclk2_in<= UsrClk2In;
	gt3_rxusrclk_in <= UsrClkIn;
	gt3_rxusrclk2_in<= UsrClk2In;
	
	gt0_txusrclk_in<=UsrClkIn;
	gt0_txusrclk2_in<=UsrClk2In;
	gt1_txusrclk_in<=UsrClkIn;
	gt1_txusrclk2_in<=UsrClk2In;
	gt2_txusrclk_in<=UsrClkIn;
	gt2_txusrclk2_in<=UsrClk2In;
	gt3_txusrclk_in<=UsrClkIn;
	gt3_txusrclk2_in<=UsrClk2In;
	
	ChannelStatus0(1 downto 0)<=gt0_txbufstatus_out;
	ChannelStatus1(1 downto 0)<=gt1_txbufstatus_out;
	ChannelStatus2(1 downto 0)<=gt2_txbufstatus_out;
	ChannelStatus3(1 downto 0)<=gt3_txbufstatus_out;
	
	ChannelStatus0(4 downto 2)<=gt0_rxbufstatus_out;
	ChannelStatus1(4 downto 2)<=gt1_rxbufstatus_out;
	ChannelStatus2(4 downto 2)<=gt2_rxbufstatus_out;
	ChannelStatus3(4 downto 2)<=gt3_rxbufstatus_out;
	
	--not available for IP core version 3.2
	-- ChannelStatus0(31)<=GT0_QPLLREFCLKLOST_OUT;
	-- ChannelStatus1(31)<=GT0_QPLLREFCLKLOST_OUT;
	-- ChannelStatus2(31)<=GT0_QPLLREFCLKLOST_OUT;
	-- ChannelStatus3(31)<=GT0_QPLLREFCLKLOST_OUT;
	
	ChannelStatus0(6 downto 5)<=GT0_RXDISPERR_OUT;
	ChannelStatus1(6 downto 5)<=GT1_RXDISPERR_OUT;
	ChannelStatus2(6 downto 5)<=GT2_RXDISPERR_OUT;
	ChannelStatus3(6 downto 5)<=GT3_RXDISPERR_OUT;
	
	ChannelStatus0(8 downto 7)<=GT0_RXNOTINTABLE_OUT;
	ChannelStatus1(8 downto 7)<=GT1_RXNOTINTABLE_OUT;
	ChannelStatus2(8 downto 7)<=GT2_RXNOTINTABLE_OUT;
	ChannelStatus3(8 downto 7)<=GT3_RXNOTINTABLE_OUT;
	
	gtwizard_32_i : gtwizard_32
	port map
	(
	SYSCLK_IN                       =>      SYSCLK_IN,
	SOFT_RESET_IN                   =>      SOFT_RESET_IN,
	DONT_RESET_ON_DATA_ERROR_IN     =>      DONT_RESET_ON_DATA_ERROR_IN,
	GT0_TX_FSM_RESET_DONE_OUT => GT0_TX_FSM_RESET_DONE_OUT,
	GT0_RX_FSM_RESET_DONE_OUT => GT0_RX_FSM_RESET_DONE_OUT,
	GT0_DATA_VALID_IN => GT0_DATA_VALID_IN,
	GT1_TX_FSM_RESET_DONE_OUT => GT1_TX_FSM_RESET_DONE_OUT,
	GT1_RX_FSM_RESET_DONE_OUT => GT1_RX_FSM_RESET_DONE_OUT,
	GT1_DATA_VALID_IN => GT1_DATA_VALID_IN,
	GT2_TX_FSM_RESET_DONE_OUT => GT2_TX_FSM_RESET_DONE_OUT,
	GT2_RX_FSM_RESET_DONE_OUT => GT2_RX_FSM_RESET_DONE_OUT,
	GT2_DATA_VALID_IN => GT2_DATA_VALID_IN,
	GT3_TX_FSM_RESET_DONE_OUT => GT3_TX_FSM_RESET_DONE_OUT,
	GT3_RX_FSM_RESET_DONE_OUT => GT3_RX_FSM_RESET_DONE_OUT,
	GT3_DATA_VALID_IN => GT3_DATA_VALID_IN,

	--_________________________________________________________________________
	--GT0  (X0Y0)
	--____________________________CHANNEL PORTS________________________________
	---------------------------- Channel - DRP Ports  --------------------------
	gt0_drpaddr_in                  =>      gt0_drpaddr_in,
	gt0_drpclk_in                   =>      gt0_drpclk_in,
	gt0_drpdi_in                    =>      gt0_drpdi_in,
	gt0_drpdo_out                   =>      gt0_drpdo_out,
	gt0_drpen_in                    =>      gt0_drpen_in,
	gt0_drprdy_out                  =>      gt0_drprdy_out,
	gt0_drpwe_in                    =>      gt0_drpwe_in,
	------------------------------- Loopback Ports -----------------------------
	gt0_loopback_in                 =>      gt0_loopback_in,
	------------------------------ Power-Down Ports ----------------------------
	gt0_rxpd_in                     =>      gt0_rxpd_in,
	gt0_txpd_in                     =>      gt0_txpd_in,
	--------------------- RX Initialization and Reset Ports --------------------
	gt0_eyescanreset_in             =>      gt0_eyescanreset_in,
	gt0_rxuserrdy_in                =>      gt0_rxuserrdy_in,
	-------------------------- RX Margin Analysis Ports ------------------------
	gt0_eyescandataerror_out        =>      gt0_eyescandataerror_out,
	gt0_eyescantrigger_in           =>      gt0_eyescantrigger_in,
	------------------- Receive Ports - Digital Monitor Ports ------------------
	gt0_dmonitorout_out             =>      gt0_dmonitorout_out,
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	gt0_rxusrclk_in                 =>      gt0_rxusrclk_in,
	gt0_rxusrclk2_in                =>      gt0_rxusrclk2_in,
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	gt0_rxdata_out                  =>      gt0_rxdata_out,
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	gt0_rxdisperr_out               =>      gt0_rxdisperr_out,
	gt0_rxnotintable_out            =>      gt0_rxnotintable_out,
	------------------------ Receive Ports - RX AFE Ports ----------------------
	gt0_gthrxn_in                   =>      gt0_gthrxn_in,
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	gt0_rxbufreset_in               =>      gt0_rxbufreset_in,
	gt0_rxbufstatus_out             =>      gt0_rxbufstatus_out,
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	gt0_rxmcommaalignen_in          =>      gt0_rxmcommaalignen_in,
	gt0_rxpcommaalignen_in          =>      gt0_rxpcommaalignen_in,
	--------------------- Receive Ports - RX Equalizer Ports -------------------
	gt0_rxmonitorout_out            =>      gt0_rxmonitorout_out,
	gt0_rxmonitorsel_in             =>      gt0_rxmonitorsel_in,
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	gt0_rxoutclk_out                =>      gt0_rxoutclk_out,
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	gt0_gtrxreset_in                =>      gt0_gtrxreset_in,
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	gt0_rxchariscomma_out           =>      gt0_rxchariscomma_out,
	gt0_rxcharisk_out               =>      gt0_rxcharisk_out,
	------------------------ Receive Ports -RX AFE Ports -----------------------
	gt0_gthrxp_in                   =>      gt0_gthrxp_in,
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	gt0_rxresetdone_out             =>      gt0_rxresetdone_out,
	------------------------ TX Configurable Driver Ports ----------------------
	gt0_txpostcursor_in             =>      gt0_txpostcursor_in,
	gt0_txprecursor_in              =>      gt0_txprecursor_in,
	--------------------- TX Initialization and Reset Ports --------------------
	gt0_gttxreset_in                =>      gt0_gttxreset_in,
	gt0_txuserrdy_in                =>      gt0_txuserrdy_in,
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	gt0_txusrclk_in                 =>      gt0_txusrclk_in,
	gt0_txusrclk2_in                =>      gt0_txusrclk2_in,
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	gt0_txbufstatus_out             =>      gt0_txbufstatus_out,
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	gt0_txdiffctrl_in               =>      gt0_txdiffctrl_in,
	------------------ Transmit Ports - TX Data Path interface -----------------
	gt0_txdata_in                   =>      gt0_txdata_in,
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	gt0_gthtxn_out                  =>      gt0_gthtxn_out,
	gt0_gthtxp_out                  =>      gt0_gthtxp_out,
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	gt0_txoutclk_out                =>      gt0_txoutclk_out,
	gt0_txoutclkfabric_out          =>      gt0_txoutclkfabric_out,
	gt0_txoutclkpcs_out             =>      gt0_txoutclkpcs_out,
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	gt0_txresetdone_out             =>      gt0_txresetdone_out,
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	gt0_txcharisk_in                =>      gt0_txcharisk_in,

	--GT1  (X0Y1)
	--____________________________CHANNEL PORTS________________________________
	---------------------------- Channel - DRP Ports  --------------------------
	gt1_drpaddr_in                  =>      gt1_drpaddr_in,
	gt1_drpclk_in                   =>      gt1_drpclk_in,
	gt1_drpdi_in                    =>      gt1_drpdi_in,
	gt1_drpdo_out                   =>      gt1_drpdo_out,
	gt1_drpen_in                    =>      gt1_drpen_in,
	gt1_drprdy_out                  =>      gt1_drprdy_out,
	gt1_drpwe_in                    =>      gt1_drpwe_in,
	------------------------------- Loopback Ports -----------------------------
	gt1_loopback_in                 =>      gt1_loopback_in,
	------------------------------ Power-Down Ports ----------------------------
	gt1_rxpd_in                     =>      gt1_rxpd_in,
	gt1_txpd_in                     =>      gt1_txpd_in,
	--------------------- RX Initialization and Reset Ports --------------------
	gt1_eyescanreset_in             =>      gt1_eyescanreset_in,
	gt1_rxuserrdy_in                =>      gt1_rxuserrdy_in,
	-------------------------- RX Margin Analysis Ports ------------------------
	gt1_eyescandataerror_out        =>      gt1_eyescandataerror_out,
	gt1_eyescantrigger_in           =>      gt1_eyescantrigger_in,
	------------------- Receive Ports - Digital Monitor Ports ------------------
	gt1_dmonitorout_out             =>      gt1_dmonitorout_out,
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	gt1_rxusrclk_in                 =>      gt1_rxusrclk_in,
	gt1_rxusrclk2_in                =>      gt1_rxusrclk2_in,
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	gt1_rxdata_out                  =>      gt1_rxdata_out,
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	gt1_rxdisperr_out               =>      gt1_rxdisperr_out,
	gt1_rxnotintable_out            =>      gt1_rxnotintable_out,
	------------------------ Receive Ports - RX AFE Ports ----------------------
	gt1_gthrxn_in                   =>      gt1_gthrxn_in,
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	gt1_rxbufreset_in               =>      gt1_rxbufreset_in,
	gt1_rxbufstatus_out             =>      gt1_rxbufstatus_out,
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	gt1_rxmcommaalignen_in          =>      gt1_rxmcommaalignen_in,
	gt1_rxpcommaalignen_in          =>      gt1_rxpcommaalignen_in,
	--------------------- Receive Ports - RX Equalizer Ports -------------------
	gt1_rxmonitorout_out            =>      gt1_rxmonitorout_out,
	gt1_rxmonitorsel_in             =>      gt1_rxmonitorsel_in,
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	gt1_rxoutclk_out                =>      gt1_rxoutclk_out,
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	gt1_gtrxreset_in                =>      gt1_gtrxreset_in,
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	gt1_rxchariscomma_out           =>      gt1_rxchariscomma_out,
	gt1_rxcharisk_out               =>      gt1_rxcharisk_out,
	------------------------ Receive Ports -RX AFE Ports -----------------------
	gt1_gthrxp_in                   =>      gt1_gthrxp_in,
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	gt1_rxresetdone_out             =>      gt1_rxresetdone_out,
	------------------------ TX Configurable Driver Ports ----------------------
	gt1_txpostcursor_in             =>      gt1_txpostcursor_in,
	gt1_txprecursor_in              =>      gt1_txprecursor_in,
	--------------------- TX Initialization and Reset Ports --------------------
	gt1_gttxreset_in                =>      gt1_gttxreset_in,
	gt1_txuserrdy_in                =>      gt1_txuserrdy_in,
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	gt1_txusrclk_in                 =>      gt1_txusrclk_in,
	gt1_txusrclk2_in                =>      gt1_txusrclk2_in,
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	gt1_txbufstatus_out             =>      gt1_txbufstatus_out,
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	gt1_txdiffctrl_in               =>      gt1_txdiffctrl_in,
	------------------ Transmit Ports - TX Data Path interface -----------------
	gt1_txdata_in                   =>      gt1_txdata_in,
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	gt1_gthtxn_out                  =>      gt1_gthtxn_out,
	gt1_gthtxp_out                  =>      gt1_gthtxp_out,
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	gt1_txoutclk_out                =>      gt1_txoutclk_out,
	gt1_txoutclkfabric_out          =>      gt1_txoutclkfabric_out,
	gt1_txoutclkpcs_out             =>      gt1_txoutclkpcs_out,
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	gt1_txresetdone_out             =>      gt1_txresetdone_out,
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	gt1_txcharisk_in                =>      gt1_txcharisk_in,

	--GT2  (X0Y2)
	--____________________________CHANNEL PORTS________________________________
	---------------------------- Channel - DRP Ports  --------------------------
	gt2_drpaddr_in                  =>      gt2_drpaddr_in,
	gt2_drpclk_in                   =>      gt2_drpclk_in,
	gt2_drpdi_in                    =>      gt2_drpdi_in,
	gt2_drpdo_out                   =>      gt2_drpdo_out,
	gt2_drpen_in                    =>      gt2_drpen_in,
	gt2_drprdy_out                  =>      gt2_drprdy_out,
	gt2_drpwe_in                    =>      gt2_drpwe_in,
	------------------------------- Loopback Ports -----------------------------
	gt2_loopback_in                 =>      gt2_loopback_in,
	------------------------------ Power-Down Ports ----------------------------
	gt2_rxpd_in                     =>      gt2_rxpd_in,
	gt2_txpd_in                     =>      gt2_txpd_in,
	--------------------- RX Initialization and Reset Ports --------------------
	gt2_eyescanreset_in             =>      gt2_eyescanreset_in,
	gt2_rxuserrdy_in                =>      gt2_rxuserrdy_in,
	-------------------------- RX Margin Analysis Ports ------------------------
	gt2_eyescandataerror_out        =>      gt2_eyescandataerror_out,
	gt2_eyescantrigger_in           =>      gt2_eyescantrigger_in,
	------------------- Receive Ports - Digital Monitor Ports ------------------
	gt2_dmonitorout_out             =>      gt2_dmonitorout_out,
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	gt2_rxusrclk_in                 =>      gt2_rxusrclk_in,
	gt2_rxusrclk2_in                =>      gt2_rxusrclk2_in,
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	gt2_rxdata_out                  =>      gt2_rxdata_out,
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	gt2_rxdisperr_out               =>      gt2_rxdisperr_out,
	gt2_rxnotintable_out            =>      gt2_rxnotintable_out,
	------------------------ Receive Ports - RX AFE Ports ----------------------
	gt2_gthrxn_in                   =>      gt2_gthrxn_in,
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	gt2_rxbufreset_in               =>      gt2_rxbufreset_in,
	gt2_rxbufstatus_out             =>      gt2_rxbufstatus_out,
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	gt2_rxmcommaalignen_in          =>      gt2_rxmcommaalignen_in,
	gt2_rxpcommaalignen_in          =>      gt2_rxpcommaalignen_in,
	--------------------- Receive Ports - RX Equalizer Ports -------------------
	gt2_rxmonitorout_out            =>      gt2_rxmonitorout_out,
	gt2_rxmonitorsel_in             =>      gt2_rxmonitorsel_in,
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	gt2_rxoutclk_out                =>      gt2_rxoutclk_out,
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	gt2_gtrxreset_in                =>      gt2_gtrxreset_in,
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	gt2_rxchariscomma_out           =>      gt2_rxchariscomma_out,
	gt2_rxcharisk_out               =>      gt2_rxcharisk_out,
	------------------------ Receive Ports -RX AFE Ports -----------------------
	gt2_gthrxp_in                   =>      gt2_gthrxp_in,
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	gt2_rxresetdone_out             =>      gt2_rxresetdone_out,
	------------------------ TX Configurable Driver Ports ----------------------
	gt2_txpostcursor_in             =>      gt2_txpostcursor_in,
	gt2_txprecursor_in              =>      gt2_txprecursor_in,
	--------------------- TX Initialization and Reset Ports --------------------
	gt2_gttxreset_in                =>      gt2_gttxreset_in,
	gt2_txuserrdy_in                =>      gt2_txuserrdy_in,
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	gt2_txusrclk_in                 =>      gt2_txusrclk_in,
	gt2_txusrclk2_in                =>      gt2_txusrclk2_in,
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	gt2_txbufstatus_out             =>      gt2_txbufstatus_out,
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	gt2_txdiffctrl_in               =>      gt2_txdiffctrl_in,
	------------------ Transmit Ports - TX Data Path interface -----------------
	gt2_txdata_in                   =>      gt2_txdata_in,
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	gt2_gthtxn_out                  =>      gt2_gthtxn_out,
	gt2_gthtxp_out                  =>      gt2_gthtxp_out,
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	gt2_txoutclk_out                =>      gt2_txoutclk_out,
	gt2_txoutclkfabric_out          =>      gt2_txoutclkfabric_out,
	gt2_txoutclkpcs_out             =>      gt2_txoutclkpcs_out,
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	gt2_txresetdone_out             =>      gt2_txresetdone_out,
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	gt2_txcharisk_in                =>      gt2_txcharisk_in,

	--GT3  (X0Y3)
	--____________________________CHANNEL PORTS________________________________
	---------------------------- Channel - DRP Ports  --------------------------
	gt3_drpaddr_in                  =>      gt3_drpaddr_in,
	gt3_drpclk_in                   =>      gt3_drpclk_in,
	gt3_drpdi_in                    =>      gt3_drpdi_in,
	gt3_drpdo_out                   =>      gt3_drpdo_out,
	gt3_drpen_in                    =>      gt3_drpen_in,
	gt3_drprdy_out                  =>      gt3_drprdy_out,
	gt3_drpwe_in                    =>      gt3_drpwe_in,
	------------------------------- Loopback Ports -----------------------------
	gt3_loopback_in                 =>      gt3_loopback_in,
	------------------------------ Power-Down Ports ----------------------------
	gt3_rxpd_in                     =>      gt3_rxpd_in,
	gt3_txpd_in                     =>      gt3_txpd_in,
	--------------------- RX Initialization and Reset Ports --------------------
	gt3_eyescanreset_in             =>      gt3_eyescanreset_in,
	gt3_rxuserrdy_in                =>      gt3_rxuserrdy_in,
	-------------------------- RX Margin Analysis Ports ------------------------
	gt3_eyescandataerror_out        =>      gt3_eyescandataerror_out,
	gt3_eyescantrigger_in           =>      gt3_eyescantrigger_in,
	------------------- Receive Ports - Digital Monitor Ports ------------------
	gt3_dmonitorout_out             =>      gt3_dmonitorout_out,
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	gt3_rxusrclk_in                 =>      gt3_rxusrclk_in,
	gt3_rxusrclk2_in                =>      gt3_rxusrclk2_in,
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	gt3_rxdata_out                  =>      gt3_rxdata_out,
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	gt3_rxdisperr_out               =>      gt3_rxdisperr_out,
	gt3_rxnotintable_out            =>      gt3_rxnotintable_out,
	------------------------ Receive Ports - RX AFE Ports ----------------------
	gt3_gthrxn_in                   =>      gt3_gthrxn_in,
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	gt3_rxbufreset_in               =>      gt3_rxbufreset_in,
	gt3_rxbufstatus_out             =>      gt3_rxbufstatus_out,
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	gt3_rxmcommaalignen_in          =>      gt3_rxmcommaalignen_in,
	gt3_rxpcommaalignen_in          =>      gt3_rxpcommaalignen_in,
	--------------------- Receive Ports - RX Equalizer Ports -------------------
	gt3_rxmonitorout_out            =>      gt3_rxmonitorout_out,
	gt3_rxmonitorsel_in             =>      gt3_rxmonitorsel_in,
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	gt3_rxoutclk_out                =>      gt3_rxoutclk_out,
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	gt3_gtrxreset_in                =>      gt3_gtrxreset_in,
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	gt3_rxchariscomma_out           =>      gt3_rxchariscomma_out,
	gt3_rxcharisk_out               =>      gt3_rxcharisk_out,
	------------------------ Receive Ports -RX AFE Ports -----------------------
	gt3_gthrxp_in                   =>      gt3_gthrxp_in,
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	gt3_rxresetdone_out             =>      gt3_rxresetdone_out,
	------------------------ TX Configurable Driver Ports ----------------------
	gt3_txpostcursor_in             =>      gt3_txpostcursor_in,
	gt3_txprecursor_in              =>      gt3_txprecursor_in,
	--------------------- TX Initialization and Reset Ports --------------------
	gt3_gttxreset_in                =>      gt3_gttxreset_in,
	gt3_txuserrdy_in                =>      gt3_txuserrdy_in,
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	gt3_txusrclk_in                 =>      gt3_txusrclk_in,
	gt3_txusrclk2_in                =>      gt3_txusrclk2_in,
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	gt3_txbufstatus_out             =>      gt3_txbufstatus_out,
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	gt3_txdiffctrl_in               =>      gt3_txdiffctrl_in,
	------------------ Transmit Ports - TX Data Path interface -----------------
	gt3_txdata_in                   =>      gt3_txdata_in,
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	gt3_gthtxn_out                  =>      gt3_gthtxn_out,
	gt3_gthtxp_out                  =>      gt3_gthtxp_out,
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	gt3_txoutclk_out                =>      gt3_txoutclk_out,
	gt3_txoutclkfabric_out          =>      gt3_txoutclkfabric_out,
	gt3_txoutclkpcs_out             =>      gt3_txoutclkpcs_out,
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	gt3_txresetdone_out             =>      gt3_txresetdone_out,
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	gt3_txcharisk_in                =>      gt3_txcharisk_in,


	--____________________________COMMON PORTS________________________________
	GT0_QPLLLOCK_IN => GT0_QPLLLOCK_IN, 
	GT0_QPLLREFCLKLOST_IN => GT0_QPLLREFCLKLOST_IN, 
	GT0_QPLLRESET_OUT => GT0_QPLLRESET_OUT, 
	GT0_QPLLOUTCLK_IN  => GT0_QPLLOUTCLK_IN,
	GT0_QPLLOUTREFCLK_IN => GT0_QPLLOUTREFCLK_IN 

	);



	common0_i: entity work.gtwizard_0_common 
	generic map
	(
	WRAPPER_SIM_GTRESET_SPEEDUP => EXAMPLE_SIM_GTRESET_SPEEDUP
	)
	port map
	(
	QPLLPD_IN => GT0_QPLLPD_IN,  
	GTREFCLK0_IN => MGTRefClk,
	QPLLLOCK_OUT => GT0_QPLLLOCK_IN,
	QPLLLOCKDETCLK_IN => SYSCLK40,
	QPLLOUTCLK_OUT => GT0_QPLLOUTCLK_IN,
	QPLLOUTREFCLK_OUT => GT0_QPLLOUTREFCLK_IN,
	QPLLREFCLKLOST_OUT => GT0_QPLLREFCLKLOST_IN,   
	QPLLRESET_IN => gt0_qpllreset_t
	);

	gt0_qpllreset_t <= commonreset_i or GT0_QPLLRESET_OUT;
	
	common_reset_i: entity work.gtwizard_0_common_reset 
	generic map 
	(
	STABLE_CLOCK_PERIOD =>SYSCLKPeriod -- Period of the stable clock driving this state-machine, unit is [ns]
	)
	port map
	(    
	STABLE_CLOCK => SYSCLK40,          --Stable Clock, either a stable clock from the PCB
	SOFT_RESET => SOFT_RESET_IN,       --User Reset, can be pulled any time
	COMMON_RESET => commonreset_i      --Reset QPLL
	);
	
	-- vio_gtx_i : vio_gtx
	  -- PORT MAP (
		-- clk => SYSCLK40,
		-- probe_in0 => GT0_RX_FSM_RESET_DONE_OUT & GT1_RX_FSM_RESET_DONE_OUT &GT2_RX_FSM_RESET_DONE_OUT & GT3_RX_FSM_RESET_DONE_OUT & GT0_TX_FSM_RESET_DONE_OUT & GT1_TX_FSM_RESET_DONE_OUT &GT2_TX_FSM_RESET_DONE_OUT & GT3_TX_FSM_RESET_DONE_OUT,
		-- probe_out0 => probe_out0
	  -- );
	-- -- GT0_DATA_VALID_IN <=probe_out0(3);  
	-- -- gt0_rxuserrdy_in<=probe_out0(2);--'1'
	-- -- gt0_txuserrdy_in<=probe_out0(1);
	-- -- SOFT_RESET_IN<=probe_out0(0)
end Behavioral;
