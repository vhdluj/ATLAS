-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
-- Date        : Mon Sep 29 16:45:10 2014
-- Host        : Grzegorz-THINK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/Grzegorz/Desktop/virtex7_sources/ProcessorU2_140926/TopoGTH_QPLL_AV2.srcs/sources_1/ip/gtwizard_32_Rx/gtwizard_32_Rx_stub.vhdl
-- Design      : gtwizard_32_Rx
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gtwizard_32_Rx is
  Port ( 
    SYSCLK_IN : in STD_LOGIC;
    SOFT_RESET_IN : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    GT0_DRP_BUSY_OUT : out STD_LOGIC;
    GT0_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT0_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT0_DATA_VALID_IN : in STD_LOGIC;
    GT1_DRP_BUSY_OUT : out STD_LOGIC;
    GT1_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT1_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT1_DATA_VALID_IN : in STD_LOGIC;
    GT2_DRP_BUSY_OUT : out STD_LOGIC;
    GT2_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT2_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT2_DATA_VALID_IN : in STD_LOGIC;
    GT3_DRP_BUSY_OUT : out STD_LOGIC;
    GT3_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT3_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT3_DATA_VALID_IN : in STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpclk_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drprdy_out : out STD_LOGIC;
    gt0_drpwe_in : in STD_LOGIC;
    gt0_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_rxuserrdy_in : in STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_rxusrclk_in : in STD_LOGIC;
    gt0_rxusrclk2_in : in STD_LOGIC;
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_gthrxn_in : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxmcommaalignen_in : in STD_LOGIC;
    gt0_rxpcommaalignen_in : in STD_LOGIC;
    gt0_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt0_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxoutclk_out : out STD_LOGIC;
    gt0_gtrxreset_in : in STD_LOGIC;
    gt0_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_gthrxp_in : in STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_gttxreset_in : in STD_LOGIC;
    gt1_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt1_drpclk_in : in STD_LOGIC;
    gt1_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpen_in : in STD_LOGIC;
    gt1_drprdy_out : out STD_LOGIC;
    gt1_drpwe_in : in STD_LOGIC;
    gt1_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_eyescanreset_in : in STD_LOGIC;
    gt1_rxuserrdy_in : in STD_LOGIC;
    gt1_eyescandataerror_out : out STD_LOGIC;
    gt1_eyescantrigger_in : in STD_LOGIC;
    gt1_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt1_rxusrclk_in : in STD_LOGIC;
    gt1_rxusrclk2_in : in STD_LOGIC;
    gt1_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_gthrxn_in : in STD_LOGIC;
    gt1_rxbufreset_in : in STD_LOGIC;
    gt1_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_rxmcommaalignen_in : in STD_LOGIC;
    gt1_rxpcommaalignen_in : in STD_LOGIC;
    gt1_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt1_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxoutclk_out : out STD_LOGIC;
    gt1_gtrxreset_in : in STD_LOGIC;
    gt1_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_gthrxp_in : in STD_LOGIC;
    gt1_rxresetdone_out : out STD_LOGIC;
    gt1_gttxreset_in : in STD_LOGIC;
    gt2_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt2_drpclk_in : in STD_LOGIC;
    gt2_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpen_in : in STD_LOGIC;
    gt2_drprdy_out : out STD_LOGIC;
    gt2_drpwe_in : in STD_LOGIC;
    gt2_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_eyescanreset_in : in STD_LOGIC;
    gt2_rxuserrdy_in : in STD_LOGIC;
    gt2_eyescandataerror_out : out STD_LOGIC;
    gt2_eyescantrigger_in : in STD_LOGIC;
    gt2_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt2_rxusrclk_in : in STD_LOGIC;
    gt2_rxusrclk2_in : in STD_LOGIC;
    gt2_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_gthrxn_in : in STD_LOGIC;
    gt2_rxbufreset_in : in STD_LOGIC;
    gt2_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_rxmcommaalignen_in : in STD_LOGIC;
    gt2_rxpcommaalignen_in : in STD_LOGIC;
    gt2_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt2_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxoutclk_out : out STD_LOGIC;
    gt2_gtrxreset_in : in STD_LOGIC;
    gt2_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_gthrxp_in : in STD_LOGIC;
    gt2_rxresetdone_out : out STD_LOGIC;
    gt2_gttxreset_in : in STD_LOGIC;
    gt3_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt3_drpclk_in : in STD_LOGIC;
    gt3_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpen_in : in STD_LOGIC;
    gt3_drprdy_out : out STD_LOGIC;
    gt3_drpwe_in : in STD_LOGIC;
    gt3_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_eyescanreset_in : in STD_LOGIC;
    gt3_rxuserrdy_in : in STD_LOGIC;
    gt3_eyescandataerror_out : out STD_LOGIC;
    gt3_eyescantrigger_in : in STD_LOGIC;
    gt3_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt3_rxusrclk_in : in STD_LOGIC;
    gt3_rxusrclk2_in : in STD_LOGIC;
    gt3_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_gthrxn_in : in STD_LOGIC;
    gt3_rxbufreset_in : in STD_LOGIC;
    gt3_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_rxmcommaalignen_in : in STD_LOGIC;
    gt3_rxpcommaalignen_in : in STD_LOGIC;
    gt3_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt3_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxoutclk_out : out STD_LOGIC;
    gt3_gtrxreset_in : in STD_LOGIC;
    gt3_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_gthrxp_in : in STD_LOGIC;
    gt3_rxresetdone_out : out STD_LOGIC;
    gt3_gttxreset_in : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC;
    GT0_QPLLREFCLKLOST_IN : in STD_LOGIC;
    GT0_QPLLRESET_OUT : out STD_LOGIC;
    GT0_QPLLOUTCLK_IN : in STD_LOGIC;
    GT0_QPLLOUTREFCLK_IN : in STD_LOGIC
  );

end gtwizard_32_Rx;

architecture stub of gtwizard_32_Rx is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SYSCLK_IN,SOFT_RESET_IN,DONT_RESET_ON_DATA_ERROR_IN,GT0_DRP_BUSY_OUT,GT0_TX_FSM_RESET_DONE_OUT,GT0_RX_FSM_RESET_DONE_OUT,GT0_DATA_VALID_IN,GT1_DRP_BUSY_OUT,GT1_TX_FSM_RESET_DONE_OUT,GT1_RX_FSM_RESET_DONE_OUT,GT1_DATA_VALID_IN,GT2_DRP_BUSY_OUT,GT2_TX_FSM_RESET_DONE_OUT,GT2_RX_FSM_RESET_DONE_OUT,GT2_DATA_VALID_IN,GT3_DRP_BUSY_OUT,GT3_TX_FSM_RESET_DONE_OUT,GT3_RX_FSM_RESET_DONE_OUT,GT3_DATA_VALID_IN,gt0_drpaddr_in[8:0],gt0_drpclk_in,gt0_drpdi_in[15:0],gt0_drpdo_out[15:0],gt0_drpen_in,gt0_drprdy_out,gt0_drpwe_in,gt0_rxpd_in[1:0],gt0_eyescanreset_in,gt0_rxuserrdy_in,gt0_eyescandataerror_out,gt0_eyescantrigger_in,gt0_dmonitorout_out[14:0],gt0_rxusrclk_in,gt0_rxusrclk2_in,gt0_rxdata_out[15:0],gt0_rxdisperr_out[1:0],gt0_rxnotintable_out[1:0],gt0_gthrxn_in,gt0_rxbufreset_in,gt0_rxbufstatus_out[2:0],gt0_rxmcommaalignen_in,gt0_rxpcommaalignen_in,gt0_rxmonitorout_out[6:0],gt0_rxmonitorsel_in[1:0],gt0_rxoutclk_out,gt0_gtrxreset_in,gt0_rxchariscomma_out[1:0],gt0_rxcharisk_out[1:0],gt0_gthrxp_in,gt0_rxresetdone_out,gt0_gttxreset_in,gt1_drpaddr_in[8:0],gt1_drpclk_in,gt1_drpdi_in[15:0],gt1_drpdo_out[15:0],gt1_drpen_in,gt1_drprdy_out,gt1_drpwe_in,gt1_rxpd_in[1:0],gt1_eyescanreset_in,gt1_rxuserrdy_in,gt1_eyescandataerror_out,gt1_eyescantrigger_in,gt1_dmonitorout_out[14:0],gt1_rxusrclk_in,gt1_rxusrclk2_in,gt1_rxdata_out[15:0],gt1_rxdisperr_out[1:0],gt1_rxnotintable_out[1:0],gt1_gthrxn_in,gt1_rxbufreset_in,gt1_rxbufstatus_out[2:0],gt1_rxmcommaalignen_in,gt1_rxpcommaalignen_in,gt1_rxmonitorout_out[6:0],gt1_rxmonitorsel_in[1:0],gt1_rxoutclk_out,gt1_gtrxreset_in,gt1_rxchariscomma_out[1:0],gt1_rxcharisk_out[1:0],gt1_gthrxp_in,gt1_rxresetdone_out,gt1_gttxreset_in,gt2_drpaddr_in[8:0],gt2_drpclk_in,gt2_drpdi_in[15:0],gt2_drpdo_out[15:0],gt2_drpen_in,gt2_drprdy_out,gt2_drpwe_in,gt2_rxpd_in[1:0],gt2_eyescanreset_in,gt2_rxuserrdy_in,gt2_eyescandataerror_out,gt2_eyescantrigger_in,gt2_dmonitorout_out[14:0],gt2_rxusrclk_in,gt2_rxusrclk2_in,gt2_rxdata_out[15:0],gt2_rxdisperr_out[1:0],gt2_rxnotintable_out[1:0],gt2_gthrxn_in,gt2_rxbufreset_in,gt2_rxbufstatus_out[2:0],gt2_rxmcommaalignen_in,gt2_rxpcommaalignen_in,gt2_rxmonitorout_out[6:0],gt2_rxmonitorsel_in[1:0],gt2_rxoutclk_out,gt2_gtrxreset_in,gt2_rxchariscomma_out[1:0],gt2_rxcharisk_out[1:0],gt2_gthrxp_in,gt2_rxresetdone_out,gt2_gttxreset_in,gt3_drpaddr_in[8:0],gt3_drpclk_in,gt3_drpdi_in[15:0],gt3_drpdo_out[15:0],gt3_drpen_in,gt3_drprdy_out,gt3_drpwe_in,gt3_rxpd_in[1:0],gt3_eyescanreset_in,gt3_rxuserrdy_in,gt3_eyescandataerror_out,gt3_eyescantrigger_in,gt3_dmonitorout_out[14:0],gt3_rxusrclk_in,gt3_rxusrclk2_in,gt3_rxdata_out[15:0],gt3_rxdisperr_out[1:0],gt3_rxnotintable_out[1:0],gt3_gthrxn_in,gt3_rxbufreset_in,gt3_rxbufstatus_out[2:0],gt3_rxmcommaalignen_in,gt3_rxpcommaalignen_in,gt3_rxmonitorout_out[6:0],gt3_rxmonitorsel_in[1:0],gt3_rxoutclk_out,gt3_gtrxreset_in,gt3_rxchariscomma_out[1:0],gt3_rxcharisk_out[1:0],gt3_gthrxp_in,gt3_rxresetdone_out,gt3_gttxreset_in,GT0_QPLLLOCK_IN,GT0_QPLLREFCLKLOST_IN,GT0_QPLLRESET_OUT,GT0_QPLLOUTCLK_IN,GT0_QPLLOUTREFCLK_IN";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "gtwizard_32_Rx,gtwizard_v3_2,{protocol_file=Start_from_scratch}";
begin
end;
