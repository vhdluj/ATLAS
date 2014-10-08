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

entity GTH_Buffered_27 is
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
end GTH_Buffered_27;

architecture Behavioral of GTH_Buffered_27 is

	signal  tied_to_ground_i                : std_logic;
    signal  tied_to_ground_vec_i            : std_logic_vector(63 downto 0);
    signal  tied_to_vcc_i                   : std_logic;
    signal  tied_to_vcc_vec_i               : std_logic_vector(7 downto 0);

	signal gt0_rx_power_up,gt0_tx_power_up : std_logic;
	signal gt1_rx_power_up,gt1_tx_power_up : std_logic;
	signal gt2_rx_power_up,gt2_tx_power_up : std_logic;
	signal gt3_rx_power_up,gt3_tx_power_up : std_logic;

	--GT0  (X0Y0)
	--____________________________CHANNEL PORTS________________________________
	signal GT0_DRP_BUSY_OUT                        : std_logic; 
	---------------------------- Channel - DRP Ports  --------------------------
	signal GT0_DRPADDR_IN                          : std_logic_vector(8 downto 0);
	signal GT0_DRPCLK_IN                           : std_logic;
	signal GT0_DRPDI_IN                            : std_logic_vector(15 downto 0);
	signal GT0_DRPDO_OUT                           : std_logic_vector(15 downto 0);
	signal GT0_DRPEN_IN                            : std_logic;
	signal GT0_DRPRDY_OUT                          : std_logic;
	signal GT0_DRPWE_IN                            : std_logic;
	------------------------------- Loopback Ports -----------------------------
	signal GT0_LOOPBACK_IN                         : std_logic_vector(2 downto 0);
	------------------------------ Power-Down Ports ----------------------------
	signal GT0_RXPD_IN                             : std_logic_vector(1 downto 0);
	signal GT0_TXPD_IN                             : std_logic_vector(1 downto 0);
	--------------------- RX Initialization and Reset Ports --------------------
	signal GT0_RXUSERRDY_IN                        : std_logic;
	-------------------------- RX Margin Analysis Ports ------------------------
	signal GT0_EYESCANDATAERROR_OUT                : std_logic;
	------------------------- Receive Ports - CDR Ports ------------------------
	signal GT0_RXCDRLOCK_OUT                       : std_logic;
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	signal GT0_RXUSRCLK_IN                         : std_logic;
	signal GT0_RXUSRCLK2_IN                        : std_logic;
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	-- signal GT0_RXDATA_OUT                          : std_logic_vector(15 downto 0);
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	signal GT0_RXDISPERR_OUT                       : std_logic_vector(1 downto 0);
	signal GT0_RXNOTINTABLE_OUT                    : std_logic_vector(1 downto 0);
	------------------------ Receive Ports - RX AFE Ports ----------------------
	-- signal GT0_GTHRXN_IN                           : std_logic;
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	signal GT0_RXBUFRESET_IN                       : std_logic;
	signal GT0_RXBUFSTATUS_OUT                     : std_logic_vector(2 downto 0);
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	signal GT0_RXMCOMMAALIGNEN_IN                  : std_logic;
	signal GT0_RXPCOMMAALIGNEN_IN                  : std_logic;
	-------------------- Receive Ports - RX Equailizer Ports -------------------
	signal GT0_RXLPMHFHOLD_IN                      : std_logic;
	signal GT0_RXLPMLFHOLD_IN                      : std_logic;
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	signal GT0_RXOUTCLK_OUT                        : std_logic;
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	signal GT0_GTRXRESET_IN                        : std_logic;
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	-- signal GT0_RXCHARISCOMMA_OUT                   : std_logic_vector(1 downto 0);
	-- signal GT0_RXCHARISK_OUT                       : std_logic_vector(1 downto 0);
	------------------------ Receive Ports -RX AFE Ports -----------------------
	-- signal GT0_GTHRXP_IN                           : std_logic;
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	signal GT0_RXRESETDONE_OUT                     : std_logic;
	------------------------ TX Configurable Driver Ports ----------------------
	signal GT0_TXPOSTCURSOR_IN                     : std_logic_vector(4 downto 0);
	signal GT0_TXPRECURSOR_IN                      : std_logic_vector(4 downto 0);
	--------------------- TX Initialization and Reset Ports --------------------
	signal GT0_GTTXRESET_IN                        : std_logic;
	signal GT0_TXUSERRDY_IN                        : std_logic;
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	signal GT0_TXUSRCLK_IN                         : std_logic;
	signal GT0_TXUSRCLK2_IN                        : std_logic;
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	signal GT0_TXBUFSTATUS_OUT                     : std_logic_vector(1 downto 0);
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	signal GT0_TXDIFFCTRL_IN                       : std_logic_vector(3 downto 0);
	------------------ Transmit Ports - TX Data Path interface -----------------
	-- signal GT0_TXDATA_IN                           : std_logic_vector(15 downto 0);
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	-- signal GT0_GTHTXN_OUT                          : std_logic;
	-- signal GT0_GTHTXP_OUT                          : std_logic;
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	signal GT0_TXOUTCLK_OUT                        : std_logic;
	signal GT0_TXOUTCLKFABRIC_OUT                  : std_logic;
	signal GT0_TXOUTCLKPCS_OUT                     : std_logic;
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	signal GT0_TXRESETDONE_OUT                     : std_logic;
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	-- signal GT0_TXCHARISK_IN                        : std_logic_vector(1 downto 0);

	--GT1  (X0Y1)
	--____________________________CHANNEL PORTS________________________________
	signal GT1_DRP_BUSY_OUT                        : std_logic; 
	---------------------------- Channel - DRP Ports  --------------------------
	signal GT1_DRPADDR_IN                          : std_logic_vector(8 downto 0);
	signal GT1_DRPCLK_IN                           : std_logic;
	signal GT1_DRPDI_IN                            : std_logic_vector(15 downto 0);
	signal GT1_DRPDO_OUT                           : std_logic_vector(15 downto 0);
	signal GT1_DRPEN_IN                            : std_logic;
	signal GT1_DRPRDY_OUT                          : std_logic;
	signal GT1_DRPWE_IN                            : std_logic;
	------------------------------- Loopback Ports -----------------------------
	signal GT1_LOOPBACK_IN                         : std_logic_vector(2 downto 0);
	------------------------------ Power-Down Ports ----------------------------
	signal GT1_RXPD_IN                             : std_logic_vector(1 downto 0);
	signal GT1_TXPD_IN                             : std_logic_vector(1 downto 0);
	--------------------- RX Initialization and Reset Ports --------------------
	signal GT1_RXUSERRDY_IN                        : std_logic;
	-------------------------- RX Margin Analysis Ports ------------------------
	signal GT1_EYESCANDATAERROR_OUT                : std_logic;
	------------------------- Receive Ports - CDR Ports ------------------------
	signal GT1_RXCDRLOCK_OUT                       : std_logic;
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	signal GT1_RXUSRCLK_IN                         : std_logic;
	signal GT1_RXUSRCLK2_IN                        : std_logic;
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	-- signal GT1_RXDATA_OUT                          : std_logic_vector(15 downto 0);
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	signal GT1_RXDISPERR_OUT                       : std_logic_vector(1 downto 0);
	signal GT1_RXNOTINTABLE_OUT                    : std_logic_vector(1 downto 0);
	------------------------ Receive Ports - RX AFE Ports ----------------------
	-- signal GT1_GTHRXN_IN                           : std_logic;
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	signal GT1_RXBUFRESET_IN                       : std_logic;
	signal GT1_RXBUFSTATUS_OUT                     : std_logic_vector(2 downto 0);
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	signal GT1_RXMCOMMAALIGNEN_IN                  : std_logic;
	signal GT1_RXPCOMMAALIGNEN_IN                  : std_logic;
	-------------------- Receive Ports - RX Equailizer Ports -------------------
	signal GT1_RXLPMHFHOLD_IN                      : std_logic;
	signal GT1_RXLPMLFHOLD_IN                      : std_logic;
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	signal GT1_RXOUTCLK_OUT                        : std_logic;
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	signal GT1_GTRXRESET_IN                        : std_logic;
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	-- signal GT1_RXCHARISCOMMA_OUT                   : std_logic_vector(1 downto 0);
	-- signal GT1_RXCHARISK_OUT                       : std_logic_vector(1 downto 0);
	------------------------ Receive Ports -RX AFE Ports -----------------------
	-- signal GT1_GTHRXP_IN                           : std_logic;
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	signal GT1_RXRESETDONE_OUT                     : std_logic;
	------------------------ TX Configurable Driver Ports ----------------------
	signal GT1_TXPOSTCURSOR_IN                     : std_logic_vector(4 downto 0);
	signal GT1_TXPRECURSOR_IN                      : std_logic_vector(4 downto 0);
	--------------------- TX Initialization and Reset Ports --------------------
	signal GT1_GTTXRESET_IN                        : std_logic;
	signal GT1_TXUSERRDY_IN                        : std_logic;
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	signal GT1_TXUSRCLK_IN                         : std_logic;
	signal GT1_TXUSRCLK2_IN                        : std_logic;
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	signal GT1_TXBUFSTATUS_OUT                     : std_logic_vector(1 downto 0);
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	signal GT1_TXDIFFCTRL_IN                       : std_logic_vector(3 downto 0);
	------------------ Transmit Ports - TX Data Path interface -----------------
	-- signal GT1_TXDATA_IN                           : std_logic_vector(15 downto 0);
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	-- signal GT1_GTHTXN_OUT                          : std_logic;
	-- signal GT1_GTHTXP_OUT                          : std_logic;
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	signal GT1_TXOUTCLK_OUT                        : std_logic;
	signal GT1_TXOUTCLKFABRIC_OUT                  : std_logic;
	signal GT1_TXOUTCLKPCS_OUT                     : std_logic;
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	signal GT1_TXRESETDONE_OUT                     : std_logic;
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	-- signal GT1_TXCHARISK_IN                        : std_logic_vector(1 downto 0);

	--GT2  (X0Y2)
	--____________________________CHANNEL PORTS________________________________
	signal GT2_DRP_BUSY_OUT                        : std_logic; 
	---------------------------- Channel - DRP Ports  --------------------------
	signal GT2_DRPADDR_IN                          : std_logic_vector(8 downto 0);
	signal GT2_DRPCLK_IN                           : std_logic;
	signal GT2_DRPDI_IN                            : std_logic_vector(15 downto 0);
	signal GT2_DRPDO_OUT                           : std_logic_vector(15 downto 0);
	signal GT2_DRPEN_IN                            : std_logic;
	signal GT2_DRPRDY_OUT                          : std_logic;
	signal GT2_DRPWE_IN                            : std_logic;
	------------------------------- Loopback Ports -----------------------------
	signal GT2_LOOPBACK_IN                         : std_logic_vector(2 downto 0);
	------------------------------ Power-Down Ports ----------------------------
	signal GT2_RXPD_IN                             : std_logic_vector(1 downto 0);
	signal GT2_TXPD_IN                             : std_logic_vector(1 downto 0);
	--------------------- RX Initialization and Reset Ports --------------------
	signal GT2_RXUSERRDY_IN                        : std_logic;
	-------------------------- RX Margin Analysis Ports ------------------------
	signal GT2_EYESCANDATAERROR_OUT                : std_logic;
	------------------------- Receive Ports - CDR Ports ------------------------
	signal GT2_RXCDRLOCK_OUT                       : std_logic;
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	signal GT2_RXUSRCLK_IN                         : std_logic;
	signal GT2_RXUSRCLK2_IN                        : std_logic;
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	-- signal GT2_RXDATA_OUT                          : std_logic_vector(15 downto 0);
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	signal GT2_RXDISPERR_OUT                       : std_logic_vector(1 downto 0);
	signal GT2_RXNOTINTABLE_OUT                    : std_logic_vector(1 downto 0);
	------------------------ Receive Ports - RX AFE Ports ----------------------
	-- signal GT2_GTHRXN_IN                           : std_logic;
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	signal GT2_RXBUFRESET_IN                       : std_logic;
	signal GT2_RXBUFSTATUS_OUT                     : std_logic_vector(2 downto 0);
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	signal GT2_RXMCOMMAALIGNEN_IN                  : std_logic;
	signal GT2_RXPCOMMAALIGNEN_IN                  : std_logic;
	-------------------- Receive Ports - RX Equailizer Ports -------------------
	signal GT2_RXLPMHFHOLD_IN                      : std_logic;
	signal GT2_RXLPMLFHOLD_IN                      : std_logic;
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	signal GT2_RXOUTCLK_OUT                        : std_logic;
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	signal GT2_GTRXRESET_IN                        : std_logic;
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	-- signal GT2_RXCHARISCOMMA_OUT                   : std_logic_vector(1 downto 0);
	-- signal GT2_RXCHARISK_OUT                       : std_logic_vector(1 downto 0);
	------------------------ Receive Ports -RX AFE Ports -----------------------
	-- signal GT2_GTHRXP_IN                           : std_logic;
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	signal GT2_RXRESETDONE_OUT                     : std_logic;
	------------------------ TX Configurable Driver Ports ----------------------
	signal GT2_TXPOSTCURSOR_IN                     : std_logic_vector(4 downto 0);
	signal GT2_TXPRECURSOR_IN                      : std_logic_vector(4 downto 0);
	--------------------- TX Initialization and Reset Ports --------------------
	signal GT2_GTTXRESET_IN                        : std_logic;
	signal GT2_TXUSERRDY_IN                        : std_logic;
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	signal GT2_TXUSRCLK_IN                         : std_logic;
	signal GT2_TXUSRCLK2_IN                        : std_logic;
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	signal GT2_TXBUFSTATUS_OUT                     : std_logic_vector(1 downto 0);
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	signal GT2_TXDIFFCTRL_IN                       : std_logic_vector(3 downto 0);
	------------------ Transmit Ports - TX Data Path interface -----------------
	-- signal GT2_TXDATA_IN                           : std_logic_vector(15 downto 0);
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	-- signal GT2_GTHTXN_OUT                          : std_logic;
	-- signal GT2_GTHTXP_OUT                          : std_logic;
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	signal GT2_TXOUTCLK_OUT                        : std_logic;
	signal GT2_TXOUTCLKFABRIC_OUT                  : std_logic;
	signal GT2_TXOUTCLKPCS_OUT                     : std_logic;
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	signal GT2_TXRESETDONE_OUT                     : std_logic;
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	-- signal GT2_TXCHARISK_IN                        : std_logic_vector(1 downto 0);
	--GT3  (X0Y3)
	--____________________________CHANNEL PORTS________________________________
	signal GT3_DRP_BUSY_OUT                        : std_logic; 
	---------------------------- Channel - DRP Ports  --------------------------
	signal GT3_DRPADDR_IN                          : std_logic_vector(8 downto 0);
	signal GT3_DRPCLK_IN                           : std_logic;
	signal GT3_DRPDI_IN                            : std_logic_vector(15 downto 0);
	signal GT3_DRPDO_OUT                           : std_logic_vector(15 downto 0);
	signal GT3_DRPEN_IN                            : std_logic;
	signal GT3_DRPRDY_OUT                          : std_logic;
	signal GT3_DRPWE_IN                            : std_logic;
	------------------------------- Loopback Ports -----------------------------
	signal GT3_LOOPBACK_IN                         : std_logic_vector(2 downto 0);
	------------------------------ Power-Down Ports ----------------------------
	signal GT3_RXPD_IN                             : std_logic_vector(1 downto 0);
	signal GT3_TXPD_IN                             : std_logic_vector(1 downto 0);
	--------------------- RX Initialization and Reset Ports --------------------
	signal GT3_RXUSERRDY_IN                        : std_logic;
	-------------------------- RX Margin Analysis Ports ------------------------
	signal GT3_EYESCANDATAERROR_OUT                : std_logic;
	------------------------- Receive Ports - CDR Ports ------------------------
	signal GT3_RXCDRLOCK_OUT                       : std_logic;
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	signal GT3_RXUSRCLK_IN                         : std_logic;
	signal GT3_RXUSRCLK2_IN                        : std_logic;
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	-- signal GT3_RXDATA_OUT                          : std_logic_vector(15 downto 0);
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	signal GT3_RXDISPERR_OUT                       : std_logic_vector(1 downto 0);
	signal GT3_RXNOTINTABLE_OUT                    : std_logic_vector(1 downto 0);
	------------------------ Receive Ports - RX AFE Ports ----------------------
	-- signal GT3_GTHRXN_IN                           : std_logic;
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	signal GT3_RXBUFRESET_IN                       : std_logic;
	signal GT3_RXBUFSTATUS_OUT                     : std_logic_vector(2 downto 0);
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	signal GT3_RXMCOMMAALIGNEN_IN                  : std_logic;
	signal GT3_RXPCOMMAALIGNEN_IN                  : std_logic;
	-------------------- Receive Ports - RX Equailizer Ports -------------------
	signal GT3_RXLPMHFHOLD_IN                      : std_logic;
	signal GT3_RXLPMLFHOLD_IN                      : std_logic;
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	signal GT3_RXOUTCLK_OUT                        : std_logic;
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	signal GT3_GTRXRESET_IN                        : std_logic;
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	-- signal GT3_RXCHARISCOMMA_OUT                   : std_logic_vector(1 downto 0);
	-- signal GT3_RXCHARISK_OUT                       : std_logic_vector(1 downto 0);
	------------------------ Receive Ports -RX AFE Ports -----------------------
	-- signal GT3_GTHRXP_IN                           : std_logic;
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	signal GT3_RXRESETDONE_OUT                     : std_logic;
	------------------------ TX Configurable Driver Ports ----------------------
	signal GT3_TXPOSTCURSOR_IN                     : std_logic_vector(4 downto 0);
	signal GT3_TXPRECURSOR_IN                      : std_logic_vector(4 downto 0);
	--------------------- TX Initialization and Reset Ports --------------------
	signal GT3_GTTXRESET_IN                        : std_logic;
	signal GT3_TXUSERRDY_IN                        : std_logic;
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	signal GT3_TXUSRCLK_IN                         : std_logic;
	signal GT3_TXUSRCLK2_IN                        : std_logic;
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	signal GT3_TXBUFSTATUS_OUT                     : std_logic_vector(1 downto 0);
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	signal GT3_TXDIFFCTRL_IN                       : std_logic_vector(3 downto 0);
	------------------ Transmit Ports - TX Data Path interface -----------------
	-- signal GT3_TXDATA_IN                           : std_logic_vector(15 downto 0);
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	-- signal GT3_GTHTXN_OUT                          : std_logic;
	-- signal GT3_GTHTXP_OUT                          : std_logic;
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	signal GT3_TXOUTCLK_OUT                        : std_logic;
	signal GT3_TXOUTCLKFABRIC_OUT                  : std_logic;
	signal GT3_TXOUTCLKPCS_OUT                     : std_logic;
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	signal GT3_TXRESETDONE_OUT                     : std_logic;
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	-- signal GT3_TXCHARISK_IN                        : std_logic_vector(1 downto 0);


	--____________________________COMMON PORTS________________________________
	---------------------- Common Block  - Ref Clock Ports ---------------------
	signal GT0_GTREFCLK0_COMMON_IN                 : std_logic;
	------------------------- Common Block - QPLL Ports ------------------------
	signal GT0_QPLLLOCK_OUT                        : std_logic;
	signal GT0_QPLLLOCKDETCLK_IN                   : std_logic;
	signal GT0_QPLLPD_IN                           : std_logic;
	signal GT0_QPLLREFCLKLOST_OUT                  : std_logic;
	signal GT0_QPLLRESET_IN                        : std_logic;	
	
	
	component gtwizard_27 
	generic
	(
		QPLL_FBDIV_TOP                 : integer  := 80;

		-- Simulation attributes
		EXAMPLE_SIMULATION             : integer  := 0;      -- Set to 1 for simulation
		WRAPPER_SIM_GTRESET_SPEEDUP    : string   := "FALSE" -- Set to "TRUE" to speed up sim reset
	);
	port
	(
		--_________________________________________________________________________
		--_________________________________________________________________________
		--GT0  (X0Y0)
		--____________________________CHANNEL PORTS________________________________
		GT0_DRP_BUSY_OUT                        : out  std_logic; 
		---------------------------- Channel - DRP Ports  --------------------------
		GT0_DRPADDR_IN                          : in   std_logic_vector(8 downto 0);
		GT0_DRPCLK_IN                           : in   std_logic;
		GT0_DRPDI_IN                            : in   std_logic_vector(15 downto 0);
		GT0_DRPDO_OUT                           : out  std_logic_vector(15 downto 0);
		GT0_DRPEN_IN                            : in   std_logic;
		GT0_DRPRDY_OUT                          : out  std_logic;
		GT0_DRPWE_IN                            : in   std_logic;
		------------------------------- Loopback Ports -----------------------------
		GT0_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
		------------------------------ Power-Down Ports ----------------------------
		GT0_RXPD_IN                             : in   std_logic_vector(1 downto 0);
		GT0_TXPD_IN                             : in   std_logic_vector(1 downto 0);
		--------------------- RX Initialization and Reset Ports --------------------
		GT0_RXUSERRDY_IN                        : in   std_logic;
		-------------------------- RX Margin Analysis Ports ------------------------
		GT0_EYESCANDATAERROR_OUT                : out  std_logic;
		------------------------- Receive Ports - CDR Ports ------------------------
		GT0_RXCDRLOCK_OUT                       : out  std_logic;
		------------------ Receive Ports - FPGA RX Interface Ports -----------------
		GT0_RXUSRCLK_IN                         : in   std_logic;
		GT0_RXUSRCLK2_IN                        : in   std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		GT0_RXDATA_OUT                          : out  std_logic_vector(15 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		GT0_RXDISPERR_OUT                       : out  std_logic_vector(1 downto 0);
		GT0_RXNOTINTABLE_OUT                    : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		GT0_GTHRXN_IN                           : in   std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		GT0_RXBUFRESET_IN                       : in   std_logic;
		GT0_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		GT0_RXMCOMMAALIGNEN_IN                  : in   std_logic;
		GT0_RXPCOMMAALIGNEN_IN                  : in   std_logic;
		-------------------- Receive Ports - RX Equailizer Ports -------------------
		GT0_RXLPMHFHOLD_IN                      : in   std_logic;
		GT0_RXLPMLFHOLD_IN                      : in   std_logic;
		--------------- Receive Ports - RX Fabric Output Control Ports -------------
		GT0_RXOUTCLK_OUT                        : out  std_logic;
		------------- Receive Ports - RX Initialization and Reset Ports ------------
		GT0_GTRXRESET_IN                        : in   std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		GT0_RXCHARISCOMMA_OUT                   : out  std_logic_vector(1 downto 0);
		GT0_RXCHARISK_OUT                       : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		GT0_GTHRXP_IN                           : in   std_logic;
		-------------- Receive Ports -RX Initialization and Reset Ports ------------
		GT0_RXRESETDONE_OUT                     : out  std_logic;
		------------------------ TX Configurable Driver Ports ----------------------
		GT0_TXPOSTCURSOR_IN                     : in   std_logic_vector(4 downto 0);
		GT0_TXPRECURSOR_IN                      : in   std_logic_vector(4 downto 0);
		--------------------- TX Initialization and Reset Ports --------------------
		GT0_GTTXRESET_IN                        : in   std_logic;
		GT0_TXUSERRDY_IN                        : in   std_logic;
		------------------ Transmit Ports - FPGA TX Interface Ports ----------------
		GT0_TXUSRCLK_IN                         : in   std_logic;
		GT0_TXUSRCLK2_IN                        : in   std_logic;
		---------------------- Transmit Ports - TX Buffer Ports --------------------
		GT0_TXBUFSTATUS_OUT                     : out  std_logic_vector(1 downto 0);
		--------------- Transmit Ports - TX Configurable Driver Ports --------------
		GT0_TXDIFFCTRL_IN                       : in   std_logic_vector(3 downto 0);
		------------------ Transmit Ports - TX Data Path interface -----------------
		GT0_TXDATA_IN                           : in   std_logic_vector(15 downto 0);
		---------------- Transmit Ports - TX Driver and OOB signaling --------------
		GT0_GTHTXN_OUT                          : out  std_logic;
		GT0_GTHTXP_OUT                          : out  std_logic;
		----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
		GT0_TXOUTCLK_OUT                        : out  std_logic;
		GT0_TXOUTCLKFABRIC_OUT                  : out  std_logic;
		GT0_TXOUTCLKPCS_OUT                     : out  std_logic;
		------------- Transmit Ports - TX Initialization and Reset Ports -----------
		GT0_TXRESETDONE_OUT                     : out  std_logic;
		----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
		GT0_TXCHARISK_IN                        : in   std_logic_vector(1 downto 0);

		--GT1  (X0Y1)
		--____________________________CHANNEL PORTS________________________________
		GT1_DRP_BUSY_OUT                        : out  std_logic; 
		---------------------------- Channel - DRP Ports  --------------------------
		GT1_DRPADDR_IN                          : in   std_logic_vector(8 downto 0);
		GT1_DRPCLK_IN                           : in   std_logic;
		GT1_DRPDI_IN                            : in   std_logic_vector(15 downto 0);
		GT1_DRPDO_OUT                           : out  std_logic_vector(15 downto 0);
		GT1_DRPEN_IN                            : in   std_logic;
		GT1_DRPRDY_OUT                          : out  std_logic;
		GT1_DRPWE_IN                            : in   std_logic;
		------------------------------- Loopback Ports -----------------------------
		GT1_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
		------------------------------ Power-Down Ports ----------------------------
		GT1_RXPD_IN                             : in   std_logic_vector(1 downto 0);
		GT1_TXPD_IN                             : in   std_logic_vector(1 downto 0);
		--------------------- RX Initialization and Reset Ports --------------------
		GT1_RXUSERRDY_IN                        : in   std_logic;
		-------------------------- RX Margin Analysis Ports ------------------------
		GT1_EYESCANDATAERROR_OUT                : out  std_logic;
		------------------------- Receive Ports - CDR Ports ------------------------
		GT1_RXCDRLOCK_OUT                       : out  std_logic;
		------------------ Receive Ports - FPGA RX Interface Ports -----------------
		GT1_RXUSRCLK_IN                         : in   std_logic;
		GT1_RXUSRCLK2_IN                        : in   std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		GT1_RXDATA_OUT                          : out  std_logic_vector(15 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		GT1_RXDISPERR_OUT                       : out  std_logic_vector(1 downto 0);
		GT1_RXNOTINTABLE_OUT                    : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		GT1_GTHRXN_IN                           : in   std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		GT1_RXBUFRESET_IN                       : in   std_logic;
		GT1_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		GT1_RXMCOMMAALIGNEN_IN                  : in   std_logic;
		GT1_RXPCOMMAALIGNEN_IN                  : in   std_logic;
		-------------------- Receive Ports - RX Equailizer Ports -------------------
		GT1_RXLPMHFHOLD_IN                      : in   std_logic;
		GT1_RXLPMLFHOLD_IN                      : in   std_logic;
		--------------- Receive Ports - RX Fabric Output Control Ports -------------
		GT1_RXOUTCLK_OUT                        : out  std_logic;
		------------- Receive Ports - RX Initialization and Reset Ports ------------
		GT1_GTRXRESET_IN                        : in   std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		GT1_RXCHARISCOMMA_OUT                   : out  std_logic_vector(1 downto 0);
		GT1_RXCHARISK_OUT                       : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		GT1_GTHRXP_IN                           : in   std_logic;
		-------------- Receive Ports -RX Initialization and Reset Ports ------------
		GT1_RXRESETDONE_OUT                     : out  std_logic;
		------------------------ TX Configurable Driver Ports ----------------------
		GT1_TXPOSTCURSOR_IN                     : in   std_logic_vector(4 downto 0);
		GT1_TXPRECURSOR_IN                      : in   std_logic_vector(4 downto 0);
		--------------------- TX Initialization and Reset Ports --------------------
		GT1_GTTXRESET_IN                        : in   std_logic;
		GT1_TXUSERRDY_IN                        : in   std_logic;
		------------------ Transmit Ports - FPGA TX Interface Ports ----------------
		GT1_TXUSRCLK_IN                         : in   std_logic;
		GT1_TXUSRCLK2_IN                        : in   std_logic;
		---------------------- Transmit Ports - TX Buffer Ports --------------------
		GT1_TXBUFSTATUS_OUT                     : out  std_logic_vector(1 downto 0);
		--------------- Transmit Ports - TX Configurable Driver Ports --------------
		GT1_TXDIFFCTRL_IN                       : in   std_logic_vector(3 downto 0);
		------------------ Transmit Ports - TX Data Path interface -----------------
		GT1_TXDATA_IN                           : in   std_logic_vector(15 downto 0);
		---------------- Transmit Ports - TX Driver and OOB signaling --------------
		GT1_GTHTXN_OUT                          : out  std_logic;
		GT1_GTHTXP_OUT                          : out  std_logic;
		----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
		GT1_TXOUTCLK_OUT                        : out  std_logic;
		GT1_TXOUTCLKFABRIC_OUT                  : out  std_logic;
		GT1_TXOUTCLKPCS_OUT                     : out  std_logic;
		------------- Transmit Ports - TX Initialization and Reset Ports -----------
		GT1_TXRESETDONE_OUT                     : out  std_logic;
		----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
		GT1_TXCHARISK_IN                        : in   std_logic_vector(1 downto 0);

		--GT2  (X0Y2)
		--____________________________CHANNEL PORTS________________________________
		GT2_DRP_BUSY_OUT                        : out  std_logic; 
		---------------------------- Channel - DRP Ports  --------------------------
		GT2_DRPADDR_IN                          : in   std_logic_vector(8 downto 0);
		GT2_DRPCLK_IN                           : in   std_logic;
		GT2_DRPDI_IN                            : in   std_logic_vector(15 downto 0);
		GT2_DRPDO_OUT                           : out  std_logic_vector(15 downto 0);
		GT2_DRPEN_IN                            : in   std_logic;
		GT2_DRPRDY_OUT                          : out  std_logic;
		GT2_DRPWE_IN                            : in   std_logic;
		------------------------------- Loopback Ports -----------------------------
		GT2_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
		------------------------------ Power-Down Ports ----------------------------
		GT2_RXPD_IN                             : in   std_logic_vector(1 downto 0);
		GT2_TXPD_IN                             : in   std_logic_vector(1 downto 0);
		--------------------- RX Initialization and Reset Ports --------------------
		GT2_RXUSERRDY_IN                        : in   std_logic;
		-------------------------- RX Margin Analysis Ports ------------------------
		GT2_EYESCANDATAERROR_OUT                : out  std_logic;
		------------------------- Receive Ports - CDR Ports ------------------------
		GT2_RXCDRLOCK_OUT                       : out  std_logic;
		------------------ Receive Ports - FPGA RX Interface Ports -----------------
		GT2_RXUSRCLK_IN                         : in   std_logic;
		GT2_RXUSRCLK2_IN                        : in   std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		GT2_RXDATA_OUT                          : out  std_logic_vector(15 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		GT2_RXDISPERR_OUT                       : out  std_logic_vector(1 downto 0);
		GT2_RXNOTINTABLE_OUT                    : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		GT2_GTHRXN_IN                           : in   std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		GT2_RXBUFRESET_IN                       : in   std_logic;
		GT2_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		GT2_RXMCOMMAALIGNEN_IN                  : in   std_logic;
		GT2_RXPCOMMAALIGNEN_IN                  : in   std_logic;
		-------------------- Receive Ports - RX Equailizer Ports -------------------
		GT2_RXLPMHFHOLD_IN                      : in   std_logic;
		GT2_RXLPMLFHOLD_IN                      : in   std_logic;
		--------------- Receive Ports - RX Fabric Output Control Ports -------------
		GT2_RXOUTCLK_OUT                        : out  std_logic;
		------------- Receive Ports - RX Initialization and Reset Ports ------------
		GT2_GTRXRESET_IN                        : in   std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		GT2_RXCHARISCOMMA_OUT                   : out  std_logic_vector(1 downto 0);
		GT2_RXCHARISK_OUT                       : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		GT2_GTHRXP_IN                           : in   std_logic;
		-------------- Receive Ports -RX Initialization and Reset Ports ------------
		GT2_RXRESETDONE_OUT                     : out  std_logic;
		------------------------ TX Configurable Driver Ports ----------------------
		GT2_TXPOSTCURSOR_IN                     : in   std_logic_vector(4 downto 0);
		GT2_TXPRECURSOR_IN                      : in   std_logic_vector(4 downto 0);
		--------------------- TX Initialization and Reset Ports --------------------
		GT2_GTTXRESET_IN                        : in   std_logic;
		GT2_TXUSERRDY_IN                        : in   std_logic;
		------------------ Transmit Ports - FPGA TX Interface Ports ----------------
		GT2_TXUSRCLK_IN                         : in   std_logic;
		GT2_TXUSRCLK2_IN                        : in   std_logic;
		---------------------- Transmit Ports - TX Buffer Ports --------------------
		GT2_TXBUFSTATUS_OUT                     : out  std_logic_vector(1 downto 0);
		--------------- Transmit Ports - TX Configurable Driver Ports --------------
		GT2_TXDIFFCTRL_IN                       : in   std_logic_vector(3 downto 0);
		------------------ Transmit Ports - TX Data Path interface -----------------
		GT2_TXDATA_IN                           : in   std_logic_vector(15 downto 0);
		---------------- Transmit Ports - TX Driver and OOB signaling --------------
		GT2_GTHTXN_OUT                          : out  std_logic;
		GT2_GTHTXP_OUT                          : out  std_logic;
		----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
		GT2_TXOUTCLK_OUT                        : out  std_logic;
		GT2_TXOUTCLKFABRIC_OUT                  : out  std_logic;
		GT2_TXOUTCLKPCS_OUT                     : out  std_logic;
		------------- Transmit Ports - TX Initialization and Reset Ports -----------
		GT2_TXRESETDONE_OUT                     : out  std_logic;
		----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
		GT2_TXCHARISK_IN                        : in   std_logic_vector(1 downto 0);
		--GT3  (X0Y3)
		--____________________________CHANNEL PORTS________________________________
		GT3_DRP_BUSY_OUT                        : out  std_logic; 
		---------------------------- Channel - DRP Ports  --------------------------
		GT3_DRPADDR_IN                          : in   std_logic_vector(8 downto 0);
		GT3_DRPCLK_IN                           : in   std_logic;
		GT3_DRPDI_IN                            : in   std_logic_vector(15 downto 0);
		GT3_DRPDO_OUT                           : out  std_logic_vector(15 downto 0);
		GT3_DRPEN_IN                            : in   std_logic;
		GT3_DRPRDY_OUT                          : out  std_logic;
		GT3_DRPWE_IN                            : in   std_logic;
		------------------------------- Loopback Ports -----------------------------
		GT3_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
		------------------------------ Power-Down Ports ----------------------------
		GT3_RXPD_IN                             : in   std_logic_vector(1 downto 0);
		GT3_TXPD_IN                             : in   std_logic_vector(1 downto 0);
		--------------------- RX Initialization and Reset Ports --------------------
		GT3_RXUSERRDY_IN                        : in   std_logic;
		-------------------------- RX Margin Analysis Ports ------------------------
		GT3_EYESCANDATAERROR_OUT                : out  std_logic;
		------------------------- Receive Ports - CDR Ports ------------------------
		GT3_RXCDRLOCK_OUT                       : out  std_logic;
		------------------ Receive Ports - FPGA RX Interface Ports -----------------
		GT3_RXUSRCLK_IN                         : in   std_logic;
		GT3_RXUSRCLK2_IN                        : in   std_logic;
		------------------ Receive Ports - FPGA RX interface Ports -----------------
		GT3_RXDATA_OUT                          : out  std_logic_vector(15 downto 0);
		------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
		GT3_RXDISPERR_OUT                       : out  std_logic_vector(1 downto 0);
		GT3_RXNOTINTABLE_OUT                    : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports - RX AFE Ports ----------------------
		GT3_GTHRXN_IN                           : in   std_logic;
		------------------- Receive Ports - RX Buffer Bypass Ports -----------------
		GT3_RXBUFRESET_IN                       : in   std_logic;
		GT3_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
		-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
		GT3_RXMCOMMAALIGNEN_IN                  : in   std_logic;
		GT3_RXPCOMMAALIGNEN_IN                  : in   std_logic;
		-------------------- Receive Ports - RX Equailizer Ports -------------------
		GT3_RXLPMHFHOLD_IN                      : in   std_logic;
		GT3_RXLPMLFHOLD_IN                      : in   std_logic;
		--------------- Receive Ports - RX Fabric Output Control Ports -------------
		GT3_RXOUTCLK_OUT                        : out  std_logic;
		------------- Receive Ports - RX Initialization and Reset Ports ------------
		GT3_GTRXRESET_IN                        : in   std_logic;
		------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
		GT3_RXCHARISCOMMA_OUT                   : out  std_logic_vector(1 downto 0);
		GT3_RXCHARISK_OUT                       : out  std_logic_vector(1 downto 0);
		------------------------ Receive Ports -RX AFE Ports -----------------------
		GT3_GTHRXP_IN                           : in   std_logic;
		-------------- Receive Ports -RX Initialization and Reset Ports ------------
		GT3_RXRESETDONE_OUT                     : out  std_logic;
		------------------------ TX Configurable Driver Ports ----------------------
		GT3_TXPOSTCURSOR_IN                     : in   std_logic_vector(4 downto 0);
		GT3_TXPRECURSOR_IN                      : in   std_logic_vector(4 downto 0);
		--------------------- TX Initialization and Reset Ports --------------------
		GT3_GTTXRESET_IN                        : in   std_logic;
		GT3_TXUSERRDY_IN                        : in   std_logic;
		------------------ Transmit Ports - FPGA TX Interface Ports ----------------
		GT3_TXUSRCLK_IN                         : in   std_logic;
		GT3_TXUSRCLK2_IN                        : in   std_logic;
		---------------------- Transmit Ports - TX Buffer Ports --------------------
		GT3_TXBUFSTATUS_OUT                     : out  std_logic_vector(1 downto 0);
		--------------- Transmit Ports - TX Configurable Driver Ports --------------
		GT3_TXDIFFCTRL_IN                       : in   std_logic_vector(3 downto 0);
		------------------ Transmit Ports - TX Data Path interface -----------------
		GT3_TXDATA_IN                           : in   std_logic_vector(15 downto 0);
		---------------- Transmit Ports - TX Driver and OOB signaling --------------
		GT3_GTHTXN_OUT                          : out  std_logic;
		GT3_GTHTXP_OUT                          : out  std_logic;
		----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
		GT3_TXOUTCLK_OUT                        : out  std_logic;
		GT3_TXOUTCLKFABRIC_OUT                  : out  std_logic;
		GT3_TXOUTCLKPCS_OUT                     : out  std_logic;
		------------- Transmit Ports - TX Initialization and Reset Ports -----------
		GT3_TXRESETDONE_OUT                     : out  std_logic;
		----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
		GT3_TXCHARISK_IN                        : in   std_logic_vector(1 downto 0);


		--____________________________COMMON PORTS________________________________
		---------------------- Common Block  - Ref Clock Ports ---------------------
		GT0_GTREFCLK0_COMMON_IN                 : in   std_logic;
		------------------------- Common Block - QPLL Ports ------------------------
		GT0_QPLLLOCK_OUT                        : out  std_logic;
		GT0_QPLLLOCKDETCLK_IN                   : in   std_logic;
		GT0_QPLLPD_IN                           : in   std_logic;
		GT0_QPLLREFCLKLOST_OUT                  : out  std_logic;
		GT0_QPLLRESET_IN                        : in   std_logic

	);
	end component;
	
begin
	tied_to_ground_i                             <= '0';
	tied_to_ground_vec_i                         <= x"0000000000000000";
	tied_to_vcc_i                                <= '1';
	tied_to_vcc_vec_i                            <= "11111111";

	-- enables comma_alignment, when receiver is ready, TODO: needs to be checked	
	gt0_rxmcommaalignen_in <= gt0_rxresetdone_out;--similar to gtx
	gt0_rxpcommaalignen_in <= gt0_rxresetdone_out;
	gt1_rxmcommaalignen_in <= gt1_rxresetdone_out;
	gt1_rxpcommaalignen_in <= gt1_rxresetdone_out;
	gt2_rxmcommaalignen_in <= gt2_rxresetdone_out;
	gt2_rxpcommaalignen_in <= gt2_rxresetdone_out;
	gt3_rxmcommaalignen_in <= gt3_rxresetdone_out;
	gt3_rxpcommaalignen_in <= gt3_rxresetdone_out;

	
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
	-- SOFT_RESET_IN<=not QuadControl(1);--probe_out0(0);--user reset can be pulled at any time
	
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

	--like for gtx
	gt0_rxuserrdy_in<='1';--probe_out0(2);--like GTX
	gt1_rxuserrdy_in<='1';--probe_out0(2);--like GTX
	gt2_rxuserrdy_in<='1';--probe_out0(2);--like GTX
	gt3_rxuserrdy_in<='1';--probe_out0(2);--like GTX
	
	gt0_txuserrdy_in<='1';--probe_out0(2);--like GTX
	gt1_txuserrdy_in<='1';--probe_out0(2);--like GTX
	gt2_txuserrdy_in<='1';--probe_out0(2);--like GTX
	gt3_txuserrdy_in<='1';--probe_out0(2);--like GTX
	
	--probably not ok...
	GT0_RXLPMHFHOLD_IN<='0';
	GT1_RXLPMHFHOLD_IN<='0';
	GT2_RXLPMHFHOLD_IN<='0';
	GT3_RXLPMHFHOLD_IN<='0';
	--probably not ok...
	GT0_RXLPMLFHOLD_IN<='0';
	GT1_RXLPMLFHOLD_IN<='0';
	GT2_RXLPMLFHOLD_IN<='0';
	GT3_RXLPMLFHOLD_IN<='0';
	
	-- gt0_eyescanreset_in<=tied_to_ground_i;
	-- gt0_eyescantrigger_in<=tied_to_ground_i;
	-- gt0_gtrxreset_in<=ChannelControl3(20);
	-- gt0_gttxreset_in<=ChannelControl3(19);
	-- gt1_eyescanreset_in<=tied_to_ground_i;
	-- gt1_eyescantrigger_in<=tied_to_ground_i;
	-- gt1_gtrxreset_in<=ChannelControl3(20);
	-- gt1_gttxreset_in<=ChannelControl3(19);
	-- gt2_eyescanreset_in<=tied_to_ground_i;
	-- gt2_eyescantrigger_in<=tied_to_ground_i;
	-- gt2_gtrxreset_in<=ChannelControl3(20);
	-- gt2_gttxreset_in<=ChannelControl3(19);
	-- gt3_eyescanreset_in<=tied_to_ground_i;
	-- gt3_eyescantrigger_in<=tied_to_ground_i;
	-- gt3_gtrxreset_in<=ChannelControl3(20);
	-- gt3_gttxreset_in<=ChannelControl3(19);
	
	gt0_rxbufreset_in<=ChannelControl0(21);
	gt1_rxbufreset_in<=ChannelControl1(21);
	gt2_rxbufreset_in<=ChannelControl2(21);
	gt3_rxbufreset_in<=ChannelControl3(21);	
	
	-- gt0_rxmonitorsel_in<="00";
	-- gt1_rxmonitorsel_in<="00";
	-- gt2_rxmonitorsel_in<="00";
	-- gt3_rxmonitorsel_in<="00";
	
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

	--only for IP Core version 2.7
	ChannelStatus0(31)<=GT0_QPLLREFCLKLOST_OUT;
	ChannelStatus1(31)<=GT0_QPLLREFCLKLOST_OUT;
	ChannelStatus2(31)<=GT0_QPLLREFCLKLOST_OUT;
	ChannelStatus3(31)<=GT0_QPLLREFCLKLOST_OUT;
	
	ChannelStatus0(6 downto 5)<=GT0_RXDISPERR_OUT;
	ChannelStatus1(6 downto 5)<=GT1_RXDISPERR_OUT;
	ChannelStatus2(6 downto 5)<=GT2_RXDISPERR_OUT;
	ChannelStatus3(6 downto 5)<=GT3_RXDISPERR_OUT;
	
	ChannelStatus0(8 downto 7)<=GT0_RXNOTINTABLE_OUT;
	ChannelStatus1(8 downto 7)<=GT1_RXNOTINTABLE_OUT;
	ChannelStatus2(8 downto 7)<=GT2_RXNOTINTABLE_OUT;
	ChannelStatus3(8 downto 7)<=GT3_RXNOTINTABLE_OUT;
	
	gtwizard_27_i : gtwizard_27
    generic map
    (
        -- Simulation attributes
        WRAPPER_SIM_GTRESET_SPEEDUP =>  "TRUE"         -- Speedup is turned on for simulation
    ) 
    port map
    (
	--_____________________________________________________________________
	--_____________________________________________________________________
	  --____________________________CHANNEL PORTS________________________________
	GT0_DRP_BUSY_OUT                => GT0_DRP_BUSY_OUT,
	---------------------------- Channel - DRP Ports  --------------------------
	GT0_DRPADDR_IN                  => GT0_DRPADDR_IN,--
	GT0_DRPCLK_IN                   => GT0_DRPCLK_IN,--
	GT0_DRPDI_IN                    => GT0_DRPDI_IN,--
	GT0_DRPDO_OUT                   => GT0_DRPDO_OUT,--
	GT0_DRPEN_IN                    => GT0_DRPEN_IN,--
	GT0_DRPRDY_OUT                  => GT0_DRPRDY_OUT,--
	GT0_DRPWE_IN                    => GT0_DRPWE_IN,--
	------------------------------- Loopback Ports -----------------------------
	GT0_LOOPBACK_IN                 => GT0_LOOPBACK_IN,--
	------------------------------ Power-Down Ports ----------------------------
	GT0_RXPD_IN                     => GT0_RXPD_IN,--
	GT0_TXPD_IN                     => GT0_TXPD_IN,--
	--------------------- RX Initialization and Reset Ports --------------------
	GT0_RXUSERRDY_IN                => GT0_RXUSERRDY_IN,--
	-------------------------- RX Margin Analysis Ports ------------------------
	GT0_EYESCANDATAERROR_OUT        => GT0_EYESCANDATAERROR_OUT,--
	------------------------- Receive Ports - CDR Ports ------------------------
	GT0_RXCDRLOCK_OUT               => GT0_RXCDRLOCK_OUT,--
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	GT0_RXUSRCLK_IN                 => GT0_RXUSRCLK_IN,--
	GT0_RXUSRCLK2_IN                => GT0_RXUSRCLK2_IN,--
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	GT0_RXDATA_OUT                  => GT0_RXDATA_OUT,--
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	GT0_RXDISPERR_OUT               => GT0_RXDISPERR_OUT,--
	GT0_RXNOTINTABLE_OUT            => GT0_RXNOTINTABLE_OUT,--
	------------------------ Receive Ports - RX AFE Ports ----------------------
	GT0_GTHRXN_IN                   => GT0_GTHRXN_IN,--
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	GT0_RXBUFRESET_IN               => GT0_RXBUFRESET_IN,--
	GT0_RXBUFSTATUS_OUT             => GT0_RXBUFSTATUS_OUT,--
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	GT0_RXMCOMMAALIGNEN_IN          => GT0_RXMCOMMAALIGNEN_IN,--
	GT0_RXPCOMMAALIGNEN_IN          => GT0_RXPCOMMAALIGNEN_IN,--
	-------------------- Receive Ports - RX Equailizer Ports -------------------
	GT0_RXLPMHFHOLD_IN              => GT0_RXLPMHFHOLD_IN,
	GT0_RXLPMLFHOLD_IN              => GT0_RXLPMLFHOLD_IN,
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	GT0_RXOUTCLK_OUT                => GT0_RXOUTCLK_OUT,--
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	GT0_GTRXRESET_IN                => GT0_GTRXRESET_IN,--
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	GT0_RXCHARISCOMMA_OUT           => GT0_RXCHARISCOMMA_OUT,--
	GT0_RXCHARISK_OUT               => GT0_RXCHARISK_OUT,--
	------------------------ Receive Ports -RX AFE Ports -----------------------
	GT0_GTHRXP_IN                   => GT0_GTHRXP_IN,--
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	GT0_RXRESETDONE_OUT             => GT0_RXRESETDONE_OUT,
	------------------------ TX Configurable Driver Ports ----------------------
	GT0_TXPOSTCURSOR_IN             => GT0_TXPOSTCURSOR_IN,--
	GT0_TXPRECURSOR_IN              => GT0_TXPRECURSOR_IN,--
	--------------------- TX Initialization and Reset Ports --------------------
	GT0_GTTXRESET_IN                => GT0_GTTXRESET_IN,--
	GT0_TXUSERRDY_IN                => GT0_TXUSERRDY_IN,--
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	GT0_TXUSRCLK_IN                 => GT0_TXUSRCLK_IN,--
	GT0_TXUSRCLK2_IN                => GT0_TXUSRCLK2_IN,--
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	GT0_TXBUFSTATUS_OUT             => GT0_TXBUFSTATUS_OUT,--
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	GT0_TXDIFFCTRL_IN               => GT0_TXDIFFCTRL_IN,--
	------------------ Transmit Ports - TX Data Path interface -----------------
	GT0_TXDATA_IN                   => GT0_TXDATA_IN,--
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	GT0_GTHTXN_OUT                  => GT0_GTHTXN_OUT,--
	GT0_GTHTXP_OUT                  => GT0_GTHTXP_OUT,--
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	GT0_TXOUTCLK_OUT                => GT0_TXOUTCLK_OUT,--
	GT0_TXOUTCLKFABRIC_OUT          => GT0_TXOUTCLKFABRIC_OUT,--
	GT0_TXOUTCLKPCS_OUT             => GT0_TXOUTCLKPCS_OUT,--
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	GT0_TXRESETDONE_OUT             => GT0_TXRESETDONE_OUT,--
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	GT0_TXCHARISK_IN                => GT0_TXCHARISK_IN,--
	--_____________________________________________________________________
	--_____________________________________________________________________
	  --____________________________CHANNEL PORTS________________________________
	GT1_DRP_BUSY_OUT                => GT1_DRP_BUSY_OUT,
	---------------------------- Channel - DRP Ports  --------------------------
	GT1_DRPADDR_IN                  => GT1_DRPADDR_IN,
	GT1_DRPCLK_IN                   => GT1_DRPCLK_IN,
	GT1_DRPDI_IN                    => GT1_DRPDI_IN,
	GT1_DRPDO_OUT                   => GT1_DRPDO_OUT,
	GT1_DRPEN_IN                    => GT1_DRPEN_IN,
	GT1_DRPRDY_OUT                  => GT1_DRPRDY_OUT,
	GT1_DRPWE_IN                    => GT1_DRPWE_IN,
	------------------------------- Loopback Ports -----------------------------
	GT1_LOOPBACK_IN                 => GT1_LOOPBACK_IN,
	------------------------------ Power-Down Ports ----------------------------
	GT1_RXPD_IN                     => GT1_RXPD_IN,
	GT1_TXPD_IN                     => GT1_TXPD_IN,
	--------------------- RX Initialization and Reset Ports --------------------
	GT1_RXUSERRDY_IN                => GT1_RXUSERRDY_IN,
	-------------------------- RX Margin Analysis Ports ------------------------
	GT1_EYESCANDATAERROR_OUT        => GT1_EYESCANDATAERROR_OUT,
	------------------------- Receive Ports - CDR Ports ------------------------
	GT1_RXCDRLOCK_OUT               => GT1_RXCDRLOCK_OUT,
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	GT1_RXUSRCLK_IN                 => GT1_RXUSRCLK_IN,
	GT1_RXUSRCLK2_IN                => GT1_RXUSRCLK2_IN,
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	GT1_RXDATA_OUT                  => GT1_RXDATA_OUT,
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	GT1_RXDISPERR_OUT               => GT1_RXDISPERR_OUT,
	GT1_RXNOTINTABLE_OUT            => GT1_RXNOTINTABLE_OUT,
	------------------------ Receive Ports - RX AFE Ports ----------------------
	GT1_GTHRXN_IN                   => GT1_GTHRXN_IN,
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	GT1_RXBUFRESET_IN               => GT1_RXBUFRESET_IN,
	GT1_RXBUFSTATUS_OUT             => GT1_RXBUFSTATUS_OUT,
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	GT1_RXMCOMMAALIGNEN_IN          => GT1_RXMCOMMAALIGNEN_IN,
	GT1_RXPCOMMAALIGNEN_IN          => GT1_RXPCOMMAALIGNEN_IN,
	-------------------- Receive Ports - RX Equailizer Ports -------------------
	GT1_RXLPMHFHOLD_IN              => GT1_RXLPMHFHOLD_IN,
	GT1_RXLPMLFHOLD_IN              => GT1_RXLPMLFHOLD_IN,
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	GT1_RXOUTCLK_OUT                => GT1_RXOUTCLK_OUT,
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	GT1_GTRXRESET_IN                => GT1_GTRXRESET_IN,
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	GT1_RXCHARISCOMMA_OUT           => GT1_RXCHARISCOMMA_OUT,
	GT1_RXCHARISK_OUT               => GT1_RXCHARISK_OUT,
	------------------------ Receive Ports -RX AFE Ports -----------------------
	GT1_GTHRXP_IN                   => GT1_GTHRXP_IN,
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	GT1_RXRESETDONE_OUT             => GT1_RXRESETDONE_OUT,
	------------------------ TX Configurable Driver Ports ----------------------
	GT1_TXPOSTCURSOR_IN             => GT1_TXPOSTCURSOR_IN,
	GT1_TXPRECURSOR_IN              => GT1_TXPRECURSOR_IN,
	--------------------- TX Initialization and Reset Ports --------------------
	GT1_GTTXRESET_IN                => GT1_GTTXRESET_IN,
	GT1_TXUSERRDY_IN                => GT1_TXUSERRDY_IN,
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	GT1_TXUSRCLK_IN                 => GT1_TXUSRCLK_IN,
	GT1_TXUSRCLK2_IN                => GT1_TXUSRCLK2_IN,
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	GT1_TXBUFSTATUS_OUT             => GT1_TXBUFSTATUS_OUT,
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	GT1_TXDIFFCTRL_IN               => GT1_TXDIFFCTRL_IN,
	------------------ Transmit Ports - TX Data Path interface -----------------
	GT1_TXDATA_IN                   => GT1_TXDATA_IN,
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	GT1_GTHTXN_OUT                  => GT1_GTHTXN_OUT,
	GT1_GTHTXP_OUT                  => GT1_GTHTXP_OUT,
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	GT1_TXOUTCLK_OUT                => GT1_TXOUTCLK_OUT,
	GT1_TXOUTCLKFABRIC_OUT          => GT1_TXOUTCLKFABRIC_OUT,
	GT1_TXOUTCLKPCS_OUT             => GT1_TXOUTCLKPCS_OUT,
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	GT1_TXRESETDONE_OUT             => GT1_TXRESETDONE_OUT,
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	GT1_TXCHARISK_IN                => GT1_TXCHARISK_IN,
	--_____________________________________________________________________
	--_____________________________________________________________________
	  --____________________________CHANNEL PORTS________________________________
	GT2_DRP_BUSY_OUT                => GT2_DRP_BUSY_OUT,
	---------------------------- Channel - DRP Ports  --------------------------
	GT2_DRPADDR_IN                  => GT2_DRPADDR_IN,
	GT2_DRPCLK_IN                   => GT2_DRPCLK_IN,
	GT2_DRPDI_IN                    => GT2_DRPDI_IN,
	GT2_DRPDO_OUT                   => GT2_DRPDO_OUT,
	GT2_DRPEN_IN                    => GT2_DRPEN_IN,
	GT2_DRPRDY_OUT                  => GT2_DRPRDY_OUT,
	GT2_DRPWE_IN                    => GT2_DRPWE_IN,
	------------------------------- Loopback Ports -----------------------------
	GT2_LOOPBACK_IN                 => GT2_LOOPBACK_IN,
	------------------------------ Power-Down Ports ----------------------------
	GT2_RXPD_IN                     => GT2_RXPD_IN,
	GT2_TXPD_IN                     => GT2_TXPD_IN,
	--------------------- RX Initialization and Reset Ports --------------------
	GT2_RXUSERRDY_IN                => GT2_RXUSERRDY_IN,
	-------------------------- RX Margin Analysis Ports ------------------------
	GT2_EYESCANDATAERROR_OUT        => GT2_EYESCANDATAERROR_OUT,
	------------------------- Receive Ports - CDR Ports ------------------------
	GT2_RXCDRLOCK_OUT               => GT2_RXCDRLOCK_OUT,
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	GT2_RXUSRCLK_IN                 => GT2_RXUSRCLK_IN,
	GT2_RXUSRCLK2_IN                => GT2_RXUSRCLK2_IN,
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	GT2_RXDATA_OUT                  => GT2_RXDATA_OUT,
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	GT2_RXDISPERR_OUT               => GT2_RXDISPERR_OUT,
	GT2_RXNOTINTABLE_OUT            => GT2_RXNOTINTABLE_OUT,
	------------------------ Receive Ports - RX AFE Ports ----------------------
	GT2_GTHRXN_IN                   => GT2_GTHRXN_IN,
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	GT2_RXBUFRESET_IN               => GT2_RXBUFRESET_IN,
	GT2_RXBUFSTATUS_OUT             => GT2_RXBUFSTATUS_OUT,
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	GT2_RXMCOMMAALIGNEN_IN          => GT2_RXMCOMMAALIGNEN_IN,
	GT2_RXPCOMMAALIGNEN_IN          => GT2_RXPCOMMAALIGNEN_IN,
	-------------------- Receive Ports - RX Equailizer Ports -------------------
	GT2_RXLPMHFHOLD_IN              => GT2_RXLPMHFHOLD_IN,
	GT2_RXLPMLFHOLD_IN              => GT2_RXLPMLFHOLD_IN,
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	GT2_RXOUTCLK_OUT                => GT2_RXOUTCLK_OUT,
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	GT2_GTRXRESET_IN                => GT2_GTRXRESET_IN,
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	GT2_RXCHARISCOMMA_OUT           => GT2_RXCHARISCOMMA_OUT,
	GT2_RXCHARISK_OUT               => GT2_RXCHARISK_OUT,
	------------------------ Receive Ports -RX AFE Ports -----------------------
	GT2_GTHRXP_IN                   => GT2_GTHRXP_IN,
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	GT2_RXRESETDONE_OUT             => GT2_RXRESETDONE_OUT,
	------------------------ TX Configurable Driver Ports ----------------------
	GT2_TXPOSTCURSOR_IN             => GT2_TXPOSTCURSOR_IN,
	GT2_TXPRECURSOR_IN              => GT2_TXPRECURSOR_IN,
	--------------------- TX Initialization and Reset Ports --------------------
	GT2_GTTXRESET_IN                => GT2_GTTXRESET_IN,
	GT2_TXUSERRDY_IN                => GT2_TXUSERRDY_IN,
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	GT2_TXUSRCLK_IN                 => GT2_TXUSRCLK_IN,
	GT2_TXUSRCLK2_IN                => GT2_TXUSRCLK2_IN,
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	GT2_TXBUFSTATUS_OUT             => GT2_TXBUFSTATUS_OUT,
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	GT2_TXDIFFCTRL_IN               => GT2_TXDIFFCTRL_IN,
	------------------ Transmit Ports - TX Data Path interface -----------------
	GT2_TXDATA_IN                   => GT2_TXDATA_IN,
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	GT2_GTHTXN_OUT                  => GT2_GTHTXN_OUT,
	GT2_GTHTXP_OUT                  => GT2_GTHTXP_OUT,
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	GT2_TXOUTCLK_OUT                => GT2_TXOUTCLK_OUT,
	GT2_TXOUTCLKFABRIC_OUT          => GT2_TXOUTCLKFABRIC_OUT,
	GT2_TXOUTCLKPCS_OUT             => GT2_TXOUTCLKPCS_OUT,
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	GT2_TXRESETDONE_OUT             => GT2_TXRESETDONE_OUT,
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	GT2_TXCHARISK_IN                => GT2_TXCHARISK_IN,	
	--_____________________________________________________________________
	--_____________________________________________________________________
	  --____________________________CHANNEL PORTS________________________________
	GT3_DRP_BUSY_OUT                => GT3_DRP_BUSY_OUT,
	---------------------------- Channel - DRP Ports  --------------------------
	GT3_DRPADDR_IN                  => GT3_DRPADDR_IN,
	GT3_DRPCLK_IN                   => GT3_DRPCLK_IN,
	GT3_DRPDI_IN                    => GT3_DRPDI_IN,
	GT3_DRPDO_OUT                   => GT3_DRPDO_OUT,
	GT3_DRPEN_IN                    => GT3_DRPEN_IN,
	GT3_DRPRDY_OUT                  => GT3_DRPRDY_OUT,
	GT3_DRPWE_IN                    => GT3_DRPWE_IN,
	------------------------------- Loopback Ports -----------------------------
	GT3_LOOPBACK_IN                 => GT3_LOOPBACK_IN,
	------------------------------ Power-Down Ports ----------------------------
	GT3_RXPD_IN                     => GT3_RXPD_IN,
	GT3_TXPD_IN                     => GT3_TXPD_IN,
	--------------------- RX Initialization and Reset Ports --------------------
	GT3_RXUSERRDY_IN                => GT3_RXUSERRDY_IN,
	-------------------------- RX Margin Analysis Ports ------------------------
	GT3_EYESCANDATAERROR_OUT        => GT3_EYESCANDATAERROR_OUT,
	------------------------- Receive Ports - CDR Ports ------------------------
	GT3_RXCDRLOCK_OUT               => GT3_RXCDRLOCK_OUT,
	------------------ Receive Ports - FPGA RX Interface Ports -----------------
	GT3_RXUSRCLK_IN                 => GT3_RXUSRCLK_IN,
	GT3_RXUSRCLK2_IN                => GT3_RXUSRCLK2_IN,
	------------------ Receive Ports - FPGA RX interface Ports -----------------
	GT3_RXDATA_OUT                  => GT3_RXDATA_OUT,
	------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
	GT3_RXDISPERR_OUT               => GT3_RXDISPERR_OUT,
	GT3_RXNOTINTABLE_OUT            => GT3_RXNOTINTABLE_OUT,
	------------------------ Receive Ports - RX AFE Ports ----------------------
	GT3_GTHRXN_IN                   => GT3_GTHRXN_IN,
	------------------- Receive Ports - RX Buffer Bypass Ports -----------------
	GT3_RXBUFRESET_IN               => GT3_RXBUFRESET_IN,
	GT3_RXBUFSTATUS_OUT             => GT3_RXBUFSTATUS_OUT,
	-------------- Receive Ports - RX Byte and Word Alignment Ports ------------
	GT3_RXMCOMMAALIGNEN_IN          => GT3_RXMCOMMAALIGNEN_IN,
	GT3_RXPCOMMAALIGNEN_IN          => GT3_RXPCOMMAALIGNEN_IN,
	-------------------- Receive Ports - RX Equailizer Ports -------------------
	GT3_RXLPMHFHOLD_IN              => GT3_RXLPMHFHOLD_IN,
	GT3_RXLPMLFHOLD_IN              => GT3_RXLPMLFHOLD_IN,
	--------------- Receive Ports - RX Fabric Output Control Ports -------------
	GT3_RXOUTCLK_OUT                => GT3_RXOUTCLK_OUT,
	------------- Receive Ports - RX Initialization and Reset Ports ------------
	GT3_GTRXRESET_IN                => GT3_GTRXRESET_IN,
	------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
	GT3_RXCHARISCOMMA_OUT           => GT3_RXCHARISCOMMA_OUT,
	GT3_RXCHARISK_OUT               => GT3_RXCHARISK_OUT,
	------------------------ Receive Ports -RX AFE Ports -----------------------
	GT3_GTHRXP_IN                   => GT3_GTHRXP_IN,
	-------------- Receive Ports -RX Initialization and Reset Ports ------------
	GT3_RXRESETDONE_OUT             => GT3_RXRESETDONE_OUT,
	------------------------ TX Configurable Driver Ports ----------------------
	GT3_TXPOSTCURSOR_IN             => GT3_TXPOSTCURSOR_IN,
	GT3_TXPRECURSOR_IN              => GT3_TXPRECURSOR_IN,
	--------------------- TX Initialization and Reset Ports --------------------
	GT3_GTTXRESET_IN                => GT3_GTTXRESET_IN,
	GT3_TXUSERRDY_IN                => GT3_TXUSERRDY_IN,
	------------------ Transmit Ports - FPGA TX Interface Ports ----------------
	GT3_TXUSRCLK_IN                 => GT3_TXUSRCLK_IN,
	GT3_TXUSRCLK2_IN                => GT3_TXUSRCLK2_IN,
	---------------------- Transmit Ports - TX Buffer Ports --------------------
	GT3_TXBUFSTATUS_OUT             => GT3_TXBUFSTATUS_OUT,
	--------------- Transmit Ports - TX Configurable Driver Ports --------------
	GT3_TXDIFFCTRL_IN               => GT3_TXDIFFCTRL_IN,
	------------------ Transmit Ports - TX Data Path interface -----------------
	GT3_TXDATA_IN                   => GT3_TXDATA_IN,
	---------------- Transmit Ports - TX Driver and OOB signaling --------------
	GT3_GTHTXN_OUT                  => GT3_GTHTXN_OUT,
	GT3_GTHTXP_OUT                  => GT3_GTHTXP_OUT,
	----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
	GT3_TXOUTCLK_OUT                => GT3_TXOUTCLK_OUT,
	GT3_TXOUTCLKFABRIC_OUT          => GT3_TXOUTCLKFABRIC_OUT,
	GT3_TXOUTCLKPCS_OUT             => GT3_TXOUTCLKPCS_OUT,
	------------- Transmit Ports - TX Initialization and Reset Ports -----------
	GT3_TXRESETDONE_OUT             => GT3_TXRESETDONE_OUT,
	----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
	GT3_TXCHARISK_IN                => GT3_TXCHARISK_IN,
	--____________________________COMMON PORTS________________________________
	---------------------- Common Block  - Ref Clock Ports ---------------------
	GT0_GTREFCLK0_COMMON_IN         => GT0_GTREFCLK0_COMMON_IN,
	------------------------- Common Block - QPLL Ports ------------------------
	GT0_QPLLLOCK_OUT                => GT0_QPLLLOCK_OUT,--
	GT0_QPLLLOCKDETCLK_IN           => GT0_QPLLLOCKDETCLK_IN,--
	GT0_QPLLPD_IN                   => GT0_QPLLPD_IN,--
	GT0_QPLLREFCLKLOST_OUT          => GT0_QPLLREFCLKLOST_OUT,--
	GT0_QPLLRESET_IN                => GT0_QPLLRESET_IN--     
    );
 
	GT0_QPLLLOCKDETCLK_IN<='0';
 
	Quad_start : entity work.startup_counter
	generic map(
		max_count => 256--shouldn't exceed 256
	)
	Port map(
		PowerUpIn   => QuadControl(0),
		Qpll_locked => '1',
		clkIn       => UsrClkIn,
		ResetOut    => gt0_qpllreset_in
	);

	RX0_start : entity work.startup_counter
	generic map(
		max_count => 256 --shouldn't exceed 256
	)
	Port map(
		PowerUpIn   => gt0_rx_power_up,
		Qpll_locked => gt0_qplllock_out,
		clkIn       => UsrClkIn,
		ResetOut    => gt0_gtrxreset_in
	);
	
	RX1_start : entity work.startup_counter
	generic map(
		max_count => 256 --shouldn't exceed 256
	)
	Port map(
		PowerUpIn   => gt1_rx_power_up,
		Qpll_locked => gt0_qplllock_out,
		clkIn       => UsrClkIn,
		ResetOut    => gt1_gtrxreset_in
	);

	RX2_start : entity work.startup_counter
	generic map(
		max_count => 256 --shouldn't exceed 256
	)
	Port map(
		PowerUpIn   => gt2_rx_power_up,
		Qpll_locked => gt0_qplllock_out,
		clkIn       => UsrClkIn,
		ResetOut    => gt2_gtrxreset_in
	);

	RX3_start : entity work.startup_counter
	generic map(
		max_count => 256 --shouldn't exceed 256
	)
	Port map(
		PowerUpIn   => gt3_rx_power_up,
		Qpll_locked => gt0_qplllock_out,
		clkIn       => UsrClkIn,
		ResetOut    => gt3_gtrxreset_in
	);	

	TX0_start : entity work.startup_counter
	generic map(
		max_count => 256 --shouldn't exceed 256
	)
	Port map(
		PowerUpIn   => gt0_tx_power_up,
		Qpll_locked => gt0_qplllock_out,
		clkIn       => UsrClkIn,
		ResetOut    => gt0_gttxreset_in
	);
	
	TX1_start : entity work.startup_counter
	generic map(
		max_count => 256 --shouldn't exceed 256
	)
	Port map(
		PowerUpIn   => gt1_tx_power_up,
		Qpll_locked => gt0_qplllock_out,
		clkIn       => UsrClkIn,
		ResetOut    => gt1_gttxreset_in
	);

	TX2_start : entity work.startup_counter
	generic map(
		max_count => 256 --shouldn't exceed 256
	)
	Port map(
		PowerUpIn   => gt2_tx_power_up,
		Qpll_locked => gt0_qplllock_out,
		clkIn       => UsrClkIn,
		ResetOut    => gt2_gttxreset_in
	);

	TX3_start : entity work.startup_counter
	generic map(
		max_count => 256 --shouldn't exceed 256
	)
	Port map(
		PowerUpIn   => gt3_tx_power_up,
		Qpll_locked => gt0_qplllock_out,
		clkIn       => UsrClkIn,
		ResetOut    => gt3_gttxreset_in
	);	
 
	GT0_GTREFCLK0_COMMON_IN<=MGTRefClk;
end Behavioral;
