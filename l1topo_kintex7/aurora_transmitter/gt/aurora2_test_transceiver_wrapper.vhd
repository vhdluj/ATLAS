-------------------------------------------------------------------------------
-- (c) Copyright 2008 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--
--------------------------------------------------------------------------------
-- Module aurora2_test_GT_WRAPPER
--------------------------------------------------------------------------------
library IEEE;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity aurora2_test_GT_WRAPPER is
generic
(
    QPLL_FBDIV_TOP                 : integer  := 40;
   
    -- Simulation attribute
    SIM_GTRESET_SPEEDUP : string :=   "false"      -- Set to "true" to speed up sim reset
);  

port
(

---------------------- Loopback and Powerdown Ports ----------------------
LOOPBACK_IN                               : in    std_logic_vector (2 downto 0);
--------------------- Receive Ports - 8b10b Decoder ----------------------
RXCHARISCOMMA_OUT : out   std_logic_vector (1 downto 0);
RXCHARISK_OUT     : out   std_logic_vector (1 downto 0);
RXDISPERR_OUT     : out   std_logic_vector (1 downto 0);
RXNOTINTABLE_OUT  : out   std_logic_vector (1 downto 0);
----------------- Receive Ports - Channel Bonding Ports -----------------
ENCHANSYNC_IN     : in    std_logic;
CHBONDDONE_OUT    : out   std_logic;
----------------- Receive Ports - Clock Correction Ports -----------------
RXBUFERR_OUT      : out   std_logic;
------------- Receive Ports - Comma Detection and Alignment --------------
RXREALIGN_OUT     : out   std_logic;
ENMCOMMAALIGN_IN  : in    std_logic;
ENPCOMMAALIGN_IN  : in    std_logic;
----------------- Receive Ports - RX Data Path interface -----------------
RXDATA_OUT        : out   std_logic_vector (15 downto 0);
RXRESET_IN        : in    std_logic;
RXUSRCLK_IN                               : in    std_logic;
RXUSRCLK2_IN                              : in    std_logic;
----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
RX1N_IN           : in    std_logic;
RX1P_IN           : in    std_logic;
--------------- Receive Ports - RX Polarity Control Ports ----------------
RXPOLARITY_IN     : in    std_logic;
------------------- Shared Ports - Tile and PLL Ports --------------------
REFCLK                                    : in    std_logic;
INIT_CLK_IN                               : in  std_logic; 
PLL_NOT_LOCKED                            : in    std_logic;
GTRESET_IN                                : in    std_logic;
PLLLKDET_OUT      : out   std_logic;
TX_RESETDONE_OUT                          : out    std_logic;
RX_RESETDONE_OUT                          : out    std_logic;
-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
TXCHARISK_IN      : in    std_logic_vector (1 downto 0);
---------------- Transmit Ports - TX Data Path interface -----------------
TXDATA_IN         : in    std_logic_vector (15 downto 0);
TXOUTCLK1_OUT     : out   std_logic;
TXRESET_IN        : in    std_logic;
TXUSRCLK_IN                               : in    std_logic;      
TXUSRCLK2_IN                              : in    std_logic;
TXBUFERR_OUT      : out   std_logic;
------------- Transmit Ports - TX Driver and OOB signalling --------------
TX1N_OUT          : out   std_logic;
TX1P_OUT          : out   std_logic;
---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
DRPADDR_IN                              : in   std_logic_vector(8 downto 0);
DRPCLK_IN                               : in   std_logic;
DRPDI_IN                                : in   std_logic_vector(15 downto 0);
DRPDO_OUT                               : out  std_logic_vector(15 downto 0);
DRPEN_IN                                : in   std_logic;
DRPRDY_OUT                              : out  std_logic;
DRPWE_IN                                : in   std_logic;

LINK_RESET_IN                           : in    std_logic;
POWERDOWN_IN                            : in    std_logic
);

end aurora2_test_GT_WRAPPER;


architecture BEHAVIORAL of aurora2_test_GT_WRAPPER is
  attribute core_generation_info               : string;
  attribute core_generation_info of BEHAVIORAL : architecture is "aurora2_test,aurora_8b10b_v8_3,{user_interface=AXI_4_Streaming,backchannel_mode=Sidebands,c_aurora_lanes=1,c_column_used=left,c_gt_clock_1=GTXQ2,c_gt_clock_2=None,c_gt_loc_1=X,c_gt_loc_10=X,c_gt_loc_11=1,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=X,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=2,c_line_rate=12500,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=125000,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,flow_mode=None,interface_mode=Framing,dataflow_config=Duplex}";

    -- Parameter Declarations --
    constant DLY : time := 1 ns;

--***************************** Compopnent Declaration ****************************
component aurora2_test_multi_gt is
generic
(
    QPLL_FBDIV_TOP                 : integer  := 40;

    -- Simulation attributes
    WRAPPER_SIM_GTRESET_SPEEDUP     : string     :=  "false";        -- Set to "true" to speed up sim reset
    RX_DFE_KL_CFG2_IN               : bit_vector :=  X"3010D90C";
    PMA_RSV_IN                      : bit_vector :=  x"00018480";
    SIM_VERSION                     : string     :=  "3.0"
);
port
(
    --_________________________________________________________________________
    --_________________________________________________________________________
    --GT0  
    --____________________________CHANNEL PORTS________________________________
    ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
    GT0_DRPADDR_IN                          : in   std_logic_vector(8 downto 0);
    GT0_DRPCLK_IN                           : in   std_logic;
    GT0_DRPDI_IN                            : in   std_logic_vector(15 downto 0);
    GT0_DRPDO_OUT                           : out  std_logic_vector(15 downto 0);
    GT0_DRPEN_IN                            : in   std_logic;
    GT0_DRPRDY_OUT                          : out  std_logic;
    GT0_DRPWE_IN                            : in   std_logic;
    ------------------------- Channel - Ref Clock Ports ------------------------
    GT0_GTREFCLK0_IN                        : in   std_logic;
    -------------------------------- Channel PLL -------------------------------
    GT0_CPLLFBCLKLOST_OUT                   : out  std_logic;
    GT0_CPLLLOCK_OUT                        : out  std_logic;
    GT0_CPLLLOCKDETCLK_IN                   : in   std_logic;
    GT0_CPLLREFCLKLOST_OUT                  : out  std_logic;
    GT0_CPLLRESET_IN                        : in   std_logic;
    ------------------------------- Eye Scan Ports -----------------------------
    GT0_EYESCANDATAERROR_OUT                : out  std_logic;
    ------------------------ Loopback and Powerdown Ports ----------------------
    GT0_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
    GT0_RXPD_IN                             : in   std_logic_vector(1 downto 0);
    GT0_TXPD_IN                             : in   std_logic_vector(1 downto 0);
    ------------------------------- Receive Ports ------------------------------
    GT0_RXUSERRDY_IN                        : in   std_logic;
    ----------------------- Receive Ports - 8b10b Decoder ----------------------
    GT0_RXCHARISCOMMA_OUT                   : out  std_logic_vector(1 downto 0);
    GT0_RXCHARISK_OUT                       : out  std_logic_vector(1 downto 0);
    GT0_RXDISPERR_OUT                       : out  std_logic_vector(1 downto 0);
    GT0_RXNOTINTABLE_OUT                    : out  std_logic_vector(1 downto 0);
    ------------------- Receive Ports - Clock Correction Ports -----------------
    GT0_RXCLKCORCNT_OUT                     : out  std_logic_vector(1 downto 0);
    --------------- Receive Ports - Comma Detection and Alignment --------------
    GT0_RXBYTEREALIGN_OUT                   : out  std_logic;
    GT0_RXMCOMMAALIGNEN_IN                  : in   std_logic;
    GT0_RXPCOMMAALIGNEN_IN                  : in   std_logic;
    ------------------- Receive Ports - RX Data Path interface -----------------
    GT0_GTRXRESET_IN                        : in   std_logic;
    GT0_RXDATA_OUT                          : out  std_logic_vector(15 downto 0);
    GT0_RXOUTCLK_OUT                        : out  std_logic;
    GT0_RXUSRCLK_IN                         : in   std_logic;
    GT0_RXUSRCLK2_IN                        : in   std_logic;
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GT0_GTXRXN_IN                           : in   std_logic;
    GT0_GTXRXP_IN                           : in   std_logic;
    GT0_RXCDRLOCK_OUT                       : out  std_logic;
    GT0_RXELECIDLE_OUT                      : out  std_logic;
    -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    GT0_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    GT0_RXRESETDONE_OUT                     : out  std_logic;
    ----------------- Receive Ports - RX Polarity Control Ports ----------------
    GT0_RXPOLARITY_IN                       : in   std_logic;
    ------------------------------- Transmit Ports -----------------------------
    GT0_TXUSERRDY_IN                        : in   std_logic;
    ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    GT0_TXCHARISK_IN                        : in   std_logic_vector(1 downto 0);
    ------------ Transmit Ports - TX Buffer and Phase Alignment Ports ----------
    GT0_TXBUFSTATUS_OUT                     : out  std_logic_vector(1 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GT0_GTTXRESET_IN                        : in   std_logic;
    GT0_TXDATA_IN                           : in   std_logic_vector(15 downto 0);
    GT0_TXOUTCLK_OUT                        : out  std_logic;
    GT0_TXOUTCLKFABRIC_OUT                  : out  std_logic;
    GT0_TXOUTCLKPCS_OUT                     : out  std_logic;
    GT0_TXUSRCLK_IN                         : in   std_logic;
    GT0_TXUSRCLK2_IN                        : in   std_logic;
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GT0_GTXTXN_OUT                          : out  std_logic;
    GT0_GTXTXP_OUT                          : out  std_logic;
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    GT0_TXRESETDONE_OUT                     : out  std_logic;


    --____________________________COMMON PORTS________________________________
    ---------------------- Common Block  - Ref Clock Ports ---------------------
    GT0_GTREFCLK0_COMMON_IN                 : in   std_logic;
    ------------------------- Common Block - QPLL Ports ------------------------
    GT0_QPLLLOCK_OUT                        : out  std_logic;
    GT0_QPLLLOCKDETCLK_IN                   : in   std_logic;
    GT0_QPLLREFCLKLOST_OUT                  : out  std_logic;
    GT0_QPLLRESET_IN                        : in   std_logic


);
end component;

   signal tied_to_ground_i                               : std_logic;
   signal tied_to_ground_vec_i                           : std_logic_vector (63 downto 0);
   signal tied_to_vcc_i                                  : std_logic;
   signal chbondi                 : std_logic_vector (4 downto 0);
   signal chbondo                 : std_logic_vector (4 downto 0);
   signal chbondi_unused_i                                    : std_logic_vector (4 downto 0);

   signal gt_userrdy_r             : std_logic;    
   signal link_reset_r             : std_logic;    
   signal link_reset_r2            : std_logic; 

   signal              gt0_txresetdone_r : std_logic;
   signal              gt0_txresetdone_r2 : std_logic;
   signal              gt0_txresetdone_r3 : std_logic;
   signal              gt0_rxresetdone_r : std_logic;
   signal              gt0_rxresetdone_r2 : std_logic;
   signal              gt0_rxresetdone_r3 : std_logic;

   --reset logic
   signal reset_counter            : std_logic_vector (7 downto 0) := "00000000";
   signal gt_reset_i               : std_logic;
   signal gt_txbuferr_i            : std_logic;
   signal gt_rxbuferr_i            : std_logic;
   signal cpll_reset_i             : std_logic;  -- Combine GTRESET_IN along with LINK_RESET_IN
   signal qpll_reset_i             : std_logic;  -- Same as cpll_reset_i
   signal gt0_txresetdone_i        : std_logic; 
   signal gt0_rxresetdone_i        : std_logic;

   --concatenation or temp signals
   signal powerdown_i              : std_logic_vector(1 downto 0);
   signal rx_buf_status_i    : std_logic_vector(2 downto 0);
   signal tx_buf_status_i    : std_logic_vector(1 downto 0);
   signal plllkdet_out_i     : std_logic;   


begin

  tied_to_ground_i                    <= '0';
  tied_to_ground_vec_i(63 downto 0)   <= (others => '0');
  tied_to_vcc_i                       <= '1';


  powerdown_i               <=  POWERDOWN_IN & POWERDOWN_IN;
  RXBUFERR_OUT        <=  rx_buf_status_i(2);
  TXBUFERR_OUT        <=  tx_buf_status_i(1);
  PLLLKDET_OUT        <=  plllkdet_out_i;
  chbondi_unused_i          <= "00000";


   --Connect channel bonding bus

   chbondi <= chbondi_unused_i;
   CHBONDDONE_OUT <= '1';


    --***********************************************************************--
    --                                                                       --
    -----------------------  Reset Logic  -------------------------------------
    --                                                                       --
    --***********************************************************************--
    -- Aurora core supports Sequence Mode; hence PCS and PMA resets
    -- are tied to ground. In Single mode, the user needs to follow the
    -- reset sequencing given in the UG476.

    cpll_reset_i      <= GTRESET_IN or LINK_RESET_IN;
    qpll_reset_i      <= GTRESET_IN or LINK_RESET_IN;

    process(INIT_CLK_IN)
    begin
        if(INIT_CLK_IN'event and INIT_CLK_IN='1') then
            link_reset_r  <=  LINK_RESET_IN after DLY;
            link_reset_r2 <=  link_reset_r after DLY;
        end if;
    end process;

    process (INIT_CLK_IN)
    begin
        if (GTRESET_IN = '1') then
            gt_userrdy_r  <= '0' after DLY;
        elsif (INIT_CLK_IN 'event and INIT_CLK_IN = '1') then
            gt_userrdy_r  <= (not PLL_NOT_LOCKED AND not link_reset_r2) after DLY;
        end if;
    end process;

    -- Upon configuration, GTXTXRESET and GTXRXRESET must be initiated in
    -- Sequential mode. If RESETOVRD and GTRESETSEL are already defaulted
    -- to the above values, then all GT resets (CPLLRESET, QPLLRESET,
    -- GTXTXRESET and GTXRXRESET) cannot be asserted until a minimum of 500ns
    -- after GSR deassertion.

    process (INIT_CLK_IN)
    begin
      if (INIT_CLK_IN 'event and INIT_CLK_IN = '1') then
        if (reset_counter(7) = '1') then    
          reset_counter  <= reset_counter after DLY;
        else
          reset_counter  <= reset_counter + 1 after DLY;
        end if;
      end if;
    end process;

      --TXRESETDONE for lane0
    process(TXUSRCLK2_IN)
    begin
        if(TXUSRCLK2_IN'event and TXUSRCLK2_IN='1') then
            gt0_txresetdone_r  <=  gt0_txresetdone_i after DLY;
            gt0_txresetdone_r2 <=  gt0_txresetdone_r after DLY;
            gt0_txresetdone_r3 <=  gt0_txresetdone_r2 after DLY;
        end if;
    end process;

      --RXRESETDONE for lane0
    process(RXUSRCLK2_IN)
    begin
        if(RXUSRCLK2_IN'event and RXUSRCLK2_IN='1') then
            gt0_rxresetdone_r  <=  gt0_rxresetdone_i after DLY;
            gt0_rxresetdone_r2 <=  gt0_rxresetdone_r after DLY;
            gt0_rxresetdone_r3 <=  gt0_rxresetdone_r2 after DLY;
        end if;
    end process;



      gt_txbuferr_i     <= tx_buf_status_i(1) ;
      gt_rxbuferr_i     <= rx_buf_status_i(2) ;
      gt_reset_i        <= '0' when (reset_counter(7) = '0') else
			   ( (not plllkdet_out_i)  or gt_txbuferr_i or gt_rxbuferr_i) ;
      TX_RESETDONE_OUT  <= gt0_txresetdone_r3 ;
      RX_RESETDONE_OUT  <= gt0_rxresetdone_r3 ;

------------------------- GT Instantiations  --------------------------  
   aurora2_test_multi_gt_i : aurora2_test_multi_gt 
    generic map
    (
        -- Simulation attributes
        WRAPPER_SIM_GTRESET_SPEEDUP      => SIM_GTRESET_SPEEDUP

    )
    port map
    (
        --_________________________________________________________________________
        --_________________________________________________________________________
        --GT0  
        ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
        GT0_DRPADDR_IN                     => DRPADDR_IN,
        GT0_DRPCLK_IN                      => DRPCLK_IN,
        GT0_DRPDI_IN                       => DRPDI_IN,
        GT0_DRPDO_OUT                      => DRPDO_OUT,
        GT0_DRPEN_IN                       => DRPEN_IN,
        GT0_DRPRDY_OUT                     => DRPRDY_OUT,
        GT0_DRPWE_IN                       => DRPWE_IN,
        ------------------------- Channel - Ref Clock Ports ------------------------
        GT0_GTREFCLK0_IN                   => REFCLK,
        -------------------------------- Channel PLL -------------------------------
        GT0_CPLLFBCLKLOST_OUT              => OPEN,
        GT0_CPLLLOCK_OUT                   => plllkdet_out_i,
        GT0_CPLLLOCKDETCLK_IN              => tied_to_ground_i,
        GT0_CPLLREFCLKLOST_OUT             => OPEN,
        GT0_CPLLRESET_IN                   => cpll_reset_i,
        ------------------------------- Eye Scan Ports -----------------------------
        GT0_EYESCANDATAERROR_OUT           => OPEN,
        ------------------------ Loopback and Powerdown Ports ----------------------
        GT0_LOOPBACK_IN                    => LOOPBACK_IN,
        GT0_RXPD_IN                        => powerdown_i,
        GT0_TXPD_IN                        => powerdown_i,
        ------------------------------- Receive Ports ------------------------------
        GT0_RXUSERRDY_IN                   => gt_userrdy_r,
        ----------------------- Receive Ports - 8b10b Decoder ----------------------
        GT0_RXCHARISCOMMA_OUT              => RXCHARISCOMMA_OUT,
        GT0_RXCHARISK_OUT                  => RXCHARISK_OUT,
        GT0_RXDISPERR_OUT                  => RXDISPERR_OUT,
        GT0_RXNOTINTABLE_OUT               => RXNOTINTABLE_OUT,
        ------------------- Receive Ports - Channel Bonding Ports ------------------
        ------------------- Receive Ports - Clock Correction Ports -----------------
        GT0_RXCLKCORCNT_OUT                => OPEN,
        --------------- Receive Ports - Comma Detection and Alignment --------------
        GT0_RXBYTEREALIGN_OUT              => RXREALIGN_OUT,
        GT0_RXMCOMMAALIGNEN_IN             => ENMCOMMAALIGN_IN,
        GT0_RXPCOMMAALIGNEN_IN             => ENPCOMMAALIGN_IN,
        ------------------- Receive Ports - RX Data Path interface -----------------
        GT0_GTRXRESET_IN                   => gt_reset_i,
        GT0_RXDATA_OUT                     => RXDATA_OUT,
        GT0_RXOUTCLK_OUT                   => OPEN,
        GT0_RXUSRCLK_IN                    => RXUSRCLK_IN,
        GT0_RXUSRCLK2_IN                   => RXUSRCLK2_IN,
        ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        GT0_GTXRXN_IN                      => RX1N_IN,
        GT0_GTXRXP_IN                      => RX1P_IN,
        GT0_RXCDRLOCK_OUT                  => OPEN,
        GT0_RXELECIDLE_OUT                 => OPEN,
        -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
        GT0_RXBUFSTATUS_OUT                => rx_buf_status_i,
        ------------------------ Receive Ports - RX PLL Ports ----------------------
        GT0_RXRESETDONE_OUT                => gt0_rxresetdone_i,
        ------------------------------- Transmit Ports -----------------------------
        GT0_TXUSERRDY_IN                   => gt_userrdy_r,
        ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
        GT0_TXCHARISK_IN                   => TXCHARISK_IN,
        ----------- Transmit Ports - TX Buffer and Phase Alignment ---------
        GT0_TXBUFSTATUS_OUT                => tx_buf_status_i,
        ----------------- Receive Ports - RX Polarity Control Ports ----------------
        GT0_RXPOLARITY_IN                  => RXPOLARITY_IN,
        ------------------ Transmit Ports - TX Data Path interface -----------------
        GT0_GTTXRESET_IN                   => gt_reset_i,
        GT0_TXDATA_IN                      => TXDATA_IN,
        GT0_TXOUTCLK_OUT                   => TXOUTCLK1_OUT,
        GT0_TXOUTCLKFABRIC_OUT             => OPEN,
        GT0_TXOUTCLKPCS_OUT                => OPEN,
        GT0_TXUSRCLK_IN                    => TXUSRCLK_IN,
        GT0_TXUSRCLK2_IN                   => TXUSRCLK2_IN,
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------
        GT0_GTXTXN_OUT                     => TX1N_OUT,
        GT0_GTXTXP_OUT                     => TX1P_OUT,
        ----------------------- Transmit Ports - TX PLL Ports ----------------------
        GT0_TXRESETDONE_OUT                => gt0_txresetdone_i,

        --____________________________COMMON PORTS________________________________
        ---------------------- Common Block  - Ref Clock Ports ---------------------
        GT0_GTREFCLK0_COMMON_IN            => REFCLK,
        ------------------------- Common Block - QPLL Ports ------------------------
        GT0_QPLLLOCK_OUT                   => open,
        GT0_QPLLLOCKDETCLK_IN              => tied_to_ground_i,
        GT0_QPLLREFCLKLOST_OUT             => open,
        GT0_QPLLRESET_IN                   => qpll_reset_i 

    );

end BEHAVIORAL;  
