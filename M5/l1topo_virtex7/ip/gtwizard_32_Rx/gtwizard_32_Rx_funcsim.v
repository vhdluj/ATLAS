// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
// Date        : Mon Sep 29 16:45:10 2014
// Host        : Grzegorz-THINK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/Grzegorz/Desktop/virtex7_sources/ProcessorU2_140926/TopoGTH_QPLL_AV2.srcs/sources_1/ip/gtwizard_32_Rx/gtwizard_32_Rx_funcsim.v
// Design      : gtwizard_32_Rx
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1927-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "gtwizard_32_Rx,gtwizard_v3_2,{protocol_file=Start_from_scratch}" *) (* core_generation_info = "gtwizard_32_Rx,gtwizard_v3_2,{protocol_file=Start_from_scratch}" *) 
(* NotValidForBitStream *)
module gtwizard_32_Rx
   (SYSCLK_IN,
    SOFT_RESET_IN,
    DONT_RESET_ON_DATA_ERROR_IN,
    GT0_DRP_BUSY_OUT,
    GT0_TX_FSM_RESET_DONE_OUT,
    GT0_RX_FSM_RESET_DONE_OUT,
    GT0_DATA_VALID_IN,
    GT1_DRP_BUSY_OUT,
    GT1_TX_FSM_RESET_DONE_OUT,
    GT1_RX_FSM_RESET_DONE_OUT,
    GT1_DATA_VALID_IN,
    GT2_DRP_BUSY_OUT,
    GT2_TX_FSM_RESET_DONE_OUT,
    GT2_RX_FSM_RESET_DONE_OUT,
    GT2_DATA_VALID_IN,
    GT3_DRP_BUSY_OUT,
    GT3_TX_FSM_RESET_DONE_OUT,
    GT3_RX_FSM_RESET_DONE_OUT,
    GT3_DATA_VALID_IN,
    gt0_drpaddr_in,
    gt0_drpclk_in,
    gt0_drpdi_in,
    gt0_drpdo_out,
    gt0_drpen_in,
    gt0_drprdy_out,
    gt0_drpwe_in,
    gt0_rxpd_in,
    gt0_eyescanreset_in,
    gt0_rxuserrdy_in,
    gt0_eyescandataerror_out,
    gt0_eyescantrigger_in,
    gt0_dmonitorout_out,
    gt0_rxusrclk_in,
    gt0_rxusrclk2_in,
    gt0_rxdata_out,
    gt0_rxdisperr_out,
    gt0_rxnotintable_out,
    gt0_gthrxn_in,
    gt0_rxbufreset_in,
    gt0_rxbufstatus_out,
    gt0_rxmcommaalignen_in,
    gt0_rxpcommaalignen_in,
    gt0_rxmonitorout_out,
    gt0_rxmonitorsel_in,
    gt0_rxoutclk_out,
    gt0_gtrxreset_in,
    gt0_rxchariscomma_out,
    gt0_rxcharisk_out,
    gt0_gthrxp_in,
    gt0_rxresetdone_out,
    gt0_gttxreset_in,
    gt1_drpaddr_in,
    gt1_drpclk_in,
    gt1_drpdi_in,
    gt1_drpdo_out,
    gt1_drpen_in,
    gt1_drprdy_out,
    gt1_drpwe_in,
    gt1_rxpd_in,
    gt1_eyescanreset_in,
    gt1_rxuserrdy_in,
    gt1_eyescandataerror_out,
    gt1_eyescantrigger_in,
    gt1_dmonitorout_out,
    gt1_rxusrclk_in,
    gt1_rxusrclk2_in,
    gt1_rxdata_out,
    gt1_rxdisperr_out,
    gt1_rxnotintable_out,
    gt1_gthrxn_in,
    gt1_rxbufreset_in,
    gt1_rxbufstatus_out,
    gt1_rxmcommaalignen_in,
    gt1_rxpcommaalignen_in,
    gt1_rxmonitorout_out,
    gt1_rxmonitorsel_in,
    gt1_rxoutclk_out,
    gt1_gtrxreset_in,
    gt1_rxchariscomma_out,
    gt1_rxcharisk_out,
    gt1_gthrxp_in,
    gt1_rxresetdone_out,
    gt1_gttxreset_in,
    gt2_drpaddr_in,
    gt2_drpclk_in,
    gt2_drpdi_in,
    gt2_drpdo_out,
    gt2_drpen_in,
    gt2_drprdy_out,
    gt2_drpwe_in,
    gt2_rxpd_in,
    gt2_eyescanreset_in,
    gt2_rxuserrdy_in,
    gt2_eyescandataerror_out,
    gt2_eyescantrigger_in,
    gt2_dmonitorout_out,
    gt2_rxusrclk_in,
    gt2_rxusrclk2_in,
    gt2_rxdata_out,
    gt2_rxdisperr_out,
    gt2_rxnotintable_out,
    gt2_gthrxn_in,
    gt2_rxbufreset_in,
    gt2_rxbufstatus_out,
    gt2_rxmcommaalignen_in,
    gt2_rxpcommaalignen_in,
    gt2_rxmonitorout_out,
    gt2_rxmonitorsel_in,
    gt2_rxoutclk_out,
    gt2_gtrxreset_in,
    gt2_rxchariscomma_out,
    gt2_rxcharisk_out,
    gt2_gthrxp_in,
    gt2_rxresetdone_out,
    gt2_gttxreset_in,
    gt3_drpaddr_in,
    gt3_drpclk_in,
    gt3_drpdi_in,
    gt3_drpdo_out,
    gt3_drpen_in,
    gt3_drprdy_out,
    gt3_drpwe_in,
    gt3_rxpd_in,
    gt3_eyescanreset_in,
    gt3_rxuserrdy_in,
    gt3_eyescandataerror_out,
    gt3_eyescantrigger_in,
    gt3_dmonitorout_out,
    gt3_rxusrclk_in,
    gt3_rxusrclk2_in,
    gt3_rxdata_out,
    gt3_rxdisperr_out,
    gt3_rxnotintable_out,
    gt3_gthrxn_in,
    gt3_rxbufreset_in,
    gt3_rxbufstatus_out,
    gt3_rxmcommaalignen_in,
    gt3_rxpcommaalignen_in,
    gt3_rxmonitorout_out,
    gt3_rxmonitorsel_in,
    gt3_rxoutclk_out,
    gt3_gtrxreset_in,
    gt3_rxchariscomma_out,
    gt3_rxcharisk_out,
    gt3_gthrxp_in,
    gt3_rxresetdone_out,
    gt3_gttxreset_in,
    GT0_QPLLLOCK_IN,
    GT0_QPLLREFCLKLOST_IN,
    GT0_QPLLRESET_OUT,
    GT0_QPLLOUTCLK_IN,
    GT0_QPLLOUTREFCLK_IN);
  input SYSCLK_IN;
  input SOFT_RESET_IN;
  input DONT_RESET_ON_DATA_ERROR_IN;
  output GT0_DRP_BUSY_OUT;
  output GT0_TX_FSM_RESET_DONE_OUT;
  output GT0_RX_FSM_RESET_DONE_OUT;
  input GT0_DATA_VALID_IN;
  output GT1_DRP_BUSY_OUT;
  output GT1_TX_FSM_RESET_DONE_OUT;
  output GT1_RX_FSM_RESET_DONE_OUT;
  input GT1_DATA_VALID_IN;
  output GT2_DRP_BUSY_OUT;
  output GT2_TX_FSM_RESET_DONE_OUT;
  output GT2_RX_FSM_RESET_DONE_OUT;
  input GT2_DATA_VALID_IN;
  output GT3_DRP_BUSY_OUT;
  output GT3_TX_FSM_RESET_DONE_OUT;
  output GT3_RX_FSM_RESET_DONE_OUT;
  input GT3_DATA_VALID_IN;
  input [8:0]gt0_drpaddr_in;
  input gt0_drpclk_in;
  input [15:0]gt0_drpdi_in;
  output [15:0]gt0_drpdo_out;
  input gt0_drpen_in;
  output gt0_drprdy_out;
  input gt0_drpwe_in;
  input [1:0]gt0_rxpd_in;
  input gt0_eyescanreset_in;
  input gt0_rxuserrdy_in;
  output gt0_eyescandataerror_out;
  input gt0_eyescantrigger_in;
  output [14:0]gt0_dmonitorout_out;
  input gt0_rxusrclk_in;
  input gt0_rxusrclk2_in;
  output [15:0]gt0_rxdata_out;
  output [1:0]gt0_rxdisperr_out;
  output [1:0]gt0_rxnotintable_out;
  input gt0_gthrxn_in;
  input gt0_rxbufreset_in;
  output [2:0]gt0_rxbufstatus_out;
  input gt0_rxmcommaalignen_in;
  input gt0_rxpcommaalignen_in;
  output [6:0]gt0_rxmonitorout_out;
  input [1:0]gt0_rxmonitorsel_in;
  output gt0_rxoutclk_out;
  input gt0_gtrxreset_in;
  output [1:0]gt0_rxchariscomma_out;
  output [1:0]gt0_rxcharisk_out;
  input gt0_gthrxp_in;
  output gt0_rxresetdone_out;
  input gt0_gttxreset_in;
  input [8:0]gt1_drpaddr_in;
  input gt1_drpclk_in;
  input [15:0]gt1_drpdi_in;
  output [15:0]gt1_drpdo_out;
  input gt1_drpen_in;
  output gt1_drprdy_out;
  input gt1_drpwe_in;
  input [1:0]gt1_rxpd_in;
  input gt1_eyescanreset_in;
  input gt1_rxuserrdy_in;
  output gt1_eyescandataerror_out;
  input gt1_eyescantrigger_in;
  output [14:0]gt1_dmonitorout_out;
  input gt1_rxusrclk_in;
  input gt1_rxusrclk2_in;
  output [15:0]gt1_rxdata_out;
  output [1:0]gt1_rxdisperr_out;
  output [1:0]gt1_rxnotintable_out;
  input gt1_gthrxn_in;
  input gt1_rxbufreset_in;
  output [2:0]gt1_rxbufstatus_out;
  input gt1_rxmcommaalignen_in;
  input gt1_rxpcommaalignen_in;
  output [6:0]gt1_rxmonitorout_out;
  input [1:0]gt1_rxmonitorsel_in;
  output gt1_rxoutclk_out;
  input gt1_gtrxreset_in;
  output [1:0]gt1_rxchariscomma_out;
  output [1:0]gt1_rxcharisk_out;
  input gt1_gthrxp_in;
  output gt1_rxresetdone_out;
  input gt1_gttxreset_in;
  input [8:0]gt2_drpaddr_in;
  input gt2_drpclk_in;
  input [15:0]gt2_drpdi_in;
  output [15:0]gt2_drpdo_out;
  input gt2_drpen_in;
  output gt2_drprdy_out;
  input gt2_drpwe_in;
  input [1:0]gt2_rxpd_in;
  input gt2_eyescanreset_in;
  input gt2_rxuserrdy_in;
  output gt2_eyescandataerror_out;
  input gt2_eyescantrigger_in;
  output [14:0]gt2_dmonitorout_out;
  input gt2_rxusrclk_in;
  input gt2_rxusrclk2_in;
  output [15:0]gt2_rxdata_out;
  output [1:0]gt2_rxdisperr_out;
  output [1:0]gt2_rxnotintable_out;
  input gt2_gthrxn_in;
  input gt2_rxbufreset_in;
  output [2:0]gt2_rxbufstatus_out;
  input gt2_rxmcommaalignen_in;
  input gt2_rxpcommaalignen_in;
  output [6:0]gt2_rxmonitorout_out;
  input [1:0]gt2_rxmonitorsel_in;
  output gt2_rxoutclk_out;
  input gt2_gtrxreset_in;
  output [1:0]gt2_rxchariscomma_out;
  output [1:0]gt2_rxcharisk_out;
  input gt2_gthrxp_in;
  output gt2_rxresetdone_out;
  input gt2_gttxreset_in;
  input [8:0]gt3_drpaddr_in;
  input gt3_drpclk_in;
  input [15:0]gt3_drpdi_in;
  output [15:0]gt3_drpdo_out;
  input gt3_drpen_in;
  output gt3_drprdy_out;
  input gt3_drpwe_in;
  input [1:0]gt3_rxpd_in;
  input gt3_eyescanreset_in;
  input gt3_rxuserrdy_in;
  output gt3_eyescandataerror_out;
  input gt3_eyescantrigger_in;
  output [14:0]gt3_dmonitorout_out;
  input gt3_rxusrclk_in;
  input gt3_rxusrclk2_in;
  output [15:0]gt3_rxdata_out;
  output [1:0]gt3_rxdisperr_out;
  output [1:0]gt3_rxnotintable_out;
  input gt3_gthrxn_in;
  input gt3_rxbufreset_in;
  output [2:0]gt3_rxbufstatus_out;
  input gt3_rxmcommaalignen_in;
  input gt3_rxpcommaalignen_in;
  output [6:0]gt3_rxmonitorout_out;
  input [1:0]gt3_rxmonitorsel_in;
  output gt3_rxoutclk_out;
  input gt3_gtrxreset_in;
  output [1:0]gt3_rxchariscomma_out;
  output [1:0]gt3_rxcharisk_out;
  input gt3_gthrxp_in;
  output gt3_rxresetdone_out;
  input gt3_gttxreset_in;
  input GT0_QPLLLOCK_IN;
  input GT0_QPLLREFCLKLOST_IN;
  output GT0_QPLLRESET_OUT;
  input GT0_QPLLOUTCLK_IN;
  input GT0_QPLLOUTREFCLK_IN;

  wire DONT_RESET_ON_DATA_ERROR_IN;
  wire GT0_DATA_VALID_IN;
  wire GT0_DRP_BUSY_OUT;
  wire GT0_QPLLLOCK_IN;
  wire GT0_QPLLOUTCLK_IN;
  wire GT0_QPLLOUTREFCLK_IN;
  wire GT0_QPLLRESET_OUT;
  wire GT0_RX_FSM_RESET_DONE_OUT;
  wire GT1_DATA_VALID_IN;
  wire GT1_DRP_BUSY_OUT;
  wire GT1_RX_FSM_RESET_DONE_OUT;
  wire GT2_DATA_VALID_IN;
  wire GT2_DRP_BUSY_OUT;
  wire GT2_RX_FSM_RESET_DONE_OUT;
  wire GT3_DATA_VALID_IN;
  wire GT3_DRP_BUSY_OUT;
  wire GT3_RX_FSM_RESET_DONE_OUT;
  wire SOFT_RESET_IN;
  wire SYSCLK_IN;
  wire [14:0]gt0_dmonitorout_out;
  wire [8:0]gt0_drpaddr_in;
  wire gt0_drpclk_in;
  wire [15:0]gt0_drpdi_in;
  wire [15:0]gt0_drpdo_out;
  wire gt0_drpen_in;
  wire gt0_drprdy_out;
  wire gt0_drpwe_in;
  wire gt0_eyescandataerror_out;
  wire gt0_eyescanreset_in;
  wire gt0_eyescantrigger_in;
  wire gt0_gthrxn_in;
  wire gt0_gthrxp_in;
  wire gt0_rxbufreset_in;
  wire [2:0]gt0_rxbufstatus_out;
  wire [1:0]gt0_rxchariscomma_out;
  wire [1:0]gt0_rxcharisk_out;
  wire [15:0]gt0_rxdata_out;
  wire [1:0]gt0_rxdisperr_out;
  wire gt0_rxmcommaalignen_in;
  wire [6:0]gt0_rxmonitorout_out;
  wire [1:0]gt0_rxmonitorsel_in;
  wire [1:0]gt0_rxnotintable_out;
  wire gt0_rxoutclk_out;
  wire gt0_rxpcommaalignen_in;
  wire [1:0]gt0_rxpd_in;
  wire gt0_rxresetdone_out;
  wire gt0_rxusrclk2_in;
  wire gt0_rxusrclk_in;
  wire [14:0]gt1_dmonitorout_out;
  wire [8:0]gt1_drpaddr_in;
  wire gt1_drpclk_in;
  wire [15:0]gt1_drpdi_in;
  wire [15:0]gt1_drpdo_out;
  wire gt1_drpen_in;
  wire gt1_drprdy_out;
  wire gt1_drpwe_in;
  wire gt1_eyescandataerror_out;
  wire gt1_eyescanreset_in;
  wire gt1_eyescantrigger_in;
  wire gt1_gthrxn_in;
  wire gt1_gthrxp_in;
  wire gt1_rxbufreset_in;
  wire [2:0]gt1_rxbufstatus_out;
  wire [1:0]gt1_rxchariscomma_out;
  wire [1:0]gt1_rxcharisk_out;
  wire [15:0]gt1_rxdata_out;
  wire [1:0]gt1_rxdisperr_out;
  wire gt1_rxmcommaalignen_in;
  wire [6:0]gt1_rxmonitorout_out;
  wire [1:0]gt1_rxmonitorsel_in;
  wire [1:0]gt1_rxnotintable_out;
  wire gt1_rxoutclk_out;
  wire gt1_rxpcommaalignen_in;
  wire [1:0]gt1_rxpd_in;
  wire gt1_rxresetdone_out;
  wire gt1_rxusrclk2_in;
  wire gt1_rxusrclk_in;
  wire [14:0]gt2_dmonitorout_out;
  wire [8:0]gt2_drpaddr_in;
  wire gt2_drpclk_in;
  wire [15:0]gt2_drpdi_in;
  wire [15:0]gt2_drpdo_out;
  wire gt2_drpen_in;
  wire gt2_drprdy_out;
  wire gt2_drpwe_in;
  wire gt2_eyescandataerror_out;
  wire gt2_eyescanreset_in;
  wire gt2_eyescantrigger_in;
  wire gt2_gthrxn_in;
  wire gt2_gthrxp_in;
  wire gt2_rxbufreset_in;
  wire [2:0]gt2_rxbufstatus_out;
  wire [1:0]gt2_rxchariscomma_out;
  wire [1:0]gt2_rxcharisk_out;
  wire [15:0]gt2_rxdata_out;
  wire [1:0]gt2_rxdisperr_out;
  wire gt2_rxmcommaalignen_in;
  wire [6:0]gt2_rxmonitorout_out;
  wire [1:0]gt2_rxmonitorsel_in;
  wire [1:0]gt2_rxnotintable_out;
  wire gt2_rxoutclk_out;
  wire gt2_rxpcommaalignen_in;
  wire [1:0]gt2_rxpd_in;
  wire gt2_rxresetdone_out;
  wire gt2_rxusrclk2_in;
  wire gt2_rxusrclk_in;
  wire [14:0]gt3_dmonitorout_out;
  wire [8:0]gt3_drpaddr_in;
  wire gt3_drpclk_in;
  wire [15:0]gt3_drpdi_in;
  wire [15:0]gt3_drpdo_out;
  wire gt3_drpen_in;
  wire gt3_drprdy_out;
  wire gt3_drpwe_in;
  wire gt3_eyescandataerror_out;
  wire gt3_eyescanreset_in;
  wire gt3_eyescantrigger_in;
  wire gt3_gthrxn_in;
  wire gt3_gthrxp_in;
  wire gt3_rxbufreset_in;
  wire [2:0]gt3_rxbufstatus_out;
  wire [1:0]gt3_rxchariscomma_out;
  wire [1:0]gt3_rxcharisk_out;
  wire [15:0]gt3_rxdata_out;
  wire [1:0]gt3_rxdisperr_out;
  wire gt3_rxmcommaalignen_in;
  wire [6:0]gt3_rxmonitorout_out;
  wire [1:0]gt3_rxmonitorsel_in;
  wire [1:0]gt3_rxnotintable_out;
  wire gt3_rxoutclk_out;
  wire gt3_rxpcommaalignen_in;
  wire [1:0]gt3_rxpd_in;
  wire gt3_rxresetdone_out;
  wire gt3_rxusrclk2_in;
  wire gt3_rxusrclk_in;

gtwizard_32_Rx_gtwizard_32_Rx_init__parameterized0 U0
       (.DONT_RESET_ON_DATA_ERROR_IN(DONT_RESET_ON_DATA_ERROR_IN),
        .GT0_DATA_VALID_IN(GT0_DATA_VALID_IN),
        .GT0_DRP_BUSY_OUT(GT0_DRP_BUSY_OUT),
        .GT0_QPLLLOCK_IN(GT0_QPLLLOCK_IN),
        .GT0_QPLLOUTCLK_IN(GT0_QPLLOUTCLK_IN),
        .GT0_QPLLOUTREFCLK_IN(GT0_QPLLOUTREFCLK_IN),
        .GT0_QPLLRESET_OUT(GT0_QPLLRESET_OUT),
        .GT0_RX_FSM_RESET_DONE_OUT(GT0_RX_FSM_RESET_DONE_OUT),
        .GT1_DATA_VALID_IN(GT1_DATA_VALID_IN),
        .GT1_DRP_BUSY_OUT(GT1_DRP_BUSY_OUT),
        .GT1_RX_FSM_RESET_DONE_OUT(GT1_RX_FSM_RESET_DONE_OUT),
        .GT2_DATA_VALID_IN(GT2_DATA_VALID_IN),
        .GT2_DRP_BUSY_OUT(GT2_DRP_BUSY_OUT),
        .GT2_RX_FSM_RESET_DONE_OUT(GT2_RX_FSM_RESET_DONE_OUT),
        .GT3_DATA_VALID_IN(GT3_DATA_VALID_IN),
        .GT3_DRP_BUSY_OUT(GT3_DRP_BUSY_OUT),
        .GT3_RX_FSM_RESET_DONE_OUT(GT3_RX_FSM_RESET_DONE_OUT),
        .SOFT_RESET_IN(SOFT_RESET_IN),
        .SYSCLK_IN(SYSCLK_IN),
        .gt0_dmonitorout_out(gt0_dmonitorout_out),
        .gt0_drpaddr_in(gt0_drpaddr_in),
        .gt0_drpclk_in(gt0_drpclk_in),
        .gt0_drpdi_in(gt0_drpdi_in),
        .gt0_drpdo_out(gt0_drpdo_out),
        .gt0_drpen_in(gt0_drpen_in),
        .gt0_drprdy_out(gt0_drprdy_out),
        .gt0_drpwe_in(gt0_drpwe_in),
        .gt0_eyescandataerror_out(gt0_eyescandataerror_out),
        .gt0_eyescanreset_in(gt0_eyescanreset_in),
        .gt0_eyescantrigger_in(gt0_eyescantrigger_in),
        .gt0_gthrxn_in(gt0_gthrxn_in),
        .gt0_gthrxp_in(gt0_gthrxp_in),
        .gt0_rxbufreset_in(gt0_rxbufreset_in),
        .gt0_rxbufstatus_out(gt0_rxbufstatus_out),
        .gt0_rxchariscomma_out(gt0_rxchariscomma_out),
        .gt0_rxcharisk_out(gt0_rxcharisk_out),
        .gt0_rxdata_out(gt0_rxdata_out),
        .gt0_rxdisperr_out(gt0_rxdisperr_out),
        .gt0_rxmcommaalignen_in(gt0_rxmcommaalignen_in),
        .gt0_rxmonitorout_out(gt0_rxmonitorout_out),
        .gt0_rxmonitorsel_in(gt0_rxmonitorsel_in),
        .gt0_rxnotintable_out(gt0_rxnotintable_out),
        .gt0_rxoutclk_out(gt0_rxoutclk_out),
        .gt0_rxpcommaalignen_in(gt0_rxpcommaalignen_in),
        .gt0_rxpd_in(gt0_rxpd_in),
        .gt0_rxresetdone_out(gt0_rxresetdone_out),
        .gt0_rxusrclk2_in(gt0_rxusrclk2_in),
        .gt0_rxusrclk_in(gt0_rxusrclk_in),
        .gt1_dmonitorout_out(gt1_dmonitorout_out),
        .gt1_drpaddr_in(gt1_drpaddr_in),
        .gt1_drpclk_in(gt1_drpclk_in),
        .gt1_drpdi_in(gt1_drpdi_in),
        .gt1_drpdo_out(gt1_drpdo_out),
        .gt1_drpen_in(gt1_drpen_in),
        .gt1_drprdy_out(gt1_drprdy_out),
        .gt1_drpwe_in(gt1_drpwe_in),
        .gt1_eyescandataerror_out(gt1_eyescandataerror_out),
        .gt1_eyescanreset_in(gt1_eyescanreset_in),
        .gt1_eyescantrigger_in(gt1_eyescantrigger_in),
        .gt1_gthrxn_in(gt1_gthrxn_in),
        .gt1_gthrxp_in(gt1_gthrxp_in),
        .gt1_rxbufreset_in(gt1_rxbufreset_in),
        .gt1_rxbufstatus_out(gt1_rxbufstatus_out),
        .gt1_rxchariscomma_out(gt1_rxchariscomma_out),
        .gt1_rxcharisk_out(gt1_rxcharisk_out),
        .gt1_rxdata_out(gt1_rxdata_out),
        .gt1_rxdisperr_out(gt1_rxdisperr_out),
        .gt1_rxmcommaalignen_in(gt1_rxmcommaalignen_in),
        .gt1_rxmonitorout_out(gt1_rxmonitorout_out),
        .gt1_rxmonitorsel_in(gt1_rxmonitorsel_in),
        .gt1_rxnotintable_out(gt1_rxnotintable_out),
        .gt1_rxoutclk_out(gt1_rxoutclk_out),
        .gt1_rxpcommaalignen_in(gt1_rxpcommaalignen_in),
        .gt1_rxpd_in(gt1_rxpd_in),
        .gt1_rxresetdone_out(gt1_rxresetdone_out),
        .gt1_rxusrclk2_in(gt1_rxusrclk2_in),
        .gt1_rxusrclk_in(gt1_rxusrclk_in),
        .gt2_dmonitorout_out(gt2_dmonitorout_out),
        .gt2_drpaddr_in(gt2_drpaddr_in),
        .gt2_drpclk_in(gt2_drpclk_in),
        .gt2_drpdi_in(gt2_drpdi_in),
        .gt2_drpdo_out(gt2_drpdo_out),
        .gt2_drpen_in(gt2_drpen_in),
        .gt2_drprdy_out(gt2_drprdy_out),
        .gt2_drpwe_in(gt2_drpwe_in),
        .gt2_eyescandataerror_out(gt2_eyescandataerror_out),
        .gt2_eyescanreset_in(gt2_eyescanreset_in),
        .gt2_eyescantrigger_in(gt2_eyescantrigger_in),
        .gt2_gthrxn_in(gt2_gthrxn_in),
        .gt2_gthrxp_in(gt2_gthrxp_in),
        .gt2_rxbufreset_in(gt2_rxbufreset_in),
        .gt2_rxbufstatus_out(gt2_rxbufstatus_out),
        .gt2_rxchariscomma_out(gt2_rxchariscomma_out),
        .gt2_rxcharisk_out(gt2_rxcharisk_out),
        .gt2_rxdata_out(gt2_rxdata_out),
        .gt2_rxdisperr_out(gt2_rxdisperr_out),
        .gt2_rxmcommaalignen_in(gt2_rxmcommaalignen_in),
        .gt2_rxmonitorout_out(gt2_rxmonitorout_out),
        .gt2_rxmonitorsel_in(gt2_rxmonitorsel_in),
        .gt2_rxnotintable_out(gt2_rxnotintable_out),
        .gt2_rxoutclk_out(gt2_rxoutclk_out),
        .gt2_rxpcommaalignen_in(gt2_rxpcommaalignen_in),
        .gt2_rxpd_in(gt2_rxpd_in),
        .gt2_rxresetdone_out(gt2_rxresetdone_out),
        .gt2_rxusrclk2_in(gt2_rxusrclk2_in),
        .gt2_rxusrclk_in(gt2_rxusrclk_in),
        .gt3_dmonitorout_out(gt3_dmonitorout_out),
        .gt3_drpaddr_in(gt3_drpaddr_in),
        .gt3_drpclk_in(gt3_drpclk_in),
        .gt3_drpdi_in(gt3_drpdi_in),
        .gt3_drpdo_out(gt3_drpdo_out),
        .gt3_drpen_in(gt3_drpen_in),
        .gt3_drprdy_out(gt3_drprdy_out),
        .gt3_drpwe_in(gt3_drpwe_in),
        .gt3_eyescandataerror_out(gt3_eyescandataerror_out),
        .gt3_eyescanreset_in(gt3_eyescanreset_in),
        .gt3_eyescantrigger_in(gt3_eyescantrigger_in),
        .gt3_gthrxn_in(gt3_gthrxn_in),
        .gt3_gthrxp_in(gt3_gthrxp_in),
        .gt3_rxbufreset_in(gt3_rxbufreset_in),
        .gt3_rxbufstatus_out(gt3_rxbufstatus_out),
        .gt3_rxchariscomma_out(gt3_rxchariscomma_out),
        .gt3_rxcharisk_out(gt3_rxcharisk_out),
        .gt3_rxdata_out(gt3_rxdata_out),
        .gt3_rxdisperr_out(gt3_rxdisperr_out),
        .gt3_rxmcommaalignen_in(gt3_rxmcommaalignen_in),
        .gt3_rxmonitorout_out(gt3_rxmonitorout_out),
        .gt3_rxmonitorsel_in(gt3_rxmonitorsel_in),
        .gt3_rxnotintable_out(gt3_rxnotintable_out),
        .gt3_rxoutclk_out(gt3_rxoutclk_out),
        .gt3_rxpcommaalignen_in(gt3_rxpcommaalignen_in),
        .gt3_rxpd_in(gt3_rxpd_in),
        .gt3_rxresetdone_out(gt3_rxresetdone_out),
        .gt3_rxusrclk2_in(gt3_rxusrclk2_in),
        .gt3_rxusrclk_in(gt3_rxusrclk_in));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_GT" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0
   (O1,
    gt0_eyescandataerror_out,
    gt0_rxoutclk_out,
    gt0_rxresetdone_out,
    gt0_dmonitorout_out,
    gt0_drpdo_out,
    gt0_rxbufstatus_out,
    gt0_rxdata_out,
    gt0_rxmonitorout_out,
    gt0_rxchariscomma_out,
    gt0_rxcharisk_out,
    gt0_rxdisperr_out,
    gt0_rxnotintable_out,
    GT0_DRP_BUSY_OUT,
    gt0_drpclk_in,
    gt0_eyescanreset_in,
    gt0_eyescantrigger_in,
    gt0_gthrxn_in,
    gt0_gthrxp_in,
    GT0_QPLLOUTCLK_IN,
    GT0_QPLLOUTREFCLK_IN,
    gt0_rxbufreset_in,
    gt0_rxmcommaalignen_in,
    gt0_rxpcommaalignen_in,
    RXUSERRDY,
    gt0_rxusrclk_in,
    gt0_rxusrclk2_in,
    gt0_rxmonitorsel_in,
    gt0_rxpd_in,
    AR,
    gtrxreset_i,
    gt0_drpen_in,
    gt0_drpdi_in,
    gt0_drpwe_in,
    gt0_drpaddr_in);
  output O1;
  output gt0_eyescandataerror_out;
  output gt0_rxoutclk_out;
  output gt0_rxresetdone_out;
  output [14:0]gt0_dmonitorout_out;
  output [15:0]gt0_drpdo_out;
  output [2:0]gt0_rxbufstatus_out;
  output [15:0]gt0_rxdata_out;
  output [6:0]gt0_rxmonitorout_out;
  output [1:0]gt0_rxchariscomma_out;
  output [1:0]gt0_rxcharisk_out;
  output [1:0]gt0_rxdisperr_out;
  output [1:0]gt0_rxnotintable_out;
  output GT0_DRP_BUSY_OUT;
  input gt0_drpclk_in;
  input gt0_eyescanreset_in;
  input gt0_eyescantrigger_in;
  input gt0_gthrxn_in;
  input gt0_gthrxp_in;
  input GT0_QPLLOUTCLK_IN;
  input GT0_QPLLOUTREFCLK_IN;
  input gt0_rxbufreset_in;
  input gt0_rxmcommaalignen_in;
  input gt0_rxpcommaalignen_in;
  input RXUSERRDY;
  input gt0_rxusrclk_in;
  input gt0_rxusrclk2_in;
  input [1:0]gt0_rxmonitorsel_in;
  input [1:0]gt0_rxpd_in;
  input [0:0]AR;
  input gtrxreset_i;
  input gt0_drpen_in;
  input [15:0]gt0_drpdi_in;
  input gt0_drpwe_in;
  input [8:0]gt0_drpaddr_in;

  wire [0:0]AR;
  wire GT0_DRP_BUSY_OUT;
  wire GT0_QPLLOUTCLK_IN;
  wire GT0_QPLLOUTREFCLK_IN;
  wire GTRXRESET_OUT;
  wire O1;
  wire RXPMARESETDONE;
  wire RXUSERRDY;
  wire [14:0]gt0_dmonitorout_out;
  wire [8:0]gt0_drpaddr_in;
  wire gt0_drpclk_in;
  wire [15:0]gt0_drpdi_in;
  wire [15:0]gt0_drpdo_out;
  wire gt0_drpen_in;
  wire gt0_drpwe_in;
  wire gt0_eyescandataerror_out;
  wire gt0_eyescanreset_in;
  wire gt0_eyescantrigger_in;
  wire gt0_gthrxn_in;
  wire gt0_gthrxp_in;
  wire gt0_rxbufreset_in;
  wire [2:0]gt0_rxbufstatus_out;
  wire [1:0]gt0_rxchariscomma_out;
  wire [1:0]gt0_rxcharisk_out;
  wire [15:0]gt0_rxdata_out;
  wire [1:0]gt0_rxdisperr_out;
  wire gt0_rxmcommaalignen_in;
  wire [6:0]gt0_rxmonitorout_out;
  wire [1:0]gt0_rxmonitorsel_in;
  wire [1:0]gt0_rxnotintable_out;
  wire gt0_rxoutclk_out;
  wire gt0_rxpcommaalignen_in;
  wire [1:0]gt0_rxpd_in;
  wire gt0_rxresetdone_out;
  wire gt0_rxusrclk2_in;
  wire gt0_rxusrclk_in;
  wire gtrxreset_i;
  wire n_10_gtrxreset_seq_i;
  wire n_11_gtrxreset_seq_i;
  wire n_12_gtrxreset_seq_i;
  wire n_13_gtrxreset_seq_i;
  wire n_14_gtrxreset_seq_i;
  wire n_15_gtrxreset_seq_i;
  wire n_16_gtrxreset_seq_i;
  wire n_17_gtrxreset_seq_i;
  wire n_18_gtrxreset_seq_i;
  wire n_19_gtrxreset_seq_i;
  wire n_1_gtrxreset_seq_i;
  wire n_20_gtrxreset_seq_i;
  wire n_21_gtrxreset_seq_i;
  wire n_22_gtrxreset_seq_i;
  wire n_23_gtrxreset_seq_i;
  wire n_24_gtrxreset_seq_i;
  wire n_25_gtrxreset_seq_i;
  wire n_26_gtrxreset_seq_i;
  wire n_270_gthe2_i;
  wire n_27_gtrxreset_seq_i;
  wire n_28_gtrxreset_seq_i;
  wire n_2_gtrxreset_seq_i;
  wire n_3_gtrxreset_seq_i;
  wire n_4_gtrxreset_seq_i;
  wire n_5_gtrxreset_seq_i;
  wire n_6_gtrxreset_seq_i;
  wire n_7_gtrxreset_seq_i;
  wire n_8_gtrxreset_seq_i;
  wire n_9_gtrxreset_seq_i;
  wire NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED;
  wire NLW_gthe2_i_CPLLLOCK_UNCONNECTED;
  wire NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED;
  wire NLW_gthe2_i_GTHTXN_UNCONNECTED;
  wire NLW_gthe2_i_GTHTXP_UNCONNECTED;
  wire NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED;
  wire NLW_gthe2_i_PHYSTATUS_UNCONNECTED;
  wire NLW_gthe2_i_RSOSINTDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED;
  wire NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED;
  wire NLW_gthe2_i_RXCDRLOCK_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMINITDET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMMADET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMSASDET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXELECIDLE_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED;
  wire NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXPRBSERR_UNCONNECTED;
  wire NLW_gthe2_i_RXQPISENN_UNCONNECTED;
  wire NLW_gthe2_i_RXQPISENP_UNCONNECTED;
  wire NLW_gthe2_i_RXRATEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXSYNCDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXSYNCOUT_UNCONNECTED;
  wire NLW_gthe2_i_RXVALID_UNCONNECTED;
  wire NLW_gthe2_i_TXCOMFINISH_UNCONNECTED;
  wire NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLK_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED;
  wire NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXPHINITDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXQPISENN_UNCONNECTED;
  wire NLW_gthe2_i_TXQPISENP_UNCONNECTED;
  wire NLW_gthe2_i_TXRATEDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXSYNCDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXSYNCOUT_UNCONNECTED;
  wire [15:0]NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXCHARISK_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXCHBONDO_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED;
  wire [63:16]NLW_gthe2_i_RXDATA_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXDATAVALID_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXDISPERR_UNCONNECTED;
  wire [5:0]NLW_gthe2_i_RXHEADER_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXHEADERVALID_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXPHMONITOR_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED;
  wire [2:0]NLW_gthe2_i_RXSTATUS_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED;

FDRE #(
    .INIT(1'b0)) 
     drp_busy_i1_reg
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .D(n_19_gtrxreset_seq_i),
        .Q(GT0_DRP_BUSY_OUT),
        .R(1'b0));
(* box_type = "PRIMITIVE" *) 
   GTHE2_CHANNEL #(
    .ACJTAG_DEBUG_MODE(1'b0),
    .ACJTAG_MODE(1'b0),
    .ACJTAG_RESET(1'b0),
    .ADAPT_CFG0(20'h00C10),
    .ALIGN_COMMA_DOUBLE("FALSE"),
    .ALIGN_COMMA_ENABLE(10'b1111111111),
    .ALIGN_COMMA_WORD(2),
    .ALIGN_MCOMMA_DET("TRUE"),
    .ALIGN_MCOMMA_VALUE(10'b1010000011),
    .ALIGN_PCOMMA_DET("TRUE"),
    .ALIGN_PCOMMA_VALUE(10'b0101111100),
    .A_RXOSCALRESET(1'b0),
    .CBCC_DATA_SOURCE_SEL("DECODED"),
    .CFOK_CFG(42'h24800040E80),
    .CFOK_CFG2(6'b100000),
    .CFOK_CFG3(6'b100000),
    .CHAN_BOND_KEEP_ALIGN("FALSE"),
    .CHAN_BOND_MAX_SKEW(1),
    .CHAN_BOND_SEQ_1_1(10'b0000000000),
    .CHAN_BOND_SEQ_1_2(10'b0000000000),
    .CHAN_BOND_SEQ_1_3(10'b0000000000),
    .CHAN_BOND_SEQ_1_4(10'b0000000000),
    .CHAN_BOND_SEQ_1_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_1(10'b0000000000),
    .CHAN_BOND_SEQ_2_2(10'b0000000000),
    .CHAN_BOND_SEQ_2_3(10'b0000000000),
    .CHAN_BOND_SEQ_2_4(10'b0000000000),
    .CHAN_BOND_SEQ_2_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_USE("FALSE"),
    .CHAN_BOND_SEQ_LEN(1),
    .CLK_CORRECT_USE("FALSE"),
    .CLK_COR_KEEP_IDLE("FALSE"),
    .CLK_COR_MAX_LAT(10),
    .CLK_COR_MIN_LAT(8),
    .CLK_COR_PRECEDENCE("TRUE"),
    .CLK_COR_REPEAT_WAIT(0),
    .CLK_COR_SEQ_1_1(10'b0100000000),
    .CLK_COR_SEQ_1_2(10'b0000000000),
    .CLK_COR_SEQ_1_3(10'b0000000000),
    .CLK_COR_SEQ_1_4(10'b0000000000),
    .CLK_COR_SEQ_1_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_1(10'b0100000000),
    .CLK_COR_SEQ_2_2(10'b0000000000),
    .CLK_COR_SEQ_2_3(10'b0000000000),
    .CLK_COR_SEQ_2_4(10'b0000000000),
    .CLK_COR_SEQ_2_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_USE("FALSE"),
    .CLK_COR_SEQ_LEN(1),
    .CPLL_CFG(29'h00BC07DC),
    .CPLL_FBDIV(5),
    .CPLL_FBDIV_45(5),
    .CPLL_INIT_CFG(24'h00001E),
    .CPLL_LOCK_CFG(16'h01E8),
    .CPLL_REFCLK_DIV(1),
    .DEC_MCOMMA_DETECT("TRUE"),
    .DEC_PCOMMA_DETECT("TRUE"),
    .DEC_VALID_COMMA_ONLY("TRUE"),
    .DMONITOR_CFG(24'h000A00),
    .ES_CLK_PHASE_SEL(1'b0),
    .ES_CONTROL(6'b000000),
    .ES_ERRDET_EN("FALSE"),
    .ES_EYE_SCAN_EN("TRUE"),
    .ES_HORZ_OFFSET(12'h000),
    .ES_PMA_CFG(10'b0000000000),
    .ES_PRESCALE(5'b00000),
    .ES_QUALIFIER(80'h00000000000000000000),
    .ES_QUAL_MASK(80'h00000000000000000000),
    .ES_SDATA_MASK(80'h00000000000000000000),
    .ES_VERT_OFFSET(9'b000000000),
    .FTS_DESKEW_SEQ_ENABLE(4'b1111),
    .FTS_LANE_DESKEW_CFG(4'b1111),
    .FTS_LANE_DESKEW_EN("FALSE"),
    .GEARBOX_MODE(3'b000),
    .IS_CLKRSVD0_INVERTED(1'b0),
    .IS_CLKRSVD1_INVERTED(1'b0),
    .IS_CPLLLOCKDETCLK_INVERTED(1'b0),
    .IS_DMONITORCLK_INVERTED(1'b0),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_RXUSRCLK2_INVERTED(1'b0),
    .IS_RXUSRCLK_INVERTED(1'b0),
    .IS_SIGVALIDCLK_INVERTED(1'b0),
    .IS_TXPHDLYTSTCLK_INVERTED(1'b0),
    .IS_TXUSRCLK2_INVERTED(1'b0),
    .IS_TXUSRCLK_INVERTED(1'b0),
    .LOOPBACK_CFG(1'b0),
    .OUTREFCLK_SEL_INV(2'b11),
    .PCS_PCIE_EN("FALSE"),
    .PCS_RSVD_ATTR(48'h000000000000),
    .PD_TRANS_TIME_FROM_P2(12'h03C),
    .PD_TRANS_TIME_NONE_P2(8'h3C),
    .PD_TRANS_TIME_TO_P2(8'h64),
    .PMA_RSV(32'b00000000000111100111000010000000),
    .PMA_RSV2(32'b00011100000000000000000000001010),
    .PMA_RSV3(2'b00),
    .PMA_RSV4(15'b000000000001000),
    .PMA_RSV5(4'b0000),
    .RESET_POWERSAVE_DISABLE(1'b0),
    .RXBUFRESET_TIME(5'b00001),
    .RXBUF_ADDR_MODE("FAST"),
    .RXBUF_EIDLE_HI_CNT(4'b1000),
    .RXBUF_EIDLE_LO_CNT(4'b0000),
    .RXBUF_EN("TRUE"),
    .RXBUF_RESET_ON_CB_CHANGE("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN("FALSE"),
    .RXBUF_RESET_ON_EIDLE("FALSE"),
    .RXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .RXBUF_THRESH_OVFLW(61),
    .RXBUF_THRESH_OVRD("FALSE"),
    .RXBUF_THRESH_UNDFLW(4),
    .RXCDRFREQRESET_TIME(5'b00001),
    .RXCDRPHRESET_TIME(5'b00001),
    .RXCDR_CFG(83'h0002007FE1000C2080018),
    .RXCDR_FR_RESET_ON_EIDLE(1'b0),
    .RXCDR_HOLD_DURING_EIDLE(1'b0),
    .RXCDR_LOCK_CFG(6'b010101),
    .RXCDR_PH_RESET_ON_EIDLE(1'b0),
    .RXDFELPMRESET_TIME(7'b0001111),
    .RXDLY_CFG(16'h001F),
    .RXDLY_LCFG(9'h030),
    .RXDLY_TAP_CFG(16'h0000),
    .RXGEARBOX_EN("FALSE"),
    .RXISCANRESET_TIME(5'b00001),
    .RXLPM_HF_CFG(14'b00001000000000),
    .RXLPM_LF_CFG(18'b001001000000000000),
    .RXOOB_CFG(7'b0000110),
    .RXOOB_CLK_CFG("PMA"),
    .RXOSCALRESET_TIME(5'b00011),
    .RXOSCALRESET_TIMEOUT(5'b00000),
    .RXOUT_DIV(2),
    .RXPCSRESET_TIME(5'b00001),
    .RXPHDLY_CFG(24'h084020),
    .RXPH_CFG(24'hC00002),
    .RXPH_MONITOR_SEL(5'b00000),
    .RXPI_CFG0(2'b00),
    .RXPI_CFG1(2'b11),
    .RXPI_CFG2(2'b11),
    .RXPI_CFG3(2'b11),
    .RXPI_CFG4(1'b0),
    .RXPI_CFG5(1'b0),
    .RXPI_CFG6(3'b100),
    .RXPMARESET_TIME(5'b00011),
    .RXPRBS_ERR_LOOPBACK(1'b0),
    .RXSLIDE_AUTO_WAIT(7),
    .RXSLIDE_MODE("OFF"),
    .RXSYNC_MULTILANE(1'b1),
    .RXSYNC_OVRD(1'b0),
    .RXSYNC_SKIP_DA(1'b0),
    .RX_BIAS_CFG(24'b000011000000000000010000),
    .RX_BUFFER_CFG(6'b000000),
    .RX_CLK25_DIV(6),
    .RX_CLKMUX_PD(1'b1),
    .RX_CM_SEL(2'b00),
    .RX_CM_TRIM(4'b0000),
    .RX_DATA_WIDTH(20),
    .RX_DDI_SEL(6'b000000),
    .RX_DEBUG_CFG(14'b00000000000000),
    .RX_DEFER_RESET_BUF_EN("TRUE"),
    .RX_DFELPM_CFG0(4'b0110),
    .RX_DFELPM_CFG1(1'b0),
    .RX_DFELPM_KLKH_AGC_STUP_EN(1'b1),
    .RX_DFE_AGC_CFG0(2'b00),
    .RX_DFE_AGC_CFG1(3'b010),
    .RX_DFE_AGC_CFG2(4'b0000),
    .RX_DFE_AGC_OVRDEN(1'b1),
    .RX_DFE_GAIN_CFG(23'h0020C0),
    .RX_DFE_H2_CFG(12'b000000000000),
    .RX_DFE_H3_CFG(12'b000001000000),
    .RX_DFE_H4_CFG(11'b00011100000),
    .RX_DFE_H5_CFG(11'b00011100000),
    .RX_DFE_H6_CFG(11'b00000100000),
    .RX_DFE_H7_CFG(11'b00000100000),
    .RX_DFE_KL_CFG(33'b001000001000000000000001100010000),
    .RX_DFE_KL_LPM_KH_CFG0(2'b01),
    .RX_DFE_KL_LPM_KH_CFG1(3'b010),
    .RX_DFE_KL_LPM_KH_CFG2(4'b0010),
    .RX_DFE_KL_LPM_KH_OVRDEN(1'b1),
    .RX_DFE_KL_LPM_KL_CFG0(2'b01),
    .RX_DFE_KL_LPM_KL_CFG1(3'b010),
    .RX_DFE_KL_LPM_KL_CFG2(4'b0010),
    .RX_DFE_KL_LPM_KL_OVRDEN(1'b1),
    .RX_DFE_LPM_CFG(16'h0080),
    .RX_DFE_LPM_HOLD_DURING_EIDLE(1'b0),
    .RX_DFE_ST_CFG(54'h00E100000C003F),
    .RX_DFE_UT_CFG(17'b00011100000000000),
    .RX_DFE_VP_CFG(17'b00011101010100011),
    .RX_DISPERR_SEQ_MATCH("TRUE"),
    .RX_INT_DATAWIDTH(0),
    .RX_OS_CFG(13'b0000010000000),
    .RX_SIG_VALID_DLY(10),
    .RX_XCLK_SEL("RXREC"),
    .SAS_MAX_COM(64),
    .SAS_MIN_COM(36),
    .SATA_BURST_SEQ_LEN(4'b1111),
    .SATA_BURST_VAL(3'b100),
    .SATA_CPLL_CFG("VCO_3000MHZ"),
    .SATA_EIDLE_VAL(3'b100),
    .SATA_MAX_BURST(8),
    .SATA_MAX_INIT(21),
    .SATA_MAX_WAKE(7),
    .SATA_MIN_BURST(4),
    .SATA_MIN_INIT(12),
    .SATA_MIN_WAKE(4),
    .SHOW_REALIGN_COMMA("TRUE"),
    .SIM_CPLLREFCLK_SEL(3'b001),
    .SIM_RECEIVER_DETECT_PASS("TRUE"),
    .SIM_RESET_SPEEDUP("FALSE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL("X"),
    .SIM_VERSION("2.0"),
    .TERM_RCAL_CFG(15'b100001000010000),
    .TERM_RCAL_OVRD(3'b000),
    .TRANS_TIME_RATE(8'h0E),
    .TST_RSV(32'h00000000),
    .TXBUF_EN("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .TXDLY_CFG(16'h001F),
    .TXDLY_LCFG(9'h030),
    .TXDLY_TAP_CFG(16'h0000),
    .TXGEARBOX_EN("FALSE"),
    .TXOOB_CFG(1'b0),
    .TXOUT_DIV(1),
    .TXPCSRESET_TIME(5'b00001),
    .TXPHDLY_CFG(24'h084020),
    .TXPH_CFG(16'h0780),
    .TXPH_MONITOR_SEL(5'b00000),
    .TXPI_CFG0(2'b00),
    .TXPI_CFG1(2'b00),
    .TXPI_CFG2(2'b00),
    .TXPI_CFG3(1'b0),
    .TXPI_CFG4(1'b0),
    .TXPI_CFG5(3'b100),
    .TXPI_GREY_SEL(1'b0),
    .TXPI_INVSTROBE_SEL(1'b0),
    .TXPI_PPMCLK_SEL("TXUSRCLK2"),
    .TXPI_PPM_CFG(8'b00000000),
    .TXPI_SYNFREQ_PPM(3'b000),
    .TXPMARESET_TIME(5'b00001),
    .TXSYNC_MULTILANE(1'b0),
    .TXSYNC_OVRD(1'b0),
    .TXSYNC_SKIP_DA(1'b0),
    .TX_CLK25_DIV(6),
    .TX_CLKMUX_PD(1'b1),
    .TX_DATA_WIDTH(20),
    .TX_DEEMPH0(6'b000000),
    .TX_DEEMPH1(6'b000000),
    .TX_DRIVE_MODE("DIRECT"),
    .TX_EIDLE_ASSERT_DELAY(3'b110),
    .TX_EIDLE_DEASSERT_DELAY(3'b100),
    .TX_INT_DATAWIDTH(0),
    .TX_LOOPBACK_DRIVE_HIZ("FALSE"),
    .TX_MAINCURSOR_SEL(1'b0),
    .TX_MARGIN_FULL_0(7'b1001110),
    .TX_MARGIN_FULL_1(7'b1001001),
    .TX_MARGIN_FULL_2(7'b1000101),
    .TX_MARGIN_FULL_3(7'b1000010),
    .TX_MARGIN_FULL_4(7'b1000000),
    .TX_MARGIN_LOW_0(7'b1000110),
    .TX_MARGIN_LOW_1(7'b1000100),
    .TX_MARGIN_LOW_2(7'b1000010),
    .TX_MARGIN_LOW_3(7'b1000000),
    .TX_MARGIN_LOW_4(7'b1000000),
    .TX_QPI_STATUS_EN(1'b0),
    .TX_RXDETECT_CFG(14'h1832),
    .TX_RXDETECT_PRECHARGE_TIME(17'h155CC),
    .TX_RXDETECT_REF(3'b100),
    .TX_XCLK_SEL("TXOUT"),
    .UCODEER_CLR(1'b0),
    .USE_PCS_CLK_PHASE_SEL(1'b0)) 
     gthe2_i
       (.CFGRESET(1'b0),
        .CLKRSVD0(1'b0),
        .CLKRSVD1(1'b0),
        .CPLLFBCLKLOST(NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED),
        .CPLLLOCK(NLW_gthe2_i_CPLLLOCK_UNCONNECTED),
        .CPLLLOCKDETCLK(1'b0),
        .CPLLLOCKEN(1'b1),
        .CPLLPD(1'b1),
        .CPLLREFCLKLOST(NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED),
        .CPLLREFCLKSEL({1'b0,1'b0,1'b1}),
        .CPLLRESET(1'b0),
        .DMONFIFORESET(1'b0),
        .DMONITORCLK(1'b0),
        .DMONITOROUT(gt0_dmonitorout_out),
        .DRPADDR({n_20_gtrxreset_seq_i,n_21_gtrxreset_seq_i,n_22_gtrxreset_seq_i,n_23_gtrxreset_seq_i,n_24_gtrxreset_seq_i,n_25_gtrxreset_seq_i,n_26_gtrxreset_seq_i,n_27_gtrxreset_seq_i,n_28_gtrxreset_seq_i}),
        .DRPCLK(gt0_drpclk_in),
        .DRPDI({n_2_gtrxreset_seq_i,n_3_gtrxreset_seq_i,n_4_gtrxreset_seq_i,n_5_gtrxreset_seq_i,n_6_gtrxreset_seq_i,n_7_gtrxreset_seq_i,n_8_gtrxreset_seq_i,n_9_gtrxreset_seq_i,n_10_gtrxreset_seq_i,n_11_gtrxreset_seq_i,n_12_gtrxreset_seq_i,n_13_gtrxreset_seq_i,n_14_gtrxreset_seq_i,n_15_gtrxreset_seq_i,n_16_gtrxreset_seq_i,n_17_gtrxreset_seq_i}),
        .DRPDO(gt0_drpdo_out),
        .DRPEN(n_1_gtrxreset_seq_i),
        .DRPRDY(O1),
        .DRPWE(n_18_gtrxreset_seq_i),
        .EYESCANDATAERROR(gt0_eyescandataerror_out),
        .EYESCANMODE(1'b0),
        .EYESCANRESET(gt0_eyescanreset_in),
        .EYESCANTRIGGER(gt0_eyescantrigger_in),
        .GTGREFCLK(1'b0),
        .GTHRXN(gt0_gthrxn_in),
        .GTHRXP(gt0_gthrxp_in),
        .GTHTXN(NLW_gthe2_i_GTHTXN_UNCONNECTED),
        .GTHTXP(NLW_gthe2_i_GTHTXP_UNCONNECTED),
        .GTNORTHREFCLK0(1'b0),
        .GTNORTHREFCLK1(1'b0),
        .GTREFCLK0(1'b0),
        .GTREFCLK1(1'b0),
        .GTREFCLKMONITOR(NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED),
        .GTRESETSEL(1'b0),
        .GTRSVD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .GTRXRESET(GTRXRESET_OUT),
        .GTSOUTHREFCLK0(1'b0),
        .GTSOUTHREFCLK1(1'b0),
        .GTTXRESET(n_270_gthe2_i),
        .LOOPBACK({1'b0,1'b0,1'b0}),
        .PCSRSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDIN2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDOUT(NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED[15:0]),
        .PHYSTATUS(NLW_gthe2_i_PHYSTATUS_UNCONNECTED),
        .PMARSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLCLK(GT0_QPLLOUTCLK_IN),
        .QPLLREFCLK(GT0_QPLLOUTREFCLK_IN),
        .RESETOVRD(1'b0),
        .RSOSINTDONE(NLW_gthe2_i_RSOSINTDONE_UNCONNECTED),
        .RX8B10BEN(1'b1),
        .RXADAPTSELTEST({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXBUFRESET(gt0_rxbufreset_in),
        .RXBUFSTATUS(gt0_rxbufstatus_out),
        .RXBYTEISALIGNED(NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED),
        .RXBYTEREALIGN(NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED),
        .RXCDRFREQRESET(1'b0),
        .RXCDRHOLD(1'b0),
        .RXCDRLOCK(NLW_gthe2_i_RXCDRLOCK_UNCONNECTED),
        .RXCDROVRDEN(1'b0),
        .RXCDRRESET(1'b0),
        .RXCDRRESETRSV(1'b0),
        .RXCHANBONDSEQ(NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED),
        .RXCHANISALIGNED(NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED),
        .RXCHANREALIGN(NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED),
        .RXCHARISCOMMA({NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED[7:2],gt0_rxchariscomma_out}),
        .RXCHARISK({NLW_gthe2_i_RXCHARISK_UNCONNECTED[7:2],gt0_rxcharisk_out}),
        .RXCHBONDEN(1'b0),
        .RXCHBONDI({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXCHBONDLEVEL({1'b0,1'b0,1'b0}),
        .RXCHBONDMASTER(1'b0),
        .RXCHBONDO(NLW_gthe2_i_RXCHBONDO_UNCONNECTED[4:0]),
        .RXCHBONDSLAVE(1'b0),
        .RXCLKCORCNT(NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED[1:0]),
        .RXCOMINITDET(NLW_gthe2_i_RXCOMINITDET_UNCONNECTED),
        .RXCOMMADET(NLW_gthe2_i_RXCOMMADET_UNCONNECTED),
        .RXCOMMADETEN(1'b1),
        .RXCOMSASDET(NLW_gthe2_i_RXCOMSASDET_UNCONNECTED),
        .RXCOMWAKEDET(NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED),
        .RXDATA({NLW_gthe2_i_RXDATA_UNCONNECTED[63:16],gt0_rxdata_out}),
        .RXDATAVALID(NLW_gthe2_i_RXDATAVALID_UNCONNECTED[1:0]),
        .RXDDIEN(1'b0),
        .RXDFEAGCHOLD(1'b0),
        .RXDFEAGCOVRDEN(1'b1),
        .RXDFEAGCTRL({1'b1,1'b0,1'b0,1'b0,1'b0}),
        .RXDFECM1EN(1'b0),
        .RXDFELFHOLD(1'b0),
        .RXDFELFOVRDEN(1'b0),
        .RXDFELPMRESET(1'b0),
        .RXDFESLIDETAP({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXDFESLIDETAPADAPTEN(1'b0),
        .RXDFESLIDETAPHOLD(1'b0),
        .RXDFESLIDETAPID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXDFESLIDETAPINITOVRDEN(1'b0),
        .RXDFESLIDETAPONLYADAPTEN(1'b0),
        .RXDFESLIDETAPOVRDEN(1'b0),
        .RXDFESLIDETAPSTARTED(NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED),
        .RXDFESLIDETAPSTROBE(1'b0),
        .RXDFESLIDETAPSTROBEDONE(NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED),
        .RXDFESLIDETAPSTROBESTARTED(NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED),
        .RXDFESTADAPTDONE(NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED),
        .RXDFETAP2HOLD(1'b0),
        .RXDFETAP2OVRDEN(1'b0),
        .RXDFETAP3HOLD(1'b0),
        .RXDFETAP3OVRDEN(1'b0),
        .RXDFETAP4HOLD(1'b0),
        .RXDFETAP4OVRDEN(1'b0),
        .RXDFETAP5HOLD(1'b0),
        .RXDFETAP5OVRDEN(1'b0),
        .RXDFETAP6HOLD(1'b0),
        .RXDFETAP6OVRDEN(1'b0),
        .RXDFETAP7HOLD(1'b0),
        .RXDFETAP7OVRDEN(1'b0),
        .RXDFEUTHOLD(1'b0),
        .RXDFEUTOVRDEN(1'b0),
        .RXDFEVPHOLD(1'b0),
        .RXDFEVPOVRDEN(1'b0),
        .RXDFEVSEN(1'b0),
        .RXDFEXYDEN(1'b1),
        .RXDISPERR({NLW_gthe2_i_RXDISPERR_UNCONNECTED[7:2],gt0_rxdisperr_out}),
        .RXDLYBYPASS(1'b1),
        .RXDLYEN(1'b0),
        .RXDLYOVRDEN(1'b0),
        .RXDLYSRESET(1'b0),
        .RXDLYSRESETDONE(NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED),
        .RXELECIDLE(NLW_gthe2_i_RXELECIDLE_UNCONNECTED),
        .RXELECIDLEMODE({1'b1,1'b1}),
        .RXGEARBOXSLIP(1'b0),
        .RXHEADER(NLW_gthe2_i_RXHEADER_UNCONNECTED[5:0]),
        .RXHEADERVALID(NLW_gthe2_i_RXHEADERVALID_UNCONNECTED[1:0]),
        .RXLPMEN(1'b1),
        .RXLPMHFHOLD(1'b0),
        .RXLPMHFOVRDEN(1'b0),
        .RXLPMLFHOLD(1'b0),
        .RXLPMLFKLOVRDEN(1'b0),
        .RXMCOMMAALIGNEN(gt0_rxmcommaalignen_in),
        .RXMONITOROUT(gt0_rxmonitorout_out),
        .RXMONITORSEL(gt0_rxmonitorsel_in),
        .RXNOTINTABLE({NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED[7:2],gt0_rxnotintable_out}),
        .RXOOBRESET(1'b0),
        .RXOSCALRESET(1'b0),
        .RXOSHOLD(1'b0),
        .RXOSINTCFG({1'b0,1'b1,1'b1,1'b0}),
        .RXOSINTEN(1'b1),
        .RXOSINTHOLD(1'b0),
        .RXOSINTID0({1'b0,1'b0,1'b0,1'b0}),
        .RXOSINTNTRLEN(1'b0),
        .RXOSINTOVRDEN(1'b0),
        .RXOSINTSTARTED(NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED),
        .RXOSINTSTROBE(1'b0),
        .RXOSINTSTROBEDONE(NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED),
        .RXOSINTSTROBESTARTED(NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED),
        .RXOSINTTESTOVRDEN(1'b0),
        .RXOSOVRDEN(1'b0),
        .RXOUTCLK(gt0_rxoutclk_out),
        .RXOUTCLKFABRIC(NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED),
        .RXOUTCLKPCS(NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED),
        .RXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .RXPCOMMAALIGNEN(gt0_rxpcommaalignen_in),
        .RXPCSRESET(1'b0),
        .RXPD(gt0_rxpd_in),
        .RXPHALIGN(1'b0),
        .RXPHALIGNDONE(NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED),
        .RXPHALIGNEN(1'b0),
        .RXPHDLYPD(1'b0),
        .RXPHDLYRESET(1'b0),
        .RXPHMONITOR(NLW_gthe2_i_RXPHMONITOR_UNCONNECTED[4:0]),
        .RXPHOVRDEN(1'b0),
        .RXPHSLIPMONITOR(NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED[4:0]),
        .RXPMARESET(1'b0),
        .RXPMARESETDONE(RXPMARESETDONE),
        .RXPOLARITY(1'b0),
        .RXPRBSCNTRESET(1'b0),
        .RXPRBSERR(NLW_gthe2_i_RXPRBSERR_UNCONNECTED),
        .RXPRBSSEL({1'b0,1'b0,1'b0}),
        .RXQPIEN(1'b0),
        .RXQPISENN(NLW_gthe2_i_RXQPISENN_UNCONNECTED),
        .RXQPISENP(NLW_gthe2_i_RXQPISENP_UNCONNECTED),
        .RXRATE({1'b0,1'b0,1'b0}),
        .RXRATEDONE(NLW_gthe2_i_RXRATEDONE_UNCONNECTED),
        .RXRATEMODE(1'b0),
        .RXRESETDONE(gt0_rxresetdone_out),
        .RXSLIDE(1'b0),
        .RXSTARTOFSEQ(NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED[1:0]),
        .RXSTATUS(NLW_gthe2_i_RXSTATUS_UNCONNECTED[2:0]),
        .RXSYNCALLIN(1'b0),
        .RXSYNCDONE(NLW_gthe2_i_RXSYNCDONE_UNCONNECTED),
        .RXSYNCIN(1'b0),
        .RXSYNCMODE(1'b0),
        .RXSYNCOUT(NLW_gthe2_i_RXSYNCOUT_UNCONNECTED),
        .RXSYSCLKSEL({1'b1,1'b1}),
        .RXUSERRDY(RXUSERRDY),
        .RXUSRCLK(gt0_rxusrclk_in),
        .RXUSRCLK2(gt0_rxusrclk2_in),
        .RXVALID(NLW_gthe2_i_RXVALID_UNCONNECTED),
        .SETERRSTATUS(1'b0),
        .SIGVALIDCLK(1'b0),
        .TSTIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .TX8B10BBYPASS({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX8B10BEN(1'b0),
        .TXBUFDIFFCTRL({1'b1,1'b0,1'b0}),
        .TXBUFSTATUS(NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED[1:0]),
        .TXCHARDISPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARDISPVAL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARISK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCOMFINISH(NLW_gthe2_i_TXCOMFINISH_UNCONNECTED),
        .TXCOMINIT(1'b0),
        .TXCOMSAS(1'b0),
        .TXCOMWAKE(1'b0),
        .TXDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXDEEMPH(1'b0),
        .TXDETECTRX(1'b0),
        .TXDIFFCTRL({1'b1,1'b0,1'b0,1'b0}),
        .TXDIFFPD(1'b1),
        .TXDLYBYPASS(1'b1),
        .TXDLYEN(1'b0),
        .TXDLYHOLD(1'b0),
        .TXDLYOVRDEN(1'b0),
        .TXDLYSRESET(1'b0),
        .TXDLYSRESETDONE(NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED),
        .TXDLYUPDOWN(1'b0),
        .TXELECIDLE(1'b1),
        .TXGEARBOXREADY(NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED),
        .TXHEADER({1'b0,1'b0,1'b0}),
        .TXINHIBIT(1'b0),
        .TXMAINCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXMARGIN({1'b0,1'b0,1'b0}),
        .TXOUTCLK(NLW_gthe2_i_TXOUTCLK_UNCONNECTED),
        .TXOUTCLKFABRIC(NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED),
        .TXOUTCLKPCS(NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED),
        .TXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .TXPCSRESET(1'b0),
        .TXPD({1'b1,1'b1}),
        .TXPDELECIDLEMODE(1'b1),
        .TXPHALIGN(1'b0),
        .TXPHALIGNDONE(NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED),
        .TXPHALIGNEN(1'b0),
        .TXPHDLYPD(1'b1),
        .TXPHDLYRESET(1'b0),
        .TXPHDLYTSTCLK(1'b0),
        .TXPHINIT(1'b0),
        .TXPHINITDONE(NLW_gthe2_i_TXPHINITDONE_UNCONNECTED),
        .TXPHOVRDEN(1'b0),
        .TXPIPPMEN(1'b0),
        .TXPIPPMOVRDEN(1'b0),
        .TXPIPPMPD(1'b1),
        .TXPIPPMSEL(1'b0),
        .TXPIPPMSTEPSIZE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPISOPD(1'b1),
        .TXPMARESET(1'b0),
        .TXPMARESETDONE(NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED),
        .TXPOLARITY(1'b0),
        .TXPOSTCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPOSTCURSORINV(1'b0),
        .TXPRBSFORCEERR(1'b0),
        .TXPRBSSEL({1'b0,1'b0,1'b0}),
        .TXPRECURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPRECURSORINV(1'b0),
        .TXQPIBIASEN(1'b0),
        .TXQPISENN(NLW_gthe2_i_TXQPISENN_UNCONNECTED),
        .TXQPISENP(NLW_gthe2_i_TXQPISENP_UNCONNECTED),
        .TXQPISTRONGPDOWN(1'b0),
        .TXQPIWEAKPUP(1'b0),
        .TXRATE({1'b0,1'b0,1'b0}),
        .TXRATEDONE(NLW_gthe2_i_TXRATEDONE_UNCONNECTED),
        .TXRATEMODE(1'b0),
        .TXRESETDONE(NLW_gthe2_i_TXRESETDONE_UNCONNECTED),
        .TXSEQUENCE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXSTARTSEQ(1'b0),
        .TXSWING(1'b0),
        .TXSYNCALLIN(1'b0),
        .TXSYNCDONE(NLW_gthe2_i_TXSYNCDONE_UNCONNECTED),
        .TXSYNCIN(1'b0),
        .TXSYNCMODE(1'b0),
        .TXSYNCOUT(NLW_gthe2_i_TXSYNCOUT_UNCONNECTED),
        .TXSYSCLKSEL({1'b0,1'b0}),
        .TXUSERRDY(1'b0),
        .TXUSRCLK(1'b0),
        .TXUSRCLK2(1'b0));
gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_10 gtrxreset_seq_i
       (.AR(AR),
        .DRPADDR({n_20_gtrxreset_seq_i,n_21_gtrxreset_seq_i,n_22_gtrxreset_seq_i,n_23_gtrxreset_seq_i,n_24_gtrxreset_seq_i,n_25_gtrxreset_seq_i,n_26_gtrxreset_seq_i,n_27_gtrxreset_seq_i,n_28_gtrxreset_seq_i}),
        .DRPDI({n_2_gtrxreset_seq_i,n_3_gtrxreset_seq_i,n_4_gtrxreset_seq_i,n_5_gtrxreset_seq_i,n_6_gtrxreset_seq_i,n_7_gtrxreset_seq_i,n_8_gtrxreset_seq_i,n_9_gtrxreset_seq_i,n_10_gtrxreset_seq_i,n_11_gtrxreset_seq_i,n_12_gtrxreset_seq_i,n_13_gtrxreset_seq_i,n_14_gtrxreset_seq_i,n_15_gtrxreset_seq_i,n_16_gtrxreset_seq_i,n_17_gtrxreset_seq_i}),
        .GTRXRESET_OUT(GTRXRESET_OUT),
        .I1(O1),
        .O1(n_1_gtrxreset_seq_i),
        .O2(n_18_gtrxreset_seq_i),
        .O3(n_19_gtrxreset_seq_i),
        .data_in(RXPMARESETDONE),
        .gt0_drpaddr_in(gt0_drpaddr_in),
        .gt0_drpclk_in(gt0_drpclk_in),
        .gt0_drpdi_in(gt0_drpdi_in),
        .gt0_drpdo_out(gt0_drpdo_out),
        .gt0_drpen_in(gt0_drpen_in),
        .gt0_drpwe_in(gt0_drpwe_in),
        .gtrxreset_i(gtrxreset_i));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_GT" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_3
   (O1,
    gt1_eyescandataerror_out,
    gt1_rxoutclk_out,
    gt1_rxresetdone_out,
    gt1_dmonitorout_out,
    gt1_drpdo_out,
    gt1_rxbufstatus_out,
    gt1_rxdata_out,
    gt1_rxmonitorout_out,
    gt1_rxchariscomma_out,
    gt1_rxcharisk_out,
    gt1_rxdisperr_out,
    gt1_rxnotintable_out,
    GT1_DRP_BUSY_OUT,
    gt1_drpclk_in,
    gt1_eyescanreset_in,
    gt1_eyescantrigger_in,
    gt1_gthrxn_in,
    gt1_gthrxp_in,
    GT0_QPLLOUTCLK_IN,
    GT0_QPLLOUTREFCLK_IN,
    gt1_rxbufreset_in,
    gt1_rxmcommaalignen_in,
    gt1_rxpcommaalignen_in,
    I1,
    gt1_rxusrclk_in,
    gt1_rxusrclk2_in,
    gt1_rxmonitorsel_in,
    gt1_rxpd_in,
    AR,
    I4,
    gt1_drpen_in,
    gt1_drpdi_in,
    gt1_drpwe_in,
    gt1_drpaddr_in);
  output O1;
  output gt1_eyescandataerror_out;
  output gt1_rxoutclk_out;
  output gt1_rxresetdone_out;
  output [14:0]gt1_dmonitorout_out;
  output [15:0]gt1_drpdo_out;
  output [2:0]gt1_rxbufstatus_out;
  output [15:0]gt1_rxdata_out;
  output [6:0]gt1_rxmonitorout_out;
  output [1:0]gt1_rxchariscomma_out;
  output [1:0]gt1_rxcharisk_out;
  output [1:0]gt1_rxdisperr_out;
  output [1:0]gt1_rxnotintable_out;
  output GT1_DRP_BUSY_OUT;
  input gt1_drpclk_in;
  input gt1_eyescanreset_in;
  input gt1_eyescantrigger_in;
  input gt1_gthrxn_in;
  input gt1_gthrxp_in;
  input GT0_QPLLOUTCLK_IN;
  input GT0_QPLLOUTREFCLK_IN;
  input gt1_rxbufreset_in;
  input gt1_rxmcommaalignen_in;
  input gt1_rxpcommaalignen_in;
  input I1;
  input gt1_rxusrclk_in;
  input gt1_rxusrclk2_in;
  input [1:0]gt1_rxmonitorsel_in;
  input [1:0]gt1_rxpd_in;
  input [0:0]AR;
  input I4;
  input gt1_drpen_in;
  input [15:0]gt1_drpdi_in;
  input gt1_drpwe_in;
  input [8:0]gt1_drpaddr_in;

  wire [0:0]AR;
  wire GT0_QPLLOUTCLK_IN;
  wire GT0_QPLLOUTREFCLK_IN;
  wire GT1_DRP_BUSY_OUT;
  wire GTRXRESET_OUT;
  wire I1;
  wire I4;
  wire O1;
  wire [14:0]gt1_dmonitorout_out;
  wire [8:0]gt1_drpaddr_in;
  wire gt1_drpclk_in;
  wire [15:0]gt1_drpdi_in;
  wire [15:0]gt1_drpdo_out;
  wire gt1_drpen_in;
  wire gt1_drpwe_in;
  wire gt1_eyescandataerror_out;
  wire gt1_eyescanreset_in;
  wire gt1_eyescantrigger_in;
  wire gt1_gthrxn_in;
  wire gt1_gthrxp_in;
  wire gt1_rxbufreset_in;
  wire [2:0]gt1_rxbufstatus_out;
  wire [1:0]gt1_rxchariscomma_out;
  wire [1:0]gt1_rxcharisk_out;
  wire [15:0]gt1_rxdata_out;
  wire [1:0]gt1_rxdisperr_out;
  wire gt1_rxmcommaalignen_in;
  wire [6:0]gt1_rxmonitorout_out;
  wire [1:0]gt1_rxmonitorsel_in;
  wire [1:0]gt1_rxnotintable_out;
  wire gt1_rxoutclk_out;
  wire gt1_rxpcommaalignen_in;
  wire [1:0]gt1_rxpd_in;
  wire gt1_rxresetdone_out;
  wire gt1_rxusrclk2_in;
  wire gt1_rxusrclk_in;
  wire n_10_gtrxreset_seq_i;
  wire n_11_gtrxreset_seq_i;
  wire n_12_gtrxreset_seq_i;
  wire n_13_gtrxreset_seq_i;
  wire n_14_gtrxreset_seq_i;
  wire n_15_gtrxreset_seq_i;
  wire n_16_gtrxreset_seq_i;
  wire n_17_gtrxreset_seq_i;
  wire n_18_gtrxreset_seq_i;
  wire n_19_gtrxreset_seq_i;
  wire n_1_gtrxreset_seq_i;
  wire n_20_gtrxreset_seq_i;
  wire n_21_gtrxreset_seq_i;
  wire n_22_gtrxreset_seq_i;
  wire n_23_gtrxreset_seq_i;
  wire n_24_gtrxreset_seq_i;
  wire n_25_gtrxreset_seq_i;
  wire n_26_gtrxreset_seq_i;
  wire n_270_gthe2_i;
  wire n_27_gtrxreset_seq_i;
  wire n_28_gtrxreset_seq_i;
  wire n_2_gtrxreset_seq_i;
  wire n_33_gthe2_i;
  wire n_3_gtrxreset_seq_i;
  wire n_4_gtrxreset_seq_i;
  wire n_5_gtrxreset_seq_i;
  wire n_6_gtrxreset_seq_i;
  wire n_7_gtrxreset_seq_i;
  wire n_8_gtrxreset_seq_i;
  wire n_9_gtrxreset_seq_i;
  wire NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED;
  wire NLW_gthe2_i_CPLLLOCK_UNCONNECTED;
  wire NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED;
  wire NLW_gthe2_i_GTHTXN_UNCONNECTED;
  wire NLW_gthe2_i_GTHTXP_UNCONNECTED;
  wire NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED;
  wire NLW_gthe2_i_PHYSTATUS_UNCONNECTED;
  wire NLW_gthe2_i_RSOSINTDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED;
  wire NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED;
  wire NLW_gthe2_i_RXCDRLOCK_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMINITDET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMMADET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMSASDET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXELECIDLE_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED;
  wire NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXPRBSERR_UNCONNECTED;
  wire NLW_gthe2_i_RXQPISENN_UNCONNECTED;
  wire NLW_gthe2_i_RXQPISENP_UNCONNECTED;
  wire NLW_gthe2_i_RXRATEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXSYNCDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXSYNCOUT_UNCONNECTED;
  wire NLW_gthe2_i_RXVALID_UNCONNECTED;
  wire NLW_gthe2_i_TXCOMFINISH_UNCONNECTED;
  wire NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLK_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED;
  wire NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXPHINITDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXQPISENN_UNCONNECTED;
  wire NLW_gthe2_i_TXQPISENP_UNCONNECTED;
  wire NLW_gthe2_i_TXRATEDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXSYNCDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXSYNCOUT_UNCONNECTED;
  wire [15:0]NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXCHARISK_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXCHBONDO_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED;
  wire [63:16]NLW_gthe2_i_RXDATA_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXDATAVALID_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXDISPERR_UNCONNECTED;
  wire [5:0]NLW_gthe2_i_RXHEADER_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXHEADERVALID_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXPHMONITOR_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED;
  wire [2:0]NLW_gthe2_i_RXSTATUS_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED;

FDRE #(
    .INIT(1'b0)) 
     drp_busy_i1_reg
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .D(n_19_gtrxreset_seq_i),
        .Q(GT1_DRP_BUSY_OUT),
        .R(1'b0));
(* box_type = "PRIMITIVE" *) 
   GTHE2_CHANNEL #(
    .ACJTAG_DEBUG_MODE(1'b0),
    .ACJTAG_MODE(1'b0),
    .ACJTAG_RESET(1'b0),
    .ADAPT_CFG0(20'h00C10),
    .ALIGN_COMMA_DOUBLE("FALSE"),
    .ALIGN_COMMA_ENABLE(10'b1111111111),
    .ALIGN_COMMA_WORD(2),
    .ALIGN_MCOMMA_DET("TRUE"),
    .ALIGN_MCOMMA_VALUE(10'b1010000011),
    .ALIGN_PCOMMA_DET("TRUE"),
    .ALIGN_PCOMMA_VALUE(10'b0101111100),
    .A_RXOSCALRESET(1'b0),
    .CBCC_DATA_SOURCE_SEL("DECODED"),
    .CFOK_CFG(42'h24800040E80),
    .CFOK_CFG2(6'b100000),
    .CFOK_CFG3(6'b100000),
    .CHAN_BOND_KEEP_ALIGN("FALSE"),
    .CHAN_BOND_MAX_SKEW(1),
    .CHAN_BOND_SEQ_1_1(10'b0000000000),
    .CHAN_BOND_SEQ_1_2(10'b0000000000),
    .CHAN_BOND_SEQ_1_3(10'b0000000000),
    .CHAN_BOND_SEQ_1_4(10'b0000000000),
    .CHAN_BOND_SEQ_1_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_1(10'b0000000000),
    .CHAN_BOND_SEQ_2_2(10'b0000000000),
    .CHAN_BOND_SEQ_2_3(10'b0000000000),
    .CHAN_BOND_SEQ_2_4(10'b0000000000),
    .CHAN_BOND_SEQ_2_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_USE("FALSE"),
    .CHAN_BOND_SEQ_LEN(1),
    .CLK_CORRECT_USE("FALSE"),
    .CLK_COR_KEEP_IDLE("FALSE"),
    .CLK_COR_MAX_LAT(10),
    .CLK_COR_MIN_LAT(8),
    .CLK_COR_PRECEDENCE("TRUE"),
    .CLK_COR_REPEAT_WAIT(0),
    .CLK_COR_SEQ_1_1(10'b0100000000),
    .CLK_COR_SEQ_1_2(10'b0000000000),
    .CLK_COR_SEQ_1_3(10'b0000000000),
    .CLK_COR_SEQ_1_4(10'b0000000000),
    .CLK_COR_SEQ_1_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_1(10'b0100000000),
    .CLK_COR_SEQ_2_2(10'b0000000000),
    .CLK_COR_SEQ_2_3(10'b0000000000),
    .CLK_COR_SEQ_2_4(10'b0000000000),
    .CLK_COR_SEQ_2_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_USE("FALSE"),
    .CLK_COR_SEQ_LEN(1),
    .CPLL_CFG(29'h00BC07DC),
    .CPLL_FBDIV(5),
    .CPLL_FBDIV_45(5),
    .CPLL_INIT_CFG(24'h00001E),
    .CPLL_LOCK_CFG(16'h01E8),
    .CPLL_REFCLK_DIV(1),
    .DEC_MCOMMA_DETECT("TRUE"),
    .DEC_PCOMMA_DETECT("TRUE"),
    .DEC_VALID_COMMA_ONLY("TRUE"),
    .DMONITOR_CFG(24'h000A00),
    .ES_CLK_PHASE_SEL(1'b0),
    .ES_CONTROL(6'b000000),
    .ES_ERRDET_EN("FALSE"),
    .ES_EYE_SCAN_EN("TRUE"),
    .ES_HORZ_OFFSET(12'h000),
    .ES_PMA_CFG(10'b0000000000),
    .ES_PRESCALE(5'b00000),
    .ES_QUALIFIER(80'h00000000000000000000),
    .ES_QUAL_MASK(80'h00000000000000000000),
    .ES_SDATA_MASK(80'h00000000000000000000),
    .ES_VERT_OFFSET(9'b000000000),
    .FTS_DESKEW_SEQ_ENABLE(4'b1111),
    .FTS_LANE_DESKEW_CFG(4'b1111),
    .FTS_LANE_DESKEW_EN("FALSE"),
    .GEARBOX_MODE(3'b000),
    .IS_CLKRSVD0_INVERTED(1'b0),
    .IS_CLKRSVD1_INVERTED(1'b0),
    .IS_CPLLLOCKDETCLK_INVERTED(1'b0),
    .IS_DMONITORCLK_INVERTED(1'b0),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_RXUSRCLK2_INVERTED(1'b0),
    .IS_RXUSRCLK_INVERTED(1'b0),
    .IS_SIGVALIDCLK_INVERTED(1'b0),
    .IS_TXPHDLYTSTCLK_INVERTED(1'b0),
    .IS_TXUSRCLK2_INVERTED(1'b0),
    .IS_TXUSRCLK_INVERTED(1'b0),
    .LOOPBACK_CFG(1'b0),
    .OUTREFCLK_SEL_INV(2'b11),
    .PCS_PCIE_EN("FALSE"),
    .PCS_RSVD_ATTR(48'h000000000000),
    .PD_TRANS_TIME_FROM_P2(12'h03C),
    .PD_TRANS_TIME_NONE_P2(8'h3C),
    .PD_TRANS_TIME_TO_P2(8'h64),
    .PMA_RSV(32'b00000000000111100111000010000000),
    .PMA_RSV2(32'b00011100000000000000000000001010),
    .PMA_RSV3(2'b00),
    .PMA_RSV4(15'b000000000001000),
    .PMA_RSV5(4'b0000),
    .RESET_POWERSAVE_DISABLE(1'b0),
    .RXBUFRESET_TIME(5'b00001),
    .RXBUF_ADDR_MODE("FAST"),
    .RXBUF_EIDLE_HI_CNT(4'b1000),
    .RXBUF_EIDLE_LO_CNT(4'b0000),
    .RXBUF_EN("TRUE"),
    .RXBUF_RESET_ON_CB_CHANGE("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN("FALSE"),
    .RXBUF_RESET_ON_EIDLE("FALSE"),
    .RXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .RXBUF_THRESH_OVFLW(61),
    .RXBUF_THRESH_OVRD("FALSE"),
    .RXBUF_THRESH_UNDFLW(4),
    .RXCDRFREQRESET_TIME(5'b00001),
    .RXCDRPHRESET_TIME(5'b00001),
    .RXCDR_CFG(83'h0002007FE1000C2080018),
    .RXCDR_FR_RESET_ON_EIDLE(1'b0),
    .RXCDR_HOLD_DURING_EIDLE(1'b0),
    .RXCDR_LOCK_CFG(6'b010101),
    .RXCDR_PH_RESET_ON_EIDLE(1'b0),
    .RXDFELPMRESET_TIME(7'b0001111),
    .RXDLY_CFG(16'h001F),
    .RXDLY_LCFG(9'h030),
    .RXDLY_TAP_CFG(16'h0000),
    .RXGEARBOX_EN("FALSE"),
    .RXISCANRESET_TIME(5'b00001),
    .RXLPM_HF_CFG(14'b00001000000000),
    .RXLPM_LF_CFG(18'b001001000000000000),
    .RXOOB_CFG(7'b0000110),
    .RXOOB_CLK_CFG("PMA"),
    .RXOSCALRESET_TIME(5'b00011),
    .RXOSCALRESET_TIMEOUT(5'b00000),
    .RXOUT_DIV(2),
    .RXPCSRESET_TIME(5'b00001),
    .RXPHDLY_CFG(24'h084020),
    .RXPH_CFG(24'hC00002),
    .RXPH_MONITOR_SEL(5'b00000),
    .RXPI_CFG0(2'b00),
    .RXPI_CFG1(2'b11),
    .RXPI_CFG2(2'b11),
    .RXPI_CFG3(2'b11),
    .RXPI_CFG4(1'b0),
    .RXPI_CFG5(1'b0),
    .RXPI_CFG6(3'b100),
    .RXPMARESET_TIME(5'b00011),
    .RXPRBS_ERR_LOOPBACK(1'b0),
    .RXSLIDE_AUTO_WAIT(7),
    .RXSLIDE_MODE("OFF"),
    .RXSYNC_MULTILANE(1'b1),
    .RXSYNC_OVRD(1'b0),
    .RXSYNC_SKIP_DA(1'b0),
    .RX_BIAS_CFG(24'b000011000000000000010000),
    .RX_BUFFER_CFG(6'b000000),
    .RX_CLK25_DIV(6),
    .RX_CLKMUX_PD(1'b1),
    .RX_CM_SEL(2'b00),
    .RX_CM_TRIM(4'b0000),
    .RX_DATA_WIDTH(20),
    .RX_DDI_SEL(6'b000000),
    .RX_DEBUG_CFG(14'b00000000000000),
    .RX_DEFER_RESET_BUF_EN("TRUE"),
    .RX_DFELPM_CFG0(4'b0110),
    .RX_DFELPM_CFG1(1'b0),
    .RX_DFELPM_KLKH_AGC_STUP_EN(1'b1),
    .RX_DFE_AGC_CFG0(2'b00),
    .RX_DFE_AGC_CFG1(3'b010),
    .RX_DFE_AGC_CFG2(4'b0000),
    .RX_DFE_AGC_OVRDEN(1'b1),
    .RX_DFE_GAIN_CFG(23'h0020C0),
    .RX_DFE_H2_CFG(12'b000000000000),
    .RX_DFE_H3_CFG(12'b000001000000),
    .RX_DFE_H4_CFG(11'b00011100000),
    .RX_DFE_H5_CFG(11'b00011100000),
    .RX_DFE_H6_CFG(11'b00000100000),
    .RX_DFE_H7_CFG(11'b00000100000),
    .RX_DFE_KL_CFG(33'b001000001000000000000001100010000),
    .RX_DFE_KL_LPM_KH_CFG0(2'b01),
    .RX_DFE_KL_LPM_KH_CFG1(3'b010),
    .RX_DFE_KL_LPM_KH_CFG2(4'b0010),
    .RX_DFE_KL_LPM_KH_OVRDEN(1'b1),
    .RX_DFE_KL_LPM_KL_CFG0(2'b01),
    .RX_DFE_KL_LPM_KL_CFG1(3'b010),
    .RX_DFE_KL_LPM_KL_CFG2(4'b0010),
    .RX_DFE_KL_LPM_KL_OVRDEN(1'b1),
    .RX_DFE_LPM_CFG(16'h0080),
    .RX_DFE_LPM_HOLD_DURING_EIDLE(1'b0),
    .RX_DFE_ST_CFG(54'h00E100000C003F),
    .RX_DFE_UT_CFG(17'b00011100000000000),
    .RX_DFE_VP_CFG(17'b00011101010100011),
    .RX_DISPERR_SEQ_MATCH("TRUE"),
    .RX_INT_DATAWIDTH(0),
    .RX_OS_CFG(13'b0000010000000),
    .RX_SIG_VALID_DLY(10),
    .RX_XCLK_SEL("RXREC"),
    .SAS_MAX_COM(64),
    .SAS_MIN_COM(36),
    .SATA_BURST_SEQ_LEN(4'b1111),
    .SATA_BURST_VAL(3'b100),
    .SATA_CPLL_CFG("VCO_3000MHZ"),
    .SATA_EIDLE_VAL(3'b100),
    .SATA_MAX_BURST(8),
    .SATA_MAX_INIT(21),
    .SATA_MAX_WAKE(7),
    .SATA_MIN_BURST(4),
    .SATA_MIN_INIT(12),
    .SATA_MIN_WAKE(4),
    .SHOW_REALIGN_COMMA("TRUE"),
    .SIM_CPLLREFCLK_SEL(3'b001),
    .SIM_RECEIVER_DETECT_PASS("TRUE"),
    .SIM_RESET_SPEEDUP("FALSE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL("X"),
    .SIM_VERSION("2.0"),
    .TERM_RCAL_CFG(15'b100001000010000),
    .TERM_RCAL_OVRD(3'b000),
    .TRANS_TIME_RATE(8'h0E),
    .TST_RSV(32'h00000000),
    .TXBUF_EN("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .TXDLY_CFG(16'h001F),
    .TXDLY_LCFG(9'h030),
    .TXDLY_TAP_CFG(16'h0000),
    .TXGEARBOX_EN("FALSE"),
    .TXOOB_CFG(1'b0),
    .TXOUT_DIV(1),
    .TXPCSRESET_TIME(5'b00001),
    .TXPHDLY_CFG(24'h084020),
    .TXPH_CFG(16'h0780),
    .TXPH_MONITOR_SEL(5'b00000),
    .TXPI_CFG0(2'b00),
    .TXPI_CFG1(2'b00),
    .TXPI_CFG2(2'b00),
    .TXPI_CFG3(1'b0),
    .TXPI_CFG4(1'b0),
    .TXPI_CFG5(3'b100),
    .TXPI_GREY_SEL(1'b0),
    .TXPI_INVSTROBE_SEL(1'b0),
    .TXPI_PPMCLK_SEL("TXUSRCLK2"),
    .TXPI_PPM_CFG(8'b00000000),
    .TXPI_SYNFREQ_PPM(3'b000),
    .TXPMARESET_TIME(5'b00001),
    .TXSYNC_MULTILANE(1'b0),
    .TXSYNC_OVRD(1'b0),
    .TXSYNC_SKIP_DA(1'b0),
    .TX_CLK25_DIV(6),
    .TX_CLKMUX_PD(1'b1),
    .TX_DATA_WIDTH(20),
    .TX_DEEMPH0(6'b000000),
    .TX_DEEMPH1(6'b000000),
    .TX_DRIVE_MODE("DIRECT"),
    .TX_EIDLE_ASSERT_DELAY(3'b110),
    .TX_EIDLE_DEASSERT_DELAY(3'b100),
    .TX_INT_DATAWIDTH(0),
    .TX_LOOPBACK_DRIVE_HIZ("FALSE"),
    .TX_MAINCURSOR_SEL(1'b0),
    .TX_MARGIN_FULL_0(7'b1001110),
    .TX_MARGIN_FULL_1(7'b1001001),
    .TX_MARGIN_FULL_2(7'b1000101),
    .TX_MARGIN_FULL_3(7'b1000010),
    .TX_MARGIN_FULL_4(7'b1000000),
    .TX_MARGIN_LOW_0(7'b1000110),
    .TX_MARGIN_LOW_1(7'b1000100),
    .TX_MARGIN_LOW_2(7'b1000010),
    .TX_MARGIN_LOW_3(7'b1000000),
    .TX_MARGIN_LOW_4(7'b1000000),
    .TX_QPI_STATUS_EN(1'b0),
    .TX_RXDETECT_CFG(14'h1832),
    .TX_RXDETECT_PRECHARGE_TIME(17'h155CC),
    .TX_RXDETECT_REF(3'b100),
    .TX_XCLK_SEL("TXOUT"),
    .UCODEER_CLR(1'b0),
    .USE_PCS_CLK_PHASE_SEL(1'b0)) 
     gthe2_i
       (.CFGRESET(1'b0),
        .CLKRSVD0(1'b0),
        .CLKRSVD1(1'b0),
        .CPLLFBCLKLOST(NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED),
        .CPLLLOCK(NLW_gthe2_i_CPLLLOCK_UNCONNECTED),
        .CPLLLOCKDETCLK(1'b0),
        .CPLLLOCKEN(1'b1),
        .CPLLPD(1'b1),
        .CPLLREFCLKLOST(NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED),
        .CPLLREFCLKSEL({1'b0,1'b0,1'b1}),
        .CPLLRESET(1'b0),
        .DMONFIFORESET(1'b0),
        .DMONITORCLK(1'b0),
        .DMONITOROUT(gt1_dmonitorout_out),
        .DRPADDR({n_20_gtrxreset_seq_i,n_21_gtrxreset_seq_i,n_22_gtrxreset_seq_i,n_23_gtrxreset_seq_i,n_24_gtrxreset_seq_i,n_25_gtrxreset_seq_i,n_26_gtrxreset_seq_i,n_27_gtrxreset_seq_i,n_28_gtrxreset_seq_i}),
        .DRPCLK(gt1_drpclk_in),
        .DRPDI({n_2_gtrxreset_seq_i,n_3_gtrxreset_seq_i,n_4_gtrxreset_seq_i,n_5_gtrxreset_seq_i,n_6_gtrxreset_seq_i,n_7_gtrxreset_seq_i,n_8_gtrxreset_seq_i,n_9_gtrxreset_seq_i,n_10_gtrxreset_seq_i,n_11_gtrxreset_seq_i,n_12_gtrxreset_seq_i,n_13_gtrxreset_seq_i,n_14_gtrxreset_seq_i,n_15_gtrxreset_seq_i,n_16_gtrxreset_seq_i,n_17_gtrxreset_seq_i}),
        .DRPDO(gt1_drpdo_out),
        .DRPEN(n_1_gtrxreset_seq_i),
        .DRPRDY(O1),
        .DRPWE(n_18_gtrxreset_seq_i),
        .EYESCANDATAERROR(gt1_eyescandataerror_out),
        .EYESCANMODE(1'b0),
        .EYESCANRESET(gt1_eyescanreset_in),
        .EYESCANTRIGGER(gt1_eyescantrigger_in),
        .GTGREFCLK(1'b0),
        .GTHRXN(gt1_gthrxn_in),
        .GTHRXP(gt1_gthrxp_in),
        .GTHTXN(NLW_gthe2_i_GTHTXN_UNCONNECTED),
        .GTHTXP(NLW_gthe2_i_GTHTXP_UNCONNECTED),
        .GTNORTHREFCLK0(1'b0),
        .GTNORTHREFCLK1(1'b0),
        .GTREFCLK0(1'b0),
        .GTREFCLK1(1'b0),
        .GTREFCLKMONITOR(NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED),
        .GTRESETSEL(1'b0),
        .GTRSVD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .GTRXRESET(GTRXRESET_OUT),
        .GTSOUTHREFCLK0(1'b0),
        .GTSOUTHREFCLK1(1'b0),
        .GTTXRESET(n_270_gthe2_i),
        .LOOPBACK({1'b0,1'b0,1'b0}),
        .PCSRSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDIN2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDOUT(NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED[15:0]),
        .PHYSTATUS(NLW_gthe2_i_PHYSTATUS_UNCONNECTED),
        .PMARSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLCLK(GT0_QPLLOUTCLK_IN),
        .QPLLREFCLK(GT0_QPLLOUTREFCLK_IN),
        .RESETOVRD(1'b0),
        .RSOSINTDONE(NLW_gthe2_i_RSOSINTDONE_UNCONNECTED),
        .RX8B10BEN(1'b1),
        .RXADAPTSELTEST({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXBUFRESET(gt1_rxbufreset_in),
        .RXBUFSTATUS(gt1_rxbufstatus_out),
        .RXBYTEISALIGNED(NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED),
        .RXBYTEREALIGN(NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED),
        .RXCDRFREQRESET(1'b0),
        .RXCDRHOLD(1'b0),
        .RXCDRLOCK(NLW_gthe2_i_RXCDRLOCK_UNCONNECTED),
        .RXCDROVRDEN(1'b0),
        .RXCDRRESET(1'b0),
        .RXCDRRESETRSV(1'b0),
        .RXCHANBONDSEQ(NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED),
        .RXCHANISALIGNED(NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED),
        .RXCHANREALIGN(NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED),
        .RXCHARISCOMMA({NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED[7:2],gt1_rxchariscomma_out}),
        .RXCHARISK({NLW_gthe2_i_RXCHARISK_UNCONNECTED[7:2],gt1_rxcharisk_out}),
        .RXCHBONDEN(1'b0),
        .RXCHBONDI({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXCHBONDLEVEL({1'b0,1'b0,1'b0}),
        .RXCHBONDMASTER(1'b0),
        .RXCHBONDO(NLW_gthe2_i_RXCHBONDO_UNCONNECTED[4:0]),
        .RXCHBONDSLAVE(1'b0),
        .RXCLKCORCNT(NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED[1:0]),
        .RXCOMINITDET(NLW_gthe2_i_RXCOMINITDET_UNCONNECTED),
        .RXCOMMADET(NLW_gthe2_i_RXCOMMADET_UNCONNECTED),
        .RXCOMMADETEN(1'b1),
        .RXCOMSASDET(NLW_gthe2_i_RXCOMSASDET_UNCONNECTED),
        .RXCOMWAKEDET(NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED),
        .RXDATA({NLW_gthe2_i_RXDATA_UNCONNECTED[63:16],gt1_rxdata_out}),
        .RXDATAVALID(NLW_gthe2_i_RXDATAVALID_UNCONNECTED[1:0]),
        .RXDDIEN(1'b0),
        .RXDFEAGCHOLD(1'b0),
        .RXDFEAGCOVRDEN(1'b1),
        .RXDFEAGCTRL({1'b1,1'b0,1'b0,1'b0,1'b0}),
        .RXDFECM1EN(1'b0),
        .RXDFELFHOLD(1'b0),
        .RXDFELFOVRDEN(1'b0),
        .RXDFELPMRESET(1'b0),
        .RXDFESLIDETAP({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXDFESLIDETAPADAPTEN(1'b0),
        .RXDFESLIDETAPHOLD(1'b0),
        .RXDFESLIDETAPID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXDFESLIDETAPINITOVRDEN(1'b0),
        .RXDFESLIDETAPONLYADAPTEN(1'b0),
        .RXDFESLIDETAPOVRDEN(1'b0),
        .RXDFESLIDETAPSTARTED(NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED),
        .RXDFESLIDETAPSTROBE(1'b0),
        .RXDFESLIDETAPSTROBEDONE(NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED),
        .RXDFESLIDETAPSTROBESTARTED(NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED),
        .RXDFESTADAPTDONE(NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED),
        .RXDFETAP2HOLD(1'b0),
        .RXDFETAP2OVRDEN(1'b0),
        .RXDFETAP3HOLD(1'b0),
        .RXDFETAP3OVRDEN(1'b0),
        .RXDFETAP4HOLD(1'b0),
        .RXDFETAP4OVRDEN(1'b0),
        .RXDFETAP5HOLD(1'b0),
        .RXDFETAP5OVRDEN(1'b0),
        .RXDFETAP6HOLD(1'b0),
        .RXDFETAP6OVRDEN(1'b0),
        .RXDFETAP7HOLD(1'b0),
        .RXDFETAP7OVRDEN(1'b0),
        .RXDFEUTHOLD(1'b0),
        .RXDFEUTOVRDEN(1'b0),
        .RXDFEVPHOLD(1'b0),
        .RXDFEVPOVRDEN(1'b0),
        .RXDFEVSEN(1'b0),
        .RXDFEXYDEN(1'b1),
        .RXDISPERR({NLW_gthe2_i_RXDISPERR_UNCONNECTED[7:2],gt1_rxdisperr_out}),
        .RXDLYBYPASS(1'b1),
        .RXDLYEN(1'b0),
        .RXDLYOVRDEN(1'b0),
        .RXDLYSRESET(1'b0),
        .RXDLYSRESETDONE(NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED),
        .RXELECIDLE(NLW_gthe2_i_RXELECIDLE_UNCONNECTED),
        .RXELECIDLEMODE({1'b1,1'b1}),
        .RXGEARBOXSLIP(1'b0),
        .RXHEADER(NLW_gthe2_i_RXHEADER_UNCONNECTED[5:0]),
        .RXHEADERVALID(NLW_gthe2_i_RXHEADERVALID_UNCONNECTED[1:0]),
        .RXLPMEN(1'b1),
        .RXLPMHFHOLD(1'b0),
        .RXLPMHFOVRDEN(1'b0),
        .RXLPMLFHOLD(1'b0),
        .RXLPMLFKLOVRDEN(1'b0),
        .RXMCOMMAALIGNEN(gt1_rxmcommaalignen_in),
        .RXMONITOROUT(gt1_rxmonitorout_out),
        .RXMONITORSEL(gt1_rxmonitorsel_in),
        .RXNOTINTABLE({NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED[7:2],gt1_rxnotintable_out}),
        .RXOOBRESET(1'b0),
        .RXOSCALRESET(1'b0),
        .RXOSHOLD(1'b0),
        .RXOSINTCFG({1'b0,1'b1,1'b1,1'b0}),
        .RXOSINTEN(1'b1),
        .RXOSINTHOLD(1'b0),
        .RXOSINTID0({1'b0,1'b0,1'b0,1'b0}),
        .RXOSINTNTRLEN(1'b0),
        .RXOSINTOVRDEN(1'b0),
        .RXOSINTSTARTED(NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED),
        .RXOSINTSTROBE(1'b0),
        .RXOSINTSTROBEDONE(NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED),
        .RXOSINTSTROBESTARTED(NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED),
        .RXOSINTTESTOVRDEN(1'b0),
        .RXOSOVRDEN(1'b0),
        .RXOUTCLK(gt1_rxoutclk_out),
        .RXOUTCLKFABRIC(NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED),
        .RXOUTCLKPCS(NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED),
        .RXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .RXPCOMMAALIGNEN(gt1_rxpcommaalignen_in),
        .RXPCSRESET(1'b0),
        .RXPD(gt1_rxpd_in),
        .RXPHALIGN(1'b0),
        .RXPHALIGNDONE(NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED),
        .RXPHALIGNEN(1'b0),
        .RXPHDLYPD(1'b0),
        .RXPHDLYRESET(1'b0),
        .RXPHMONITOR(NLW_gthe2_i_RXPHMONITOR_UNCONNECTED[4:0]),
        .RXPHOVRDEN(1'b0),
        .RXPHSLIPMONITOR(NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED[4:0]),
        .RXPMARESET(1'b0),
        .RXPMARESETDONE(n_33_gthe2_i),
        .RXPOLARITY(1'b0),
        .RXPRBSCNTRESET(1'b0),
        .RXPRBSERR(NLW_gthe2_i_RXPRBSERR_UNCONNECTED),
        .RXPRBSSEL({1'b0,1'b0,1'b0}),
        .RXQPIEN(1'b0),
        .RXQPISENN(NLW_gthe2_i_RXQPISENN_UNCONNECTED),
        .RXQPISENP(NLW_gthe2_i_RXQPISENP_UNCONNECTED),
        .RXRATE({1'b0,1'b0,1'b0}),
        .RXRATEDONE(NLW_gthe2_i_RXRATEDONE_UNCONNECTED),
        .RXRATEMODE(1'b0),
        .RXRESETDONE(gt1_rxresetdone_out),
        .RXSLIDE(1'b0),
        .RXSTARTOFSEQ(NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED[1:0]),
        .RXSTATUS(NLW_gthe2_i_RXSTATUS_UNCONNECTED[2:0]),
        .RXSYNCALLIN(1'b0),
        .RXSYNCDONE(NLW_gthe2_i_RXSYNCDONE_UNCONNECTED),
        .RXSYNCIN(1'b0),
        .RXSYNCMODE(1'b0),
        .RXSYNCOUT(NLW_gthe2_i_RXSYNCOUT_UNCONNECTED),
        .RXSYSCLKSEL({1'b1,1'b1}),
        .RXUSERRDY(I1),
        .RXUSRCLK(gt1_rxusrclk_in),
        .RXUSRCLK2(gt1_rxusrclk2_in),
        .RXVALID(NLW_gthe2_i_RXVALID_UNCONNECTED),
        .SETERRSTATUS(1'b0),
        .SIGVALIDCLK(1'b0),
        .TSTIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .TX8B10BBYPASS({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX8B10BEN(1'b0),
        .TXBUFDIFFCTRL({1'b1,1'b0,1'b0}),
        .TXBUFSTATUS(NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED[1:0]),
        .TXCHARDISPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARDISPVAL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARISK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCOMFINISH(NLW_gthe2_i_TXCOMFINISH_UNCONNECTED),
        .TXCOMINIT(1'b0),
        .TXCOMSAS(1'b0),
        .TXCOMWAKE(1'b0),
        .TXDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXDEEMPH(1'b0),
        .TXDETECTRX(1'b0),
        .TXDIFFCTRL({1'b1,1'b0,1'b0,1'b0}),
        .TXDIFFPD(1'b1),
        .TXDLYBYPASS(1'b1),
        .TXDLYEN(1'b0),
        .TXDLYHOLD(1'b0),
        .TXDLYOVRDEN(1'b0),
        .TXDLYSRESET(1'b0),
        .TXDLYSRESETDONE(NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED),
        .TXDLYUPDOWN(1'b0),
        .TXELECIDLE(1'b1),
        .TXGEARBOXREADY(NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED),
        .TXHEADER({1'b0,1'b0,1'b0}),
        .TXINHIBIT(1'b0),
        .TXMAINCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXMARGIN({1'b0,1'b0,1'b0}),
        .TXOUTCLK(NLW_gthe2_i_TXOUTCLK_UNCONNECTED),
        .TXOUTCLKFABRIC(NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED),
        .TXOUTCLKPCS(NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED),
        .TXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .TXPCSRESET(1'b0),
        .TXPD({1'b1,1'b1}),
        .TXPDELECIDLEMODE(1'b1),
        .TXPHALIGN(1'b0),
        .TXPHALIGNDONE(NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED),
        .TXPHALIGNEN(1'b0),
        .TXPHDLYPD(1'b1),
        .TXPHDLYRESET(1'b0),
        .TXPHDLYTSTCLK(1'b0),
        .TXPHINIT(1'b0),
        .TXPHINITDONE(NLW_gthe2_i_TXPHINITDONE_UNCONNECTED),
        .TXPHOVRDEN(1'b0),
        .TXPIPPMEN(1'b0),
        .TXPIPPMOVRDEN(1'b0),
        .TXPIPPMPD(1'b1),
        .TXPIPPMSEL(1'b0),
        .TXPIPPMSTEPSIZE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPISOPD(1'b1),
        .TXPMARESET(1'b0),
        .TXPMARESETDONE(NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED),
        .TXPOLARITY(1'b0),
        .TXPOSTCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPOSTCURSORINV(1'b0),
        .TXPRBSFORCEERR(1'b0),
        .TXPRBSSEL({1'b0,1'b0,1'b0}),
        .TXPRECURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPRECURSORINV(1'b0),
        .TXQPIBIASEN(1'b0),
        .TXQPISENN(NLW_gthe2_i_TXQPISENN_UNCONNECTED),
        .TXQPISENP(NLW_gthe2_i_TXQPISENP_UNCONNECTED),
        .TXQPISTRONGPDOWN(1'b0),
        .TXQPIWEAKPUP(1'b0),
        .TXRATE({1'b0,1'b0,1'b0}),
        .TXRATEDONE(NLW_gthe2_i_TXRATEDONE_UNCONNECTED),
        .TXRATEMODE(1'b0),
        .TXRESETDONE(NLW_gthe2_i_TXRESETDONE_UNCONNECTED),
        .TXSEQUENCE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXSTARTSEQ(1'b0),
        .TXSWING(1'b0),
        .TXSYNCALLIN(1'b0),
        .TXSYNCDONE(NLW_gthe2_i_TXSYNCDONE_UNCONNECTED),
        .TXSYNCIN(1'b0),
        .TXSYNCMODE(1'b0),
        .TXSYNCOUT(NLW_gthe2_i_TXSYNCOUT_UNCONNECTED),
        .TXSYSCLKSEL({1'b0,1'b0}),
        .TXUSERRDY(1'b0),
        .TXUSRCLK(1'b0),
        .TXUSRCLK2(1'b0));
gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_8 gtrxreset_seq_i
       (.AR(AR),
        .DRPADDR({n_20_gtrxreset_seq_i,n_21_gtrxreset_seq_i,n_22_gtrxreset_seq_i,n_23_gtrxreset_seq_i,n_24_gtrxreset_seq_i,n_25_gtrxreset_seq_i,n_26_gtrxreset_seq_i,n_27_gtrxreset_seq_i,n_28_gtrxreset_seq_i}),
        .DRPDI({n_2_gtrxreset_seq_i,n_3_gtrxreset_seq_i,n_4_gtrxreset_seq_i,n_5_gtrxreset_seq_i,n_6_gtrxreset_seq_i,n_7_gtrxreset_seq_i,n_8_gtrxreset_seq_i,n_9_gtrxreset_seq_i,n_10_gtrxreset_seq_i,n_11_gtrxreset_seq_i,n_12_gtrxreset_seq_i,n_13_gtrxreset_seq_i,n_14_gtrxreset_seq_i,n_15_gtrxreset_seq_i,n_16_gtrxreset_seq_i,n_17_gtrxreset_seq_i}),
        .GTRXRESET_OUT(GTRXRESET_OUT),
        .I1(O1),
        .I4(I4),
        .O1(n_1_gtrxreset_seq_i),
        .O2(n_18_gtrxreset_seq_i),
        .O3(n_19_gtrxreset_seq_i),
        .data_in(n_33_gthe2_i),
        .gt1_drpaddr_in(gt1_drpaddr_in),
        .gt1_drpclk_in(gt1_drpclk_in),
        .gt1_drpdi_in(gt1_drpdi_in),
        .gt1_drpdo_out(gt1_drpdo_out),
        .gt1_drpen_in(gt1_drpen_in),
        .gt1_drpwe_in(gt1_drpwe_in));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_GT" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_4
   (O1,
    gt2_eyescandataerror_out,
    gt2_rxoutclk_out,
    gt2_rxresetdone_out,
    gt2_dmonitorout_out,
    gt2_drpdo_out,
    gt2_rxbufstatus_out,
    gt2_rxdata_out,
    gt2_rxmonitorout_out,
    gt2_rxchariscomma_out,
    gt2_rxcharisk_out,
    gt2_rxdisperr_out,
    gt2_rxnotintable_out,
    GT2_DRP_BUSY_OUT,
    gt2_drpclk_in,
    gt2_eyescanreset_in,
    gt2_eyescantrigger_in,
    gt2_gthrxn_in,
    gt2_gthrxp_in,
    GT0_QPLLOUTCLK_IN,
    GT0_QPLLOUTREFCLK_IN,
    gt2_rxbufreset_in,
    gt2_rxmcommaalignen_in,
    gt2_rxpcommaalignen_in,
    I2,
    gt2_rxusrclk_in,
    gt2_rxusrclk2_in,
    gt2_rxmonitorsel_in,
    gt2_rxpd_in,
    AR,
    I5,
    gt2_drpen_in,
    gt2_drpdi_in,
    gt2_drpwe_in,
    gt2_drpaddr_in);
  output O1;
  output gt2_eyescandataerror_out;
  output gt2_rxoutclk_out;
  output gt2_rxresetdone_out;
  output [14:0]gt2_dmonitorout_out;
  output [15:0]gt2_drpdo_out;
  output [2:0]gt2_rxbufstatus_out;
  output [15:0]gt2_rxdata_out;
  output [6:0]gt2_rxmonitorout_out;
  output [1:0]gt2_rxchariscomma_out;
  output [1:0]gt2_rxcharisk_out;
  output [1:0]gt2_rxdisperr_out;
  output [1:0]gt2_rxnotintable_out;
  output GT2_DRP_BUSY_OUT;
  input gt2_drpclk_in;
  input gt2_eyescanreset_in;
  input gt2_eyescantrigger_in;
  input gt2_gthrxn_in;
  input gt2_gthrxp_in;
  input GT0_QPLLOUTCLK_IN;
  input GT0_QPLLOUTREFCLK_IN;
  input gt2_rxbufreset_in;
  input gt2_rxmcommaalignen_in;
  input gt2_rxpcommaalignen_in;
  input I2;
  input gt2_rxusrclk_in;
  input gt2_rxusrclk2_in;
  input [1:0]gt2_rxmonitorsel_in;
  input [1:0]gt2_rxpd_in;
  input [0:0]AR;
  input I5;
  input gt2_drpen_in;
  input [15:0]gt2_drpdi_in;
  input gt2_drpwe_in;
  input [8:0]gt2_drpaddr_in;

  wire [0:0]AR;
  wire GT0_QPLLOUTCLK_IN;
  wire GT0_QPLLOUTREFCLK_IN;
  wire GT2_DRP_BUSY_OUT;
  wire GTRXRESET_OUT;
  wire I2;
  wire I5;
  wire O1;
  wire [14:0]gt2_dmonitorout_out;
  wire [8:0]gt2_drpaddr_in;
  wire gt2_drpclk_in;
  wire [15:0]gt2_drpdi_in;
  wire [15:0]gt2_drpdo_out;
  wire gt2_drpen_in;
  wire gt2_drpwe_in;
  wire gt2_eyescandataerror_out;
  wire gt2_eyescanreset_in;
  wire gt2_eyescantrigger_in;
  wire gt2_gthrxn_in;
  wire gt2_gthrxp_in;
  wire gt2_rxbufreset_in;
  wire [2:0]gt2_rxbufstatus_out;
  wire [1:0]gt2_rxchariscomma_out;
  wire [1:0]gt2_rxcharisk_out;
  wire [15:0]gt2_rxdata_out;
  wire [1:0]gt2_rxdisperr_out;
  wire gt2_rxmcommaalignen_in;
  wire [6:0]gt2_rxmonitorout_out;
  wire [1:0]gt2_rxmonitorsel_in;
  wire [1:0]gt2_rxnotintable_out;
  wire gt2_rxoutclk_out;
  wire gt2_rxpcommaalignen_in;
  wire [1:0]gt2_rxpd_in;
  wire gt2_rxresetdone_out;
  wire gt2_rxusrclk2_in;
  wire gt2_rxusrclk_in;
  wire n_10_gtrxreset_seq_i;
  wire n_11_gtrxreset_seq_i;
  wire n_12_gtrxreset_seq_i;
  wire n_13_gtrxreset_seq_i;
  wire n_14_gtrxreset_seq_i;
  wire n_15_gtrxreset_seq_i;
  wire n_16_gtrxreset_seq_i;
  wire n_17_gtrxreset_seq_i;
  wire n_18_gtrxreset_seq_i;
  wire n_19_gtrxreset_seq_i;
  wire n_1_gtrxreset_seq_i;
  wire n_20_gtrxreset_seq_i;
  wire n_21_gtrxreset_seq_i;
  wire n_22_gtrxreset_seq_i;
  wire n_23_gtrxreset_seq_i;
  wire n_24_gtrxreset_seq_i;
  wire n_25_gtrxreset_seq_i;
  wire n_26_gtrxreset_seq_i;
  wire n_270_gthe2_i;
  wire n_27_gtrxreset_seq_i;
  wire n_28_gtrxreset_seq_i;
  wire n_2_gtrxreset_seq_i;
  wire n_33_gthe2_i;
  wire n_3_gtrxreset_seq_i;
  wire n_4_gtrxreset_seq_i;
  wire n_5_gtrxreset_seq_i;
  wire n_6_gtrxreset_seq_i;
  wire n_7_gtrxreset_seq_i;
  wire n_8_gtrxreset_seq_i;
  wire n_9_gtrxreset_seq_i;
  wire NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED;
  wire NLW_gthe2_i_CPLLLOCK_UNCONNECTED;
  wire NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED;
  wire NLW_gthe2_i_GTHTXN_UNCONNECTED;
  wire NLW_gthe2_i_GTHTXP_UNCONNECTED;
  wire NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED;
  wire NLW_gthe2_i_PHYSTATUS_UNCONNECTED;
  wire NLW_gthe2_i_RSOSINTDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED;
  wire NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED;
  wire NLW_gthe2_i_RXCDRLOCK_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMINITDET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMMADET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMSASDET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXELECIDLE_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED;
  wire NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXPRBSERR_UNCONNECTED;
  wire NLW_gthe2_i_RXQPISENN_UNCONNECTED;
  wire NLW_gthe2_i_RXQPISENP_UNCONNECTED;
  wire NLW_gthe2_i_RXRATEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXSYNCDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXSYNCOUT_UNCONNECTED;
  wire NLW_gthe2_i_RXVALID_UNCONNECTED;
  wire NLW_gthe2_i_TXCOMFINISH_UNCONNECTED;
  wire NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLK_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED;
  wire NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXPHINITDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXQPISENN_UNCONNECTED;
  wire NLW_gthe2_i_TXQPISENP_UNCONNECTED;
  wire NLW_gthe2_i_TXRATEDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXSYNCDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXSYNCOUT_UNCONNECTED;
  wire [15:0]NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXCHARISK_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXCHBONDO_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED;
  wire [63:16]NLW_gthe2_i_RXDATA_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXDATAVALID_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXDISPERR_UNCONNECTED;
  wire [5:0]NLW_gthe2_i_RXHEADER_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXHEADERVALID_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXPHMONITOR_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED;
  wire [2:0]NLW_gthe2_i_RXSTATUS_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED;

FDRE #(
    .INIT(1'b0)) 
     drp_busy_i1_reg
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .D(n_19_gtrxreset_seq_i),
        .Q(GT2_DRP_BUSY_OUT),
        .R(1'b0));
(* box_type = "PRIMITIVE" *) 
   GTHE2_CHANNEL #(
    .ACJTAG_DEBUG_MODE(1'b0),
    .ACJTAG_MODE(1'b0),
    .ACJTAG_RESET(1'b0),
    .ADAPT_CFG0(20'h00C10),
    .ALIGN_COMMA_DOUBLE("FALSE"),
    .ALIGN_COMMA_ENABLE(10'b1111111111),
    .ALIGN_COMMA_WORD(2),
    .ALIGN_MCOMMA_DET("TRUE"),
    .ALIGN_MCOMMA_VALUE(10'b1010000011),
    .ALIGN_PCOMMA_DET("TRUE"),
    .ALIGN_PCOMMA_VALUE(10'b0101111100),
    .A_RXOSCALRESET(1'b0),
    .CBCC_DATA_SOURCE_SEL("DECODED"),
    .CFOK_CFG(42'h24800040E80),
    .CFOK_CFG2(6'b100000),
    .CFOK_CFG3(6'b100000),
    .CHAN_BOND_KEEP_ALIGN("FALSE"),
    .CHAN_BOND_MAX_SKEW(1),
    .CHAN_BOND_SEQ_1_1(10'b0000000000),
    .CHAN_BOND_SEQ_1_2(10'b0000000000),
    .CHAN_BOND_SEQ_1_3(10'b0000000000),
    .CHAN_BOND_SEQ_1_4(10'b0000000000),
    .CHAN_BOND_SEQ_1_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_1(10'b0000000000),
    .CHAN_BOND_SEQ_2_2(10'b0000000000),
    .CHAN_BOND_SEQ_2_3(10'b0000000000),
    .CHAN_BOND_SEQ_2_4(10'b0000000000),
    .CHAN_BOND_SEQ_2_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_USE("FALSE"),
    .CHAN_BOND_SEQ_LEN(1),
    .CLK_CORRECT_USE("FALSE"),
    .CLK_COR_KEEP_IDLE("FALSE"),
    .CLK_COR_MAX_LAT(10),
    .CLK_COR_MIN_LAT(8),
    .CLK_COR_PRECEDENCE("TRUE"),
    .CLK_COR_REPEAT_WAIT(0),
    .CLK_COR_SEQ_1_1(10'b0100000000),
    .CLK_COR_SEQ_1_2(10'b0000000000),
    .CLK_COR_SEQ_1_3(10'b0000000000),
    .CLK_COR_SEQ_1_4(10'b0000000000),
    .CLK_COR_SEQ_1_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_1(10'b0100000000),
    .CLK_COR_SEQ_2_2(10'b0000000000),
    .CLK_COR_SEQ_2_3(10'b0000000000),
    .CLK_COR_SEQ_2_4(10'b0000000000),
    .CLK_COR_SEQ_2_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_USE("FALSE"),
    .CLK_COR_SEQ_LEN(1),
    .CPLL_CFG(29'h00BC07DC),
    .CPLL_FBDIV(5),
    .CPLL_FBDIV_45(5),
    .CPLL_INIT_CFG(24'h00001E),
    .CPLL_LOCK_CFG(16'h01E8),
    .CPLL_REFCLK_DIV(1),
    .DEC_MCOMMA_DETECT("TRUE"),
    .DEC_PCOMMA_DETECT("TRUE"),
    .DEC_VALID_COMMA_ONLY("TRUE"),
    .DMONITOR_CFG(24'h000A00),
    .ES_CLK_PHASE_SEL(1'b0),
    .ES_CONTROL(6'b000000),
    .ES_ERRDET_EN("FALSE"),
    .ES_EYE_SCAN_EN("TRUE"),
    .ES_HORZ_OFFSET(12'h000),
    .ES_PMA_CFG(10'b0000000000),
    .ES_PRESCALE(5'b00000),
    .ES_QUALIFIER(80'h00000000000000000000),
    .ES_QUAL_MASK(80'h00000000000000000000),
    .ES_SDATA_MASK(80'h00000000000000000000),
    .ES_VERT_OFFSET(9'b000000000),
    .FTS_DESKEW_SEQ_ENABLE(4'b1111),
    .FTS_LANE_DESKEW_CFG(4'b1111),
    .FTS_LANE_DESKEW_EN("FALSE"),
    .GEARBOX_MODE(3'b000),
    .IS_CLKRSVD0_INVERTED(1'b0),
    .IS_CLKRSVD1_INVERTED(1'b0),
    .IS_CPLLLOCKDETCLK_INVERTED(1'b0),
    .IS_DMONITORCLK_INVERTED(1'b0),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_RXUSRCLK2_INVERTED(1'b0),
    .IS_RXUSRCLK_INVERTED(1'b0),
    .IS_SIGVALIDCLK_INVERTED(1'b0),
    .IS_TXPHDLYTSTCLK_INVERTED(1'b0),
    .IS_TXUSRCLK2_INVERTED(1'b0),
    .IS_TXUSRCLK_INVERTED(1'b0),
    .LOOPBACK_CFG(1'b0),
    .OUTREFCLK_SEL_INV(2'b11),
    .PCS_PCIE_EN("FALSE"),
    .PCS_RSVD_ATTR(48'h000000000000),
    .PD_TRANS_TIME_FROM_P2(12'h03C),
    .PD_TRANS_TIME_NONE_P2(8'h3C),
    .PD_TRANS_TIME_TO_P2(8'h64),
    .PMA_RSV(32'b00000000000111100111000010000000),
    .PMA_RSV2(32'b00011100000000000000000000001010),
    .PMA_RSV3(2'b00),
    .PMA_RSV4(15'b000000000001000),
    .PMA_RSV5(4'b0000),
    .RESET_POWERSAVE_DISABLE(1'b0),
    .RXBUFRESET_TIME(5'b00001),
    .RXBUF_ADDR_MODE("FAST"),
    .RXBUF_EIDLE_HI_CNT(4'b1000),
    .RXBUF_EIDLE_LO_CNT(4'b0000),
    .RXBUF_EN("TRUE"),
    .RXBUF_RESET_ON_CB_CHANGE("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN("FALSE"),
    .RXBUF_RESET_ON_EIDLE("FALSE"),
    .RXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .RXBUF_THRESH_OVFLW(61),
    .RXBUF_THRESH_OVRD("FALSE"),
    .RXBUF_THRESH_UNDFLW(4),
    .RXCDRFREQRESET_TIME(5'b00001),
    .RXCDRPHRESET_TIME(5'b00001),
    .RXCDR_CFG(83'h0002007FE1000C2080018),
    .RXCDR_FR_RESET_ON_EIDLE(1'b0),
    .RXCDR_HOLD_DURING_EIDLE(1'b0),
    .RXCDR_LOCK_CFG(6'b010101),
    .RXCDR_PH_RESET_ON_EIDLE(1'b0),
    .RXDFELPMRESET_TIME(7'b0001111),
    .RXDLY_CFG(16'h001F),
    .RXDLY_LCFG(9'h030),
    .RXDLY_TAP_CFG(16'h0000),
    .RXGEARBOX_EN("FALSE"),
    .RXISCANRESET_TIME(5'b00001),
    .RXLPM_HF_CFG(14'b00001000000000),
    .RXLPM_LF_CFG(18'b001001000000000000),
    .RXOOB_CFG(7'b0000110),
    .RXOOB_CLK_CFG("PMA"),
    .RXOSCALRESET_TIME(5'b00011),
    .RXOSCALRESET_TIMEOUT(5'b00000),
    .RXOUT_DIV(2),
    .RXPCSRESET_TIME(5'b00001),
    .RXPHDLY_CFG(24'h084020),
    .RXPH_CFG(24'hC00002),
    .RXPH_MONITOR_SEL(5'b00000),
    .RXPI_CFG0(2'b00),
    .RXPI_CFG1(2'b11),
    .RXPI_CFG2(2'b11),
    .RXPI_CFG3(2'b11),
    .RXPI_CFG4(1'b0),
    .RXPI_CFG5(1'b0),
    .RXPI_CFG6(3'b100),
    .RXPMARESET_TIME(5'b00011),
    .RXPRBS_ERR_LOOPBACK(1'b0),
    .RXSLIDE_AUTO_WAIT(7),
    .RXSLIDE_MODE("OFF"),
    .RXSYNC_MULTILANE(1'b1),
    .RXSYNC_OVRD(1'b0),
    .RXSYNC_SKIP_DA(1'b0),
    .RX_BIAS_CFG(24'b000011000000000000010000),
    .RX_BUFFER_CFG(6'b000000),
    .RX_CLK25_DIV(6),
    .RX_CLKMUX_PD(1'b1),
    .RX_CM_SEL(2'b00),
    .RX_CM_TRIM(4'b0000),
    .RX_DATA_WIDTH(20),
    .RX_DDI_SEL(6'b000000),
    .RX_DEBUG_CFG(14'b00000000000000),
    .RX_DEFER_RESET_BUF_EN("TRUE"),
    .RX_DFELPM_CFG0(4'b0110),
    .RX_DFELPM_CFG1(1'b0),
    .RX_DFELPM_KLKH_AGC_STUP_EN(1'b1),
    .RX_DFE_AGC_CFG0(2'b00),
    .RX_DFE_AGC_CFG1(3'b010),
    .RX_DFE_AGC_CFG2(4'b0000),
    .RX_DFE_AGC_OVRDEN(1'b1),
    .RX_DFE_GAIN_CFG(23'h0020C0),
    .RX_DFE_H2_CFG(12'b000000000000),
    .RX_DFE_H3_CFG(12'b000001000000),
    .RX_DFE_H4_CFG(11'b00011100000),
    .RX_DFE_H5_CFG(11'b00011100000),
    .RX_DFE_H6_CFG(11'b00000100000),
    .RX_DFE_H7_CFG(11'b00000100000),
    .RX_DFE_KL_CFG(33'b001000001000000000000001100010000),
    .RX_DFE_KL_LPM_KH_CFG0(2'b01),
    .RX_DFE_KL_LPM_KH_CFG1(3'b010),
    .RX_DFE_KL_LPM_KH_CFG2(4'b0010),
    .RX_DFE_KL_LPM_KH_OVRDEN(1'b1),
    .RX_DFE_KL_LPM_KL_CFG0(2'b01),
    .RX_DFE_KL_LPM_KL_CFG1(3'b010),
    .RX_DFE_KL_LPM_KL_CFG2(4'b0010),
    .RX_DFE_KL_LPM_KL_OVRDEN(1'b1),
    .RX_DFE_LPM_CFG(16'h0080),
    .RX_DFE_LPM_HOLD_DURING_EIDLE(1'b0),
    .RX_DFE_ST_CFG(54'h00E100000C003F),
    .RX_DFE_UT_CFG(17'b00011100000000000),
    .RX_DFE_VP_CFG(17'b00011101010100011),
    .RX_DISPERR_SEQ_MATCH("TRUE"),
    .RX_INT_DATAWIDTH(0),
    .RX_OS_CFG(13'b0000010000000),
    .RX_SIG_VALID_DLY(10),
    .RX_XCLK_SEL("RXREC"),
    .SAS_MAX_COM(64),
    .SAS_MIN_COM(36),
    .SATA_BURST_SEQ_LEN(4'b1111),
    .SATA_BURST_VAL(3'b100),
    .SATA_CPLL_CFG("VCO_3000MHZ"),
    .SATA_EIDLE_VAL(3'b100),
    .SATA_MAX_BURST(8),
    .SATA_MAX_INIT(21),
    .SATA_MAX_WAKE(7),
    .SATA_MIN_BURST(4),
    .SATA_MIN_INIT(12),
    .SATA_MIN_WAKE(4),
    .SHOW_REALIGN_COMMA("TRUE"),
    .SIM_CPLLREFCLK_SEL(3'b001),
    .SIM_RECEIVER_DETECT_PASS("TRUE"),
    .SIM_RESET_SPEEDUP("FALSE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL("X"),
    .SIM_VERSION("2.0"),
    .TERM_RCAL_CFG(15'b100001000010000),
    .TERM_RCAL_OVRD(3'b000),
    .TRANS_TIME_RATE(8'h0E),
    .TST_RSV(32'h00000000),
    .TXBUF_EN("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .TXDLY_CFG(16'h001F),
    .TXDLY_LCFG(9'h030),
    .TXDLY_TAP_CFG(16'h0000),
    .TXGEARBOX_EN("FALSE"),
    .TXOOB_CFG(1'b0),
    .TXOUT_DIV(1),
    .TXPCSRESET_TIME(5'b00001),
    .TXPHDLY_CFG(24'h084020),
    .TXPH_CFG(16'h0780),
    .TXPH_MONITOR_SEL(5'b00000),
    .TXPI_CFG0(2'b00),
    .TXPI_CFG1(2'b00),
    .TXPI_CFG2(2'b00),
    .TXPI_CFG3(1'b0),
    .TXPI_CFG4(1'b0),
    .TXPI_CFG5(3'b100),
    .TXPI_GREY_SEL(1'b0),
    .TXPI_INVSTROBE_SEL(1'b0),
    .TXPI_PPMCLK_SEL("TXUSRCLK2"),
    .TXPI_PPM_CFG(8'b00000000),
    .TXPI_SYNFREQ_PPM(3'b000),
    .TXPMARESET_TIME(5'b00001),
    .TXSYNC_MULTILANE(1'b0),
    .TXSYNC_OVRD(1'b0),
    .TXSYNC_SKIP_DA(1'b0),
    .TX_CLK25_DIV(6),
    .TX_CLKMUX_PD(1'b1),
    .TX_DATA_WIDTH(20),
    .TX_DEEMPH0(6'b000000),
    .TX_DEEMPH1(6'b000000),
    .TX_DRIVE_MODE("DIRECT"),
    .TX_EIDLE_ASSERT_DELAY(3'b110),
    .TX_EIDLE_DEASSERT_DELAY(3'b100),
    .TX_INT_DATAWIDTH(0),
    .TX_LOOPBACK_DRIVE_HIZ("FALSE"),
    .TX_MAINCURSOR_SEL(1'b0),
    .TX_MARGIN_FULL_0(7'b1001110),
    .TX_MARGIN_FULL_1(7'b1001001),
    .TX_MARGIN_FULL_2(7'b1000101),
    .TX_MARGIN_FULL_3(7'b1000010),
    .TX_MARGIN_FULL_4(7'b1000000),
    .TX_MARGIN_LOW_0(7'b1000110),
    .TX_MARGIN_LOW_1(7'b1000100),
    .TX_MARGIN_LOW_2(7'b1000010),
    .TX_MARGIN_LOW_3(7'b1000000),
    .TX_MARGIN_LOW_4(7'b1000000),
    .TX_QPI_STATUS_EN(1'b0),
    .TX_RXDETECT_CFG(14'h1832),
    .TX_RXDETECT_PRECHARGE_TIME(17'h155CC),
    .TX_RXDETECT_REF(3'b100),
    .TX_XCLK_SEL("TXOUT"),
    .UCODEER_CLR(1'b0),
    .USE_PCS_CLK_PHASE_SEL(1'b0)) 
     gthe2_i
       (.CFGRESET(1'b0),
        .CLKRSVD0(1'b0),
        .CLKRSVD1(1'b0),
        .CPLLFBCLKLOST(NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED),
        .CPLLLOCK(NLW_gthe2_i_CPLLLOCK_UNCONNECTED),
        .CPLLLOCKDETCLK(1'b0),
        .CPLLLOCKEN(1'b1),
        .CPLLPD(1'b1),
        .CPLLREFCLKLOST(NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED),
        .CPLLREFCLKSEL({1'b0,1'b0,1'b1}),
        .CPLLRESET(1'b0),
        .DMONFIFORESET(1'b0),
        .DMONITORCLK(1'b0),
        .DMONITOROUT(gt2_dmonitorout_out),
        .DRPADDR({n_20_gtrxreset_seq_i,n_21_gtrxreset_seq_i,n_22_gtrxreset_seq_i,n_23_gtrxreset_seq_i,n_24_gtrxreset_seq_i,n_25_gtrxreset_seq_i,n_26_gtrxreset_seq_i,n_27_gtrxreset_seq_i,n_28_gtrxreset_seq_i}),
        .DRPCLK(gt2_drpclk_in),
        .DRPDI({n_2_gtrxreset_seq_i,n_3_gtrxreset_seq_i,n_4_gtrxreset_seq_i,n_5_gtrxreset_seq_i,n_6_gtrxreset_seq_i,n_7_gtrxreset_seq_i,n_8_gtrxreset_seq_i,n_9_gtrxreset_seq_i,n_10_gtrxreset_seq_i,n_11_gtrxreset_seq_i,n_12_gtrxreset_seq_i,n_13_gtrxreset_seq_i,n_14_gtrxreset_seq_i,n_15_gtrxreset_seq_i,n_16_gtrxreset_seq_i,n_17_gtrxreset_seq_i}),
        .DRPDO(gt2_drpdo_out),
        .DRPEN(n_1_gtrxreset_seq_i),
        .DRPRDY(O1),
        .DRPWE(n_18_gtrxreset_seq_i),
        .EYESCANDATAERROR(gt2_eyescandataerror_out),
        .EYESCANMODE(1'b0),
        .EYESCANRESET(gt2_eyescanreset_in),
        .EYESCANTRIGGER(gt2_eyescantrigger_in),
        .GTGREFCLK(1'b0),
        .GTHRXN(gt2_gthrxn_in),
        .GTHRXP(gt2_gthrxp_in),
        .GTHTXN(NLW_gthe2_i_GTHTXN_UNCONNECTED),
        .GTHTXP(NLW_gthe2_i_GTHTXP_UNCONNECTED),
        .GTNORTHREFCLK0(1'b0),
        .GTNORTHREFCLK1(1'b0),
        .GTREFCLK0(1'b0),
        .GTREFCLK1(1'b0),
        .GTREFCLKMONITOR(NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED),
        .GTRESETSEL(1'b0),
        .GTRSVD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .GTRXRESET(GTRXRESET_OUT),
        .GTSOUTHREFCLK0(1'b0),
        .GTSOUTHREFCLK1(1'b0),
        .GTTXRESET(n_270_gthe2_i),
        .LOOPBACK({1'b0,1'b0,1'b0}),
        .PCSRSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDIN2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDOUT(NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED[15:0]),
        .PHYSTATUS(NLW_gthe2_i_PHYSTATUS_UNCONNECTED),
        .PMARSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLCLK(GT0_QPLLOUTCLK_IN),
        .QPLLREFCLK(GT0_QPLLOUTREFCLK_IN),
        .RESETOVRD(1'b0),
        .RSOSINTDONE(NLW_gthe2_i_RSOSINTDONE_UNCONNECTED),
        .RX8B10BEN(1'b1),
        .RXADAPTSELTEST({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXBUFRESET(gt2_rxbufreset_in),
        .RXBUFSTATUS(gt2_rxbufstatus_out),
        .RXBYTEISALIGNED(NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED),
        .RXBYTEREALIGN(NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED),
        .RXCDRFREQRESET(1'b0),
        .RXCDRHOLD(1'b0),
        .RXCDRLOCK(NLW_gthe2_i_RXCDRLOCK_UNCONNECTED),
        .RXCDROVRDEN(1'b0),
        .RXCDRRESET(1'b0),
        .RXCDRRESETRSV(1'b0),
        .RXCHANBONDSEQ(NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED),
        .RXCHANISALIGNED(NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED),
        .RXCHANREALIGN(NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED),
        .RXCHARISCOMMA({NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED[7:2],gt2_rxchariscomma_out}),
        .RXCHARISK({NLW_gthe2_i_RXCHARISK_UNCONNECTED[7:2],gt2_rxcharisk_out}),
        .RXCHBONDEN(1'b0),
        .RXCHBONDI({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXCHBONDLEVEL({1'b0,1'b0,1'b0}),
        .RXCHBONDMASTER(1'b0),
        .RXCHBONDO(NLW_gthe2_i_RXCHBONDO_UNCONNECTED[4:0]),
        .RXCHBONDSLAVE(1'b0),
        .RXCLKCORCNT(NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED[1:0]),
        .RXCOMINITDET(NLW_gthe2_i_RXCOMINITDET_UNCONNECTED),
        .RXCOMMADET(NLW_gthe2_i_RXCOMMADET_UNCONNECTED),
        .RXCOMMADETEN(1'b1),
        .RXCOMSASDET(NLW_gthe2_i_RXCOMSASDET_UNCONNECTED),
        .RXCOMWAKEDET(NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED),
        .RXDATA({NLW_gthe2_i_RXDATA_UNCONNECTED[63:16],gt2_rxdata_out}),
        .RXDATAVALID(NLW_gthe2_i_RXDATAVALID_UNCONNECTED[1:0]),
        .RXDDIEN(1'b0),
        .RXDFEAGCHOLD(1'b0),
        .RXDFEAGCOVRDEN(1'b1),
        .RXDFEAGCTRL({1'b1,1'b0,1'b0,1'b0,1'b0}),
        .RXDFECM1EN(1'b0),
        .RXDFELFHOLD(1'b0),
        .RXDFELFOVRDEN(1'b0),
        .RXDFELPMRESET(1'b0),
        .RXDFESLIDETAP({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXDFESLIDETAPADAPTEN(1'b0),
        .RXDFESLIDETAPHOLD(1'b0),
        .RXDFESLIDETAPID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXDFESLIDETAPINITOVRDEN(1'b0),
        .RXDFESLIDETAPONLYADAPTEN(1'b0),
        .RXDFESLIDETAPOVRDEN(1'b0),
        .RXDFESLIDETAPSTARTED(NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED),
        .RXDFESLIDETAPSTROBE(1'b0),
        .RXDFESLIDETAPSTROBEDONE(NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED),
        .RXDFESLIDETAPSTROBESTARTED(NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED),
        .RXDFESTADAPTDONE(NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED),
        .RXDFETAP2HOLD(1'b0),
        .RXDFETAP2OVRDEN(1'b0),
        .RXDFETAP3HOLD(1'b0),
        .RXDFETAP3OVRDEN(1'b0),
        .RXDFETAP4HOLD(1'b0),
        .RXDFETAP4OVRDEN(1'b0),
        .RXDFETAP5HOLD(1'b0),
        .RXDFETAP5OVRDEN(1'b0),
        .RXDFETAP6HOLD(1'b0),
        .RXDFETAP6OVRDEN(1'b0),
        .RXDFETAP7HOLD(1'b0),
        .RXDFETAP7OVRDEN(1'b0),
        .RXDFEUTHOLD(1'b0),
        .RXDFEUTOVRDEN(1'b0),
        .RXDFEVPHOLD(1'b0),
        .RXDFEVPOVRDEN(1'b0),
        .RXDFEVSEN(1'b0),
        .RXDFEXYDEN(1'b1),
        .RXDISPERR({NLW_gthe2_i_RXDISPERR_UNCONNECTED[7:2],gt2_rxdisperr_out}),
        .RXDLYBYPASS(1'b1),
        .RXDLYEN(1'b0),
        .RXDLYOVRDEN(1'b0),
        .RXDLYSRESET(1'b0),
        .RXDLYSRESETDONE(NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED),
        .RXELECIDLE(NLW_gthe2_i_RXELECIDLE_UNCONNECTED),
        .RXELECIDLEMODE({1'b1,1'b1}),
        .RXGEARBOXSLIP(1'b0),
        .RXHEADER(NLW_gthe2_i_RXHEADER_UNCONNECTED[5:0]),
        .RXHEADERVALID(NLW_gthe2_i_RXHEADERVALID_UNCONNECTED[1:0]),
        .RXLPMEN(1'b1),
        .RXLPMHFHOLD(1'b0),
        .RXLPMHFOVRDEN(1'b0),
        .RXLPMLFHOLD(1'b0),
        .RXLPMLFKLOVRDEN(1'b0),
        .RXMCOMMAALIGNEN(gt2_rxmcommaalignen_in),
        .RXMONITOROUT(gt2_rxmonitorout_out),
        .RXMONITORSEL(gt2_rxmonitorsel_in),
        .RXNOTINTABLE({NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED[7:2],gt2_rxnotintable_out}),
        .RXOOBRESET(1'b0),
        .RXOSCALRESET(1'b0),
        .RXOSHOLD(1'b0),
        .RXOSINTCFG({1'b0,1'b1,1'b1,1'b0}),
        .RXOSINTEN(1'b1),
        .RXOSINTHOLD(1'b0),
        .RXOSINTID0({1'b0,1'b0,1'b0,1'b0}),
        .RXOSINTNTRLEN(1'b0),
        .RXOSINTOVRDEN(1'b0),
        .RXOSINTSTARTED(NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED),
        .RXOSINTSTROBE(1'b0),
        .RXOSINTSTROBEDONE(NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED),
        .RXOSINTSTROBESTARTED(NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED),
        .RXOSINTTESTOVRDEN(1'b0),
        .RXOSOVRDEN(1'b0),
        .RXOUTCLK(gt2_rxoutclk_out),
        .RXOUTCLKFABRIC(NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED),
        .RXOUTCLKPCS(NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED),
        .RXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .RXPCOMMAALIGNEN(gt2_rxpcommaalignen_in),
        .RXPCSRESET(1'b0),
        .RXPD(gt2_rxpd_in),
        .RXPHALIGN(1'b0),
        .RXPHALIGNDONE(NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED),
        .RXPHALIGNEN(1'b0),
        .RXPHDLYPD(1'b0),
        .RXPHDLYRESET(1'b0),
        .RXPHMONITOR(NLW_gthe2_i_RXPHMONITOR_UNCONNECTED[4:0]),
        .RXPHOVRDEN(1'b0),
        .RXPHSLIPMONITOR(NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED[4:0]),
        .RXPMARESET(1'b0),
        .RXPMARESETDONE(n_33_gthe2_i),
        .RXPOLARITY(1'b0),
        .RXPRBSCNTRESET(1'b0),
        .RXPRBSERR(NLW_gthe2_i_RXPRBSERR_UNCONNECTED),
        .RXPRBSSEL({1'b0,1'b0,1'b0}),
        .RXQPIEN(1'b0),
        .RXQPISENN(NLW_gthe2_i_RXQPISENN_UNCONNECTED),
        .RXQPISENP(NLW_gthe2_i_RXQPISENP_UNCONNECTED),
        .RXRATE({1'b0,1'b0,1'b0}),
        .RXRATEDONE(NLW_gthe2_i_RXRATEDONE_UNCONNECTED),
        .RXRATEMODE(1'b0),
        .RXRESETDONE(gt2_rxresetdone_out),
        .RXSLIDE(1'b0),
        .RXSTARTOFSEQ(NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED[1:0]),
        .RXSTATUS(NLW_gthe2_i_RXSTATUS_UNCONNECTED[2:0]),
        .RXSYNCALLIN(1'b0),
        .RXSYNCDONE(NLW_gthe2_i_RXSYNCDONE_UNCONNECTED),
        .RXSYNCIN(1'b0),
        .RXSYNCMODE(1'b0),
        .RXSYNCOUT(NLW_gthe2_i_RXSYNCOUT_UNCONNECTED),
        .RXSYSCLKSEL({1'b1,1'b1}),
        .RXUSERRDY(I2),
        .RXUSRCLK(gt2_rxusrclk_in),
        .RXUSRCLK2(gt2_rxusrclk2_in),
        .RXVALID(NLW_gthe2_i_RXVALID_UNCONNECTED),
        .SETERRSTATUS(1'b0),
        .SIGVALIDCLK(1'b0),
        .TSTIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .TX8B10BBYPASS({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX8B10BEN(1'b0),
        .TXBUFDIFFCTRL({1'b1,1'b0,1'b0}),
        .TXBUFSTATUS(NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED[1:0]),
        .TXCHARDISPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARDISPVAL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARISK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCOMFINISH(NLW_gthe2_i_TXCOMFINISH_UNCONNECTED),
        .TXCOMINIT(1'b0),
        .TXCOMSAS(1'b0),
        .TXCOMWAKE(1'b0),
        .TXDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXDEEMPH(1'b0),
        .TXDETECTRX(1'b0),
        .TXDIFFCTRL({1'b1,1'b0,1'b0,1'b0}),
        .TXDIFFPD(1'b1),
        .TXDLYBYPASS(1'b1),
        .TXDLYEN(1'b0),
        .TXDLYHOLD(1'b0),
        .TXDLYOVRDEN(1'b0),
        .TXDLYSRESET(1'b0),
        .TXDLYSRESETDONE(NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED),
        .TXDLYUPDOWN(1'b0),
        .TXELECIDLE(1'b1),
        .TXGEARBOXREADY(NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED),
        .TXHEADER({1'b0,1'b0,1'b0}),
        .TXINHIBIT(1'b0),
        .TXMAINCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXMARGIN({1'b0,1'b0,1'b0}),
        .TXOUTCLK(NLW_gthe2_i_TXOUTCLK_UNCONNECTED),
        .TXOUTCLKFABRIC(NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED),
        .TXOUTCLKPCS(NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED),
        .TXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .TXPCSRESET(1'b0),
        .TXPD({1'b1,1'b1}),
        .TXPDELECIDLEMODE(1'b1),
        .TXPHALIGN(1'b0),
        .TXPHALIGNDONE(NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED),
        .TXPHALIGNEN(1'b0),
        .TXPHDLYPD(1'b1),
        .TXPHDLYRESET(1'b0),
        .TXPHDLYTSTCLK(1'b0),
        .TXPHINIT(1'b0),
        .TXPHINITDONE(NLW_gthe2_i_TXPHINITDONE_UNCONNECTED),
        .TXPHOVRDEN(1'b0),
        .TXPIPPMEN(1'b0),
        .TXPIPPMOVRDEN(1'b0),
        .TXPIPPMPD(1'b1),
        .TXPIPPMSEL(1'b0),
        .TXPIPPMSTEPSIZE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPISOPD(1'b1),
        .TXPMARESET(1'b0),
        .TXPMARESETDONE(NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED),
        .TXPOLARITY(1'b0),
        .TXPOSTCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPOSTCURSORINV(1'b0),
        .TXPRBSFORCEERR(1'b0),
        .TXPRBSSEL({1'b0,1'b0,1'b0}),
        .TXPRECURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPRECURSORINV(1'b0),
        .TXQPIBIASEN(1'b0),
        .TXQPISENN(NLW_gthe2_i_TXQPISENN_UNCONNECTED),
        .TXQPISENP(NLW_gthe2_i_TXQPISENP_UNCONNECTED),
        .TXQPISTRONGPDOWN(1'b0),
        .TXQPIWEAKPUP(1'b0),
        .TXRATE({1'b0,1'b0,1'b0}),
        .TXRATEDONE(NLW_gthe2_i_TXRATEDONE_UNCONNECTED),
        .TXRATEMODE(1'b0),
        .TXRESETDONE(NLW_gthe2_i_TXRESETDONE_UNCONNECTED),
        .TXSEQUENCE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXSTARTSEQ(1'b0),
        .TXSWING(1'b0),
        .TXSYNCALLIN(1'b0),
        .TXSYNCDONE(NLW_gthe2_i_TXSYNCDONE_UNCONNECTED),
        .TXSYNCIN(1'b0),
        .TXSYNCMODE(1'b0),
        .TXSYNCOUT(NLW_gthe2_i_TXSYNCOUT_UNCONNECTED),
        .TXSYSCLKSEL({1'b0,1'b0}),
        .TXUSERRDY(1'b0),
        .TXUSRCLK(1'b0),
        .TXUSRCLK2(1'b0));
gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_6 gtrxreset_seq_i
       (.AR(AR),
        .DRPADDR({n_20_gtrxreset_seq_i,n_21_gtrxreset_seq_i,n_22_gtrxreset_seq_i,n_23_gtrxreset_seq_i,n_24_gtrxreset_seq_i,n_25_gtrxreset_seq_i,n_26_gtrxreset_seq_i,n_27_gtrxreset_seq_i,n_28_gtrxreset_seq_i}),
        .DRPDI({n_2_gtrxreset_seq_i,n_3_gtrxreset_seq_i,n_4_gtrxreset_seq_i,n_5_gtrxreset_seq_i,n_6_gtrxreset_seq_i,n_7_gtrxreset_seq_i,n_8_gtrxreset_seq_i,n_9_gtrxreset_seq_i,n_10_gtrxreset_seq_i,n_11_gtrxreset_seq_i,n_12_gtrxreset_seq_i,n_13_gtrxreset_seq_i,n_14_gtrxreset_seq_i,n_15_gtrxreset_seq_i,n_16_gtrxreset_seq_i,n_17_gtrxreset_seq_i}),
        .GTRXRESET_OUT(GTRXRESET_OUT),
        .I1(O1),
        .I5(I5),
        .O1(n_1_gtrxreset_seq_i),
        .O2(n_18_gtrxreset_seq_i),
        .O3(n_19_gtrxreset_seq_i),
        .data_in(n_33_gthe2_i),
        .gt2_drpaddr_in(gt2_drpaddr_in),
        .gt2_drpclk_in(gt2_drpclk_in),
        .gt2_drpdi_in(gt2_drpdi_in),
        .gt2_drpdo_out(gt2_drpdo_out),
        .gt2_drpen_in(gt2_drpen_in),
        .gt2_drpwe_in(gt2_drpwe_in));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_GT" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_5
   (O1,
    gt3_eyescandataerror_out,
    gt3_rxoutclk_out,
    gt3_rxresetdone_out,
    gt3_dmonitorout_out,
    gt3_drpdo_out,
    gt3_rxbufstatus_out,
    gt3_rxdata_out,
    gt3_rxmonitorout_out,
    gt3_rxchariscomma_out,
    gt3_rxcharisk_out,
    gt3_rxdisperr_out,
    gt3_rxnotintable_out,
    GT3_DRP_BUSY_OUT,
    gt3_drpclk_in,
    gt3_eyescanreset_in,
    gt3_eyescantrigger_in,
    gt3_gthrxn_in,
    gt3_gthrxp_in,
    GT0_QPLLOUTCLK_IN,
    GT0_QPLLOUTREFCLK_IN,
    gt3_rxbufreset_in,
    gt3_rxmcommaalignen_in,
    gt3_rxpcommaalignen_in,
    I3,
    gt3_rxusrclk_in,
    gt3_rxusrclk2_in,
    gt3_rxmonitorsel_in,
    gt3_rxpd_in,
    AR,
    I6,
    gt3_drpen_in,
    gt3_drpdi_in,
    gt3_drpwe_in,
    gt3_drpaddr_in);
  output O1;
  output gt3_eyescandataerror_out;
  output gt3_rxoutclk_out;
  output gt3_rxresetdone_out;
  output [14:0]gt3_dmonitorout_out;
  output [15:0]gt3_drpdo_out;
  output [2:0]gt3_rxbufstatus_out;
  output [15:0]gt3_rxdata_out;
  output [6:0]gt3_rxmonitorout_out;
  output [1:0]gt3_rxchariscomma_out;
  output [1:0]gt3_rxcharisk_out;
  output [1:0]gt3_rxdisperr_out;
  output [1:0]gt3_rxnotintable_out;
  output GT3_DRP_BUSY_OUT;
  input gt3_drpclk_in;
  input gt3_eyescanreset_in;
  input gt3_eyescantrigger_in;
  input gt3_gthrxn_in;
  input gt3_gthrxp_in;
  input GT0_QPLLOUTCLK_IN;
  input GT0_QPLLOUTREFCLK_IN;
  input gt3_rxbufreset_in;
  input gt3_rxmcommaalignen_in;
  input gt3_rxpcommaalignen_in;
  input I3;
  input gt3_rxusrclk_in;
  input gt3_rxusrclk2_in;
  input [1:0]gt3_rxmonitorsel_in;
  input [1:0]gt3_rxpd_in;
  input [0:0]AR;
  input I6;
  input gt3_drpen_in;
  input [15:0]gt3_drpdi_in;
  input gt3_drpwe_in;
  input [8:0]gt3_drpaddr_in;

  wire [0:0]AR;
  wire GT0_QPLLOUTCLK_IN;
  wire GT0_QPLLOUTREFCLK_IN;
  wire GT3_DRP_BUSY_OUT;
  wire GTRXRESET_OUT;
  wire I3;
  wire I6;
  wire O1;
  wire [14:0]gt3_dmonitorout_out;
  wire [8:0]gt3_drpaddr_in;
  wire gt3_drpclk_in;
  wire [15:0]gt3_drpdi_in;
  wire [15:0]gt3_drpdo_out;
  wire gt3_drpen_in;
  wire gt3_drpwe_in;
  wire gt3_eyescandataerror_out;
  wire gt3_eyescanreset_in;
  wire gt3_eyescantrigger_in;
  wire gt3_gthrxn_in;
  wire gt3_gthrxp_in;
  wire gt3_rxbufreset_in;
  wire [2:0]gt3_rxbufstatus_out;
  wire [1:0]gt3_rxchariscomma_out;
  wire [1:0]gt3_rxcharisk_out;
  wire [15:0]gt3_rxdata_out;
  wire [1:0]gt3_rxdisperr_out;
  wire gt3_rxmcommaalignen_in;
  wire [6:0]gt3_rxmonitorout_out;
  wire [1:0]gt3_rxmonitorsel_in;
  wire [1:0]gt3_rxnotintable_out;
  wire gt3_rxoutclk_out;
  wire gt3_rxpcommaalignen_in;
  wire [1:0]gt3_rxpd_in;
  wire gt3_rxresetdone_out;
  wire gt3_rxusrclk2_in;
  wire gt3_rxusrclk_in;
  wire n_10_gtrxreset_seq_i;
  wire n_11_gtrxreset_seq_i;
  wire n_12_gtrxreset_seq_i;
  wire n_13_gtrxreset_seq_i;
  wire n_14_gtrxreset_seq_i;
  wire n_15_gtrxreset_seq_i;
  wire n_16_gtrxreset_seq_i;
  wire n_17_gtrxreset_seq_i;
  wire n_18_gtrxreset_seq_i;
  wire n_19_gtrxreset_seq_i;
  wire n_1_gtrxreset_seq_i;
  wire n_20_gtrxreset_seq_i;
  wire n_21_gtrxreset_seq_i;
  wire n_22_gtrxreset_seq_i;
  wire n_23_gtrxreset_seq_i;
  wire n_24_gtrxreset_seq_i;
  wire n_25_gtrxreset_seq_i;
  wire n_26_gtrxreset_seq_i;
  wire n_270_gthe2_i;
  wire n_27_gtrxreset_seq_i;
  wire n_28_gtrxreset_seq_i;
  wire n_2_gtrxreset_seq_i;
  wire n_33_gthe2_i;
  wire n_3_gtrxreset_seq_i;
  wire n_4_gtrxreset_seq_i;
  wire n_5_gtrxreset_seq_i;
  wire n_6_gtrxreset_seq_i;
  wire n_7_gtrxreset_seq_i;
  wire n_8_gtrxreset_seq_i;
  wire n_9_gtrxreset_seq_i;
  wire NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED;
  wire NLW_gthe2_i_CPLLLOCK_UNCONNECTED;
  wire NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED;
  wire NLW_gthe2_i_GTHTXN_UNCONNECTED;
  wire NLW_gthe2_i_GTHTXP_UNCONNECTED;
  wire NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED;
  wire NLW_gthe2_i_PHYSTATUS_UNCONNECTED;
  wire NLW_gthe2_i_RSOSINTDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED;
  wire NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED;
  wire NLW_gthe2_i_RXCDRLOCK_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED;
  wire NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMINITDET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMMADET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMSASDET_UNCONNECTED;
  wire NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXELECIDLE_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED;
  wire NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED;
  wire NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXPRBSERR_UNCONNECTED;
  wire NLW_gthe2_i_RXQPISENN_UNCONNECTED;
  wire NLW_gthe2_i_RXQPISENP_UNCONNECTED;
  wire NLW_gthe2_i_RXRATEDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXSYNCDONE_UNCONNECTED;
  wire NLW_gthe2_i_RXSYNCOUT_UNCONNECTED;
  wire NLW_gthe2_i_RXVALID_UNCONNECTED;
  wire NLW_gthe2_i_TXCOMFINISH_UNCONNECTED;
  wire NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLK_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED;
  wire NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXPHINITDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXQPISENN_UNCONNECTED;
  wire NLW_gthe2_i_TXQPISENP_UNCONNECTED;
  wire NLW_gthe2_i_TXRATEDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXRESETDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXSYNCDONE_UNCONNECTED;
  wire NLW_gthe2_i_TXSYNCOUT_UNCONNECTED;
  wire [15:0]NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXCHARISK_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXCHBONDO_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED;
  wire [63:16]NLW_gthe2_i_RXDATA_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXDATAVALID_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXDISPERR_UNCONNECTED;
  wire [5:0]NLW_gthe2_i_RXHEADER_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXHEADERVALID_UNCONNECTED;
  wire [7:2]NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXPHMONITOR_UNCONNECTED;
  wire [4:0]NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED;
  wire [2:0]NLW_gthe2_i_RXSTATUS_UNCONNECTED;
  wire [1:0]NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED;

FDRE #(
    .INIT(1'b0)) 
     drp_busy_i1_reg
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .D(n_19_gtrxreset_seq_i),
        .Q(GT3_DRP_BUSY_OUT),
        .R(1'b0));
(* box_type = "PRIMITIVE" *) 
   GTHE2_CHANNEL #(
    .ACJTAG_DEBUG_MODE(1'b0),
    .ACJTAG_MODE(1'b0),
    .ACJTAG_RESET(1'b0),
    .ADAPT_CFG0(20'h00C10),
    .ALIGN_COMMA_DOUBLE("FALSE"),
    .ALIGN_COMMA_ENABLE(10'b1111111111),
    .ALIGN_COMMA_WORD(2),
    .ALIGN_MCOMMA_DET("TRUE"),
    .ALIGN_MCOMMA_VALUE(10'b1010000011),
    .ALIGN_PCOMMA_DET("TRUE"),
    .ALIGN_PCOMMA_VALUE(10'b0101111100),
    .A_RXOSCALRESET(1'b0),
    .CBCC_DATA_SOURCE_SEL("DECODED"),
    .CFOK_CFG(42'h24800040E80),
    .CFOK_CFG2(6'b100000),
    .CFOK_CFG3(6'b100000),
    .CHAN_BOND_KEEP_ALIGN("FALSE"),
    .CHAN_BOND_MAX_SKEW(1),
    .CHAN_BOND_SEQ_1_1(10'b0000000000),
    .CHAN_BOND_SEQ_1_2(10'b0000000000),
    .CHAN_BOND_SEQ_1_3(10'b0000000000),
    .CHAN_BOND_SEQ_1_4(10'b0000000000),
    .CHAN_BOND_SEQ_1_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_1(10'b0000000000),
    .CHAN_BOND_SEQ_2_2(10'b0000000000),
    .CHAN_BOND_SEQ_2_3(10'b0000000000),
    .CHAN_BOND_SEQ_2_4(10'b0000000000),
    .CHAN_BOND_SEQ_2_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_USE("FALSE"),
    .CHAN_BOND_SEQ_LEN(1),
    .CLK_CORRECT_USE("FALSE"),
    .CLK_COR_KEEP_IDLE("FALSE"),
    .CLK_COR_MAX_LAT(10),
    .CLK_COR_MIN_LAT(8),
    .CLK_COR_PRECEDENCE("TRUE"),
    .CLK_COR_REPEAT_WAIT(0),
    .CLK_COR_SEQ_1_1(10'b0100000000),
    .CLK_COR_SEQ_1_2(10'b0000000000),
    .CLK_COR_SEQ_1_3(10'b0000000000),
    .CLK_COR_SEQ_1_4(10'b0000000000),
    .CLK_COR_SEQ_1_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_1(10'b0100000000),
    .CLK_COR_SEQ_2_2(10'b0000000000),
    .CLK_COR_SEQ_2_3(10'b0000000000),
    .CLK_COR_SEQ_2_4(10'b0000000000),
    .CLK_COR_SEQ_2_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_USE("FALSE"),
    .CLK_COR_SEQ_LEN(1),
    .CPLL_CFG(29'h00BC07DC),
    .CPLL_FBDIV(5),
    .CPLL_FBDIV_45(5),
    .CPLL_INIT_CFG(24'h00001E),
    .CPLL_LOCK_CFG(16'h01E8),
    .CPLL_REFCLK_DIV(1),
    .DEC_MCOMMA_DETECT("TRUE"),
    .DEC_PCOMMA_DETECT("TRUE"),
    .DEC_VALID_COMMA_ONLY("TRUE"),
    .DMONITOR_CFG(24'h000A00),
    .ES_CLK_PHASE_SEL(1'b0),
    .ES_CONTROL(6'b000000),
    .ES_ERRDET_EN("FALSE"),
    .ES_EYE_SCAN_EN("TRUE"),
    .ES_HORZ_OFFSET(12'h000),
    .ES_PMA_CFG(10'b0000000000),
    .ES_PRESCALE(5'b00000),
    .ES_QUALIFIER(80'h00000000000000000000),
    .ES_QUAL_MASK(80'h00000000000000000000),
    .ES_SDATA_MASK(80'h00000000000000000000),
    .ES_VERT_OFFSET(9'b000000000),
    .FTS_DESKEW_SEQ_ENABLE(4'b1111),
    .FTS_LANE_DESKEW_CFG(4'b1111),
    .FTS_LANE_DESKEW_EN("FALSE"),
    .GEARBOX_MODE(3'b000),
    .IS_CLKRSVD0_INVERTED(1'b0),
    .IS_CLKRSVD1_INVERTED(1'b0),
    .IS_CPLLLOCKDETCLK_INVERTED(1'b0),
    .IS_DMONITORCLK_INVERTED(1'b0),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_RXUSRCLK2_INVERTED(1'b0),
    .IS_RXUSRCLK_INVERTED(1'b0),
    .IS_SIGVALIDCLK_INVERTED(1'b0),
    .IS_TXPHDLYTSTCLK_INVERTED(1'b0),
    .IS_TXUSRCLK2_INVERTED(1'b0),
    .IS_TXUSRCLK_INVERTED(1'b0),
    .LOOPBACK_CFG(1'b0),
    .OUTREFCLK_SEL_INV(2'b11),
    .PCS_PCIE_EN("FALSE"),
    .PCS_RSVD_ATTR(48'h000000000000),
    .PD_TRANS_TIME_FROM_P2(12'h03C),
    .PD_TRANS_TIME_NONE_P2(8'h3C),
    .PD_TRANS_TIME_TO_P2(8'h64),
    .PMA_RSV(32'b00000000000111100111000010000000),
    .PMA_RSV2(32'b00011100000000000000000000001010),
    .PMA_RSV3(2'b00),
    .PMA_RSV4(15'b000000000001000),
    .PMA_RSV5(4'b0000),
    .RESET_POWERSAVE_DISABLE(1'b0),
    .RXBUFRESET_TIME(5'b00001),
    .RXBUF_ADDR_MODE("FAST"),
    .RXBUF_EIDLE_HI_CNT(4'b1000),
    .RXBUF_EIDLE_LO_CNT(4'b0000),
    .RXBUF_EN("TRUE"),
    .RXBUF_RESET_ON_CB_CHANGE("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN("FALSE"),
    .RXBUF_RESET_ON_EIDLE("FALSE"),
    .RXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .RXBUF_THRESH_OVFLW(61),
    .RXBUF_THRESH_OVRD("FALSE"),
    .RXBUF_THRESH_UNDFLW(4),
    .RXCDRFREQRESET_TIME(5'b00001),
    .RXCDRPHRESET_TIME(5'b00001),
    .RXCDR_CFG(83'h0002007FE1000C2080018),
    .RXCDR_FR_RESET_ON_EIDLE(1'b0),
    .RXCDR_HOLD_DURING_EIDLE(1'b0),
    .RXCDR_LOCK_CFG(6'b010101),
    .RXCDR_PH_RESET_ON_EIDLE(1'b0),
    .RXDFELPMRESET_TIME(7'b0001111),
    .RXDLY_CFG(16'h001F),
    .RXDLY_LCFG(9'h030),
    .RXDLY_TAP_CFG(16'h0000),
    .RXGEARBOX_EN("FALSE"),
    .RXISCANRESET_TIME(5'b00001),
    .RXLPM_HF_CFG(14'b00001000000000),
    .RXLPM_LF_CFG(18'b001001000000000000),
    .RXOOB_CFG(7'b0000110),
    .RXOOB_CLK_CFG("PMA"),
    .RXOSCALRESET_TIME(5'b00011),
    .RXOSCALRESET_TIMEOUT(5'b00000),
    .RXOUT_DIV(2),
    .RXPCSRESET_TIME(5'b00001),
    .RXPHDLY_CFG(24'h084020),
    .RXPH_CFG(24'hC00002),
    .RXPH_MONITOR_SEL(5'b00000),
    .RXPI_CFG0(2'b00),
    .RXPI_CFG1(2'b11),
    .RXPI_CFG2(2'b11),
    .RXPI_CFG3(2'b11),
    .RXPI_CFG4(1'b0),
    .RXPI_CFG5(1'b0),
    .RXPI_CFG6(3'b100),
    .RXPMARESET_TIME(5'b00011),
    .RXPRBS_ERR_LOOPBACK(1'b0),
    .RXSLIDE_AUTO_WAIT(7),
    .RXSLIDE_MODE("OFF"),
    .RXSYNC_MULTILANE(1'b1),
    .RXSYNC_OVRD(1'b0),
    .RXSYNC_SKIP_DA(1'b0),
    .RX_BIAS_CFG(24'b000011000000000000010000),
    .RX_BUFFER_CFG(6'b000000),
    .RX_CLK25_DIV(6),
    .RX_CLKMUX_PD(1'b1),
    .RX_CM_SEL(2'b00),
    .RX_CM_TRIM(4'b0000),
    .RX_DATA_WIDTH(20),
    .RX_DDI_SEL(6'b000000),
    .RX_DEBUG_CFG(14'b00000000000000),
    .RX_DEFER_RESET_BUF_EN("TRUE"),
    .RX_DFELPM_CFG0(4'b0110),
    .RX_DFELPM_CFG1(1'b0),
    .RX_DFELPM_KLKH_AGC_STUP_EN(1'b1),
    .RX_DFE_AGC_CFG0(2'b00),
    .RX_DFE_AGC_CFG1(3'b010),
    .RX_DFE_AGC_CFG2(4'b0000),
    .RX_DFE_AGC_OVRDEN(1'b1),
    .RX_DFE_GAIN_CFG(23'h0020C0),
    .RX_DFE_H2_CFG(12'b000000000000),
    .RX_DFE_H3_CFG(12'b000001000000),
    .RX_DFE_H4_CFG(11'b00011100000),
    .RX_DFE_H5_CFG(11'b00011100000),
    .RX_DFE_H6_CFG(11'b00000100000),
    .RX_DFE_H7_CFG(11'b00000100000),
    .RX_DFE_KL_CFG(33'b001000001000000000000001100010000),
    .RX_DFE_KL_LPM_KH_CFG0(2'b01),
    .RX_DFE_KL_LPM_KH_CFG1(3'b010),
    .RX_DFE_KL_LPM_KH_CFG2(4'b0010),
    .RX_DFE_KL_LPM_KH_OVRDEN(1'b1),
    .RX_DFE_KL_LPM_KL_CFG0(2'b01),
    .RX_DFE_KL_LPM_KL_CFG1(3'b010),
    .RX_DFE_KL_LPM_KL_CFG2(4'b0010),
    .RX_DFE_KL_LPM_KL_OVRDEN(1'b1),
    .RX_DFE_LPM_CFG(16'h0080),
    .RX_DFE_LPM_HOLD_DURING_EIDLE(1'b0),
    .RX_DFE_ST_CFG(54'h00E100000C003F),
    .RX_DFE_UT_CFG(17'b00011100000000000),
    .RX_DFE_VP_CFG(17'b00011101010100011),
    .RX_DISPERR_SEQ_MATCH("TRUE"),
    .RX_INT_DATAWIDTH(0),
    .RX_OS_CFG(13'b0000010000000),
    .RX_SIG_VALID_DLY(10),
    .RX_XCLK_SEL("RXREC"),
    .SAS_MAX_COM(64),
    .SAS_MIN_COM(36),
    .SATA_BURST_SEQ_LEN(4'b1111),
    .SATA_BURST_VAL(3'b100),
    .SATA_CPLL_CFG("VCO_3000MHZ"),
    .SATA_EIDLE_VAL(3'b100),
    .SATA_MAX_BURST(8),
    .SATA_MAX_INIT(21),
    .SATA_MAX_WAKE(7),
    .SATA_MIN_BURST(4),
    .SATA_MIN_INIT(12),
    .SATA_MIN_WAKE(4),
    .SHOW_REALIGN_COMMA("TRUE"),
    .SIM_CPLLREFCLK_SEL(3'b001),
    .SIM_RECEIVER_DETECT_PASS("TRUE"),
    .SIM_RESET_SPEEDUP("FALSE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL("X"),
    .SIM_VERSION("2.0"),
    .TERM_RCAL_CFG(15'b100001000010000),
    .TERM_RCAL_OVRD(3'b000),
    .TRANS_TIME_RATE(8'h0E),
    .TST_RSV(32'h00000000),
    .TXBUF_EN("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .TXDLY_CFG(16'h001F),
    .TXDLY_LCFG(9'h030),
    .TXDLY_TAP_CFG(16'h0000),
    .TXGEARBOX_EN("FALSE"),
    .TXOOB_CFG(1'b0),
    .TXOUT_DIV(1),
    .TXPCSRESET_TIME(5'b00001),
    .TXPHDLY_CFG(24'h084020),
    .TXPH_CFG(16'h0780),
    .TXPH_MONITOR_SEL(5'b00000),
    .TXPI_CFG0(2'b00),
    .TXPI_CFG1(2'b00),
    .TXPI_CFG2(2'b00),
    .TXPI_CFG3(1'b0),
    .TXPI_CFG4(1'b0),
    .TXPI_CFG5(3'b100),
    .TXPI_GREY_SEL(1'b0),
    .TXPI_INVSTROBE_SEL(1'b0),
    .TXPI_PPMCLK_SEL("TXUSRCLK2"),
    .TXPI_PPM_CFG(8'b00000000),
    .TXPI_SYNFREQ_PPM(3'b000),
    .TXPMARESET_TIME(5'b00001),
    .TXSYNC_MULTILANE(1'b0),
    .TXSYNC_OVRD(1'b0),
    .TXSYNC_SKIP_DA(1'b0),
    .TX_CLK25_DIV(6),
    .TX_CLKMUX_PD(1'b1),
    .TX_DATA_WIDTH(20),
    .TX_DEEMPH0(6'b000000),
    .TX_DEEMPH1(6'b000000),
    .TX_DRIVE_MODE("DIRECT"),
    .TX_EIDLE_ASSERT_DELAY(3'b110),
    .TX_EIDLE_DEASSERT_DELAY(3'b100),
    .TX_INT_DATAWIDTH(0),
    .TX_LOOPBACK_DRIVE_HIZ("FALSE"),
    .TX_MAINCURSOR_SEL(1'b0),
    .TX_MARGIN_FULL_0(7'b1001110),
    .TX_MARGIN_FULL_1(7'b1001001),
    .TX_MARGIN_FULL_2(7'b1000101),
    .TX_MARGIN_FULL_3(7'b1000010),
    .TX_MARGIN_FULL_4(7'b1000000),
    .TX_MARGIN_LOW_0(7'b1000110),
    .TX_MARGIN_LOW_1(7'b1000100),
    .TX_MARGIN_LOW_2(7'b1000010),
    .TX_MARGIN_LOW_3(7'b1000000),
    .TX_MARGIN_LOW_4(7'b1000000),
    .TX_QPI_STATUS_EN(1'b0),
    .TX_RXDETECT_CFG(14'h1832),
    .TX_RXDETECT_PRECHARGE_TIME(17'h155CC),
    .TX_RXDETECT_REF(3'b100),
    .TX_XCLK_SEL("TXOUT"),
    .UCODEER_CLR(1'b0),
    .USE_PCS_CLK_PHASE_SEL(1'b0)) 
     gthe2_i
       (.CFGRESET(1'b0),
        .CLKRSVD0(1'b0),
        .CLKRSVD1(1'b0),
        .CPLLFBCLKLOST(NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED),
        .CPLLLOCK(NLW_gthe2_i_CPLLLOCK_UNCONNECTED),
        .CPLLLOCKDETCLK(1'b0),
        .CPLLLOCKEN(1'b1),
        .CPLLPD(1'b1),
        .CPLLREFCLKLOST(NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED),
        .CPLLREFCLKSEL({1'b0,1'b0,1'b1}),
        .CPLLRESET(1'b0),
        .DMONFIFORESET(1'b0),
        .DMONITORCLK(1'b0),
        .DMONITOROUT(gt3_dmonitorout_out),
        .DRPADDR({n_20_gtrxreset_seq_i,n_21_gtrxreset_seq_i,n_22_gtrxreset_seq_i,n_23_gtrxreset_seq_i,n_24_gtrxreset_seq_i,n_25_gtrxreset_seq_i,n_26_gtrxreset_seq_i,n_27_gtrxreset_seq_i,n_28_gtrxreset_seq_i}),
        .DRPCLK(gt3_drpclk_in),
        .DRPDI({n_2_gtrxreset_seq_i,n_3_gtrxreset_seq_i,n_4_gtrxreset_seq_i,n_5_gtrxreset_seq_i,n_6_gtrxreset_seq_i,n_7_gtrxreset_seq_i,n_8_gtrxreset_seq_i,n_9_gtrxreset_seq_i,n_10_gtrxreset_seq_i,n_11_gtrxreset_seq_i,n_12_gtrxreset_seq_i,n_13_gtrxreset_seq_i,n_14_gtrxreset_seq_i,n_15_gtrxreset_seq_i,n_16_gtrxreset_seq_i,n_17_gtrxreset_seq_i}),
        .DRPDO(gt3_drpdo_out),
        .DRPEN(n_1_gtrxreset_seq_i),
        .DRPRDY(O1),
        .DRPWE(n_18_gtrxreset_seq_i),
        .EYESCANDATAERROR(gt3_eyescandataerror_out),
        .EYESCANMODE(1'b0),
        .EYESCANRESET(gt3_eyescanreset_in),
        .EYESCANTRIGGER(gt3_eyescantrigger_in),
        .GTGREFCLK(1'b0),
        .GTHRXN(gt3_gthrxn_in),
        .GTHRXP(gt3_gthrxp_in),
        .GTHTXN(NLW_gthe2_i_GTHTXN_UNCONNECTED),
        .GTHTXP(NLW_gthe2_i_GTHTXP_UNCONNECTED),
        .GTNORTHREFCLK0(1'b0),
        .GTNORTHREFCLK1(1'b0),
        .GTREFCLK0(1'b0),
        .GTREFCLK1(1'b0),
        .GTREFCLKMONITOR(NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED),
        .GTRESETSEL(1'b0),
        .GTRSVD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .GTRXRESET(GTRXRESET_OUT),
        .GTSOUTHREFCLK0(1'b0),
        .GTSOUTHREFCLK1(1'b0),
        .GTTXRESET(n_270_gthe2_i),
        .LOOPBACK({1'b0,1'b0,1'b0}),
        .PCSRSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDIN2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDOUT(NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED[15:0]),
        .PHYSTATUS(NLW_gthe2_i_PHYSTATUS_UNCONNECTED),
        .PMARSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLCLK(GT0_QPLLOUTCLK_IN),
        .QPLLREFCLK(GT0_QPLLOUTREFCLK_IN),
        .RESETOVRD(1'b0),
        .RSOSINTDONE(NLW_gthe2_i_RSOSINTDONE_UNCONNECTED),
        .RX8B10BEN(1'b1),
        .RXADAPTSELTEST({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXBUFRESET(gt3_rxbufreset_in),
        .RXBUFSTATUS(gt3_rxbufstatus_out),
        .RXBYTEISALIGNED(NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED),
        .RXBYTEREALIGN(NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED),
        .RXCDRFREQRESET(1'b0),
        .RXCDRHOLD(1'b0),
        .RXCDRLOCK(NLW_gthe2_i_RXCDRLOCK_UNCONNECTED),
        .RXCDROVRDEN(1'b0),
        .RXCDRRESET(1'b0),
        .RXCDRRESETRSV(1'b0),
        .RXCHANBONDSEQ(NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED),
        .RXCHANISALIGNED(NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED),
        .RXCHANREALIGN(NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED),
        .RXCHARISCOMMA({NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED[7:2],gt3_rxchariscomma_out}),
        .RXCHARISK({NLW_gthe2_i_RXCHARISK_UNCONNECTED[7:2],gt3_rxcharisk_out}),
        .RXCHBONDEN(1'b0),
        .RXCHBONDI({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXCHBONDLEVEL({1'b0,1'b0,1'b0}),
        .RXCHBONDMASTER(1'b0),
        .RXCHBONDO(NLW_gthe2_i_RXCHBONDO_UNCONNECTED[4:0]),
        .RXCHBONDSLAVE(1'b0),
        .RXCLKCORCNT(NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED[1:0]),
        .RXCOMINITDET(NLW_gthe2_i_RXCOMINITDET_UNCONNECTED),
        .RXCOMMADET(NLW_gthe2_i_RXCOMMADET_UNCONNECTED),
        .RXCOMMADETEN(1'b1),
        .RXCOMSASDET(NLW_gthe2_i_RXCOMSASDET_UNCONNECTED),
        .RXCOMWAKEDET(NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED),
        .RXDATA({NLW_gthe2_i_RXDATA_UNCONNECTED[63:16],gt3_rxdata_out}),
        .RXDATAVALID(NLW_gthe2_i_RXDATAVALID_UNCONNECTED[1:0]),
        .RXDDIEN(1'b0),
        .RXDFEAGCHOLD(1'b0),
        .RXDFEAGCOVRDEN(1'b1),
        .RXDFEAGCTRL({1'b1,1'b0,1'b0,1'b0,1'b0}),
        .RXDFECM1EN(1'b0),
        .RXDFELFHOLD(1'b0),
        .RXDFELFOVRDEN(1'b0),
        .RXDFELPMRESET(1'b0),
        .RXDFESLIDETAP({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXDFESLIDETAPADAPTEN(1'b0),
        .RXDFESLIDETAPHOLD(1'b0),
        .RXDFESLIDETAPID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXDFESLIDETAPINITOVRDEN(1'b0),
        .RXDFESLIDETAPONLYADAPTEN(1'b0),
        .RXDFESLIDETAPOVRDEN(1'b0),
        .RXDFESLIDETAPSTARTED(NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED),
        .RXDFESLIDETAPSTROBE(1'b0),
        .RXDFESLIDETAPSTROBEDONE(NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED),
        .RXDFESLIDETAPSTROBESTARTED(NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED),
        .RXDFESTADAPTDONE(NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED),
        .RXDFETAP2HOLD(1'b0),
        .RXDFETAP2OVRDEN(1'b0),
        .RXDFETAP3HOLD(1'b0),
        .RXDFETAP3OVRDEN(1'b0),
        .RXDFETAP4HOLD(1'b0),
        .RXDFETAP4OVRDEN(1'b0),
        .RXDFETAP5HOLD(1'b0),
        .RXDFETAP5OVRDEN(1'b0),
        .RXDFETAP6HOLD(1'b0),
        .RXDFETAP6OVRDEN(1'b0),
        .RXDFETAP7HOLD(1'b0),
        .RXDFETAP7OVRDEN(1'b0),
        .RXDFEUTHOLD(1'b0),
        .RXDFEUTOVRDEN(1'b0),
        .RXDFEVPHOLD(1'b0),
        .RXDFEVPOVRDEN(1'b0),
        .RXDFEVSEN(1'b0),
        .RXDFEXYDEN(1'b1),
        .RXDISPERR({NLW_gthe2_i_RXDISPERR_UNCONNECTED[7:2],gt3_rxdisperr_out}),
        .RXDLYBYPASS(1'b1),
        .RXDLYEN(1'b0),
        .RXDLYOVRDEN(1'b0),
        .RXDLYSRESET(1'b0),
        .RXDLYSRESETDONE(NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED),
        .RXELECIDLE(NLW_gthe2_i_RXELECIDLE_UNCONNECTED),
        .RXELECIDLEMODE({1'b1,1'b1}),
        .RXGEARBOXSLIP(1'b0),
        .RXHEADER(NLW_gthe2_i_RXHEADER_UNCONNECTED[5:0]),
        .RXHEADERVALID(NLW_gthe2_i_RXHEADERVALID_UNCONNECTED[1:0]),
        .RXLPMEN(1'b1),
        .RXLPMHFHOLD(1'b0),
        .RXLPMHFOVRDEN(1'b0),
        .RXLPMLFHOLD(1'b0),
        .RXLPMLFKLOVRDEN(1'b0),
        .RXMCOMMAALIGNEN(gt3_rxmcommaalignen_in),
        .RXMONITOROUT(gt3_rxmonitorout_out),
        .RXMONITORSEL(gt3_rxmonitorsel_in),
        .RXNOTINTABLE({NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED[7:2],gt3_rxnotintable_out}),
        .RXOOBRESET(1'b0),
        .RXOSCALRESET(1'b0),
        .RXOSHOLD(1'b0),
        .RXOSINTCFG({1'b0,1'b1,1'b1,1'b0}),
        .RXOSINTEN(1'b1),
        .RXOSINTHOLD(1'b0),
        .RXOSINTID0({1'b0,1'b0,1'b0,1'b0}),
        .RXOSINTNTRLEN(1'b0),
        .RXOSINTOVRDEN(1'b0),
        .RXOSINTSTARTED(NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED),
        .RXOSINTSTROBE(1'b0),
        .RXOSINTSTROBEDONE(NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED),
        .RXOSINTSTROBESTARTED(NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED),
        .RXOSINTTESTOVRDEN(1'b0),
        .RXOSOVRDEN(1'b0),
        .RXOUTCLK(gt3_rxoutclk_out),
        .RXOUTCLKFABRIC(NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED),
        .RXOUTCLKPCS(NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED),
        .RXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .RXPCOMMAALIGNEN(gt3_rxpcommaalignen_in),
        .RXPCSRESET(1'b0),
        .RXPD(gt3_rxpd_in),
        .RXPHALIGN(1'b0),
        .RXPHALIGNDONE(NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED),
        .RXPHALIGNEN(1'b0),
        .RXPHDLYPD(1'b0),
        .RXPHDLYRESET(1'b0),
        .RXPHMONITOR(NLW_gthe2_i_RXPHMONITOR_UNCONNECTED[4:0]),
        .RXPHOVRDEN(1'b0),
        .RXPHSLIPMONITOR(NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED[4:0]),
        .RXPMARESET(1'b0),
        .RXPMARESETDONE(n_33_gthe2_i),
        .RXPOLARITY(1'b0),
        .RXPRBSCNTRESET(1'b0),
        .RXPRBSERR(NLW_gthe2_i_RXPRBSERR_UNCONNECTED),
        .RXPRBSSEL({1'b0,1'b0,1'b0}),
        .RXQPIEN(1'b0),
        .RXQPISENN(NLW_gthe2_i_RXQPISENN_UNCONNECTED),
        .RXQPISENP(NLW_gthe2_i_RXQPISENP_UNCONNECTED),
        .RXRATE({1'b0,1'b0,1'b0}),
        .RXRATEDONE(NLW_gthe2_i_RXRATEDONE_UNCONNECTED),
        .RXRATEMODE(1'b0),
        .RXRESETDONE(gt3_rxresetdone_out),
        .RXSLIDE(1'b0),
        .RXSTARTOFSEQ(NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED[1:0]),
        .RXSTATUS(NLW_gthe2_i_RXSTATUS_UNCONNECTED[2:0]),
        .RXSYNCALLIN(1'b0),
        .RXSYNCDONE(NLW_gthe2_i_RXSYNCDONE_UNCONNECTED),
        .RXSYNCIN(1'b0),
        .RXSYNCMODE(1'b0),
        .RXSYNCOUT(NLW_gthe2_i_RXSYNCOUT_UNCONNECTED),
        .RXSYSCLKSEL({1'b1,1'b1}),
        .RXUSERRDY(I3),
        .RXUSRCLK(gt3_rxusrclk_in),
        .RXUSRCLK2(gt3_rxusrclk2_in),
        .RXVALID(NLW_gthe2_i_RXVALID_UNCONNECTED),
        .SETERRSTATUS(1'b0),
        .SIGVALIDCLK(1'b0),
        .TSTIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .TX8B10BBYPASS({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX8B10BEN(1'b0),
        .TXBUFDIFFCTRL({1'b1,1'b0,1'b0}),
        .TXBUFSTATUS(NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED[1:0]),
        .TXCHARDISPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARDISPVAL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARISK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCOMFINISH(NLW_gthe2_i_TXCOMFINISH_UNCONNECTED),
        .TXCOMINIT(1'b0),
        .TXCOMSAS(1'b0),
        .TXCOMWAKE(1'b0),
        .TXDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXDEEMPH(1'b0),
        .TXDETECTRX(1'b0),
        .TXDIFFCTRL({1'b1,1'b0,1'b0,1'b0}),
        .TXDIFFPD(1'b1),
        .TXDLYBYPASS(1'b1),
        .TXDLYEN(1'b0),
        .TXDLYHOLD(1'b0),
        .TXDLYOVRDEN(1'b0),
        .TXDLYSRESET(1'b0),
        .TXDLYSRESETDONE(NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED),
        .TXDLYUPDOWN(1'b0),
        .TXELECIDLE(1'b1),
        .TXGEARBOXREADY(NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED),
        .TXHEADER({1'b0,1'b0,1'b0}),
        .TXINHIBIT(1'b0),
        .TXMAINCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXMARGIN({1'b0,1'b0,1'b0}),
        .TXOUTCLK(NLW_gthe2_i_TXOUTCLK_UNCONNECTED),
        .TXOUTCLKFABRIC(NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED),
        .TXOUTCLKPCS(NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED),
        .TXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .TXPCSRESET(1'b0),
        .TXPD({1'b1,1'b1}),
        .TXPDELECIDLEMODE(1'b1),
        .TXPHALIGN(1'b0),
        .TXPHALIGNDONE(NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED),
        .TXPHALIGNEN(1'b0),
        .TXPHDLYPD(1'b1),
        .TXPHDLYRESET(1'b0),
        .TXPHDLYTSTCLK(1'b0),
        .TXPHINIT(1'b0),
        .TXPHINITDONE(NLW_gthe2_i_TXPHINITDONE_UNCONNECTED),
        .TXPHOVRDEN(1'b0),
        .TXPIPPMEN(1'b0),
        .TXPIPPMOVRDEN(1'b0),
        .TXPIPPMPD(1'b1),
        .TXPIPPMSEL(1'b0),
        .TXPIPPMSTEPSIZE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPISOPD(1'b1),
        .TXPMARESET(1'b0),
        .TXPMARESETDONE(NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED),
        .TXPOLARITY(1'b0),
        .TXPOSTCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPOSTCURSORINV(1'b0),
        .TXPRBSFORCEERR(1'b0),
        .TXPRBSSEL({1'b0,1'b0,1'b0}),
        .TXPRECURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPRECURSORINV(1'b0),
        .TXQPIBIASEN(1'b0),
        .TXQPISENN(NLW_gthe2_i_TXQPISENN_UNCONNECTED),
        .TXQPISENP(NLW_gthe2_i_TXQPISENP_UNCONNECTED),
        .TXQPISTRONGPDOWN(1'b0),
        .TXQPIWEAKPUP(1'b0),
        .TXRATE({1'b0,1'b0,1'b0}),
        .TXRATEDONE(NLW_gthe2_i_TXRATEDONE_UNCONNECTED),
        .TXRATEMODE(1'b0),
        .TXRESETDONE(NLW_gthe2_i_TXRESETDONE_UNCONNECTED),
        .TXSEQUENCE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXSTARTSEQ(1'b0),
        .TXSWING(1'b0),
        .TXSYNCALLIN(1'b0),
        .TXSYNCDONE(NLW_gthe2_i_TXSYNCDONE_UNCONNECTED),
        .TXSYNCIN(1'b0),
        .TXSYNCMODE(1'b0),
        .TXSYNCOUT(NLW_gthe2_i_TXSYNCOUT_UNCONNECTED),
        .TXSYSCLKSEL({1'b0,1'b0}),
        .TXUSERRDY(1'b0),
        .TXUSRCLK(1'b0),
        .TXUSRCLK2(1'b0));
gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq gtrxreset_seq_i
       (.AR(AR),
        .DRPADDR({n_20_gtrxreset_seq_i,n_21_gtrxreset_seq_i,n_22_gtrxreset_seq_i,n_23_gtrxreset_seq_i,n_24_gtrxreset_seq_i,n_25_gtrxreset_seq_i,n_26_gtrxreset_seq_i,n_27_gtrxreset_seq_i,n_28_gtrxreset_seq_i}),
        .DRPDI({n_2_gtrxreset_seq_i,n_3_gtrxreset_seq_i,n_4_gtrxreset_seq_i,n_5_gtrxreset_seq_i,n_6_gtrxreset_seq_i,n_7_gtrxreset_seq_i,n_8_gtrxreset_seq_i,n_9_gtrxreset_seq_i,n_10_gtrxreset_seq_i,n_11_gtrxreset_seq_i,n_12_gtrxreset_seq_i,n_13_gtrxreset_seq_i,n_14_gtrxreset_seq_i,n_15_gtrxreset_seq_i,n_16_gtrxreset_seq_i,n_17_gtrxreset_seq_i}),
        .GTRXRESET_OUT(GTRXRESET_OUT),
        .I1(O1),
        .I6(I6),
        .O1(n_1_gtrxreset_seq_i),
        .O2(n_18_gtrxreset_seq_i),
        .O3(n_19_gtrxreset_seq_i),
        .data_in(n_33_gthe2_i),
        .gt3_drpaddr_in(gt3_drpaddr_in),
        .gt3_drpclk_in(gt3_drpclk_in),
        .gt3_drpdi_in(gt3_drpdi_in),
        .gt3_drpdo_out(gt3_drpdo_out),
        .gt3_drpen_in(gt3_drpen_in),
        .gt3_drpwe_in(gt3_drpwe_in));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_RX_STARTUP_FSM" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0
   (AR,
    GT0_RX_FSM_RESET_DONE_OUT,
    RXUSERRDY,
    gtrxreset_i,
    SYSCLK_IN,
    gt0_rxusrclk_in,
    SOFT_RESET_IN,
    I1,
    DONT_RESET_ON_DATA_ERROR_IN,
    gt0_rxresetdone_out,
    GT0_DATA_VALID_IN,
    GT0_QPLLLOCK_IN);
  output [0:0]AR;
  output GT0_RX_FSM_RESET_DONE_OUT;
  output RXUSERRDY;
  output gtrxreset_i;
  input SYSCLK_IN;
  input gt0_rxusrclk_in;
  input SOFT_RESET_IN;
  input I1;
  input DONT_RESET_ON_DATA_ERROR_IN;
  input gt0_rxresetdone_out;
  input GT0_DATA_VALID_IN;
  input GT0_QPLLLOCK_IN;

  wire [0:0]AR;
  wire DONT_RESET_ON_DATA_ERROR_IN;
  wire GT0_DATA_VALID_IN;
  wire GT0_QPLLLOCK_IN;
  wire GT0_RX_FSM_RESET_DONE_OUT;
  wire I1;
  wire RXUSERRDY;
  wire SOFT_RESET_IN;
  wire SYSCLK_IN;
  wire check_tlock_max;
  wire clear;
  wire gt0_rxresetdone_out;
  wire gt0_rxusrclk_in;
  wire gtrxreset_i;
  wire [4:0]init_wait_count_reg__0;
  wire init_wait_done;
  wire [9:0]mmcm_lock_count_reg__0;
  wire mmcm_lock_reclocked;
  wire \n_0_FSM_onehot_rx_state[10]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[10]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[10]_i_3 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_10__2 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_11__2 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_12 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_15 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_4 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_5 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_8__2 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_10 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_4 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_5 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_6 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_7 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_8 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_3 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_4 ;
  wire \n_0_FSM_onehot_rx_state[4]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_3 ;
  wire \n_0_FSM_onehot_rx_state[6]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[6]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_2 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[9]_i_1 ;
  wire \n_0_FSM_onehot_rx_state[9]_i_2 ;
  wire \n_0_FSM_onehot_rx_state_reg[10] ;
  wire \n_0_FSM_onehot_rx_state_reg[11] ;
  wire \n_0_FSM_onehot_rx_state_reg[1] ;
  wire \n_0_FSM_onehot_rx_state_reg[2] ;
  wire \n_0_FSM_onehot_rx_state_reg[3] ;
  wire \n_0_FSM_onehot_rx_state_reg[4] ;
  wire \n_0_FSM_onehot_rx_state_reg[5] ;
  wire \n_0_FSM_onehot_rx_state_reg[7] ;
  wire \n_0_FSM_onehot_rx_state_reg[8] ;
  wire n_0_QPLL_RESET_i_1;
  wire n_0_RXUSERRDY_i_1;
  wire n_0_check_tlock_max_i_1;
  wire n_0_check_tlock_max_reg;
  wire n_0_gtrxreset_i_i_1;
  wire \n_0_init_wait_count[4]_i_1 ;
  wire n_0_init_wait_done_i_1;
  wire \n_0_mmcm_lock_count[0]_i_1 ;
  wire \n_0_mmcm_lock_count[9]_i_2 ;
  wire \n_0_mmcm_lock_count[9]_i_4 ;
  wire n_0_mmcm_lock_reclocked_i_2;
  wire n_0_pll_reset_asserted_i_1;
  wire n_0_pll_reset_asserted_reg;
  wire n_0_reset_time_out_i_11;
  wire n_0_reset_time_out_i_12;
  wire n_0_reset_time_out_i_13;
  wire n_0_reset_time_out_i_4;
  wire n_0_reset_time_out_i_5;
  wire n_0_reset_time_out_i_6;
  wire n_0_reset_time_out_i_8;
  wire n_0_reset_time_out_i_9;
  wire n_0_reset_time_out_reg;
  wire n_0_run_phase_alignment_int_i_1;
  wire n_0_run_phase_alignment_int_i_2;
  wire n_0_run_phase_alignment_int_reg;
  wire n_0_rx_fsm_reset_done_int_i_3;
  wire n_0_rx_fsm_reset_done_int_i_6;
  wire n_0_sync_QPLLLOCK;
  wire n_0_sync_data_valid;
  wire n_0_sync_mmcm_lock_reclocked;
  wire n_0_time_out_100us_i_1;
  wire n_0_time_out_100us_i_2;
  wire n_0_time_out_100us_i_3;
  wire n_0_time_out_100us_reg;
  wire n_0_time_out_1us_i_1;
  wire n_0_time_out_1us_i_2;
  wire n_0_time_out_1us_i_3;
  wire n_0_time_out_1us_reg;
  wire n_0_time_out_2ms_i_1;
  wire n_0_time_out_2ms_i_2;
  wire n_0_time_out_2ms_i_3;
  wire n_0_time_out_2ms_reg;
  wire \n_0_time_out_counter[0]_i_1 ;
  wire \n_0_time_out_counter[0]_i_3 ;
  wire \n_0_time_out_counter[0]_i_4 ;
  wire \n_0_time_out_counter[0]_i_5 ;
  wire \n_0_time_out_counter[0]_i_6 ;
  wire \n_0_time_out_counter[0]_i_7 ;
  wire \n_0_time_out_counter[0]_i_8 ;
  wire \n_0_time_out_counter[0]_i_9 ;
  wire \n_0_time_out_counter[12]_i_2 ;
  wire \n_0_time_out_counter[12]_i_3 ;
  wire \n_0_time_out_counter[12]_i_4 ;
  wire \n_0_time_out_counter[12]_i_5 ;
  wire \n_0_time_out_counter[16]_i_2 ;
  wire \n_0_time_out_counter[4]_i_2 ;
  wire \n_0_time_out_counter[4]_i_3 ;
  wire \n_0_time_out_counter[4]_i_4 ;
  wire \n_0_time_out_counter[4]_i_5 ;
  wire \n_0_time_out_counter[8]_i_2 ;
  wire \n_0_time_out_counter[8]_i_3 ;
  wire \n_0_time_out_counter[8]_i_4 ;
  wire \n_0_time_out_counter[8]_i_5 ;
  wire \n_0_time_out_counter_reg[0]_i_2 ;
  wire \n_0_time_out_counter_reg[12]_i_1 ;
  wire \n_0_time_out_counter_reg[4]_i_1 ;
  wire \n_0_time_out_counter_reg[8]_i_1 ;
  wire n_0_time_out_wait_bypass_i_1;
  wire n_0_time_out_wait_bypass_reg;
  wire n_0_time_tlock_max_i_1;
  wire n_0_time_tlock_max_i_10;
  wire n_0_time_tlock_max_i_11;
  wire n_0_time_tlock_max_i_12;
  wire n_0_time_tlock_max_i_13;
  wire n_0_time_tlock_max_i_14;
  wire n_0_time_tlock_max_i_15;
  wire n_0_time_tlock_max_i_16;
  wire n_0_time_tlock_max_i_17;
  wire n_0_time_tlock_max_i_18;
  wire n_0_time_tlock_max_i_4;
  wire n_0_time_tlock_max_i_6;
  wire n_0_time_tlock_max_i_7;
  wire n_0_time_tlock_max_i_8;
  wire n_0_time_tlock_max_i_9;
  wire n_0_time_tlock_max_reg_i_3;
  wire n_0_time_tlock_max_reg_i_5;
  wire \n_0_wait_bypass_count[0]_i_1 ;
  wire \n_0_wait_bypass_count[0]_i_2 ;
  wire \n_0_wait_bypass_count[0]_i_4 ;
  wire \n_0_wait_bypass_count[0]_i_5 ;
  wire \n_0_wait_bypass_count[0]_i_6 ;
  wire \n_0_wait_bypass_count[0]_i_7 ;
  wire \n_0_wait_bypass_count[0]_i_8 ;
  wire \n_0_wait_bypass_count[0]_i_9 ;
  wire \n_0_wait_bypass_count[12]_i_2 ;
  wire \n_0_wait_bypass_count[4]_i_2 ;
  wire \n_0_wait_bypass_count[4]_i_3 ;
  wire \n_0_wait_bypass_count[4]_i_4 ;
  wire \n_0_wait_bypass_count[4]_i_5 ;
  wire \n_0_wait_bypass_count[8]_i_2 ;
  wire \n_0_wait_bypass_count[8]_i_3 ;
  wire \n_0_wait_bypass_count[8]_i_4 ;
  wire \n_0_wait_bypass_count[8]_i_5 ;
  wire \n_0_wait_bypass_count_reg[0]_i_3 ;
  wire \n_0_wait_bypass_count_reg[4]_i_1 ;
  wire \n_0_wait_bypass_count_reg[8]_i_1 ;
  wire \n_0_wait_time_cnt[6]_i_4 ;
  wire \n_0_wait_time_cnt[6]_i_5 ;
  wire n_1_sync_QPLLLOCK;
  wire n_1_sync_data_valid;
  wire n_1_sync_mmcm_lock_reclocked;
  wire \n_1_time_out_counter_reg[0]_i_2 ;
  wire \n_1_time_out_counter_reg[12]_i_1 ;
  wire \n_1_time_out_counter_reg[4]_i_1 ;
  wire \n_1_time_out_counter_reg[8]_i_1 ;
  wire n_1_time_tlock_max_reg_i_3;
  wire n_1_time_tlock_max_reg_i_5;
  wire \n_1_wait_bypass_count_reg[0]_i_3 ;
  wire \n_1_wait_bypass_count_reg[4]_i_1 ;
  wire \n_1_wait_bypass_count_reg[8]_i_1 ;
  wire n_2_sync_QPLLLOCK;
  wire n_2_sync_data_valid;
  wire \n_2_time_out_counter_reg[0]_i_2 ;
  wire \n_2_time_out_counter_reg[12]_i_1 ;
  wire \n_2_time_out_counter_reg[4]_i_1 ;
  wire \n_2_time_out_counter_reg[8]_i_1 ;
  wire n_2_time_tlock_max_reg_i_3;
  wire n_2_time_tlock_max_reg_i_5;
  wire \n_2_wait_bypass_count_reg[0]_i_3 ;
  wire \n_2_wait_bypass_count_reg[4]_i_1 ;
  wire \n_2_wait_bypass_count_reg[8]_i_1 ;
  wire n_3_sync_QPLLLOCK;
  wire n_3_sync_data_valid;
  wire \n_3_time_out_counter_reg[0]_i_2 ;
  wire \n_3_time_out_counter_reg[12]_i_1 ;
  wire \n_3_time_out_counter_reg[4]_i_1 ;
  wire \n_3_time_out_counter_reg[8]_i_1 ;
  wire n_3_time_tlock_max_reg_i_3;
  wire n_3_time_tlock_max_reg_i_5;
  wire \n_3_wait_bypass_count_reg[0]_i_3 ;
  wire \n_3_wait_bypass_count_reg[4]_i_1 ;
  wire \n_3_wait_bypass_count_reg[8]_i_1 ;
  wire n_4_sync_data_valid;
  wire \n_4_time_out_counter_reg[0]_i_2 ;
  wire \n_4_time_out_counter_reg[12]_i_1 ;
  wire \n_4_time_out_counter_reg[4]_i_1 ;
  wire \n_4_time_out_counter_reg[8]_i_1 ;
  wire \n_4_wait_bypass_count_reg[0]_i_3 ;
  wire \n_4_wait_bypass_count_reg[4]_i_1 ;
  wire \n_4_wait_bypass_count_reg[8]_i_1 ;
  wire n_5_sync_data_valid;
  wire \n_5_time_out_counter_reg[0]_i_2 ;
  wire \n_5_time_out_counter_reg[12]_i_1 ;
  wire \n_5_time_out_counter_reg[4]_i_1 ;
  wire \n_5_time_out_counter_reg[8]_i_1 ;
  wire \n_5_wait_bypass_count_reg[0]_i_3 ;
  wire \n_5_wait_bypass_count_reg[4]_i_1 ;
  wire \n_5_wait_bypass_count_reg[8]_i_1 ;
  wire \n_6_time_out_counter_reg[0]_i_2 ;
  wire \n_6_time_out_counter_reg[12]_i_1 ;
  wire \n_6_time_out_counter_reg[4]_i_1 ;
  wire \n_6_time_out_counter_reg[8]_i_1 ;
  wire \n_6_wait_bypass_count_reg[0]_i_3 ;
  wire \n_6_wait_bypass_count_reg[4]_i_1 ;
  wire \n_6_wait_bypass_count_reg[8]_i_1 ;
  wire \n_7_time_out_counter_reg[0]_i_2 ;
  wire \n_7_time_out_counter_reg[12]_i_1 ;
  wire \n_7_time_out_counter_reg[16]_i_1 ;
  wire \n_7_time_out_counter_reg[4]_i_1 ;
  wire \n_7_time_out_counter_reg[8]_i_1 ;
  wire \n_7_wait_bypass_count_reg[0]_i_3 ;
  wire \n_7_wait_bypass_count_reg[12]_i_1 ;
  wire \n_7_wait_bypass_count_reg[4]_i_1 ;
  wire \n_7_wait_bypass_count_reg[8]_i_1 ;
  wire [4:0]p_0_in;
  wire [9:1]p_0_in__3;
  wire run_phase_alignment_int;
  wire run_phase_alignment_int_s2;
  wire run_phase_alignment_int_s3;
  wire rx_fsm_reset_done_int_s2;
  wire rx_fsm_reset_done_int_s3;
  wire rxresetdone_s2;
  wire rxresetdone_s3;
  wire sel;
  wire [16:0]time_out_counter_reg;
  wire time_out_wait_bypass_s2;
  wire time_out_wait_bypass_s3;
  wire time_tlock_max;
  wire time_tlock_max1;
  wire [12:0]wait_bypass_count_reg;
  wire [6:0]wait_time_cnt0;
  wire [6:0]wait_time_cnt_reg__0;
  wire [3:0]\NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:1]NLW_time_tlock_max_reg_i_2_CO_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_2_O_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_3_O_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_5_O_UNCONNECTED;
  wire [3:0]\NLW_wait_bypass_count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_wait_bypass_count_reg[12]_i_1_O_UNCONNECTED ;

LUT6 #(
    .INIT(64'h000000000000010C)) 
     \FSM_onehot_rx_state[10]_i_1 
       (.I0(time_out_wait_bypass_s3),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[10]_i_2 ),
        .I5(\n_0_FSM_onehot_rx_state[10]_i_3 ),
        .O(\n_0_FSM_onehot_rx_state[10]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[10]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(\n_0_FSM_onehot_rx_state[10]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair22" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[10]_i_3 
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(\n_0_FSM_onehot_rx_state[10]_i_3 ));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT5 #(
    .INIT(32'hF8F8F888)) 
     \FSM_onehot_rx_state[11]_i_10__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_10__2 ));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT5 #(
    .INIT(32'hFCFCFCA0)) 
     \FSM_onehot_rx_state[11]_i_11__2 
       (.I0(n_0_time_out_2ms_reg),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(check_tlock_max),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_11__2 ));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT3 #(
    .INIT(8'hFE)) 
     \FSM_onehot_rx_state[11]_i_12 
       (.I0(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_12 ));
(* SOFT_HLUTNM = "soft_lutpair12" *) 
   LUT5 #(
    .INIT(32'h00000203)) 
     \FSM_onehot_rx_state[11]_i_15 
       (.I0(init_wait_done),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_15 ));
LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
     \FSM_onehot_rx_state[11]_i_4 
       (.I0(\n_0_FSM_onehot_rx_state[11]_i_10__2 ),
        .I1(\n_0_FSM_onehot_rx_state[11]_i_11__2 ),
        .I2(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I3(I1),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_3 ),
        .I5(\n_0_FSM_onehot_rx_state[10]_i_3 ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_4 ));
LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[11]_i_5 
       (.I0(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_5 ));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT5 #(
    .INIT(32'h0F080808)) 
     \FSM_onehot_rx_state[11]_i_8__2 
       (.I0(time_tlock_max),
        .I1(check_tlock_max),
        .I2(n_0_reset_time_out_reg),
        .I3(n_0_time_out_2ms_reg),
        .I4(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_8__2 ));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \FSM_onehot_rx_state[2]_i_10 
       (.I0(n_0_reset_time_out_reg),
        .I1(time_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[2]_i_10 ));
LUT6 #(
    .INIT(64'h00000000000C0400)) 
     \FSM_onehot_rx_state[2]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state[2]_i_6 ),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_7 ),
        .I2(\n_0_FSM_onehot_rx_state[2]_i_8 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_5 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_2 ));
LUT6 #(
    .INIT(64'h0000000000000400)) 
     \FSM_onehot_rx_state[2]_i_4 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4 ),
        .I1(\n_0_FSM_onehot_rx_state[5]_i_3 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2 ),
        .I3(check_tlock_max),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I5(\n_0_FSM_onehot_rx_state[2]_i_10 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_4 ));
LUT6 #(
    .INIT(64'h0000001000000000)) 
     \FSM_onehot_rx_state[2]_i_5 
       (.I0(\n_0_FSM_onehot_rx_state[10]_i_3 ),
        .I1(\n_0_FSM_onehot_rx_state[10]_i_2 ),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I5(time_out_wait_bypass_s3),
        .O(\n_0_FSM_onehot_rx_state[2]_i_5 ));
(* SOFT_HLUTNM = "soft_lutpair19" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \FSM_onehot_rx_state[2]_i_6 
       (.I0(n_0_reset_time_out_reg),
        .I1(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[2]_i_6 ));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[2]_i_7 
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(run_phase_alignment_int),
        .O(\n_0_FSM_onehot_rx_state[2]_i_7 ));
(* SOFT_HLUTNM = "soft_lutpair22" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[2]_i_8 
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I3(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[2]_i_8 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \FSM_onehot_rx_state[3]_i_1 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2 ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_3 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4 ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[3]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair27" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[3]_i_3 
       (.I0(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_3 ));
(* SOFT_HLUTNM = "soft_lutpair18" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[3]_i_4 
       (.I0(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_4 ));
(* SOFT_HLUTNM = "soft_lutpair15" *) 
   LUT5 #(
    .INIT(32'h00020000)) 
     \FSM_onehot_rx_state[4]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state[9]_i_2 ),
        .O(\n_0_FSM_onehot_rx_state[4]_i_1 ));
LUT2 #(
    .INIT(4'h2)) 
     \FSM_onehot_rx_state[5]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state[5]_i_2 ),
        .I1(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[5]_i_1 ));
LUT6 #(
    .INIT(64'h0000000000040000)) 
     \FSM_onehot_rx_state[5]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(check_tlock_max),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(\n_0_FSM_onehot_rx_state[5]_i_3 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4 ),
        .O(\n_0_FSM_onehot_rx_state[5]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair27" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[5]_i_3 
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[10] ),
        .O(\n_0_FSM_onehot_rx_state[5]_i_3 ));
(* SOFT_HLUTNM = "soft_lutpair25" *) 
   LUT3 #(
    .INIT(8'h40)) 
     \FSM_onehot_rx_state[6]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state[6]_i_2 ),
        .O(\n_0_FSM_onehot_rx_state[6]_i_1 ));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \FSM_onehot_rx_state[6]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4 ),
        .I1(run_phase_alignment_int),
        .I2(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I5(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[6]_i_2 ));
LUT3 #(
    .INIT(8'hA2)) 
     \FSM_onehot_rx_state[7]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state[7]_i_2 ),
        .I1(time_tlock_max),
        .I2(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[7]_i_1 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \FSM_onehot_rx_state[7]_i_2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2 ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_3 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4 ),
        .O(\n_0_FSM_onehot_rx_state[7]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair15" *) 
   LUT5 #(
    .INIT(32'h00100000)) 
     \FSM_onehot_rx_state[8]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I4(\n_0_FSM_onehot_rx_state[9]_i_2 ),
        .O(\n_0_FSM_onehot_rx_state[8]_i_1 ));
LUT6 #(
    .INIT(64'h0008000800000008)) 
     \FSM_onehot_rx_state[9]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state[9]_i_2 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_5 ),
        .I4(n_0_time_out_2ms_reg),
        .I5(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[9]_i_1 ));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \FSM_onehot_rx_state[9]_i_2 
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I3(check_tlock_max),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_2 ),
        .O(\n_0_FSM_onehot_rx_state[9]_i_2 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[10] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[10]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[10] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[11] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(n_1_sync_data_valid),
        .Q(\n_0_FSM_onehot_rx_state_reg[11] ),
        .R(SOFT_RESET_IN));
FDSE #(
    .INIT(1'b1)) 
     \FSM_onehot_rx_state_reg[1] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(1'b0),
        .Q(\n_0_FSM_onehot_rx_state_reg[1] ),
        .S(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[2] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(n_2_sync_data_valid),
        .Q(\n_0_FSM_onehot_rx_state_reg[2] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[3] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[3]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[3] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[4] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[4]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[4] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[5] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[5]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[5] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[6] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[6]_i_1 ),
        .Q(check_tlock_max),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[7] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[7]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[7] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[8] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[8]_i_1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[8] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[9] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[9]_i_1 ),
        .Q(run_phase_alignment_int),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair21" *) 
   LUT3 #(
    .INIT(8'h74)) 
     QPLL_RESET_i_1
       (.I0(n_0_pll_reset_asserted_reg),
        .I1(\n_0_FSM_onehot_rx_state[3]_i_1 ),
        .I2(AR),
        .O(n_0_QPLL_RESET_i_1));
FDRE #(
    .INIT(1'b0)) 
     QPLL_RESET_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_QPLL_RESET_i_1),
        .Q(AR),
        .R(SOFT_RESET_IN));
LUT6 #(
    .INIT(64'hCCCCFFFFCCCC0008)) 
     RXUSERRDY_i_1
       (.I0(\n_0_FSM_onehot_rx_state[9]_i_2 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_5 ),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_1 ),
        .I5(RXUSERRDY),
        .O(n_0_RXUSERRDY_i_1));
FDRE #(
    .INIT(1'b0)) 
     RXUSERRDY_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_RXUSERRDY_i_1),
        .Q(RXUSERRDY),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair20" *) 
   LUT4 #(
    .INIT(16'hABA8)) 
     check_tlock_max_i_1
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state[7]_i_2 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1 ),
        .I3(n_0_check_tlock_max_reg),
        .O(n_0_check_tlock_max_i_1));
FDRE #(
    .INIT(1'b0)) 
     check_tlock_max_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_check_tlock_max_i_1),
        .Q(n_0_check_tlock_max_reg),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair11" *) 
   LUT5 #(
    .INIT(32'h33F73300)) 
     gtrxreset_i_i_1
       (.I0(\n_0_FSM_onehot_rx_state[6]_i_2 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_1 ),
        .I4(gtrxreset_i),
        .O(n_0_gtrxreset_i_i_1));
FDRE #(
    .INIT(1'b0)) 
     gtrxreset_i_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_gtrxreset_i_i_1),
        .Q(gtrxreset_i),
        .R(SOFT_RESET_IN));
LUT1 #(
    .INIT(2'h1)) 
     \init_wait_count[0]_i_1 
       (.I0(init_wait_count_reg__0[0]),
        .O(p_0_in[0]));
(* SOFT_HLUTNM = "soft_lutpair26" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \init_wait_count[1]_i_1 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .O(p_0_in[1]));
(* SOFT_HLUTNM = "soft_lutpair26" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \init_wait_count[2]_i_1 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[2]),
        .O(p_0_in[2]));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \init_wait_count[3]_i_1 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[3]),
        .O(p_0_in[3]));
LUT5 #(
    .INIT(32'hDFFFFFFF)) 
     \init_wait_count[4]_i_1 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[4]),
        .I4(init_wait_count_reg__0[3]),
        .O(\n_0_init_wait_count[4]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \init_wait_count[4]_i_2 
       (.I0(init_wait_count_reg__0[3]),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[2]),
        .I4(init_wait_count_reg__0[4]),
        .O(p_0_in[4]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in[0]),
        .Q(init_wait_count_reg__0[0]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in[1]),
        .Q(init_wait_count_reg__0[1]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in[2]),
        .Q(init_wait_count_reg__0[2]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in[3]),
        .Q(init_wait_count_reg__0[3]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in[4]),
        .Q(init_wait_count_reg__0[4]));
LUT6 #(
    .INIT(64'hFFFFFFFF40000000)) 
     init_wait_done_i_1
       (.I0(init_wait_count_reg__0[0]),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[4]),
        .I3(init_wait_count_reg__0[3]),
        .I4(init_wait_count_reg__0[2]),
        .I5(init_wait_done),
        .O(n_0_init_wait_done_i_1));
FDCE #(
    .INIT(1'b0)) 
     init_wait_done_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .CLR(SOFT_RESET_IN),
        .D(n_0_init_wait_done_i_1),
        .Q(init_wait_done));
LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[0]_i_1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .O(\n_0_mmcm_lock_count[0]_i_1 ));
(* SOFT_HLUTNM = "soft_lutpair23" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \mmcm_lock_count[1]_i_1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .O(p_0_in__3[1]));
(* SOFT_HLUTNM = "soft_lutpair23" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \mmcm_lock_count[2]_i_1 
       (.I0(mmcm_lock_count_reg__0[1]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[2]),
        .O(p_0_in__3[2]));
(* SOFT_HLUTNM = "soft_lutpair16" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \mmcm_lock_count[3]_i_1 
       (.I0(mmcm_lock_count_reg__0[2]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[1]),
        .I3(mmcm_lock_count_reg__0[3]),
        .O(p_0_in__3[3]));
(* SOFT_HLUTNM = "soft_lutpair16" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \mmcm_lock_count[4]_i_1 
       (.I0(mmcm_lock_count_reg__0[1]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[3]),
        .I4(mmcm_lock_count_reg__0[4]),
        .O(p_0_in__3[4]));
LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
     \mmcm_lock_count[5]_i_1 
       (.I0(mmcm_lock_count_reg__0[4]),
        .I1(mmcm_lock_count_reg__0[3]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[0]),
        .I4(mmcm_lock_count_reg__0[1]),
        .I5(mmcm_lock_count_reg__0[5]),
        .O(p_0_in__3[5]));
LUT2 #(
    .INIT(4'h9)) 
     \mmcm_lock_count[6]_i_1 
       (.I0(\n_0_mmcm_lock_count[9]_i_4 ),
        .I1(mmcm_lock_count_reg__0[6]),
        .O(p_0_in__3[6]));
(* SOFT_HLUTNM = "soft_lutpair17" *) 
   LUT3 #(
    .INIT(8'hD2)) 
     \mmcm_lock_count[7]_i_1 
       (.I0(mmcm_lock_count_reg__0[6]),
        .I1(\n_0_mmcm_lock_count[9]_i_4 ),
        .I2(mmcm_lock_count_reg__0[7]),
        .O(p_0_in__3[7]));
(* SOFT_HLUTNM = "soft_lutpair17" *) 
   LUT4 #(
    .INIT(16'hDF20)) 
     \mmcm_lock_count[8]_i_1 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(\n_0_mmcm_lock_count[9]_i_4 ),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[8]),
        .O(p_0_in__3[8]));
LUT5 #(
    .INIT(32'hDFFFFFFF)) 
     \mmcm_lock_count[9]_i_2 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(\n_0_mmcm_lock_count[9]_i_4 ),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[8]),
        .I4(mmcm_lock_count_reg__0[9]),
        .O(\n_0_mmcm_lock_count[9]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT5 #(
    .INIT(32'hF7FF0800)) 
     \mmcm_lock_count[9]_i_3 
       (.I0(mmcm_lock_count_reg__0[8]),
        .I1(mmcm_lock_count_reg__0[6]),
        .I2(\n_0_mmcm_lock_count[9]_i_4 ),
        .I3(mmcm_lock_count_reg__0[7]),
        .I4(mmcm_lock_count_reg__0[9]),
        .O(p_0_in__3[9]));
LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
     \mmcm_lock_count[9]_i_4 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .I2(mmcm_lock_count_reg__0[4]),
        .I3(mmcm_lock_count_reg__0[5]),
        .I4(mmcm_lock_count_reg__0[2]),
        .I5(mmcm_lock_count_reg__0[3]),
        .O(\n_0_mmcm_lock_count[9]_i_4 ));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2 ),
        .D(\n_0_mmcm_lock_count[0]_i_1 ),
        .Q(mmcm_lock_count_reg__0[0]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2 ),
        .D(p_0_in__3[1]),
        .Q(mmcm_lock_count_reg__0[1]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2 ),
        .D(p_0_in__3[2]),
        .Q(mmcm_lock_count_reg__0[2]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2 ),
        .D(p_0_in__3[3]),
        .Q(mmcm_lock_count_reg__0[3]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2 ),
        .D(p_0_in__3[4]),
        .Q(mmcm_lock_count_reg__0[4]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2 ),
        .D(p_0_in__3[5]),
        .Q(mmcm_lock_count_reg__0[5]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2 ),
        .D(p_0_in__3[6]),
        .Q(mmcm_lock_count_reg__0[6]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[7] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2 ),
        .D(p_0_in__3[7]),
        .Q(mmcm_lock_count_reg__0[7]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[8] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2 ),
        .D(p_0_in__3[8]),
        .Q(mmcm_lock_count_reg__0[8]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "22" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[9] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2 ),
        .D(p_0_in__3[9]),
        .Q(mmcm_lock_count_reg__0[9]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* SOFT_HLUTNM = "soft_lutpair10" *) 
   LUT5 #(
    .INIT(32'h00800000)) 
     mmcm_lock_reclocked_i_2
       (.I0(mmcm_lock_count_reg__0[9]),
        .I1(mmcm_lock_count_reg__0[8]),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(\n_0_mmcm_lock_count[9]_i_4 ),
        .I4(mmcm_lock_count_reg__0[7]),
        .O(n_0_mmcm_lock_reclocked_i_2));
FDRE #(
    .INIT(1'b0)) 
     mmcm_lock_reclocked_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_1_sync_mmcm_lock_reclocked),
        .Q(mmcm_lock_reclocked),
        .R(1'b0));
(* SOFT_HLUTNM = "soft_lutpair21" *) 
   LUT4 #(
    .INIT(16'h55DC)) 
     pll_reset_asserted_i_1
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(n_0_pll_reset_asserted_reg),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1 ),
        .I3(\n_0_FSM_onehot_rx_state[5]_i_2 ),
        .O(n_0_pll_reset_asserted_i_1));
FDRE #(
    .INIT(1'b0)) 
     pll_reset_asserted_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_pll_reset_asserted_i_1),
        .Q(n_0_pll_reset_asserted_reg),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair25" *) 
   LUT2 #(
    .INIT(4'h2)) 
     reset_time_out_i_11
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_11));
(* SOFT_HLUTNM = "soft_lutpair14" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     reset_time_out_i_12
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_12));
(* SOFT_HLUTNM = "soft_lutpair18" *) 
   LUT4 #(
    .INIT(16'h0002)) 
     reset_time_out_i_13
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(n_0_reset_time_out_i_13));
LUT6 #(
    .INIT(64'h0000000000080000)) 
     reset_time_out_i_4
       (.I0(I1),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_wait_time_cnt[6]_i_4 ),
        .I4(\n_0_FSM_onehot_rx_state[5]_i_3 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4 ),
        .O(n_0_reset_time_out_i_4));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT5 #(
    .INIT(32'h00010006)) 
     reset_time_out_i_5
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state[10]_i_3 ),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2 ),
        .I4(run_phase_alignment_int),
        .O(n_0_reset_time_out_i_5));
LUT6 #(
    .INIT(64'h0004000F00040004)) 
     reset_time_out_i_6
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4 ),
        .I1(n_0_reset_time_out_i_12),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_3 ),
        .I4(\n_0_FSM_onehot_rx_state[2]_i_8 ),
        .I5(n_0_reset_time_out_i_13),
        .O(n_0_reset_time_out_i_6));
(* SOFT_HLUTNM = "soft_lutpair14" *) 
   LUT5 #(
    .INIT(32'h00100000)) 
     reset_time_out_i_8
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(mmcm_lock_reclocked),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(check_tlock_max),
        .O(n_0_reset_time_out_i_8));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     reset_time_out_i_9
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_9));
FDSE #(
    .INIT(1'b0)) 
     reset_time_out_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_4_sync_data_valid),
        .Q(n_0_reset_time_out_reg),
        .S(SOFT_RESET_IN));
LUT4 #(
    .INIT(16'hABA8)) 
     run_phase_alignment_int_i_1
       (.I0(run_phase_alignment_int),
        .I1(n_0_run_phase_alignment_int_i_2),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1 ),
        .I3(n_0_run_phase_alignment_int_reg),
        .O(n_0_run_phase_alignment_int_i_1));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT5 #(
    .INIT(32'h00000010)) 
     run_phase_alignment_int_i_2
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2 ),
        .I4(\n_0_FSM_onehot_rx_state[10]_i_3 ),
        .O(n_0_run_phase_alignment_int_i_2));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_run_phase_alignment_int_i_1),
        .Q(n_0_run_phase_alignment_int_reg),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_s3_reg
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(run_phase_alignment_int_s2),
        .Q(run_phase_alignment_int_s3),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     rx_fsm_reset_done_int_i_3
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I5(\n_0_FSM_onehot_rx_state[10]_i_3 ),
        .O(n_0_rx_fsm_reset_done_int_i_3));
(* SOFT_HLUTNM = "soft_lutpair13" *) 
   LUT5 #(
    .INIT(32'h00000004)) 
     rx_fsm_reset_done_int_i_6
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state[10]_i_3 ),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2 ),
        .I4(run_phase_alignment_int),
        .O(n_0_rx_fsm_reset_done_int_i_6));
FDRE #(
    .INIT(1'b0)) 
     rx_fsm_reset_done_int_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_5_sync_data_valid),
        .Q(GT0_RX_FSM_RESET_DONE_OUT),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     rx_fsm_reset_done_int_s3_reg
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(rx_fsm_reset_done_int_s2),
        .Q(rx_fsm_reset_done_int_s3),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     rxresetdone_s3_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(rxresetdone_s2),
        .Q(rxresetdone_s3),
        .R(1'b0));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_33 sync_QPLLLOCK
       (.GT0_QPLLLOCK_IN(GT0_QPLLLOCK_IN),
        .I1(n_0_reset_time_out_i_9),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_4 ),
        .I3(\n_0_FSM_onehot_rx_state[5]_i_3 ),
        .I4(\n_0_wait_time_cnt[6]_i_4 ),
        .I5(n_0_reset_time_out_i_11),
        .I6(\n_0_FSM_onehot_rx_state[11]_i_12 ),
        .I7(n_3_sync_data_valid),
        .I8(n_0_pll_reset_asserted_reg),
        .I9(I1),
        .O1(n_0_sync_QPLLLOCK),
        .O2(n_1_sync_QPLLLOCK),
        .O3(n_2_sync_QPLLLOCK),
        .O4(n_3_sync_QPLLLOCK),
        .Q({\n_0_FSM_onehot_rx_state_reg[8] ,check_tlock_max,\n_0_FSM_onehot_rx_state_reg[5] ,\n_0_FSM_onehot_rx_state_reg[4] ,\n_0_FSM_onehot_rx_state_reg[2] }),
        .SYSCLK_IN(SYSCLK_IN),
        .mmcm_lock_reclocked(mmcm_lock_reclocked));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_34 sync_RXRESETDONE
       (.SYSCLK_IN(SYSCLK_IN),
        .data_out(rxresetdone_s2),
        .gt0_rxresetdone_out(gt0_rxresetdone_out));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_35 sync_data_valid
       (.D({n_1_sync_data_valid,n_2_sync_data_valid}),
        .DONT_RESET_ON_DATA_ERROR_IN(DONT_RESET_ON_DATA_ERROR_IN),
        .E(n_0_sync_data_valid),
        .GT0_DATA_VALID_IN(GT0_DATA_VALID_IN),
        .GT0_RX_FSM_RESET_DONE_OUT(GT0_RX_FSM_RESET_DONE_OUT),
        .I1(\n_0_FSM_onehot_rx_state[11]_i_4 ),
        .I10(n_0_time_out_1us_reg),
        .I11(n_0_reset_time_out_reg),
        .I12(\n_0_FSM_onehot_rx_state[2]_i_2 ),
        .I13(\n_0_FSM_onehot_rx_state[5]_i_2 ),
        .I14(n_0_time_out_2ms_reg),
        .I15(\n_0_FSM_onehot_rx_state[2]_i_4 ),
        .I16(\n_0_FSM_onehot_rx_state[2]_i_5 ),
        .I17(n_3_sync_QPLLLOCK),
        .I18(n_0_reset_time_out_i_8),
        .I19(n_0_time_out_100us_reg),
        .I2(sel),
        .I20(n_0_rx_fsm_reset_done_int_i_6),
        .I21(n_0_sync_QPLLLOCK),
        .I22(n_0_reset_time_out_i_4),
        .I23(n_0_reset_time_out_i_5),
        .I24(n_0_reset_time_out_i_6),
        .I25(n_0_rx_fsm_reset_done_int_i_3),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_5 ),
        .I4(n_1_sync_QPLLLOCK),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_15 ),
        .I6(\n_0_FSM_onehot_rx_state[10]_i_3 ),
        .I7(\n_0_FSM_onehot_rx_state[10]_i_2 ),
        .I8(\n_0_FSM_onehot_rx_state[11]_i_8__2 ),
        .I9(n_2_sync_QPLLLOCK),
        .O1(n_3_sync_data_valid),
        .O2(n_4_sync_data_valid),
        .O3(n_5_sync_data_valid),
        .Q({\n_0_FSM_onehot_rx_state_reg[11] ,\n_0_FSM_onehot_rx_state_reg[10] ,run_phase_alignment_int,\n_0_FSM_onehot_rx_state_reg[8] ,\n_0_FSM_onehot_rx_state_reg[7] ,\n_0_FSM_onehot_rx_state_reg[3] }),
        .SYSCLK_IN(SYSCLK_IN),
        .rxresetdone_s3(rxresetdone_s3));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_36 sync_mmcm_lock_reclocked
       (.I1(n_0_mmcm_lock_reclocked_i_2),
        .O1(n_1_sync_mmcm_lock_reclocked),
        .SR(n_0_sync_mmcm_lock_reclocked),
        .SYSCLK_IN(SYSCLK_IN),
        .mmcm_lock_reclocked(mmcm_lock_reclocked));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_37 sync_run_phase_alignment_int
       (.data_in(n_0_run_phase_alignment_int_reg),
        .data_out(run_phase_alignment_int_s2),
        .gt0_rxusrclk_in(gt0_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_38 sync_rx_fsm_reset_done_int
       (.GT0_RX_FSM_RESET_DONE_OUT(GT0_RX_FSM_RESET_DONE_OUT),
        .data_out(rx_fsm_reset_done_int_s2),
        .gt0_rxusrclk_in(gt0_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_39 sync_time_out_wait_bypass
       (.SYSCLK_IN(SYSCLK_IN),
        .data_in(n_0_time_out_wait_bypass_reg),
        .data_out(time_out_wait_bypass_s2));
LUT6 #(
    .INIT(64'hFFFFFFFF00010000)) 
     time_out_100us_i_1
       (.I0(\n_0_time_out_counter[0]_i_3 ),
        .I1(n_0_time_out_100us_i_2),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[11]),
        .I4(n_0_time_out_100us_i_3),
        .I5(n_0_time_out_100us_reg),
        .O(n_0_time_out_100us_i_1));
LUT2 #(
    .INIT(4'hE)) 
     time_out_100us_i_2
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[15]),
        .O(n_0_time_out_100us_i_2));
LUT6 #(
    .INIT(64'h0010000000000000)) 
     time_out_100us_i_3
       (.I0(time_out_counter_reg[16]),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[12]),
        .I3(time_out_counter_reg[3]),
        .I4(time_out_counter_reg[1]),
        .I5(time_out_counter_reg[2]),
        .O(n_0_time_out_100us_i_3));
FDRE #(
    .INIT(1'b0)) 
     time_out_100us_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_100us_i_1),
        .Q(n_0_time_out_100us_reg),
        .R(n_0_reset_time_out_reg));
LUT6 #(
    .INIT(64'hFFFFFFFF00000002)) 
     time_out_1us_i_1
       (.I0(n_0_time_out_1us_i_2),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[11]),
        .I4(time_out_counter_reg[10]),
        .I5(n_0_time_out_1us_reg),
        .O(n_0_time_out_1us_i_1));
LUT6 #(
    .INIT(64'h0000000100000000)) 
     time_out_1us_i_2
       (.I0(n_0_time_out_2ms_i_3),
        .I1(time_out_counter_reg[14]),
        .I2(time_out_counter_reg[15]),
        .I3(time_out_counter_reg[8]),
        .I4(time_out_counter_reg[9]),
        .I5(n_0_time_out_1us_i_3),
        .O(n_0_time_out_1us_i_2));
LUT5 #(
    .INIT(32'h00000020)) 
     time_out_1us_i_3
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[6]),
        .I2(time_out_counter_reg[5]),
        .I3(time_out_counter_reg[4]),
        .I4(time_out_counter_reg[7]),
        .O(n_0_time_out_1us_i_3));
FDRE #(
    .INIT(1'b0)) 
     time_out_1us_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_1us_i_1),
        .Q(n_0_time_out_1us_reg),
        .R(n_0_reset_time_out_reg));
(* SOFT_HLUTNM = "soft_lutpair19" *) 
   LUT4 #(
    .INIT(16'hFF02)) 
     time_out_2ms_i_1
       (.I0(n_0_time_out_2ms_i_2),
        .I1(\n_0_time_out_counter[0]_i_3 ),
        .I2(n_0_time_out_2ms_i_3),
        .I3(n_0_time_out_2ms_reg),
        .O(n_0_time_out_2ms_i_1));
LUT6 #(
    .INIT(64'h0080000000000000)) 
     time_out_2ms_i_2
       (.I0(time_out_counter_reg[13]),
        .I1(time_out_counter_reg[14]),
        .I2(time_out_counter_reg[11]),
        .I3(time_out_counter_reg[10]),
        .I4(time_out_counter_reg[16]),
        .I5(time_out_counter_reg[15]),
        .O(n_0_time_out_2ms_i_2));
LUT4 #(
    .INIT(16'hFFEF)) 
     time_out_2ms_i_3
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[1]),
        .I2(time_out_counter_reg[3]),
        .I3(time_out_counter_reg[12]),
        .O(n_0_time_out_2ms_i_3));
FDRE #(
    .INIT(1'b0)) 
     time_out_2ms_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_2ms_i_1),
        .Q(n_0_time_out_2ms_reg),
        .R(n_0_reset_time_out_reg));
LUT3 #(
    .INIT(8'hFE)) 
     \time_out_counter[0]_i_1 
       (.I0(time_out_counter_reg[10]),
        .I1(\n_0_time_out_counter[0]_i_3 ),
        .I2(\n_0_time_out_counter[0]_i_4 ),
        .O(\n_0_time_out_counter[0]_i_1 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
     \time_out_counter[0]_i_3 
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[5]),
        .I2(time_out_counter_reg[7]),
        .I3(time_out_counter_reg[6]),
        .I4(time_out_counter_reg[0]),
        .I5(\n_0_time_out_counter[0]_i_9 ),
        .O(\n_0_time_out_counter[0]_i_3 ));
LUT6 #(
    .INIT(64'hFFFFFFFF7FFFFFFF)) 
     \time_out_counter[0]_i_4 
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[14]),
        .I4(time_out_counter_reg[11]),
        .I5(n_0_time_out_2ms_i_3),
        .O(\n_0_time_out_counter[0]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_5 
       (.I0(time_out_counter_reg[3]),
        .O(\n_0_time_out_counter[0]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_6 
       (.I0(time_out_counter_reg[2]),
        .O(\n_0_time_out_counter[0]_i_6 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_7 
       (.I0(time_out_counter_reg[1]),
        .O(\n_0_time_out_counter[0]_i_7 ));
LUT1 #(
    .INIT(2'h1)) 
     \time_out_counter[0]_i_8 
       (.I0(time_out_counter_reg[0]),
        .O(\n_0_time_out_counter[0]_i_8 ));
LUT2 #(
    .INIT(4'hE)) 
     \time_out_counter[0]_i_9 
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[9]),
        .O(\n_0_time_out_counter[0]_i_9 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_2 
       (.I0(time_out_counter_reg[15]),
        .O(\n_0_time_out_counter[12]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_3 
       (.I0(time_out_counter_reg[14]),
        .O(\n_0_time_out_counter[12]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_4 
       (.I0(time_out_counter_reg[13]),
        .O(\n_0_time_out_counter[12]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_5 
       (.I0(time_out_counter_reg[12]),
        .O(\n_0_time_out_counter[12]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[16]_i_2 
       (.I0(time_out_counter_reg[16]),
        .O(\n_0_time_out_counter[16]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_2 
       (.I0(time_out_counter_reg[7]),
        .O(\n_0_time_out_counter[4]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_3 
       (.I0(time_out_counter_reg[6]),
        .O(\n_0_time_out_counter[4]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_4 
       (.I0(time_out_counter_reg[5]),
        .O(\n_0_time_out_counter[4]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_5 
       (.I0(time_out_counter_reg[4]),
        .O(\n_0_time_out_counter[4]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_2 
       (.I0(time_out_counter_reg[11]),
        .O(\n_0_time_out_counter[8]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_3 
       (.I0(time_out_counter_reg[10]),
        .O(\n_0_time_out_counter[8]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_4 
       (.I0(time_out_counter_reg[9]),
        .O(\n_0_time_out_counter[8]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_5 
       (.I0(time_out_counter_reg[8]),
        .O(\n_0_time_out_counter[8]_i_5 ));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_7_time_out_counter_reg[0]_i_2 ),
        .Q(time_out_counter_reg[0]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\n_0_time_out_counter_reg[0]_i_2 ,\n_1_time_out_counter_reg[0]_i_2 ,\n_2_time_out_counter_reg[0]_i_2 ,\n_3_time_out_counter_reg[0]_i_2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\n_4_time_out_counter_reg[0]_i_2 ,\n_5_time_out_counter_reg[0]_i_2 ,\n_6_time_out_counter_reg[0]_i_2 ,\n_7_time_out_counter_reg[0]_i_2 }),
        .S({\n_0_time_out_counter[0]_i_5 ,\n_0_time_out_counter[0]_i_6 ,\n_0_time_out_counter[0]_i_7 ,\n_0_time_out_counter[0]_i_8 }));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[10] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_5_time_out_counter_reg[8]_i_1 ),
        .Q(time_out_counter_reg[10]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[11] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_4_time_out_counter_reg[8]_i_1 ),
        .Q(time_out_counter_reg[11]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[12] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_7_time_out_counter_reg[12]_i_1 ),
        .Q(time_out_counter_reg[12]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[12]_i_1 
       (.CI(\n_0_time_out_counter_reg[8]_i_1 ),
        .CO({\n_0_time_out_counter_reg[12]_i_1 ,\n_1_time_out_counter_reg[12]_i_1 ,\n_2_time_out_counter_reg[12]_i_1 ,\n_3_time_out_counter_reg[12]_i_1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[12]_i_1 ,\n_5_time_out_counter_reg[12]_i_1 ,\n_6_time_out_counter_reg[12]_i_1 ,\n_7_time_out_counter_reg[12]_i_1 }),
        .S({\n_0_time_out_counter[12]_i_2 ,\n_0_time_out_counter[12]_i_3 ,\n_0_time_out_counter[12]_i_4 ,\n_0_time_out_counter[12]_i_5 }));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[13] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_6_time_out_counter_reg[12]_i_1 ),
        .Q(time_out_counter_reg[13]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[14] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_5_time_out_counter_reg[12]_i_1 ),
        .Q(time_out_counter_reg[14]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[15] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_4_time_out_counter_reg[12]_i_1 ),
        .Q(time_out_counter_reg[15]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[16] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_7_time_out_counter_reg[16]_i_1 ),
        .Q(time_out_counter_reg[16]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[16]_i_1 
       (.CI(\n_0_time_out_counter_reg[12]_i_1 ),
        .CO(\NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED [3:1],\n_7_time_out_counter_reg[16]_i_1 }),
        .S({1'b0,1'b0,1'b0,\n_0_time_out_counter[16]_i_2 }));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_6_time_out_counter_reg[0]_i_2 ),
        .Q(time_out_counter_reg[1]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_5_time_out_counter_reg[0]_i_2 ),
        .Q(time_out_counter_reg[2]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_4_time_out_counter_reg[0]_i_2 ),
        .Q(time_out_counter_reg[3]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_7_time_out_counter_reg[4]_i_1 ),
        .Q(time_out_counter_reg[4]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[4]_i_1 
       (.CI(\n_0_time_out_counter_reg[0]_i_2 ),
        .CO({\n_0_time_out_counter_reg[4]_i_1 ,\n_1_time_out_counter_reg[4]_i_1 ,\n_2_time_out_counter_reg[4]_i_1 ,\n_3_time_out_counter_reg[4]_i_1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[4]_i_1 ,\n_5_time_out_counter_reg[4]_i_1 ,\n_6_time_out_counter_reg[4]_i_1 ,\n_7_time_out_counter_reg[4]_i_1 }),
        .S({\n_0_time_out_counter[4]_i_2 ,\n_0_time_out_counter[4]_i_3 ,\n_0_time_out_counter[4]_i_4 ,\n_0_time_out_counter[4]_i_5 }));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_6_time_out_counter_reg[4]_i_1 ),
        .Q(time_out_counter_reg[5]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_5_time_out_counter_reg[4]_i_1 ),
        .Q(time_out_counter_reg[6]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[7] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_4_time_out_counter_reg[4]_i_1 ),
        .Q(time_out_counter_reg[7]),
        .R(n_0_reset_time_out_reg));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[8] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_7_time_out_counter_reg[8]_i_1 ),
        .Q(time_out_counter_reg[8]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[8]_i_1 
       (.CI(\n_0_time_out_counter_reg[4]_i_1 ),
        .CO({\n_0_time_out_counter_reg[8]_i_1 ,\n_1_time_out_counter_reg[8]_i_1 ,\n_2_time_out_counter_reg[8]_i_1 ,\n_3_time_out_counter_reg[8]_i_1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[8]_i_1 ,\n_5_time_out_counter_reg[8]_i_1 ,\n_6_time_out_counter_reg[8]_i_1 ,\n_7_time_out_counter_reg[8]_i_1 }),
        .S({\n_0_time_out_counter[8]_i_2 ,\n_0_time_out_counter[8]_i_3 ,\n_0_time_out_counter[8]_i_4 ,\n_0_time_out_counter[8]_i_5 }));
(* counter = "8" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[9] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1 ),
        .D(\n_6_time_out_counter_reg[8]_i_1 ),
        .Q(time_out_counter_reg[9]),
        .R(n_0_reset_time_out_reg));
LUT6 #(
    .INIT(64'hFF00FF0100000000)) 
     time_out_wait_bypass_i_1
       (.I0(\n_0_wait_bypass_count[0]_i_4 ),
        .I1(wait_bypass_count_reg[3]),
        .I2(\n_0_wait_bypass_count[0]_i_5 ),
        .I3(n_0_time_out_wait_bypass_reg),
        .I4(rx_fsm_reset_done_int_s3),
        .I5(run_phase_alignment_int_s3),
        .O(n_0_time_out_wait_bypass_i_1));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_reg
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(n_0_time_out_wait_bypass_i_1),
        .Q(n_0_time_out_wait_bypass_reg),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_s3_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(time_out_wait_bypass_s2),
        .Q(time_out_wait_bypass_s3),
        .R(1'b0));
LUT3 #(
    .INIT(8'hF8)) 
     time_tlock_max_i_1
       (.I0(n_0_check_tlock_max_reg),
        .I1(time_tlock_max1),
        .I2(time_tlock_max),
        .O(n_0_time_tlock_max_i_1));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_10
       (.I0(time_out_counter_reg[12]),
        .I1(time_out_counter_reg[13]),
        .O(n_0_time_tlock_max_i_10));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_11
       (.I0(time_out_counter_reg[11]),
        .I1(time_out_counter_reg[10]),
        .O(n_0_time_tlock_max_i_11));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_12
       (.I0(time_out_counter_reg[9]),
        .I1(time_out_counter_reg[8]),
        .O(n_0_time_tlock_max_i_12));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_13
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[5]),
        .O(n_0_time_tlock_max_i_13));
LUT2 #(
    .INIT(4'h8)) 
     time_tlock_max_i_14
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[1]),
        .O(n_0_time_tlock_max_i_14));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_15
       (.I0(time_out_counter_reg[6]),
        .I1(time_out_counter_reg[7]),
        .O(n_0_time_tlock_max_i_15));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_16
       (.I0(time_out_counter_reg[5]),
        .I1(time_out_counter_reg[4]),
        .O(n_0_time_tlock_max_i_16));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_17
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[3]),
        .O(n_0_time_tlock_max_i_17));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_18
       (.I0(time_out_counter_reg[1]),
        .I1(time_out_counter_reg[0]),
        .O(n_0_time_tlock_max_i_18));
LUT1 #(
    .INIT(2'h1)) 
     time_tlock_max_i_4
       (.I0(time_out_counter_reg[16]),
        .O(n_0_time_tlock_max_i_4));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_6
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[15]),
        .O(n_0_time_tlock_max_i_6));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_7
       (.I0(time_out_counter_reg[10]),
        .I1(time_out_counter_reg[11]),
        .O(n_0_time_tlock_max_i_7));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_8
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[9]),
        .O(n_0_time_tlock_max_i_8));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_9
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[14]),
        .O(n_0_time_tlock_max_i_9));
FDRE #(
    .INIT(1'b0)) 
     time_tlock_max_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_tlock_max_i_1),
        .Q(time_tlock_max),
        .R(n_0_reset_time_out_reg));
CARRY4 time_tlock_max_reg_i_2
       (.CI(n_0_time_tlock_max_reg_i_3),
        .CO({NLW_time_tlock_max_reg_i_2_CO_UNCONNECTED[3:1],time_tlock_max1}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,time_out_counter_reg[16]}),
        .O(NLW_time_tlock_max_reg_i_2_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,n_0_time_tlock_max_i_4}));
CARRY4 time_tlock_max_reg_i_3
       (.CI(n_0_time_tlock_max_reg_i_5),
        .CO({n_0_time_tlock_max_reg_i_3,n_1_time_tlock_max_reg_i_3,n_2_time_tlock_max_reg_i_3,n_3_time_tlock_max_reg_i_3}),
        .CYINIT(1'b0),
        .DI({n_0_time_tlock_max_i_6,time_out_counter_reg[13],n_0_time_tlock_max_i_7,n_0_time_tlock_max_i_8}),
        .O(NLW_time_tlock_max_reg_i_3_O_UNCONNECTED[3:0]),
        .S({n_0_time_tlock_max_i_9,n_0_time_tlock_max_i_10,n_0_time_tlock_max_i_11,n_0_time_tlock_max_i_12}));
CARRY4 time_tlock_max_reg_i_5
       (.CI(1'b0),
        .CO({n_0_time_tlock_max_reg_i_5,n_1_time_tlock_max_reg_i_5,n_2_time_tlock_max_reg_i_5,n_3_time_tlock_max_reg_i_5}),
        .CYINIT(1'b0),
        .DI({time_out_counter_reg[7],n_0_time_tlock_max_i_13,time_out_counter_reg[3],n_0_time_tlock_max_i_14}),
        .O(NLW_time_tlock_max_reg_i_5_O_UNCONNECTED[3:0]),
        .S({n_0_time_tlock_max_i_15,n_0_time_tlock_max_i_16,n_0_time_tlock_max_i_17,n_0_time_tlock_max_i_18}));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_1 
       (.I0(run_phase_alignment_int_s3),
        .O(\n_0_wait_bypass_count[0]_i_1 ));
LUT4 #(
    .INIT(16'h00FE)) 
     \wait_bypass_count[0]_i_2 
       (.I0(\n_0_wait_bypass_count[0]_i_4 ),
        .I1(wait_bypass_count_reg[3]),
        .I2(\n_0_wait_bypass_count[0]_i_5 ),
        .I3(rx_fsm_reset_done_int_s3),
        .O(\n_0_wait_bypass_count[0]_i_2 ));
LUT6 #(
    .INIT(64'hFFFFEFFFFFFFFFFF)) 
     \wait_bypass_count[0]_i_4 
       (.I0(wait_bypass_count_reg[11]),
        .I1(wait_bypass_count_reg[4]),
        .I2(wait_bypass_count_reg[0]),
        .I3(wait_bypass_count_reg[9]),
        .I4(wait_bypass_count_reg[10]),
        .I5(wait_bypass_count_reg[2]),
        .O(\n_0_wait_bypass_count[0]_i_4 ));
LUT6 #(
    .INIT(64'hFDFFFFFFFFFFFFFF)) 
     \wait_bypass_count[0]_i_5 
       (.I0(wait_bypass_count_reg[1]),
        .I1(wait_bypass_count_reg[6]),
        .I2(wait_bypass_count_reg[5]),
        .I3(wait_bypass_count_reg[12]),
        .I4(wait_bypass_count_reg[8]),
        .I5(wait_bypass_count_reg[7]),
        .O(\n_0_wait_bypass_count[0]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_6 
       (.I0(wait_bypass_count_reg[3]),
        .O(\n_0_wait_bypass_count[0]_i_6 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_7 
       (.I0(wait_bypass_count_reg[2]),
        .O(\n_0_wait_bypass_count[0]_i_7 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_8 
       (.I0(wait_bypass_count_reg[1]),
        .O(\n_0_wait_bypass_count[0]_i_8 ));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_9 
       (.I0(wait_bypass_count_reg[0]),
        .O(\n_0_wait_bypass_count[0]_i_9 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[12]_i_2 
       (.I0(wait_bypass_count_reg[12]),
        .O(\n_0_wait_bypass_count[12]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_2 
       (.I0(wait_bypass_count_reg[7]),
        .O(\n_0_wait_bypass_count[4]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_3 
       (.I0(wait_bypass_count_reg[6]),
        .O(\n_0_wait_bypass_count[4]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_4 
       (.I0(wait_bypass_count_reg[5]),
        .O(\n_0_wait_bypass_count[4]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_5 
       (.I0(wait_bypass_count_reg[4]),
        .O(\n_0_wait_bypass_count[4]_i_5 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_2 
       (.I0(wait_bypass_count_reg[11]),
        .O(\n_0_wait_bypass_count[8]_i_2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_3 
       (.I0(wait_bypass_count_reg[10]),
        .O(\n_0_wait_bypass_count[8]_i_3 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_4 
       (.I0(wait_bypass_count_reg[9]),
        .O(\n_0_wait_bypass_count[8]_i_4 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_5 
       (.I0(wait_bypass_count_reg[8]),
        .O(\n_0_wait_bypass_count[8]_i_5 ));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[0] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_7_wait_bypass_count_reg[0]_i_3 ),
        .Q(wait_bypass_count_reg[0]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
CARRY4 \wait_bypass_count_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\n_0_wait_bypass_count_reg[0]_i_3 ,\n_1_wait_bypass_count_reg[0]_i_3 ,\n_2_wait_bypass_count_reg[0]_i_3 ,\n_3_wait_bypass_count_reg[0]_i_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\n_4_wait_bypass_count_reg[0]_i_3 ,\n_5_wait_bypass_count_reg[0]_i_3 ,\n_6_wait_bypass_count_reg[0]_i_3 ,\n_7_wait_bypass_count_reg[0]_i_3 }),
        .S({\n_0_wait_bypass_count[0]_i_6 ,\n_0_wait_bypass_count[0]_i_7 ,\n_0_wait_bypass_count[0]_i_8 ,\n_0_wait_bypass_count[0]_i_9 }));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[10] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_5_wait_bypass_count_reg[8]_i_1 ),
        .Q(wait_bypass_count_reg[10]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[11] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_4_wait_bypass_count_reg[8]_i_1 ),
        .Q(wait_bypass_count_reg[11]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[12] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_7_wait_bypass_count_reg[12]_i_1 ),
        .Q(wait_bypass_count_reg[12]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
CARRY4 \wait_bypass_count_reg[12]_i_1 
       (.CI(\n_0_wait_bypass_count_reg[8]_i_1 ),
        .CO(\NLW_wait_bypass_count_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_wait_bypass_count_reg[12]_i_1_O_UNCONNECTED [3:1],\n_7_wait_bypass_count_reg[12]_i_1 }),
        .S({1'b0,1'b0,1'b0,\n_0_wait_bypass_count[12]_i_2 }));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[1] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_6_wait_bypass_count_reg[0]_i_3 ),
        .Q(wait_bypass_count_reg[1]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[2] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_5_wait_bypass_count_reg[0]_i_3 ),
        .Q(wait_bypass_count_reg[2]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[3] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_4_wait_bypass_count_reg[0]_i_3 ),
        .Q(wait_bypass_count_reg[3]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[4] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_7_wait_bypass_count_reg[4]_i_1 ),
        .Q(wait_bypass_count_reg[4]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
CARRY4 \wait_bypass_count_reg[4]_i_1 
       (.CI(\n_0_wait_bypass_count_reg[0]_i_3 ),
        .CO({\n_0_wait_bypass_count_reg[4]_i_1 ,\n_1_wait_bypass_count_reg[4]_i_1 ,\n_2_wait_bypass_count_reg[4]_i_1 ,\n_3_wait_bypass_count_reg[4]_i_1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_wait_bypass_count_reg[4]_i_1 ,\n_5_wait_bypass_count_reg[4]_i_1 ,\n_6_wait_bypass_count_reg[4]_i_1 ,\n_7_wait_bypass_count_reg[4]_i_1 }),
        .S({\n_0_wait_bypass_count[4]_i_2 ,\n_0_wait_bypass_count[4]_i_3 ,\n_0_wait_bypass_count[4]_i_4 ,\n_0_wait_bypass_count[4]_i_5 }));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[5] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_6_wait_bypass_count_reg[4]_i_1 ),
        .Q(wait_bypass_count_reg[5]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[6] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_5_wait_bypass_count_reg[4]_i_1 ),
        .Q(wait_bypass_count_reg[6]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[7] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_4_wait_bypass_count_reg[4]_i_1 ),
        .Q(wait_bypass_count_reg[7]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[8] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_7_wait_bypass_count_reg[8]_i_1 ),
        .Q(wait_bypass_count_reg[8]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
CARRY4 \wait_bypass_count_reg[8]_i_1 
       (.CI(\n_0_wait_bypass_count_reg[4]_i_1 ),
        .CO({\n_0_wait_bypass_count_reg[8]_i_1 ,\n_1_wait_bypass_count_reg[8]_i_1 ,\n_2_wait_bypass_count_reg[8]_i_1 ,\n_3_wait_bypass_count_reg[8]_i_1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_wait_bypass_count_reg[8]_i_1 ,\n_5_wait_bypass_count_reg[8]_i_1 ,\n_6_wait_bypass_count_reg[8]_i_1 ,\n_7_wait_bypass_count_reg[8]_i_1 }),
        .S({\n_0_wait_bypass_count[8]_i_2 ,\n_0_wait_bypass_count[8]_i_3 ,\n_0_wait_bypass_count[8]_i_4 ,\n_0_wait_bypass_count[8]_i_5 }));
(* counter = "9" *) 
   FDRE \wait_bypass_count_reg[9] 
       (.C(gt0_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2 ),
        .D(\n_6_wait_bypass_count_reg[8]_i_1 ),
        .Q(wait_bypass_count_reg[9]),
        .R(\n_0_wait_bypass_count[0]_i_1 ));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair28" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \wait_time_cnt[0]_i_1 
       (.I0(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0[0]));
(* SOFT_HLUTNM = "soft_lutpair28" *) 
   LUT2 #(
    .INIT(4'h9)) 
     \wait_time_cnt[1]_i_1 
       (.I0(wait_time_cnt_reg__0[1]),
        .I1(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0[1]));
(* SOFT_HLUTNM = "soft_lutpair24" *) 
   LUT3 #(
    .INIT(8'hA9)) 
     \wait_time_cnt[2]_i_1 
       (.I0(wait_time_cnt_reg__0[2]),
        .I1(wait_time_cnt_reg__0[0]),
        .I2(wait_time_cnt_reg__0[1]),
        .O(wait_time_cnt0[2]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT4 #(
    .INIT(16'hFE01)) 
     \wait_time_cnt[3]_i_1 
       (.I0(wait_time_cnt_reg__0[1]),
        .I1(wait_time_cnt_reg__0[0]),
        .I2(wait_time_cnt_reg__0[2]),
        .I3(wait_time_cnt_reg__0[3]),
        .O(wait_time_cnt0[3]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT5 #(
    .INIT(32'hAAAAAAA9)) 
     \wait_time_cnt[4]_i_1 
       (.I0(wait_time_cnt_reg__0[4]),
        .I1(wait_time_cnt_reg__0[3]),
        .I2(wait_time_cnt_reg__0[2]),
        .I3(wait_time_cnt_reg__0[0]),
        .I4(wait_time_cnt_reg__0[1]),
        .O(wait_time_cnt0[4]));
LUT6 #(
    .INIT(64'hF0F0F0F0F0F0F0E1)) 
     \wait_time_cnt[5]_i_1 
       (.I0(wait_time_cnt_reg__0[3]),
        .I1(wait_time_cnt_reg__0[2]),
        .I2(wait_time_cnt_reg__0[5]),
        .I3(wait_time_cnt_reg__0[4]),
        .I4(wait_time_cnt_reg__0[1]),
        .I5(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0[5]));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \wait_time_cnt[6]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_3 ),
        .I1(\n_0_wait_time_cnt[6]_i_4 ),
        .I2(\n_0_FSM_onehot_rx_state[11]_i_5 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I4(run_phase_alignment_int),
        .I5(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(clear));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \wait_time_cnt[6]_i_2 
       (.I0(wait_time_cnt_reg__0[6]),
        .I1(wait_time_cnt_reg__0[1]),
        .I2(wait_time_cnt_reg__0[0]),
        .I3(\n_0_wait_time_cnt[6]_i_5 ),
        .I4(wait_time_cnt_reg__0[4]),
        .I5(wait_time_cnt_reg__0[5]),
        .O(sel));
LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
     \wait_time_cnt[6]_i_3 
       (.I0(wait_time_cnt_reg__0[5]),
        .I1(wait_time_cnt_reg__0[4]),
        .I2(\n_0_wait_time_cnt[6]_i_5 ),
        .I3(wait_time_cnt_reg__0[0]),
        .I4(wait_time_cnt_reg__0[1]),
        .I5(wait_time_cnt_reg__0[6]),
        .O(wait_time_cnt0[6]));
(* SOFT_HLUTNM = "soft_lutpair20" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \wait_time_cnt[6]_i_4 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_wait_time_cnt[6]_i_4 ));
(* SOFT_HLUTNM = "soft_lutpair24" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \wait_time_cnt[6]_i_5 
       (.I0(wait_time_cnt_reg__0[2]),
        .I1(wait_time_cnt_reg__0[3]),
        .O(\n_0_wait_time_cnt[6]_i_5 ));
(* counter = "7" *) 
   FDRE \wait_time_cnt_reg[0] 
       (.C(SYSCLK_IN),
        .CE(sel),
        .D(wait_time_cnt0[0]),
        .Q(wait_time_cnt_reg__0[0]),
        .R(clear));
(* counter = "7" *) 
   FDRE \wait_time_cnt_reg[1] 
       (.C(SYSCLK_IN),
        .CE(sel),
        .D(wait_time_cnt0[1]),
        .Q(wait_time_cnt_reg__0[1]),
        .R(clear));
(* counter = "7" *) 
   FDSE \wait_time_cnt_reg[2] 
       (.C(SYSCLK_IN),
        .CE(sel),
        .D(wait_time_cnt0[2]),
        .Q(wait_time_cnt_reg__0[2]),
        .S(clear));
(* counter = "7" *) 
   FDRE \wait_time_cnt_reg[3] 
       (.C(SYSCLK_IN),
        .CE(sel),
        .D(wait_time_cnt0[3]),
        .Q(wait_time_cnt_reg__0[3]),
        .R(clear));
(* counter = "7" *) 
   FDRE \wait_time_cnt_reg[4] 
       (.C(SYSCLK_IN),
        .CE(sel),
        .D(wait_time_cnt0[4]),
        .Q(wait_time_cnt_reg__0[4]),
        .R(clear));
(* counter = "7" *) 
   FDSE \wait_time_cnt_reg[5] 
       (.C(SYSCLK_IN),
        .CE(sel),
        .D(wait_time_cnt0[5]),
        .Q(wait_time_cnt_reg__0[5]),
        .S(clear));
(* counter = "7" *) 
   FDSE \wait_time_cnt_reg[6] 
       (.C(SYSCLK_IN),
        .CE(sel),
        .D(wait_time_cnt0[6]),
        .Q(wait_time_cnt_reg__0[6]),
        .S(clear));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_RX_STARTUP_FSM" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_0
   (GT1_RX_FSM_RESET_DONE_OUT,
    O1,
    O2,
    SYSCLK_IN,
    gt1_rxusrclk_in,
    SOFT_RESET_IN,
    I1,
    DONT_RESET_ON_DATA_ERROR_IN,
    gt1_rxresetdone_out,
    GT1_DATA_VALID_IN,
    GT0_QPLLLOCK_IN);
  output GT1_RX_FSM_RESET_DONE_OUT;
  output O1;
  output O2;
  input SYSCLK_IN;
  input gt1_rxusrclk_in;
  input SOFT_RESET_IN;
  input I1;
  input DONT_RESET_ON_DATA_ERROR_IN;
  input gt1_rxresetdone_out;
  input GT1_DATA_VALID_IN;
  input GT0_QPLLLOCK_IN;

  wire DONT_RESET_ON_DATA_ERROR_IN;
  wire GT0_QPLLLOCK_IN;
  wire GT1_DATA_VALID_IN;
  wire GT1_RX_FSM_RESET_DONE_OUT;
  wire I1;
  wire O1;
  wire O2;
  wire SOFT_RESET_IN;
  wire SYSCLK_IN;
  wire check_tlock_max;
  wire gt1_rxresetdone_out;
  wire gt1_rxusrclk_in;
  wire [4:0]init_wait_count_reg__0;
  wire init_wait_done;
  wire [9:0]mmcm_lock_count_reg__0;
  wire mmcm_lock_reclocked;
  wire \n_0_FSM_onehot_rx_state[10]_i_1__0 ;
  wire \n_0_FSM_onehot_rx_state[10]_i_2__0 ;
  wire \n_0_FSM_onehot_rx_state[10]_i_3__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_10 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_11 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_12__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_14__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_15__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_16 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_5__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_6 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_8 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_10__0 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_2__0 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_4__0 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_5__0 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_6__0 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_7__0 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_8__0 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_1__0 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_2__0 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_3__0 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_4__0 ;
  wire \n_0_FSM_onehot_rx_state[4]_i_1__0 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_1__0 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_2__0 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_3__0 ;
  wire \n_0_FSM_onehot_rx_state[6]_i_1__0 ;
  wire \n_0_FSM_onehot_rx_state[6]_i_2__0 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_1__0 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_2__0 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_1__0 ;
  wire \n_0_FSM_onehot_rx_state[9]_i_1__0 ;
  wire \n_0_FSM_onehot_rx_state[9]_i_2__0 ;
  wire \n_0_FSM_onehot_rx_state_reg[10] ;
  wire \n_0_FSM_onehot_rx_state_reg[11] ;
  wire \n_0_FSM_onehot_rx_state_reg[1] ;
  wire \n_0_FSM_onehot_rx_state_reg[2] ;
  wire \n_0_FSM_onehot_rx_state_reg[3] ;
  wire \n_0_FSM_onehot_rx_state_reg[4] ;
  wire \n_0_FSM_onehot_rx_state_reg[5] ;
  wire \n_0_FSM_onehot_rx_state_reg[7] ;
  wire \n_0_FSM_onehot_rx_state_reg[8] ;
  wire n_0_RXUSERRDY_i_1__0;
  wire n_0_check_tlock_max_i_1__0;
  wire n_0_check_tlock_max_reg;
  wire n_0_gtrxreset_i_i_1__0;
  wire \n_0_init_wait_count[4]_i_1__0 ;
  wire n_0_init_wait_done_i_1__0;
  wire \n_0_mmcm_lock_count[0]_i_1__0 ;
  wire \n_0_mmcm_lock_count[9]_i_2__0 ;
  wire \n_0_mmcm_lock_count[9]_i_4__0 ;
  wire n_0_mmcm_lock_reclocked_i_2__0;
  wire n_0_pll_reset_asserted_i_1__0;
  wire n_0_pll_reset_asserted_reg;
  wire n_0_reset_time_out_i_11__0;
  wire n_0_reset_time_out_i_12__0;
  wire n_0_reset_time_out_i_13__0;
  wire n_0_reset_time_out_i_4__0;
  wire n_0_reset_time_out_i_5__0;
  wire n_0_reset_time_out_i_6__0;
  wire n_0_reset_time_out_i_8__0;
  wire n_0_reset_time_out_i_9__0;
  wire n_0_reset_time_out_reg;
  wire n_0_run_phase_alignment_int_i_1__0;
  wire n_0_run_phase_alignment_int_i_2__0;
  wire n_0_run_phase_alignment_int_reg;
  wire n_0_run_phase_alignment_int_s3_reg;
  wire n_0_rx_fsm_reset_done_int_i_3__0;
  wire n_0_rx_fsm_reset_done_int_i_6__0;
  wire n_0_rx_fsm_reset_done_int_s3_reg;
  wire n_0_sync_QPLLLOCK;
  wire n_0_sync_data_valid;
  wire n_0_sync_mmcm_lock_reclocked;
  wire n_0_time_out_100us_i_1__0;
  wire n_0_time_out_100us_i_2__0;
  wire n_0_time_out_100us_i_3__0;
  wire n_0_time_out_100us_reg;
  wire n_0_time_out_1us_i_1__0;
  wire n_0_time_out_1us_i_2__0;
  wire n_0_time_out_1us_i_3__0;
  wire n_0_time_out_1us_reg;
  wire n_0_time_out_2ms_i_1__0;
  wire n_0_time_out_2ms_i_2__0;
  wire n_0_time_out_2ms_i_3__0;
  wire n_0_time_out_2ms_reg;
  wire \n_0_time_out_counter[0]_i_1__0 ;
  wire \n_0_time_out_counter[0]_i_3__0 ;
  wire \n_0_time_out_counter[0]_i_4__0 ;
  wire \n_0_time_out_counter[0]_i_5__0 ;
  wire \n_0_time_out_counter[0]_i_6__0 ;
  wire \n_0_time_out_counter[0]_i_7__0 ;
  wire \n_0_time_out_counter[0]_i_8__0 ;
  wire \n_0_time_out_counter[0]_i_9__0 ;
  wire \n_0_time_out_counter[12]_i_2__0 ;
  wire \n_0_time_out_counter[12]_i_3__0 ;
  wire \n_0_time_out_counter[12]_i_4__0 ;
  wire \n_0_time_out_counter[12]_i_5__0 ;
  wire \n_0_time_out_counter[16]_i_2__0 ;
  wire \n_0_time_out_counter[4]_i_2__0 ;
  wire \n_0_time_out_counter[4]_i_3__0 ;
  wire \n_0_time_out_counter[4]_i_4__0 ;
  wire \n_0_time_out_counter[4]_i_5__0 ;
  wire \n_0_time_out_counter[8]_i_2__0 ;
  wire \n_0_time_out_counter[8]_i_3__0 ;
  wire \n_0_time_out_counter[8]_i_4__0 ;
  wire \n_0_time_out_counter[8]_i_5__0 ;
  wire \n_0_time_out_counter_reg[0]_i_2__0 ;
  wire \n_0_time_out_counter_reg[12]_i_1__0 ;
  wire \n_0_time_out_counter_reg[4]_i_1__0 ;
  wire \n_0_time_out_counter_reg[8]_i_1__0 ;
  wire n_0_time_out_wait_bypass_i_1__0;
  wire n_0_time_out_wait_bypass_reg;
  wire n_0_time_tlock_max_i_10__0;
  wire n_0_time_tlock_max_i_11__0;
  wire n_0_time_tlock_max_i_12__0;
  wire n_0_time_tlock_max_i_13__0;
  wire n_0_time_tlock_max_i_14__0;
  wire n_0_time_tlock_max_i_15__0;
  wire n_0_time_tlock_max_i_16__0;
  wire n_0_time_tlock_max_i_17__0;
  wire n_0_time_tlock_max_i_18__0;
  wire n_0_time_tlock_max_i_1__0;
  wire n_0_time_tlock_max_i_4__0;
  wire n_0_time_tlock_max_i_6__0;
  wire n_0_time_tlock_max_i_7__0;
  wire n_0_time_tlock_max_i_8__0;
  wire n_0_time_tlock_max_i_9__0;
  wire n_0_time_tlock_max_reg_i_3__0;
  wire n_0_time_tlock_max_reg_i_5__0;
  wire \n_0_wait_bypass_count[0]_i_1__0 ;
  wire \n_0_wait_bypass_count[0]_i_2__0 ;
  wire \n_0_wait_bypass_count[0]_i_4__0 ;
  wire \n_0_wait_bypass_count[0]_i_5__0 ;
  wire \n_0_wait_bypass_count[0]_i_6__0 ;
  wire \n_0_wait_bypass_count[0]_i_7__0 ;
  wire \n_0_wait_bypass_count[0]_i_8__0 ;
  wire \n_0_wait_bypass_count[0]_i_9__0 ;
  wire \n_0_wait_bypass_count[12]_i_2__0 ;
  wire \n_0_wait_bypass_count[4]_i_2__0 ;
  wire \n_0_wait_bypass_count[4]_i_3__0 ;
  wire \n_0_wait_bypass_count[4]_i_4__0 ;
  wire \n_0_wait_bypass_count[4]_i_5__0 ;
  wire \n_0_wait_bypass_count[8]_i_2__0 ;
  wire \n_0_wait_bypass_count[8]_i_3__0 ;
  wire \n_0_wait_bypass_count[8]_i_4__0 ;
  wire \n_0_wait_bypass_count[8]_i_5__0 ;
  wire \n_0_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_0_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_0_wait_bypass_count_reg[8]_i_1__0 ;
  wire \n_0_wait_time_cnt[6]_i_1__0 ;
  wire \n_0_wait_time_cnt[6]_i_2__0 ;
  wire \n_0_wait_time_cnt[6]_i_4__0 ;
  wire \n_0_wait_time_cnt[6]_i_5__0 ;
  wire n_1_sync_QPLLLOCK;
  wire n_1_sync_data_valid;
  wire n_1_sync_mmcm_lock_reclocked;
  wire \n_1_time_out_counter_reg[0]_i_2__0 ;
  wire \n_1_time_out_counter_reg[12]_i_1__0 ;
  wire \n_1_time_out_counter_reg[4]_i_1__0 ;
  wire \n_1_time_out_counter_reg[8]_i_1__0 ;
  wire n_1_time_tlock_max_reg_i_3__0;
  wire n_1_time_tlock_max_reg_i_5__0;
  wire \n_1_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_1_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_1_wait_bypass_count_reg[8]_i_1__0 ;
  wire n_2_sync_QPLLLOCK;
  wire n_2_sync_data_valid;
  wire \n_2_time_out_counter_reg[0]_i_2__0 ;
  wire \n_2_time_out_counter_reg[12]_i_1__0 ;
  wire \n_2_time_out_counter_reg[4]_i_1__0 ;
  wire \n_2_time_out_counter_reg[8]_i_1__0 ;
  wire n_2_time_tlock_max_reg_i_3__0;
  wire n_2_time_tlock_max_reg_i_5__0;
  wire \n_2_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_2_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_2_wait_bypass_count_reg[8]_i_1__0 ;
  wire n_3_sync_QPLLLOCK;
  wire n_3_sync_data_valid;
  wire \n_3_time_out_counter_reg[0]_i_2__0 ;
  wire \n_3_time_out_counter_reg[12]_i_1__0 ;
  wire \n_3_time_out_counter_reg[4]_i_1__0 ;
  wire \n_3_time_out_counter_reg[8]_i_1__0 ;
  wire n_3_time_tlock_max_reg_i_3__0;
  wire n_3_time_tlock_max_reg_i_5__0;
  wire \n_3_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_3_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_3_wait_bypass_count_reg[8]_i_1__0 ;
  wire n_4_sync_data_valid;
  wire \n_4_time_out_counter_reg[0]_i_2__0 ;
  wire \n_4_time_out_counter_reg[12]_i_1__0 ;
  wire \n_4_time_out_counter_reg[4]_i_1__0 ;
  wire \n_4_time_out_counter_reg[8]_i_1__0 ;
  wire \n_4_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_4_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_4_wait_bypass_count_reg[8]_i_1__0 ;
  wire n_5_sync_data_valid;
  wire \n_5_time_out_counter_reg[0]_i_2__0 ;
  wire \n_5_time_out_counter_reg[12]_i_1__0 ;
  wire \n_5_time_out_counter_reg[4]_i_1__0 ;
  wire \n_5_time_out_counter_reg[8]_i_1__0 ;
  wire \n_5_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_5_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_5_wait_bypass_count_reg[8]_i_1__0 ;
  wire \n_6_time_out_counter_reg[0]_i_2__0 ;
  wire \n_6_time_out_counter_reg[12]_i_1__0 ;
  wire \n_6_time_out_counter_reg[4]_i_1__0 ;
  wire \n_6_time_out_counter_reg[8]_i_1__0 ;
  wire \n_6_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_6_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_6_wait_bypass_count_reg[8]_i_1__0 ;
  wire \n_7_time_out_counter_reg[0]_i_2__0 ;
  wire \n_7_time_out_counter_reg[12]_i_1__0 ;
  wire \n_7_time_out_counter_reg[16]_i_1__0 ;
  wire \n_7_time_out_counter_reg[4]_i_1__0 ;
  wire \n_7_time_out_counter_reg[8]_i_1__0 ;
  wire \n_7_wait_bypass_count_reg[0]_i_3__0 ;
  wire \n_7_wait_bypass_count_reg[12]_i_1__0 ;
  wire \n_7_wait_bypass_count_reg[4]_i_1__0 ;
  wire \n_7_wait_bypass_count_reg[8]_i_1__0 ;
  wire [4:0]p_0_in__0;
  wire [9:1]p_0_in__4;
  wire run_phase_alignment_int;
  wire run_phase_alignment_int_s2;
  wire rx_fsm_reset_done_int_s2;
  wire rxresetdone_s2;
  wire rxresetdone_s3;
  wire [16:0]time_out_counter_reg;
  wire time_out_wait_bypass_s2;
  wire time_out_wait_bypass_s3;
  wire time_tlock_max;
  wire time_tlock_max1;
  wire [12:0]wait_bypass_count_reg;
  wire [6:0]wait_time_cnt0__0;
  wire [6:0]wait_time_cnt_reg__0;
  wire [3:0]\NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED ;
  wire [3:1]\NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED ;
  wire [3:1]NLW_time_tlock_max_reg_i_2__0_CO_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_2__0_O_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_3__0_O_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_5__0_O_UNCONNECTED;
  wire [3:0]\NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED ;
  wire [3:1]\NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED ;

LUT6 #(
    .INIT(64'h000000000000010C)) 
     \FSM_onehot_rx_state[10]_i_1__0 
       (.I0(time_out_wait_bypass_s3),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[10]_i_2__0 ),
        .I5(\n_0_FSM_onehot_rx_state[10]_i_3__0 ),
        .O(\n_0_FSM_onehot_rx_state[10]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair40" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[10]_i_2__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(\n_0_FSM_onehot_rx_state[10]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair49" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[10]_i_3__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I3(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[10]_i_3__0 ));
LUT6 #(
    .INIT(64'hFFFEFFFEFFFE0000)) 
     \FSM_onehot_rx_state[11]_i_10 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[10] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_10 ));
(* SOFT_HLUTNM = "soft_lutpair55" *) 
   LUT3 #(
    .INIT(8'h08)) 
     \FSM_onehot_rx_state[11]_i_11 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(n_0_time_out_2ms_reg),
        .I2(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[11]_i_11 ));
(* SOFT_HLUTNM = "soft_lutpair34" *) 
   LUT5 #(
    .INIT(32'h8F888888)) 
     \FSM_onehot_rx_state[11]_i_12__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I2(n_0_reset_time_out_reg),
        .I3(time_tlock_max),
        .I4(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[11]_i_12__0 ));
LUT6 #(
    .INIT(64'hF8F8F8F8F8F8F888)) 
     \FSM_onehot_rx_state[11]_i_14__0 
       (.I0(check_tlock_max),
        .I1(mmcm_lock_reclocked),
        .I2(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_14__0 ));
LUT6 #(
    .INIT(64'hFCFCFCECFCFCFCE0)) 
     \FSM_onehot_rx_state[11]_i_15__0 
       (.I0(I1),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(check_tlock_max),
        .I5(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[11]_i_15__0 ));
(* SOFT_HLUTNM = "soft_lutpair40" *) 
   LUT5 #(
    .INIT(32'h00000203)) 
     \FSM_onehot_rx_state[11]_i_16 
       (.I0(init_wait_done),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_16 ));
LUT6 #(
    .INIT(64'hEEEEEEEEEEEEEEE0)) 
     \FSM_onehot_rx_state[11]_i_5__0 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_3__0 ),
        .I1(\n_0_FSM_onehot_rx_state[10]_i_3__0 ),
        .I2(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_5__0 ));
(* SOFT_HLUTNM = "soft_lutpair34" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[11]_i_6 
       (.I0(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_6 ));
LUT2 #(
    .INIT(4'h8)) 
     \FSM_onehot_rx_state[11]_i_8 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_8 ));
(* SOFT_HLUTNM = "soft_lutpair50" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \FSM_onehot_rx_state[2]_i_10__0 
       (.I0(n_0_reset_time_out_reg),
        .I1(time_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[2]_i_10__0 ));
LUT6 #(
    .INIT(64'h00000000000C0400)) 
     \FSM_onehot_rx_state[2]_i_2__0 
       (.I0(\n_0_FSM_onehot_rx_state[2]_i_6__0 ),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_7__0 ),
        .I2(\n_0_FSM_onehot_rx_state[2]_i_8__0 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_6 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_2__0 ));
LUT6 #(
    .INIT(64'h0000000000000400)) 
     \FSM_onehot_rx_state[2]_i_4__0 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4__0 ),
        .I1(\n_0_FSM_onehot_rx_state[5]_i_3__0 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2__0 ),
        .I3(check_tlock_max),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I5(\n_0_FSM_onehot_rx_state[2]_i_10__0 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_4__0 ));
LUT6 #(
    .INIT(64'h0000001000000000)) 
     \FSM_onehot_rx_state[2]_i_5__0 
       (.I0(\n_0_FSM_onehot_rx_state[10]_i_3__0 ),
        .I1(\n_0_FSM_onehot_rx_state[10]_i_2__0 ),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I5(time_out_wait_bypass_s3),
        .O(\n_0_FSM_onehot_rx_state[2]_i_5__0 ));
(* SOFT_HLUTNM = "soft_lutpair48" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \FSM_onehot_rx_state[2]_i_6__0 
       (.I0(n_0_reset_time_out_reg),
        .I1(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[2]_i_6__0 ));
(* SOFT_HLUTNM = "soft_lutpair38" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[2]_i_7__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(run_phase_alignment_int),
        .O(\n_0_FSM_onehot_rx_state[2]_i_7__0 ));
(* SOFT_HLUTNM = "soft_lutpair37" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[2]_i_8__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_8__0 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \FSM_onehot_rx_state[3]_i_1__0 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2__0 ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_3__0 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__0 ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair35" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[3]_i_2__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair53" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[3]_i_3__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_3__0 ));
(* SOFT_HLUTNM = "soft_lutpair45" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[3]_i_4__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_4__0 ));
(* SOFT_HLUTNM = "soft_lutpair41" *) 
   LUT5 #(
    .INIT(32'h00020000)) 
     \FSM_onehot_rx_state[4]_i_1__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state[9]_i_2__0 ),
        .O(\n_0_FSM_onehot_rx_state[4]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair55" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \FSM_onehot_rx_state[5]_i_1__0 
       (.I0(\n_0_FSM_onehot_rx_state[5]_i_2__0 ),
        .I1(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[5]_i_1__0 ));
LUT6 #(
    .INIT(64'h0000000000040000)) 
     \FSM_onehot_rx_state[5]_i_2__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(check_tlock_max),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(\n_0_FSM_onehot_rx_state[5]_i_3__0 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__0 ),
        .O(\n_0_FSM_onehot_rx_state[5]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair53" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[5]_i_3__0 
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[10] ),
        .O(\n_0_FSM_onehot_rx_state[5]_i_3__0 ));
(* SOFT_HLUTNM = "soft_lutpair49" *) 
   LUT3 #(
    .INIT(8'h40)) 
     \FSM_onehot_rx_state[6]_i_1__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state[6]_i_2__0 ),
        .O(\n_0_FSM_onehot_rx_state[6]_i_1__0 ));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \FSM_onehot_rx_state[6]_i_2__0 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4__0 ),
        .I1(run_phase_alignment_int),
        .I2(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I5(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[6]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair50" *) 
   LUT3 #(
    .INIT(8'hA2)) 
     \FSM_onehot_rx_state[7]_i_1__0 
       (.I0(\n_0_FSM_onehot_rx_state[7]_i_2__0 ),
        .I1(time_tlock_max),
        .I2(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[7]_i_1__0 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \FSM_onehot_rx_state[7]_i_2__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2__0 ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_3__0 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__0 ),
        .O(\n_0_FSM_onehot_rx_state[7]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair41" *) 
   LUT5 #(
    .INIT(32'h00100000)) 
     \FSM_onehot_rx_state[8]_i_1__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I4(\n_0_FSM_onehot_rx_state[9]_i_2__0 ),
        .O(\n_0_FSM_onehot_rx_state[8]_i_1__0 ));
LUT6 #(
    .INIT(64'h0008000800000008)) 
     \FSM_onehot_rx_state[9]_i_1__0 
       (.I0(\n_0_FSM_onehot_rx_state[9]_i_2__0 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_6 ),
        .I4(n_0_time_out_2ms_reg),
        .I5(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[9]_i_1__0 ));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \FSM_onehot_rx_state[9]_i_2__0 
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_2__0 ),
        .I4(check_tlock_max),
        .I5(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_FSM_onehot_rx_state[9]_i_2__0 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[10] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[10]_i_1__0 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[10] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[11] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(n_1_sync_data_valid),
        .Q(\n_0_FSM_onehot_rx_state_reg[11] ),
        .R(SOFT_RESET_IN));
FDSE #(
    .INIT(1'b1)) 
     \FSM_onehot_rx_state_reg[1] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(1'b0),
        .Q(\n_0_FSM_onehot_rx_state_reg[1] ),
        .S(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[2] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(n_2_sync_data_valid),
        .Q(\n_0_FSM_onehot_rx_state_reg[2] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[3] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[3]_i_1__0 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[3] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[4] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[4]_i_1__0 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[4] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[5] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[5]_i_1__0 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[5] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[6] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[6]_i_1__0 ),
        .Q(check_tlock_max),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[7] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[7]_i_1__0 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[7] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[8] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[8]_i_1__0 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[8] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[9] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[9]_i_1__0 ),
        .Q(run_phase_alignment_int),
        .R(SOFT_RESET_IN));
LUT6 #(
    .INIT(64'hCCCCFFFFCCCC0008)) 
     RXUSERRDY_i_1__0
       (.I0(\n_0_FSM_onehot_rx_state[9]_i_2__0 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_6 ),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_1__0 ),
        .I5(O1),
        .O(n_0_RXUSERRDY_i_1__0));
FDRE #(
    .INIT(1'b0)) 
     RXUSERRDY_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_RXUSERRDY_i_1__0),
        .Q(O1),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair46" *) 
   LUT4 #(
    .INIT(16'hABA8)) 
     check_tlock_max_i_1__0
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state[7]_i_2__0 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1__0 ),
        .I3(n_0_check_tlock_max_reg),
        .O(n_0_check_tlock_max_i_1__0));
FDRE #(
    .INIT(1'b0)) 
     check_tlock_max_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_check_tlock_max_i_1__0),
        .Q(n_0_check_tlock_max_reg),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair35" *) 
   LUT5 #(
    .INIT(32'h33F73300)) 
     gtrxreset_i_i_1__0
       (.I0(\n_0_FSM_onehot_rx_state[6]_i_2__0 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_1__0 ),
        .I4(O2),
        .O(n_0_gtrxreset_i_i_1__0));
FDRE #(
    .INIT(1'b0)) 
     gtrxreset_i_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_gtrxreset_i_i_1__0),
        .Q(O2),
        .R(SOFT_RESET_IN));
LUT1 #(
    .INIT(2'h1)) 
     \init_wait_count[0]_i_1__0 
       (.I0(init_wait_count_reg__0[0]),
        .O(p_0_in__0[0]));
(* SOFT_HLUTNM = "soft_lutpair51" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \init_wait_count[1]_i_1__0 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .O(p_0_in__0[1]));
(* SOFT_HLUTNM = "soft_lutpair51" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \init_wait_count[2]_i_1__0 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[2]),
        .O(p_0_in__0[2]));
(* SOFT_HLUTNM = "soft_lutpair32" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \init_wait_count[3]_i_1__0 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[3]),
        .O(p_0_in__0[3]));
LUT5 #(
    .INIT(32'hDFFFFFFF)) 
     \init_wait_count[4]_i_1__0 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[4]),
        .I4(init_wait_count_reg__0[3]),
        .O(\n_0_init_wait_count[4]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair32" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \init_wait_count[4]_i_2__0 
       (.I0(init_wait_count_reg__0[3]),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[2]),
        .I4(init_wait_count_reg__0[4]),
        .O(p_0_in__0[4]));
(* counter = "10" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__0 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__0[0]),
        .Q(init_wait_count_reg__0[0]));
(* counter = "10" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__0 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__0[1]),
        .Q(init_wait_count_reg__0[1]));
(* counter = "10" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__0 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__0[2]),
        .Q(init_wait_count_reg__0[2]));
(* counter = "10" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__0 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__0[3]),
        .Q(init_wait_count_reg__0[3]));
(* counter = "10" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__0 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__0[4]),
        .Q(init_wait_count_reg__0[4]));
LUT6 #(
    .INIT(64'hFFFFFFFF40000000)) 
     init_wait_done_i_1__0
       (.I0(init_wait_count_reg__0[0]),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[4]),
        .I3(init_wait_count_reg__0[3]),
        .I4(init_wait_count_reg__0[2]),
        .I5(init_wait_done),
        .O(n_0_init_wait_done_i_1__0));
FDCE #(
    .INIT(1'b0)) 
     init_wait_done_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .CLR(SOFT_RESET_IN),
        .D(n_0_init_wait_done_i_1__0),
        .Q(init_wait_done));
LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[0]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[0]),
        .O(\n_0_mmcm_lock_count[0]_i_1__0 ));
(* SOFT_HLUTNM = "soft_lutpair54" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \mmcm_lock_count[1]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .O(p_0_in__4[1]));
(* SOFT_HLUTNM = "soft_lutpair54" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \mmcm_lock_count[2]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[1]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[2]),
        .O(p_0_in__4[2]));
(* SOFT_HLUTNM = "soft_lutpair42" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \mmcm_lock_count[3]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[2]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[1]),
        .I3(mmcm_lock_count_reg__0[3]),
        .O(p_0_in__4[3]));
(* SOFT_HLUTNM = "soft_lutpair42" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \mmcm_lock_count[4]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[1]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[3]),
        .I4(mmcm_lock_count_reg__0[4]),
        .O(p_0_in__4[4]));
LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
     \mmcm_lock_count[5]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[4]),
        .I1(mmcm_lock_count_reg__0[3]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[0]),
        .I4(mmcm_lock_count_reg__0[1]),
        .I5(mmcm_lock_count_reg__0[5]),
        .O(p_0_in__4[5]));
LUT2 #(
    .INIT(4'h9)) 
     \mmcm_lock_count[6]_i_1__0 
       (.I0(\n_0_mmcm_lock_count[9]_i_4__0 ),
        .I1(mmcm_lock_count_reg__0[6]),
        .O(p_0_in__4[6]));
(* SOFT_HLUTNM = "soft_lutpair43" *) 
   LUT3 #(
    .INIT(8'hD2)) 
     \mmcm_lock_count[7]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[6]),
        .I1(\n_0_mmcm_lock_count[9]_i_4__0 ),
        .I2(mmcm_lock_count_reg__0[7]),
        .O(p_0_in__4[7]));
(* SOFT_HLUTNM = "soft_lutpair43" *) 
   LUT4 #(
    .INIT(16'hDF20)) 
     \mmcm_lock_count[8]_i_1__0 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(\n_0_mmcm_lock_count[9]_i_4__0 ),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[8]),
        .O(p_0_in__4[8]));
LUT5 #(
    .INIT(32'hDFFFFFFF)) 
     \mmcm_lock_count[9]_i_2__0 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(\n_0_mmcm_lock_count[9]_i_4__0 ),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[8]),
        .I4(mmcm_lock_count_reg__0[9]),
        .O(\n_0_mmcm_lock_count[9]_i_2__0 ));
(* SOFT_HLUTNM = "soft_lutpair39" *) 
   LUT5 #(
    .INIT(32'hF7FF0800)) 
     \mmcm_lock_count[9]_i_3__0 
       (.I0(mmcm_lock_count_reg__0[8]),
        .I1(mmcm_lock_count_reg__0[6]),
        .I2(\n_0_mmcm_lock_count[9]_i_4__0 ),
        .I3(mmcm_lock_count_reg__0[7]),
        .I4(mmcm_lock_count_reg__0[9]),
        .O(p_0_in__4[9]));
LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
     \mmcm_lock_count[9]_i_4__0 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .I2(mmcm_lock_count_reg__0[4]),
        .I3(mmcm_lock_count_reg__0[5]),
        .I4(mmcm_lock_count_reg__0[2]),
        .I5(mmcm_lock_count_reg__0[3]),
        .O(\n_0_mmcm_lock_count[9]_i_4__0 ));
(* counter = "24" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(\n_0_mmcm_lock_count[0]_i_1__0 ),
        .Q(mmcm_lock_count_reg__0[0]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "24" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__4[1]),
        .Q(mmcm_lock_count_reg__0[1]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "24" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__4[2]),
        .Q(mmcm_lock_count_reg__0[2]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "24" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__4[3]),
        .Q(mmcm_lock_count_reg__0[3]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "24" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__4[4]),
        .Q(mmcm_lock_count_reg__0[4]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "24" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__4[5]),
        .Q(mmcm_lock_count_reg__0[5]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "24" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__4[6]),
        .Q(mmcm_lock_count_reg__0[6]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "24" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[7] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__4[7]),
        .Q(mmcm_lock_count_reg__0[7]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "24" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[8] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__4[8]),
        .Q(mmcm_lock_count_reg__0[8]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "24" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[9] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__0 ),
        .D(p_0_in__4[9]),
        .Q(mmcm_lock_count_reg__0[9]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* SOFT_HLUTNM = "soft_lutpair39" *) 
   LUT5 #(
    .INIT(32'h00800000)) 
     mmcm_lock_reclocked_i_2__0
       (.I0(mmcm_lock_count_reg__0[9]),
        .I1(mmcm_lock_count_reg__0[8]),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(\n_0_mmcm_lock_count[9]_i_4__0 ),
        .I4(mmcm_lock_count_reg__0[7]),
        .O(n_0_mmcm_lock_reclocked_i_2__0));
FDRE #(
    .INIT(1'b0)) 
     mmcm_lock_reclocked_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_1_sync_mmcm_lock_reclocked),
        .Q(mmcm_lock_reclocked),
        .R(1'b0));
(* SOFT_HLUTNM = "soft_lutpair44" *) 
   LUT4 #(
    .INIT(16'h55DC)) 
     pll_reset_asserted_i_1__0
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(n_0_pll_reset_asserted_reg),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1__0 ),
        .I3(\n_0_FSM_onehot_rx_state[5]_i_2__0 ),
        .O(n_0_pll_reset_asserted_i_1__0));
FDRE #(
    .INIT(1'b0)) 
     pll_reset_asserted_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_pll_reset_asserted_i_1__0),
        .Q(n_0_pll_reset_asserted_reg),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair44" *) 
   LUT2 #(
    .INIT(4'h2)) 
     reset_time_out_i_11__0
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_11__0));
(* SOFT_HLUTNM = "soft_lutpair47" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     reset_time_out_i_12__0
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_12__0));
(* SOFT_HLUTNM = "soft_lutpair45" *) 
   LUT4 #(
    .INIT(16'h0002)) 
     reset_time_out_i_13__0
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(n_0_reset_time_out_i_13__0));
LUT6 #(
    .INIT(64'h0000000000080000)) 
     reset_time_out_i_4__0
       (.I0(I1),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_wait_time_cnt[6]_i_4__0 ),
        .I4(\n_0_FSM_onehot_rx_state[5]_i_3__0 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__0 ),
        .O(n_0_reset_time_out_i_4__0));
(* SOFT_HLUTNM = "soft_lutpair36" *) 
   LUT5 #(
    .INIT(32'h00010006)) 
     reset_time_out_i_5__0
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state[10]_i_3__0 ),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2__0 ),
        .I4(run_phase_alignment_int),
        .O(n_0_reset_time_out_i_5__0));
LUT6 #(
    .INIT(64'h0004000F00040004)) 
     reset_time_out_i_6__0
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4__0 ),
        .I1(n_0_reset_time_out_i_12__0),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_3__0 ),
        .I4(\n_0_FSM_onehot_rx_state[2]_i_8__0 ),
        .I5(n_0_reset_time_out_i_13__0),
        .O(n_0_reset_time_out_i_6__0));
(* SOFT_HLUTNM = "soft_lutpair37" *) 
   LUT5 #(
    .INIT(32'h00100000)) 
     reset_time_out_i_8__0
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(mmcm_lock_reclocked),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(check_tlock_max),
        .O(n_0_reset_time_out_i_8__0));
(* SOFT_HLUTNM = "soft_lutpair47" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     reset_time_out_i_9__0
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_9__0));
FDSE #(
    .INIT(1'b0)) 
     reset_time_out_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_4_sync_data_valid),
        .Q(n_0_reset_time_out_reg),
        .S(SOFT_RESET_IN));
LUT4 #(
    .INIT(16'hABA8)) 
     run_phase_alignment_int_i_1__0
       (.I0(run_phase_alignment_int),
        .I1(n_0_run_phase_alignment_int_i_2__0),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1__0 ),
        .I3(n_0_run_phase_alignment_int_reg),
        .O(n_0_run_phase_alignment_int_i_1__0));
(* SOFT_HLUTNM = "soft_lutpair36" *) 
   LUT5 #(
    .INIT(32'h00000010)) 
     run_phase_alignment_int_i_2__0
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2__0 ),
        .I4(\n_0_FSM_onehot_rx_state[10]_i_3__0 ),
        .O(n_0_run_phase_alignment_int_i_2__0));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_run_phase_alignment_int_i_1__0),
        .Q(n_0_run_phase_alignment_int_reg),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_s3_reg
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(run_phase_alignment_int_s2),
        .Q(n_0_run_phase_alignment_int_s3_reg),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     rx_fsm_reset_done_int_i_3__0
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I5(\n_0_FSM_onehot_rx_state[10]_i_3__0 ),
        .O(n_0_rx_fsm_reset_done_int_i_3__0));
(* SOFT_HLUTNM = "soft_lutpair38" *) 
   LUT5 #(
    .INIT(32'h00000004)) 
     rx_fsm_reset_done_int_i_6__0
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state[10]_i_3__0 ),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2__0 ),
        .I4(run_phase_alignment_int),
        .O(n_0_rx_fsm_reset_done_int_i_6__0));
FDRE #(
    .INIT(1'b0)) 
     rx_fsm_reset_done_int_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_5_sync_data_valid),
        .Q(GT1_RX_FSM_RESET_DONE_OUT),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     rx_fsm_reset_done_int_s3_reg
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(rx_fsm_reset_done_int_s2),
        .Q(n_0_rx_fsm_reset_done_int_s3_reg),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     rxresetdone_s3_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(rxresetdone_s2),
        .Q(rxresetdone_s3),
        .R(1'b0));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_26 sync_QPLLLOCK
       (.GT0_QPLLLOCK_IN(GT0_QPLLLOCK_IN),
        .I1(n_0_pll_reset_asserted_reg),
        .I10(I1),
        .I2(\n_0_FSM_onehot_rx_state[11]_i_14__0 ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_15__0 ),
        .I4(n_3_sync_data_valid),
        .I5(n_0_reset_time_out_i_9__0),
        .I6(\n_0_FSM_onehot_rx_state[3]_i_4__0 ),
        .I7(\n_0_FSM_onehot_rx_state[5]_i_3__0 ),
        .I8(\n_0_wait_time_cnt[6]_i_4__0 ),
        .I9(n_0_reset_time_out_i_11__0),
        .O1(n_0_sync_QPLLLOCK),
        .O2(n_1_sync_QPLLLOCK),
        .O3(n_2_sync_QPLLLOCK),
        .O4(n_3_sync_QPLLLOCK),
        .Q({\n_0_FSM_onehot_rx_state_reg[10] ,\n_0_FSM_onehot_rx_state_reg[7] ,\n_0_FSM_onehot_rx_state_reg[5] ,\n_0_FSM_onehot_rx_state_reg[4] ,\n_0_FSM_onehot_rx_state_reg[3] ,\n_0_FSM_onehot_rx_state_reg[2] ,\n_0_FSM_onehot_rx_state_reg[1] }),
        .SYSCLK_IN(SYSCLK_IN));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_27 sync_RXRESETDONE
       (.SYSCLK_IN(SYSCLK_IN),
        .data_out(rxresetdone_s2),
        .gt1_rxresetdone_out(gt1_rxresetdone_out));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_28 sync_data_valid
       (.D({n_1_sync_data_valid,n_2_sync_data_valid}),
        .DONT_RESET_ON_DATA_ERROR_IN(DONT_RESET_ON_DATA_ERROR_IN),
        .E(n_0_sync_data_valid),
        .GT1_DATA_VALID_IN(GT1_DATA_VALID_IN),
        .GT1_RX_FSM_RESET_DONE_OUT(GT1_RX_FSM_RESET_DONE_OUT),
        .I1(n_1_sync_QPLLLOCK),
        .I10(\n_0_FSM_onehot_rx_state[11]_i_12__0 ),
        .I11(n_0_sync_QPLLLOCK),
        .I12(n_0_time_out_1us_reg),
        .I13(n_0_reset_time_out_reg),
        .I14(\n_0_FSM_onehot_rx_state[2]_i_2__0 ),
        .I15(\n_0_FSM_onehot_rx_state[5]_i_2__0 ),
        .I16(n_0_time_out_2ms_reg),
        .I17(\n_0_FSM_onehot_rx_state[2]_i_4__0 ),
        .I18(\n_0_FSM_onehot_rx_state[2]_i_5__0 ),
        .I19(n_3_sync_QPLLLOCK),
        .I2(\n_0_FSM_onehot_rx_state[11]_i_5__0 ),
        .I20(n_0_reset_time_out_i_8__0),
        .I21(\n_0_FSM_onehot_rx_state[10]_i_2__0 ),
        .I22(n_0_time_out_100us_reg),
        .I23(n_0_rx_fsm_reset_done_int_i_6__0),
        .I24(n_2_sync_QPLLLOCK),
        .I25(n_0_reset_time_out_i_4__0),
        .I26(n_0_reset_time_out_i_5__0),
        .I27(n_0_reset_time_out_i_6__0),
        .I28(n_0_rx_fsm_reset_done_int_i_3__0),
        .I3(\n_0_wait_time_cnt[6]_i_2__0 ),
        .I4(\n_0_FSM_onehot_rx_state[11]_i_6 ),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_16 ),
        .I6(\n_0_FSM_onehot_rx_state[10]_i_3__0 ),
        .I7(\n_0_FSM_onehot_rx_state[11]_i_8 ),
        .I8(\n_0_FSM_onehot_rx_state[11]_i_10 ),
        .I9(\n_0_FSM_onehot_rx_state[11]_i_11 ),
        .O1(n_3_sync_data_valid),
        .O2(n_4_sync_data_valid),
        .O3(n_5_sync_data_valid),
        .Q({\n_0_FSM_onehot_rx_state_reg[11] ,\n_0_FSM_onehot_rx_state_reg[10] ,run_phase_alignment_int,\n_0_FSM_onehot_rx_state_reg[8] }),
        .SYSCLK_IN(SYSCLK_IN),
        .rxresetdone_s3(rxresetdone_s3));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_29 sync_mmcm_lock_reclocked
       (.I1(n_0_mmcm_lock_reclocked_i_2__0),
        .O1(n_1_sync_mmcm_lock_reclocked),
        .SR(n_0_sync_mmcm_lock_reclocked),
        .SYSCLK_IN(SYSCLK_IN),
        .mmcm_lock_reclocked(mmcm_lock_reclocked));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_30 sync_run_phase_alignment_int
       (.data_in(n_0_run_phase_alignment_int_reg),
        .data_out(run_phase_alignment_int_s2),
        .gt1_rxusrclk_in(gt1_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_31 sync_rx_fsm_reset_done_int
       (.GT1_RX_FSM_RESET_DONE_OUT(GT1_RX_FSM_RESET_DONE_OUT),
        .data_out(rx_fsm_reset_done_int_s2),
        .gt1_rxusrclk_in(gt1_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_32 sync_time_out_wait_bypass
       (.SYSCLK_IN(SYSCLK_IN),
        .data_in(n_0_time_out_wait_bypass_reg),
        .data_out(time_out_wait_bypass_s2));
LUT6 #(
    .INIT(64'hFFFFFFFF00010000)) 
     time_out_100us_i_1__0
       (.I0(\n_0_time_out_counter[0]_i_3__0 ),
        .I1(n_0_time_out_100us_i_2__0),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[11]),
        .I4(n_0_time_out_100us_i_3__0),
        .I5(n_0_time_out_100us_reg),
        .O(n_0_time_out_100us_i_1__0));
LUT2 #(
    .INIT(4'hE)) 
     time_out_100us_i_2__0
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[15]),
        .O(n_0_time_out_100us_i_2__0));
LUT6 #(
    .INIT(64'h0010000000000000)) 
     time_out_100us_i_3__0
       (.I0(time_out_counter_reg[16]),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[12]),
        .I3(time_out_counter_reg[3]),
        .I4(time_out_counter_reg[1]),
        .I5(time_out_counter_reg[2]),
        .O(n_0_time_out_100us_i_3__0));
FDRE #(
    .INIT(1'b0)) 
     time_out_100us_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_100us_i_1__0),
        .Q(n_0_time_out_100us_reg),
        .R(n_0_reset_time_out_reg));
LUT6 #(
    .INIT(64'hFFFFFFFF00000002)) 
     time_out_1us_i_1__0
       (.I0(n_0_time_out_1us_i_2__0),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[11]),
        .I4(time_out_counter_reg[10]),
        .I5(n_0_time_out_1us_reg),
        .O(n_0_time_out_1us_i_1__0));
LUT6 #(
    .INIT(64'h0000000100000000)) 
     time_out_1us_i_2__0
       (.I0(n_0_time_out_2ms_i_3__0),
        .I1(time_out_counter_reg[14]),
        .I2(time_out_counter_reg[15]),
        .I3(time_out_counter_reg[8]),
        .I4(time_out_counter_reg[9]),
        .I5(n_0_time_out_1us_i_3__0),
        .O(n_0_time_out_1us_i_2__0));
LUT5 #(
    .INIT(32'h00000020)) 
     time_out_1us_i_3__0
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[6]),
        .I2(time_out_counter_reg[5]),
        .I3(time_out_counter_reg[4]),
        .I4(time_out_counter_reg[7]),
        .O(n_0_time_out_1us_i_3__0));
FDRE #(
    .INIT(1'b0)) 
     time_out_1us_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_1us_i_1__0),
        .Q(n_0_time_out_1us_reg),
        .R(n_0_reset_time_out_reg));
(* SOFT_HLUTNM = "soft_lutpair48" *) 
   LUT4 #(
    .INIT(16'hFF02)) 
     time_out_2ms_i_1__0
       (.I0(n_0_time_out_2ms_i_2__0),
        .I1(\n_0_time_out_counter[0]_i_3__0 ),
        .I2(n_0_time_out_2ms_i_3__0),
        .I3(n_0_time_out_2ms_reg),
        .O(n_0_time_out_2ms_i_1__0));
LUT6 #(
    .INIT(64'h0080000000000000)) 
     time_out_2ms_i_2__0
       (.I0(time_out_counter_reg[13]),
        .I1(time_out_counter_reg[14]),
        .I2(time_out_counter_reg[11]),
        .I3(time_out_counter_reg[10]),
        .I4(time_out_counter_reg[16]),
        .I5(time_out_counter_reg[15]),
        .O(n_0_time_out_2ms_i_2__0));
LUT4 #(
    .INIT(16'hFFEF)) 
     time_out_2ms_i_3__0
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[1]),
        .I2(time_out_counter_reg[3]),
        .I3(time_out_counter_reg[12]),
        .O(n_0_time_out_2ms_i_3__0));
FDRE #(
    .INIT(1'b0)) 
     time_out_2ms_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_2ms_i_1__0),
        .Q(n_0_time_out_2ms_reg),
        .R(n_0_reset_time_out_reg));
LUT3 #(
    .INIT(8'hFE)) 
     \time_out_counter[0]_i_1__0 
       (.I0(time_out_counter_reg[10]),
        .I1(\n_0_time_out_counter[0]_i_3__0 ),
        .I2(\n_0_time_out_counter[0]_i_4__0 ),
        .O(\n_0_time_out_counter[0]_i_1__0 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
     \time_out_counter[0]_i_3__0 
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[5]),
        .I2(time_out_counter_reg[7]),
        .I3(time_out_counter_reg[6]),
        .I4(time_out_counter_reg[0]),
        .I5(\n_0_time_out_counter[0]_i_9__0 ),
        .O(\n_0_time_out_counter[0]_i_3__0 ));
LUT6 #(
    .INIT(64'hFFFFFFFF7FFFFFFF)) 
     \time_out_counter[0]_i_4__0 
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[14]),
        .I4(time_out_counter_reg[11]),
        .I5(n_0_time_out_2ms_i_3__0),
        .O(\n_0_time_out_counter[0]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_5__0 
       (.I0(time_out_counter_reg[3]),
        .O(\n_0_time_out_counter[0]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_6__0 
       (.I0(time_out_counter_reg[2]),
        .O(\n_0_time_out_counter[0]_i_6__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_7__0 
       (.I0(time_out_counter_reg[1]),
        .O(\n_0_time_out_counter[0]_i_7__0 ));
LUT1 #(
    .INIT(2'h1)) 
     \time_out_counter[0]_i_8__0 
       (.I0(time_out_counter_reg[0]),
        .O(\n_0_time_out_counter[0]_i_8__0 ));
LUT2 #(
    .INIT(4'hE)) 
     \time_out_counter[0]_i_9__0 
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[9]),
        .O(\n_0_time_out_counter[0]_i_9__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_2__0 
       (.I0(time_out_counter_reg[15]),
        .O(\n_0_time_out_counter[12]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_3__0 
       (.I0(time_out_counter_reg[14]),
        .O(\n_0_time_out_counter[12]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_4__0 
       (.I0(time_out_counter_reg[13]),
        .O(\n_0_time_out_counter[12]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_5__0 
       (.I0(time_out_counter_reg[12]),
        .O(\n_0_time_out_counter[12]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[16]_i_2__0 
       (.I0(time_out_counter_reg[16]),
        .O(\n_0_time_out_counter[16]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_2__0 
       (.I0(time_out_counter_reg[7]),
        .O(\n_0_time_out_counter[4]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_3__0 
       (.I0(time_out_counter_reg[6]),
        .O(\n_0_time_out_counter[4]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_4__0 
       (.I0(time_out_counter_reg[5]),
        .O(\n_0_time_out_counter[4]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_5__0 
       (.I0(time_out_counter_reg[4]),
        .O(\n_0_time_out_counter[4]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_2__0 
       (.I0(time_out_counter_reg[11]),
        .O(\n_0_time_out_counter[8]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_3__0 
       (.I0(time_out_counter_reg[10]),
        .O(\n_0_time_out_counter[8]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_4__0 
       (.I0(time_out_counter_reg[9]),
        .O(\n_0_time_out_counter[8]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_5__0 
       (.I0(time_out_counter_reg[8]),
        .O(\n_0_time_out_counter[8]_i_5__0 ));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_7_time_out_counter_reg[0]_i_2__0 ),
        .Q(time_out_counter_reg[0]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[0]_i_2__0 
       (.CI(1'b0),
        .CO({\n_0_time_out_counter_reg[0]_i_2__0 ,\n_1_time_out_counter_reg[0]_i_2__0 ,\n_2_time_out_counter_reg[0]_i_2__0 ,\n_3_time_out_counter_reg[0]_i_2__0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\n_4_time_out_counter_reg[0]_i_2__0 ,\n_5_time_out_counter_reg[0]_i_2__0 ,\n_6_time_out_counter_reg[0]_i_2__0 ,\n_7_time_out_counter_reg[0]_i_2__0 }),
        .S({\n_0_time_out_counter[0]_i_5__0 ,\n_0_time_out_counter[0]_i_6__0 ,\n_0_time_out_counter[0]_i_7__0 ,\n_0_time_out_counter[0]_i_8__0 }));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[10] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_5_time_out_counter_reg[8]_i_1__0 ),
        .Q(time_out_counter_reg[10]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[11] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_4_time_out_counter_reg[8]_i_1__0 ),
        .Q(time_out_counter_reg[11]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[12] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_7_time_out_counter_reg[12]_i_1__0 ),
        .Q(time_out_counter_reg[12]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[12]_i_1__0 
       (.CI(\n_0_time_out_counter_reg[8]_i_1__0 ),
        .CO({\n_0_time_out_counter_reg[12]_i_1__0 ,\n_1_time_out_counter_reg[12]_i_1__0 ,\n_2_time_out_counter_reg[12]_i_1__0 ,\n_3_time_out_counter_reg[12]_i_1__0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[12]_i_1__0 ,\n_5_time_out_counter_reg[12]_i_1__0 ,\n_6_time_out_counter_reg[12]_i_1__0 ,\n_7_time_out_counter_reg[12]_i_1__0 }),
        .S({\n_0_time_out_counter[12]_i_2__0 ,\n_0_time_out_counter[12]_i_3__0 ,\n_0_time_out_counter[12]_i_4__0 ,\n_0_time_out_counter[12]_i_5__0 }));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[13] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_6_time_out_counter_reg[12]_i_1__0 ),
        .Q(time_out_counter_reg[13]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[14] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_5_time_out_counter_reg[12]_i_1__0 ),
        .Q(time_out_counter_reg[14]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[15] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_4_time_out_counter_reg[12]_i_1__0 ),
        .Q(time_out_counter_reg[15]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[16] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_7_time_out_counter_reg[16]_i_1__0 ),
        .Q(time_out_counter_reg[16]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[16]_i_1__0 
       (.CI(\n_0_time_out_counter_reg[12]_i_1__0 ),
        .CO(\NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED [3:1],\n_7_time_out_counter_reg[16]_i_1__0 }),
        .S({1'b0,1'b0,1'b0,\n_0_time_out_counter[16]_i_2__0 }));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_6_time_out_counter_reg[0]_i_2__0 ),
        .Q(time_out_counter_reg[1]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_5_time_out_counter_reg[0]_i_2__0 ),
        .Q(time_out_counter_reg[2]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_4_time_out_counter_reg[0]_i_2__0 ),
        .Q(time_out_counter_reg[3]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_7_time_out_counter_reg[4]_i_1__0 ),
        .Q(time_out_counter_reg[4]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[4]_i_1__0 
       (.CI(\n_0_time_out_counter_reg[0]_i_2__0 ),
        .CO({\n_0_time_out_counter_reg[4]_i_1__0 ,\n_1_time_out_counter_reg[4]_i_1__0 ,\n_2_time_out_counter_reg[4]_i_1__0 ,\n_3_time_out_counter_reg[4]_i_1__0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[4]_i_1__0 ,\n_5_time_out_counter_reg[4]_i_1__0 ,\n_6_time_out_counter_reg[4]_i_1__0 ,\n_7_time_out_counter_reg[4]_i_1__0 }),
        .S({\n_0_time_out_counter[4]_i_2__0 ,\n_0_time_out_counter[4]_i_3__0 ,\n_0_time_out_counter[4]_i_4__0 ,\n_0_time_out_counter[4]_i_5__0 }));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_6_time_out_counter_reg[4]_i_1__0 ),
        .Q(time_out_counter_reg[5]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_5_time_out_counter_reg[4]_i_1__0 ),
        .Q(time_out_counter_reg[6]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[7] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_4_time_out_counter_reg[4]_i_1__0 ),
        .Q(time_out_counter_reg[7]),
        .R(n_0_reset_time_out_reg));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[8] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_7_time_out_counter_reg[8]_i_1__0 ),
        .Q(time_out_counter_reg[8]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[8]_i_1__0 
       (.CI(\n_0_time_out_counter_reg[4]_i_1__0 ),
        .CO({\n_0_time_out_counter_reg[8]_i_1__0 ,\n_1_time_out_counter_reg[8]_i_1__0 ,\n_2_time_out_counter_reg[8]_i_1__0 ,\n_3_time_out_counter_reg[8]_i_1__0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[8]_i_1__0 ,\n_5_time_out_counter_reg[8]_i_1__0 ,\n_6_time_out_counter_reg[8]_i_1__0 ,\n_7_time_out_counter_reg[8]_i_1__0 }),
        .S({\n_0_time_out_counter[8]_i_2__0 ,\n_0_time_out_counter[8]_i_3__0 ,\n_0_time_out_counter[8]_i_4__0 ,\n_0_time_out_counter[8]_i_5__0 }));
(* counter = "12" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[9] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__0 ),
        .D(\n_6_time_out_counter_reg[8]_i_1__0 ),
        .Q(time_out_counter_reg[9]),
        .R(n_0_reset_time_out_reg));
LUT6 #(
    .INIT(64'hFF00FF0100000000)) 
     time_out_wait_bypass_i_1__0
       (.I0(\n_0_wait_bypass_count[0]_i_4__0 ),
        .I1(wait_bypass_count_reg[3]),
        .I2(\n_0_wait_bypass_count[0]_i_5__0 ),
        .I3(n_0_time_out_wait_bypass_reg),
        .I4(n_0_rx_fsm_reset_done_int_s3_reg),
        .I5(n_0_run_phase_alignment_int_s3_reg),
        .O(n_0_time_out_wait_bypass_i_1__0));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_reg
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(n_0_time_out_wait_bypass_i_1__0),
        .Q(n_0_time_out_wait_bypass_reg),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_s3_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(time_out_wait_bypass_s2),
        .Q(time_out_wait_bypass_s3),
        .R(1'b0));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_10__0
       (.I0(time_out_counter_reg[12]),
        .I1(time_out_counter_reg[13]),
        .O(n_0_time_tlock_max_i_10__0));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_11__0
       (.I0(time_out_counter_reg[11]),
        .I1(time_out_counter_reg[10]),
        .O(n_0_time_tlock_max_i_11__0));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_12__0
       (.I0(time_out_counter_reg[9]),
        .I1(time_out_counter_reg[8]),
        .O(n_0_time_tlock_max_i_12__0));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_13__0
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[5]),
        .O(n_0_time_tlock_max_i_13__0));
LUT2 #(
    .INIT(4'h8)) 
     time_tlock_max_i_14__0
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[1]),
        .O(n_0_time_tlock_max_i_14__0));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_15__0
       (.I0(time_out_counter_reg[6]),
        .I1(time_out_counter_reg[7]),
        .O(n_0_time_tlock_max_i_15__0));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_16__0
       (.I0(time_out_counter_reg[5]),
        .I1(time_out_counter_reg[4]),
        .O(n_0_time_tlock_max_i_16__0));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_17__0
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[3]),
        .O(n_0_time_tlock_max_i_17__0));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_18__0
       (.I0(time_out_counter_reg[1]),
        .I1(time_out_counter_reg[0]),
        .O(n_0_time_tlock_max_i_18__0));
LUT3 #(
    .INIT(8'hF8)) 
     time_tlock_max_i_1__0
       (.I0(n_0_check_tlock_max_reg),
        .I1(time_tlock_max1),
        .I2(time_tlock_max),
        .O(n_0_time_tlock_max_i_1__0));
LUT1 #(
    .INIT(2'h1)) 
     time_tlock_max_i_4__0
       (.I0(time_out_counter_reg[16]),
        .O(n_0_time_tlock_max_i_4__0));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_6__0
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[15]),
        .O(n_0_time_tlock_max_i_6__0));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_7__0
       (.I0(time_out_counter_reg[10]),
        .I1(time_out_counter_reg[11]),
        .O(n_0_time_tlock_max_i_7__0));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_8__0
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[9]),
        .O(n_0_time_tlock_max_i_8__0));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_9__0
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[14]),
        .O(n_0_time_tlock_max_i_9__0));
FDRE #(
    .INIT(1'b0)) 
     time_tlock_max_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_tlock_max_i_1__0),
        .Q(time_tlock_max),
        .R(n_0_reset_time_out_reg));
CARRY4 time_tlock_max_reg_i_2__0
       (.CI(n_0_time_tlock_max_reg_i_3__0),
        .CO({NLW_time_tlock_max_reg_i_2__0_CO_UNCONNECTED[3:1],time_tlock_max1}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,time_out_counter_reg[16]}),
        .O(NLW_time_tlock_max_reg_i_2__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,n_0_time_tlock_max_i_4__0}));
CARRY4 time_tlock_max_reg_i_3__0
       (.CI(n_0_time_tlock_max_reg_i_5__0),
        .CO({n_0_time_tlock_max_reg_i_3__0,n_1_time_tlock_max_reg_i_3__0,n_2_time_tlock_max_reg_i_3__0,n_3_time_tlock_max_reg_i_3__0}),
        .CYINIT(1'b0),
        .DI({n_0_time_tlock_max_i_6__0,time_out_counter_reg[13],n_0_time_tlock_max_i_7__0,n_0_time_tlock_max_i_8__0}),
        .O(NLW_time_tlock_max_reg_i_3__0_O_UNCONNECTED[3:0]),
        .S({n_0_time_tlock_max_i_9__0,n_0_time_tlock_max_i_10__0,n_0_time_tlock_max_i_11__0,n_0_time_tlock_max_i_12__0}));
CARRY4 time_tlock_max_reg_i_5__0
       (.CI(1'b0),
        .CO({n_0_time_tlock_max_reg_i_5__0,n_1_time_tlock_max_reg_i_5__0,n_2_time_tlock_max_reg_i_5__0,n_3_time_tlock_max_reg_i_5__0}),
        .CYINIT(1'b0),
        .DI({time_out_counter_reg[7],n_0_time_tlock_max_i_13__0,time_out_counter_reg[3],n_0_time_tlock_max_i_14__0}),
        .O(NLW_time_tlock_max_reg_i_5__0_O_UNCONNECTED[3:0]),
        .S({n_0_time_tlock_max_i_15__0,n_0_time_tlock_max_i_16__0,n_0_time_tlock_max_i_17__0,n_0_time_tlock_max_i_18__0}));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_1__0 
       (.I0(n_0_run_phase_alignment_int_s3_reg),
        .O(\n_0_wait_bypass_count[0]_i_1__0 ));
LUT4 #(
    .INIT(16'h00FE)) 
     \wait_bypass_count[0]_i_2__0 
       (.I0(\n_0_wait_bypass_count[0]_i_4__0 ),
        .I1(wait_bypass_count_reg[3]),
        .I2(\n_0_wait_bypass_count[0]_i_5__0 ),
        .I3(n_0_rx_fsm_reset_done_int_s3_reg),
        .O(\n_0_wait_bypass_count[0]_i_2__0 ));
LUT6 #(
    .INIT(64'hFFFFEFFFFFFFFFFF)) 
     \wait_bypass_count[0]_i_4__0 
       (.I0(wait_bypass_count_reg[11]),
        .I1(wait_bypass_count_reg[4]),
        .I2(wait_bypass_count_reg[0]),
        .I3(wait_bypass_count_reg[9]),
        .I4(wait_bypass_count_reg[10]),
        .I5(wait_bypass_count_reg[2]),
        .O(\n_0_wait_bypass_count[0]_i_4__0 ));
LUT6 #(
    .INIT(64'hFDFFFFFFFFFFFFFF)) 
     \wait_bypass_count[0]_i_5__0 
       (.I0(wait_bypass_count_reg[1]),
        .I1(wait_bypass_count_reg[6]),
        .I2(wait_bypass_count_reg[5]),
        .I3(wait_bypass_count_reg[12]),
        .I4(wait_bypass_count_reg[8]),
        .I5(wait_bypass_count_reg[7]),
        .O(\n_0_wait_bypass_count[0]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_6__0 
       (.I0(wait_bypass_count_reg[3]),
        .O(\n_0_wait_bypass_count[0]_i_6__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_7__0 
       (.I0(wait_bypass_count_reg[2]),
        .O(\n_0_wait_bypass_count[0]_i_7__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_8__0 
       (.I0(wait_bypass_count_reg[1]),
        .O(\n_0_wait_bypass_count[0]_i_8__0 ));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_9__0 
       (.I0(wait_bypass_count_reg[0]),
        .O(\n_0_wait_bypass_count[0]_i_9__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[12]_i_2__0 
       (.I0(wait_bypass_count_reg[12]),
        .O(\n_0_wait_bypass_count[12]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_2__0 
       (.I0(wait_bypass_count_reg[7]),
        .O(\n_0_wait_bypass_count[4]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_3__0 
       (.I0(wait_bypass_count_reg[6]),
        .O(\n_0_wait_bypass_count[4]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_4__0 
       (.I0(wait_bypass_count_reg[5]),
        .O(\n_0_wait_bypass_count[4]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_5__0 
       (.I0(wait_bypass_count_reg[4]),
        .O(\n_0_wait_bypass_count[4]_i_5__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_2__0 
       (.I0(wait_bypass_count_reg[11]),
        .O(\n_0_wait_bypass_count[8]_i_2__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_3__0 
       (.I0(wait_bypass_count_reg[10]),
        .O(\n_0_wait_bypass_count[8]_i_3__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_4__0 
       (.I0(wait_bypass_count_reg[9]),
        .O(\n_0_wait_bypass_count[8]_i_4__0 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_5__0 
       (.I0(wait_bypass_count_reg[8]),
        .O(\n_0_wait_bypass_count[8]_i_5__0 ));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[0] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_7_wait_bypass_count_reg[0]_i_3__0 ),
        .Q(wait_bypass_count_reg[0]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
CARRY4 \wait_bypass_count_reg[0]_i_3__0 
       (.CI(1'b0),
        .CO({\n_0_wait_bypass_count_reg[0]_i_3__0 ,\n_1_wait_bypass_count_reg[0]_i_3__0 ,\n_2_wait_bypass_count_reg[0]_i_3__0 ,\n_3_wait_bypass_count_reg[0]_i_3__0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\n_4_wait_bypass_count_reg[0]_i_3__0 ,\n_5_wait_bypass_count_reg[0]_i_3__0 ,\n_6_wait_bypass_count_reg[0]_i_3__0 ,\n_7_wait_bypass_count_reg[0]_i_3__0 }),
        .S({\n_0_wait_bypass_count[0]_i_6__0 ,\n_0_wait_bypass_count[0]_i_7__0 ,\n_0_wait_bypass_count[0]_i_8__0 ,\n_0_wait_bypass_count[0]_i_9__0 }));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[10] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_5_wait_bypass_count_reg[8]_i_1__0 ),
        .Q(wait_bypass_count_reg[10]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[11] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_4_wait_bypass_count_reg[8]_i_1__0 ),
        .Q(wait_bypass_count_reg[11]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[12] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_7_wait_bypass_count_reg[12]_i_1__0 ),
        .Q(wait_bypass_count_reg[12]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
CARRY4 \wait_bypass_count_reg[12]_i_1__0 
       (.CI(\n_0_wait_bypass_count_reg[8]_i_1__0 ),
        .CO(\NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED [3:1],\n_7_wait_bypass_count_reg[12]_i_1__0 }),
        .S({1'b0,1'b0,1'b0,\n_0_wait_bypass_count[12]_i_2__0 }));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[1] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_6_wait_bypass_count_reg[0]_i_3__0 ),
        .Q(wait_bypass_count_reg[1]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[2] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_5_wait_bypass_count_reg[0]_i_3__0 ),
        .Q(wait_bypass_count_reg[2]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[3] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_4_wait_bypass_count_reg[0]_i_3__0 ),
        .Q(wait_bypass_count_reg[3]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[4] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_7_wait_bypass_count_reg[4]_i_1__0 ),
        .Q(wait_bypass_count_reg[4]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
CARRY4 \wait_bypass_count_reg[4]_i_1__0 
       (.CI(\n_0_wait_bypass_count_reg[0]_i_3__0 ),
        .CO({\n_0_wait_bypass_count_reg[4]_i_1__0 ,\n_1_wait_bypass_count_reg[4]_i_1__0 ,\n_2_wait_bypass_count_reg[4]_i_1__0 ,\n_3_wait_bypass_count_reg[4]_i_1__0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_wait_bypass_count_reg[4]_i_1__0 ,\n_5_wait_bypass_count_reg[4]_i_1__0 ,\n_6_wait_bypass_count_reg[4]_i_1__0 ,\n_7_wait_bypass_count_reg[4]_i_1__0 }),
        .S({\n_0_wait_bypass_count[4]_i_2__0 ,\n_0_wait_bypass_count[4]_i_3__0 ,\n_0_wait_bypass_count[4]_i_4__0 ,\n_0_wait_bypass_count[4]_i_5__0 }));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[5] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_6_wait_bypass_count_reg[4]_i_1__0 ),
        .Q(wait_bypass_count_reg[5]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[6] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_5_wait_bypass_count_reg[4]_i_1__0 ),
        .Q(wait_bypass_count_reg[6]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[7] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_4_wait_bypass_count_reg[4]_i_1__0 ),
        .Q(wait_bypass_count_reg[7]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[8] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_7_wait_bypass_count_reg[8]_i_1__0 ),
        .Q(wait_bypass_count_reg[8]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
CARRY4 \wait_bypass_count_reg[8]_i_1__0 
       (.CI(\n_0_wait_bypass_count_reg[4]_i_1__0 ),
        .CO({\n_0_wait_bypass_count_reg[8]_i_1__0 ,\n_1_wait_bypass_count_reg[8]_i_1__0 ,\n_2_wait_bypass_count_reg[8]_i_1__0 ,\n_3_wait_bypass_count_reg[8]_i_1__0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_wait_bypass_count_reg[8]_i_1__0 ,\n_5_wait_bypass_count_reg[8]_i_1__0 ,\n_6_wait_bypass_count_reg[8]_i_1__0 ,\n_7_wait_bypass_count_reg[8]_i_1__0 }),
        .S({\n_0_wait_bypass_count[8]_i_2__0 ,\n_0_wait_bypass_count[8]_i_3__0 ,\n_0_wait_bypass_count[8]_i_4__0 ,\n_0_wait_bypass_count[8]_i_5__0 }));
(* counter = "13" *) 
   FDRE \wait_bypass_count_reg[9] 
       (.C(gt1_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__0 ),
        .D(\n_6_wait_bypass_count_reg[8]_i_1__0 ),
        .Q(wait_bypass_count_reg[9]),
        .R(\n_0_wait_bypass_count[0]_i_1__0 ));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair56" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \wait_time_cnt[0]_i_1__0 
       (.I0(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0__0[0]));
(* SOFT_HLUTNM = "soft_lutpair56" *) 
   LUT2 #(
    .INIT(4'h9)) 
     \wait_time_cnt[1]_i_1__0 
       (.I0(wait_time_cnt_reg__0[1]),
        .I1(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0__0[1]));
(* SOFT_HLUTNM = "soft_lutpair52" *) 
   LUT3 #(
    .INIT(8'hA9)) 
     \wait_time_cnt[2]_i_1__0 
       (.I0(wait_time_cnt_reg__0[2]),
        .I1(wait_time_cnt_reg__0[0]),
        .I2(wait_time_cnt_reg__0[1]),
        .O(wait_time_cnt0__0[2]));
(* SOFT_HLUTNM = "soft_lutpair33" *) 
   LUT4 #(
    .INIT(16'hFE01)) 
     \wait_time_cnt[3]_i_1__0 
       (.I0(wait_time_cnt_reg__0[1]),
        .I1(wait_time_cnt_reg__0[0]),
        .I2(wait_time_cnt_reg__0[2]),
        .I3(wait_time_cnt_reg__0[3]),
        .O(wait_time_cnt0__0[3]));
(* SOFT_HLUTNM = "soft_lutpair33" *) 
   LUT5 #(
    .INIT(32'hAAAAAAA9)) 
     \wait_time_cnt[4]_i_1__0 
       (.I0(wait_time_cnt_reg__0[4]),
        .I1(wait_time_cnt_reg__0[3]),
        .I2(wait_time_cnt_reg__0[2]),
        .I3(wait_time_cnt_reg__0[0]),
        .I4(wait_time_cnt_reg__0[1]),
        .O(wait_time_cnt0__0[4]));
LUT6 #(
    .INIT(64'hF0F0F0F0F0F0F0E1)) 
     \wait_time_cnt[5]_i_1__0 
       (.I0(wait_time_cnt_reg__0[3]),
        .I1(wait_time_cnt_reg__0[2]),
        .I2(wait_time_cnt_reg__0[5]),
        .I3(wait_time_cnt_reg__0[4]),
        .I4(wait_time_cnt_reg__0[1]),
        .I5(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0__0[5]));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \wait_time_cnt[6]_i_1__0 
       (.I0(\n_0_FSM_onehot_rx_state[11]_i_6 ),
        .I1(\n_0_wait_time_cnt[6]_i_4__0 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_3__0 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I4(run_phase_alignment_int),
        .I5(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(\n_0_wait_time_cnt[6]_i_1__0 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \wait_time_cnt[6]_i_2__0 
       (.I0(wait_time_cnt_reg__0[6]),
        .I1(wait_time_cnt_reg__0[1]),
        .I2(wait_time_cnt_reg__0[0]),
        .I3(\n_0_wait_time_cnt[6]_i_5__0 ),
        .I4(wait_time_cnt_reg__0[4]),
        .I5(wait_time_cnt_reg__0[5]),
        .O(\n_0_wait_time_cnt[6]_i_2__0 ));
LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
     \wait_time_cnt[6]_i_3__0 
       (.I0(wait_time_cnt_reg__0[5]),
        .I1(wait_time_cnt_reg__0[4]),
        .I2(\n_0_wait_time_cnt[6]_i_5__0 ),
        .I3(wait_time_cnt_reg__0[0]),
        .I4(wait_time_cnt_reg__0[1]),
        .I5(wait_time_cnt_reg__0[6]),
        .O(wait_time_cnt0__0[6]));
(* SOFT_HLUTNM = "soft_lutpair46" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \wait_time_cnt[6]_i_4__0 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_wait_time_cnt[6]_i_4__0 ));
(* SOFT_HLUTNM = "soft_lutpair52" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \wait_time_cnt[6]_i_5__0 
       (.I0(wait_time_cnt_reg__0[2]),
        .I1(wait_time_cnt_reg__0[3]),
        .O(\n_0_wait_time_cnt[6]_i_5__0 ));
(* counter = "11" *) 
   FDRE \wait_time_cnt_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__0 ),
        .D(wait_time_cnt0__0[0]),
        .Q(wait_time_cnt_reg__0[0]),
        .R(\n_0_wait_time_cnt[6]_i_1__0 ));
(* counter = "11" *) 
   FDRE \wait_time_cnt_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__0 ),
        .D(wait_time_cnt0__0[1]),
        .Q(wait_time_cnt_reg__0[1]),
        .R(\n_0_wait_time_cnt[6]_i_1__0 ));
(* counter = "11" *) 
   FDSE \wait_time_cnt_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__0 ),
        .D(wait_time_cnt0__0[2]),
        .Q(wait_time_cnt_reg__0[2]),
        .S(\n_0_wait_time_cnt[6]_i_1__0 ));
(* counter = "11" *) 
   FDRE \wait_time_cnt_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__0 ),
        .D(wait_time_cnt0__0[3]),
        .Q(wait_time_cnt_reg__0[3]),
        .R(\n_0_wait_time_cnt[6]_i_1__0 ));
(* counter = "11" *) 
   FDRE \wait_time_cnt_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__0 ),
        .D(wait_time_cnt0__0[4]),
        .Q(wait_time_cnt_reg__0[4]),
        .R(\n_0_wait_time_cnt[6]_i_1__0 ));
(* counter = "11" *) 
   FDSE \wait_time_cnt_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__0 ),
        .D(wait_time_cnt0__0[5]),
        .Q(wait_time_cnt_reg__0[5]),
        .S(\n_0_wait_time_cnt[6]_i_1__0 ));
(* counter = "11" *) 
   FDSE \wait_time_cnt_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__0 ),
        .D(wait_time_cnt0__0[6]),
        .Q(wait_time_cnt_reg__0[6]),
        .S(\n_0_wait_time_cnt[6]_i_1__0 ));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_RX_STARTUP_FSM" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_1
   (GT2_RX_FSM_RESET_DONE_OUT,
    O1,
    O2,
    SYSCLK_IN,
    gt2_rxusrclk_in,
    SOFT_RESET_IN,
    I1,
    DONT_RESET_ON_DATA_ERROR_IN,
    gt2_rxresetdone_out,
    GT2_DATA_VALID_IN,
    GT0_QPLLLOCK_IN);
  output GT2_RX_FSM_RESET_DONE_OUT;
  output O1;
  output O2;
  input SYSCLK_IN;
  input gt2_rxusrclk_in;
  input SOFT_RESET_IN;
  input I1;
  input DONT_RESET_ON_DATA_ERROR_IN;
  input gt2_rxresetdone_out;
  input GT2_DATA_VALID_IN;
  input GT0_QPLLLOCK_IN;

  wire DONT_RESET_ON_DATA_ERROR_IN;
  wire GT0_QPLLLOCK_IN;
  wire GT2_DATA_VALID_IN;
  wire GT2_RX_FSM_RESET_DONE_OUT;
  wire I1;
  wire O1;
  wire O2;
  wire SOFT_RESET_IN;
  wire SYSCLK_IN;
  wire check_tlock_max;
  wire gt2_rxresetdone_out;
  wire gt2_rxusrclk_in;
  wire [4:0]init_wait_count_reg__0;
  wire init_wait_done;
  wire [9:0]mmcm_lock_count_reg__0;
  wire mmcm_lock_reclocked;
  wire \n_0_FSM_onehot_rx_state[10]_i_1__1 ;
  wire \n_0_FSM_onehot_rx_state[10]_i_2__1 ;
  wire \n_0_FSM_onehot_rx_state[10]_i_3__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_10__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_11__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_12__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_14__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_15__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_16__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_5__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_6__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_8__0 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_10__1 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_2__1 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_4__1 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_5__1 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_6__1 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_7__1 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_8__1 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_1__1 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_2__1 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_3__1 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_4__1 ;
  wire \n_0_FSM_onehot_rx_state[4]_i_1__1 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_1__1 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_2__1 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_3__1 ;
  wire \n_0_FSM_onehot_rx_state[6]_i_1__1 ;
  wire \n_0_FSM_onehot_rx_state[6]_i_2__1 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_1__1 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_2__1 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_1__1 ;
  wire \n_0_FSM_onehot_rx_state[9]_i_1__1 ;
  wire \n_0_FSM_onehot_rx_state[9]_i_2__1 ;
  wire \n_0_FSM_onehot_rx_state_reg[10] ;
  wire \n_0_FSM_onehot_rx_state_reg[11] ;
  wire \n_0_FSM_onehot_rx_state_reg[1] ;
  wire \n_0_FSM_onehot_rx_state_reg[2] ;
  wire \n_0_FSM_onehot_rx_state_reg[3] ;
  wire \n_0_FSM_onehot_rx_state_reg[4] ;
  wire \n_0_FSM_onehot_rx_state_reg[5] ;
  wire \n_0_FSM_onehot_rx_state_reg[7] ;
  wire \n_0_FSM_onehot_rx_state_reg[8] ;
  wire n_0_RXUSERRDY_i_1__1;
  wire n_0_check_tlock_max_i_1__1;
  wire n_0_check_tlock_max_reg;
  wire n_0_gtrxreset_i_i_1__1;
  wire \n_0_init_wait_count[4]_i_1__1 ;
  wire n_0_init_wait_done_i_1__1;
  wire \n_0_mmcm_lock_count[0]_i_1__1 ;
  wire \n_0_mmcm_lock_count[9]_i_2__1 ;
  wire \n_0_mmcm_lock_count[9]_i_4__1 ;
  wire n_0_mmcm_lock_reclocked_i_2__1;
  wire n_0_pll_reset_asserted_i_1__1;
  wire n_0_pll_reset_asserted_reg;
  wire n_0_reset_time_out_i_11__1;
  wire n_0_reset_time_out_i_12__1;
  wire n_0_reset_time_out_i_13__1;
  wire n_0_reset_time_out_i_4__1;
  wire n_0_reset_time_out_i_5__1;
  wire n_0_reset_time_out_i_6__1;
  wire n_0_reset_time_out_i_8__1;
  wire n_0_reset_time_out_i_9__1;
  wire n_0_reset_time_out_reg;
  wire n_0_run_phase_alignment_int_i_1__1;
  wire n_0_run_phase_alignment_int_i_2__1;
  wire n_0_run_phase_alignment_int_reg;
  wire n_0_run_phase_alignment_int_s3_reg;
  wire n_0_rx_fsm_reset_done_int_i_3__1;
  wire n_0_rx_fsm_reset_done_int_i_6__1;
  wire n_0_rx_fsm_reset_done_int_s3_reg;
  wire n_0_sync_QPLLLOCK;
  wire n_0_sync_data_valid;
  wire n_0_sync_mmcm_lock_reclocked;
  wire n_0_time_out_100us_i_1__1;
  wire n_0_time_out_100us_i_2__1;
  wire n_0_time_out_100us_i_3__1;
  wire n_0_time_out_100us_reg;
  wire n_0_time_out_1us_i_1__1;
  wire n_0_time_out_1us_i_2__1;
  wire n_0_time_out_1us_i_3__1;
  wire n_0_time_out_1us_reg;
  wire n_0_time_out_2ms_i_1__1;
  wire n_0_time_out_2ms_i_2__1;
  wire n_0_time_out_2ms_i_3__1;
  wire n_0_time_out_2ms_reg;
  wire \n_0_time_out_counter[0]_i_1__1 ;
  wire \n_0_time_out_counter[0]_i_3__1 ;
  wire \n_0_time_out_counter[0]_i_4__1 ;
  wire \n_0_time_out_counter[0]_i_5__1 ;
  wire \n_0_time_out_counter[0]_i_6__1 ;
  wire \n_0_time_out_counter[0]_i_7__1 ;
  wire \n_0_time_out_counter[0]_i_8__1 ;
  wire \n_0_time_out_counter[0]_i_9__1 ;
  wire \n_0_time_out_counter[12]_i_2__1 ;
  wire \n_0_time_out_counter[12]_i_3__1 ;
  wire \n_0_time_out_counter[12]_i_4__1 ;
  wire \n_0_time_out_counter[12]_i_5__1 ;
  wire \n_0_time_out_counter[16]_i_2__1 ;
  wire \n_0_time_out_counter[4]_i_2__1 ;
  wire \n_0_time_out_counter[4]_i_3__1 ;
  wire \n_0_time_out_counter[4]_i_4__1 ;
  wire \n_0_time_out_counter[4]_i_5__1 ;
  wire \n_0_time_out_counter[8]_i_2__1 ;
  wire \n_0_time_out_counter[8]_i_3__1 ;
  wire \n_0_time_out_counter[8]_i_4__1 ;
  wire \n_0_time_out_counter[8]_i_5__1 ;
  wire \n_0_time_out_counter_reg[0]_i_2__1 ;
  wire \n_0_time_out_counter_reg[12]_i_1__1 ;
  wire \n_0_time_out_counter_reg[4]_i_1__1 ;
  wire \n_0_time_out_counter_reg[8]_i_1__1 ;
  wire n_0_time_out_wait_bypass_i_1__1;
  wire n_0_time_out_wait_bypass_reg;
  wire n_0_time_tlock_max_i_10__1;
  wire n_0_time_tlock_max_i_11__1;
  wire n_0_time_tlock_max_i_12__1;
  wire n_0_time_tlock_max_i_13__1;
  wire n_0_time_tlock_max_i_14__1;
  wire n_0_time_tlock_max_i_15__1;
  wire n_0_time_tlock_max_i_16__1;
  wire n_0_time_tlock_max_i_17__1;
  wire n_0_time_tlock_max_i_18__1;
  wire n_0_time_tlock_max_i_1__1;
  wire n_0_time_tlock_max_i_4__1;
  wire n_0_time_tlock_max_i_6__1;
  wire n_0_time_tlock_max_i_7__1;
  wire n_0_time_tlock_max_i_8__1;
  wire n_0_time_tlock_max_i_9__1;
  wire n_0_time_tlock_max_reg_i_3__1;
  wire n_0_time_tlock_max_reg_i_5__1;
  wire \n_0_wait_bypass_count[0]_i_1__1 ;
  wire \n_0_wait_bypass_count[0]_i_2__1 ;
  wire \n_0_wait_bypass_count[0]_i_4__1 ;
  wire \n_0_wait_bypass_count[0]_i_5__1 ;
  wire \n_0_wait_bypass_count[0]_i_6__1 ;
  wire \n_0_wait_bypass_count[0]_i_7__1 ;
  wire \n_0_wait_bypass_count[0]_i_8__1 ;
  wire \n_0_wait_bypass_count[0]_i_9__1 ;
  wire \n_0_wait_bypass_count[12]_i_2__1 ;
  wire \n_0_wait_bypass_count[4]_i_2__1 ;
  wire \n_0_wait_bypass_count[4]_i_3__1 ;
  wire \n_0_wait_bypass_count[4]_i_4__1 ;
  wire \n_0_wait_bypass_count[4]_i_5__1 ;
  wire \n_0_wait_bypass_count[8]_i_2__1 ;
  wire \n_0_wait_bypass_count[8]_i_3__1 ;
  wire \n_0_wait_bypass_count[8]_i_4__1 ;
  wire \n_0_wait_bypass_count[8]_i_5__1 ;
  wire \n_0_wait_bypass_count_reg[0]_i_3__1 ;
  wire \n_0_wait_bypass_count_reg[4]_i_1__1 ;
  wire \n_0_wait_bypass_count_reg[8]_i_1__1 ;
  wire \n_0_wait_time_cnt[6]_i_1__1 ;
  wire \n_0_wait_time_cnt[6]_i_2__1 ;
  wire \n_0_wait_time_cnt[6]_i_4__1 ;
  wire \n_0_wait_time_cnt[6]_i_5__1 ;
  wire n_1_sync_QPLLLOCK;
  wire n_1_sync_data_valid;
  wire n_1_sync_mmcm_lock_reclocked;
  wire \n_1_time_out_counter_reg[0]_i_2__1 ;
  wire \n_1_time_out_counter_reg[12]_i_1__1 ;
  wire \n_1_time_out_counter_reg[4]_i_1__1 ;
  wire \n_1_time_out_counter_reg[8]_i_1__1 ;
  wire n_1_time_tlock_max_reg_i_3__1;
  wire n_1_time_tlock_max_reg_i_5__1;
  wire \n_1_wait_bypass_count_reg[0]_i_3__1 ;
  wire \n_1_wait_bypass_count_reg[4]_i_1__1 ;
  wire \n_1_wait_bypass_count_reg[8]_i_1__1 ;
  wire n_2_sync_QPLLLOCK;
  wire n_2_sync_data_valid;
  wire \n_2_time_out_counter_reg[0]_i_2__1 ;
  wire \n_2_time_out_counter_reg[12]_i_1__1 ;
  wire \n_2_time_out_counter_reg[4]_i_1__1 ;
  wire \n_2_time_out_counter_reg[8]_i_1__1 ;
  wire n_2_time_tlock_max_reg_i_3__1;
  wire n_2_time_tlock_max_reg_i_5__1;
  wire \n_2_wait_bypass_count_reg[0]_i_3__1 ;
  wire \n_2_wait_bypass_count_reg[4]_i_1__1 ;
  wire \n_2_wait_bypass_count_reg[8]_i_1__1 ;
  wire n_3_sync_QPLLLOCK;
  wire n_3_sync_data_valid;
  wire \n_3_time_out_counter_reg[0]_i_2__1 ;
  wire \n_3_time_out_counter_reg[12]_i_1__1 ;
  wire \n_3_time_out_counter_reg[4]_i_1__1 ;
  wire \n_3_time_out_counter_reg[8]_i_1__1 ;
  wire n_3_time_tlock_max_reg_i_3__1;
  wire n_3_time_tlock_max_reg_i_5__1;
  wire \n_3_wait_bypass_count_reg[0]_i_3__1 ;
  wire \n_3_wait_bypass_count_reg[4]_i_1__1 ;
  wire \n_3_wait_bypass_count_reg[8]_i_1__1 ;
  wire n_4_sync_data_valid;
  wire \n_4_time_out_counter_reg[0]_i_2__1 ;
  wire \n_4_time_out_counter_reg[12]_i_1__1 ;
  wire \n_4_time_out_counter_reg[4]_i_1__1 ;
  wire \n_4_time_out_counter_reg[8]_i_1__1 ;
  wire \n_4_wait_bypass_count_reg[0]_i_3__1 ;
  wire \n_4_wait_bypass_count_reg[4]_i_1__1 ;
  wire \n_4_wait_bypass_count_reg[8]_i_1__1 ;
  wire n_5_sync_data_valid;
  wire \n_5_time_out_counter_reg[0]_i_2__1 ;
  wire \n_5_time_out_counter_reg[12]_i_1__1 ;
  wire \n_5_time_out_counter_reg[4]_i_1__1 ;
  wire \n_5_time_out_counter_reg[8]_i_1__1 ;
  wire \n_5_wait_bypass_count_reg[0]_i_3__1 ;
  wire \n_5_wait_bypass_count_reg[4]_i_1__1 ;
  wire \n_5_wait_bypass_count_reg[8]_i_1__1 ;
  wire \n_6_time_out_counter_reg[0]_i_2__1 ;
  wire \n_6_time_out_counter_reg[12]_i_1__1 ;
  wire \n_6_time_out_counter_reg[4]_i_1__1 ;
  wire \n_6_time_out_counter_reg[8]_i_1__1 ;
  wire \n_6_wait_bypass_count_reg[0]_i_3__1 ;
  wire \n_6_wait_bypass_count_reg[4]_i_1__1 ;
  wire \n_6_wait_bypass_count_reg[8]_i_1__1 ;
  wire \n_7_time_out_counter_reg[0]_i_2__1 ;
  wire \n_7_time_out_counter_reg[12]_i_1__1 ;
  wire \n_7_time_out_counter_reg[16]_i_1__1 ;
  wire \n_7_time_out_counter_reg[4]_i_1__1 ;
  wire \n_7_time_out_counter_reg[8]_i_1__1 ;
  wire \n_7_wait_bypass_count_reg[0]_i_3__1 ;
  wire \n_7_wait_bypass_count_reg[12]_i_1__1 ;
  wire \n_7_wait_bypass_count_reg[4]_i_1__1 ;
  wire \n_7_wait_bypass_count_reg[8]_i_1__1 ;
  wire [4:0]p_0_in__1;
  wire [9:1]p_0_in__5;
  wire run_phase_alignment_int;
  wire run_phase_alignment_int_s2;
  wire rx_fsm_reset_done_int_s2;
  wire rxresetdone_s2;
  wire rxresetdone_s3;
  wire [16:0]time_out_counter_reg;
  wire time_out_wait_bypass_s2;
  wire time_out_wait_bypass_s3;
  wire time_tlock_max;
  wire time_tlock_max1;
  wire [12:0]wait_bypass_count_reg;
  wire [6:0]wait_time_cnt0__1;
  wire [6:0]wait_time_cnt_reg__0;
  wire [3:0]\NLW_time_out_counter_reg[16]_i_1__1_CO_UNCONNECTED ;
  wire [3:1]\NLW_time_out_counter_reg[16]_i_1__1_O_UNCONNECTED ;
  wire [3:1]NLW_time_tlock_max_reg_i_2__1_CO_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_2__1_O_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_3__1_O_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_5__1_O_UNCONNECTED;
  wire [3:0]\NLW_wait_bypass_count_reg[12]_i_1__1_CO_UNCONNECTED ;
  wire [3:1]\NLW_wait_bypass_count_reg[12]_i_1__1_O_UNCONNECTED ;

LUT6 #(
    .INIT(64'h000000000000010C)) 
     \FSM_onehot_rx_state[10]_i_1__1 
       (.I0(time_out_wait_bypass_s3),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[10]_i_2__1 ),
        .I5(\n_0_FSM_onehot_rx_state[10]_i_3__1 ),
        .O(\n_0_FSM_onehot_rx_state[10]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair68" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[10]_i_2__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(\n_0_FSM_onehot_rx_state[10]_i_2__1 ));
(* SOFT_HLUTNM = "soft_lutpair77" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[10]_i_3__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I3(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[10]_i_3__1 ));
LUT6 #(
    .INIT(64'hFFFEFFFEFFFE0000)) 
     \FSM_onehot_rx_state[11]_i_10__0 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[10] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_10__0 ));
(* SOFT_HLUTNM = "soft_lutpair83" *) 
   LUT3 #(
    .INIT(8'h08)) 
     \FSM_onehot_rx_state[11]_i_11__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(n_0_time_out_2ms_reg),
        .I2(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[11]_i_11__0 ));
(* SOFT_HLUTNM = "soft_lutpair62" *) 
   LUT5 #(
    .INIT(32'h8F888888)) 
     \FSM_onehot_rx_state[11]_i_12__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I2(n_0_reset_time_out_reg),
        .I3(time_tlock_max),
        .I4(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[11]_i_12__1 ));
LUT6 #(
    .INIT(64'hF8F8F8F8F8F8F888)) 
     \FSM_onehot_rx_state[11]_i_14__1 
       (.I0(check_tlock_max),
        .I1(mmcm_lock_reclocked),
        .I2(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_14__1 ));
LUT6 #(
    .INIT(64'hFCFCFCECFCFCFCE0)) 
     \FSM_onehot_rx_state[11]_i_15__1 
       (.I0(I1),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(check_tlock_max),
        .I5(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[11]_i_15__1 ));
(* SOFT_HLUTNM = "soft_lutpair68" *) 
   LUT5 #(
    .INIT(32'h00000203)) 
     \FSM_onehot_rx_state[11]_i_16__0 
       (.I0(init_wait_done),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_16__0 ));
LUT6 #(
    .INIT(64'hEEEEEEEEEEEEEEE0)) 
     \FSM_onehot_rx_state[11]_i_5__1 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_3__1 ),
        .I1(\n_0_FSM_onehot_rx_state[10]_i_3__1 ),
        .I2(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_5__1 ));
(* SOFT_HLUTNM = "soft_lutpair62" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[11]_i_6__0 
       (.I0(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_6__0 ));
LUT2 #(
    .INIT(4'h8)) 
     \FSM_onehot_rx_state[11]_i_8__0 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_8__0 ));
(* SOFT_HLUTNM = "soft_lutpair78" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \FSM_onehot_rx_state[2]_i_10__1 
       (.I0(n_0_reset_time_out_reg),
        .I1(time_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[2]_i_10__1 ));
LUT6 #(
    .INIT(64'h00000000000C0400)) 
     \FSM_onehot_rx_state[2]_i_2__1 
       (.I0(\n_0_FSM_onehot_rx_state[2]_i_6__1 ),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_7__1 ),
        .I2(\n_0_FSM_onehot_rx_state[2]_i_8__1 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_6__0 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_2__1 ));
LUT6 #(
    .INIT(64'h0000000000000400)) 
     \FSM_onehot_rx_state[2]_i_4__1 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4__1 ),
        .I1(\n_0_FSM_onehot_rx_state[5]_i_3__1 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2__1 ),
        .I3(check_tlock_max),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I5(\n_0_FSM_onehot_rx_state[2]_i_10__1 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_4__1 ));
LUT6 #(
    .INIT(64'h0000001000000000)) 
     \FSM_onehot_rx_state[2]_i_5__1 
       (.I0(\n_0_FSM_onehot_rx_state[10]_i_3__1 ),
        .I1(\n_0_FSM_onehot_rx_state[10]_i_2__1 ),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I5(time_out_wait_bypass_s3),
        .O(\n_0_FSM_onehot_rx_state[2]_i_5__1 ));
(* SOFT_HLUTNM = "soft_lutpair76" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \FSM_onehot_rx_state[2]_i_6__1 
       (.I0(n_0_reset_time_out_reg),
        .I1(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[2]_i_6__1 ));
(* SOFT_HLUTNM = "soft_lutpair66" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[2]_i_7__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(run_phase_alignment_int),
        .O(\n_0_FSM_onehot_rx_state[2]_i_7__1 ));
(* SOFT_HLUTNM = "soft_lutpair65" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[2]_i_8__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_8__1 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \FSM_onehot_rx_state[3]_i_1__1 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2__1 ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_3__1 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__1 ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair63" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[3]_i_2__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_2__1 ));
(* SOFT_HLUTNM = "soft_lutpair81" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[3]_i_3__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_3__1 ));
(* SOFT_HLUTNM = "soft_lutpair73" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[3]_i_4__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_4__1 ));
(* SOFT_HLUTNM = "soft_lutpair69" *) 
   LUT5 #(
    .INIT(32'h00020000)) 
     \FSM_onehot_rx_state[4]_i_1__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state[9]_i_2__1 ),
        .O(\n_0_FSM_onehot_rx_state[4]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair83" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \FSM_onehot_rx_state[5]_i_1__1 
       (.I0(\n_0_FSM_onehot_rx_state[5]_i_2__1 ),
        .I1(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[5]_i_1__1 ));
LUT6 #(
    .INIT(64'h0000000000040000)) 
     \FSM_onehot_rx_state[5]_i_2__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(check_tlock_max),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(\n_0_FSM_onehot_rx_state[5]_i_3__1 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__1 ),
        .O(\n_0_FSM_onehot_rx_state[5]_i_2__1 ));
(* SOFT_HLUTNM = "soft_lutpair81" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[5]_i_3__1 
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[10] ),
        .O(\n_0_FSM_onehot_rx_state[5]_i_3__1 ));
(* SOFT_HLUTNM = "soft_lutpair77" *) 
   LUT3 #(
    .INIT(8'h40)) 
     \FSM_onehot_rx_state[6]_i_1__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state[6]_i_2__1 ),
        .O(\n_0_FSM_onehot_rx_state[6]_i_1__1 ));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \FSM_onehot_rx_state[6]_i_2__1 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4__1 ),
        .I1(run_phase_alignment_int),
        .I2(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I5(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[6]_i_2__1 ));
(* SOFT_HLUTNM = "soft_lutpair78" *) 
   LUT3 #(
    .INIT(8'hA2)) 
     \FSM_onehot_rx_state[7]_i_1__1 
       (.I0(\n_0_FSM_onehot_rx_state[7]_i_2__1 ),
        .I1(time_tlock_max),
        .I2(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[7]_i_1__1 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \FSM_onehot_rx_state[7]_i_2__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2__1 ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_3__1 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__1 ),
        .O(\n_0_FSM_onehot_rx_state[7]_i_2__1 ));
(* SOFT_HLUTNM = "soft_lutpair69" *) 
   LUT5 #(
    .INIT(32'h00100000)) 
     \FSM_onehot_rx_state[8]_i_1__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I4(\n_0_FSM_onehot_rx_state[9]_i_2__1 ),
        .O(\n_0_FSM_onehot_rx_state[8]_i_1__1 ));
LUT6 #(
    .INIT(64'h0008000800000008)) 
     \FSM_onehot_rx_state[9]_i_1__1 
       (.I0(\n_0_FSM_onehot_rx_state[9]_i_2__1 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_6__0 ),
        .I4(n_0_time_out_2ms_reg),
        .I5(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[9]_i_1__1 ));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \FSM_onehot_rx_state[9]_i_2__1 
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_2__1 ),
        .I4(check_tlock_max),
        .I5(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_FSM_onehot_rx_state[9]_i_2__1 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[10] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[10]_i_1__1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[10] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[11] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(n_1_sync_data_valid),
        .Q(\n_0_FSM_onehot_rx_state_reg[11] ),
        .R(SOFT_RESET_IN));
FDSE #(
    .INIT(1'b1)) 
     \FSM_onehot_rx_state_reg[1] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(1'b0),
        .Q(\n_0_FSM_onehot_rx_state_reg[1] ),
        .S(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[2] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(n_2_sync_data_valid),
        .Q(\n_0_FSM_onehot_rx_state_reg[2] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[3] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[3]_i_1__1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[3] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[4] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[4]_i_1__1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[4] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[5] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[5]_i_1__1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[5] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[6] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[6]_i_1__1 ),
        .Q(check_tlock_max),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[7] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[7]_i_1__1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[7] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[8] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[8]_i_1__1 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[8] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[9] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[9]_i_1__1 ),
        .Q(run_phase_alignment_int),
        .R(SOFT_RESET_IN));
LUT6 #(
    .INIT(64'hCCCCFFFFCCCC0008)) 
     RXUSERRDY_i_1__1
       (.I0(\n_0_FSM_onehot_rx_state[9]_i_2__1 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_6__0 ),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_1__1 ),
        .I5(O1),
        .O(n_0_RXUSERRDY_i_1__1));
FDRE #(
    .INIT(1'b0)) 
     RXUSERRDY_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_RXUSERRDY_i_1__1),
        .Q(O1),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair74" *) 
   LUT4 #(
    .INIT(16'hABA8)) 
     check_tlock_max_i_1__1
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state[7]_i_2__1 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1__1 ),
        .I3(n_0_check_tlock_max_reg),
        .O(n_0_check_tlock_max_i_1__1));
FDRE #(
    .INIT(1'b0)) 
     check_tlock_max_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_check_tlock_max_i_1__1),
        .Q(n_0_check_tlock_max_reg),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair63" *) 
   LUT5 #(
    .INIT(32'h33F73300)) 
     gtrxreset_i_i_1__1
       (.I0(\n_0_FSM_onehot_rx_state[6]_i_2__1 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_1__1 ),
        .I4(O2),
        .O(n_0_gtrxreset_i_i_1__1));
FDRE #(
    .INIT(1'b0)) 
     gtrxreset_i_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_gtrxreset_i_i_1__1),
        .Q(O2),
        .R(SOFT_RESET_IN));
LUT1 #(
    .INIT(2'h1)) 
     \init_wait_count[0]_i_1__1 
       (.I0(init_wait_count_reg__0[0]),
        .O(p_0_in__1[0]));
(* SOFT_HLUTNM = "soft_lutpair79" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \init_wait_count[1]_i_1__1 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .O(p_0_in__1[1]));
(* SOFT_HLUTNM = "soft_lutpair79" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \init_wait_count[2]_i_1__1 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[2]),
        .O(p_0_in__1[2]));
(* SOFT_HLUTNM = "soft_lutpair60" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \init_wait_count[3]_i_1__1 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[3]),
        .O(p_0_in__1[3]));
LUT5 #(
    .INIT(32'hDFFFFFFF)) 
     \init_wait_count[4]_i_1__1 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[4]),
        .I4(init_wait_count_reg__0[3]),
        .O(\n_0_init_wait_count[4]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair60" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \init_wait_count[4]_i_2__1 
       (.I0(init_wait_count_reg__0[3]),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[2]),
        .I4(init_wait_count_reg__0[4]),
        .O(p_0_in__1[4]));
(* counter = "14" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__1 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__1[0]),
        .Q(init_wait_count_reg__0[0]));
(* counter = "14" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__1 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__1[1]),
        .Q(init_wait_count_reg__0[1]));
(* counter = "14" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__1 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__1[2]),
        .Q(init_wait_count_reg__0[2]));
(* counter = "14" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__1 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__1[3]),
        .Q(init_wait_count_reg__0[3]));
(* counter = "14" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__1 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__1[4]),
        .Q(init_wait_count_reg__0[4]));
LUT6 #(
    .INIT(64'hFFFFFFFF40000000)) 
     init_wait_done_i_1__1
       (.I0(init_wait_count_reg__0[0]),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[4]),
        .I3(init_wait_count_reg__0[3]),
        .I4(init_wait_count_reg__0[2]),
        .I5(init_wait_done),
        .O(n_0_init_wait_done_i_1__1));
FDCE #(
    .INIT(1'b0)) 
     init_wait_done_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .CLR(SOFT_RESET_IN),
        .D(n_0_init_wait_done_i_1__1),
        .Q(init_wait_done));
LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[0]_i_1__1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .O(\n_0_mmcm_lock_count[0]_i_1__1 ));
(* SOFT_HLUTNM = "soft_lutpair82" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \mmcm_lock_count[1]_i_1__1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .O(p_0_in__5[1]));
(* SOFT_HLUTNM = "soft_lutpair82" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \mmcm_lock_count[2]_i_1__1 
       (.I0(mmcm_lock_count_reg__0[1]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[2]),
        .O(p_0_in__5[2]));
(* SOFT_HLUTNM = "soft_lutpair70" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \mmcm_lock_count[3]_i_1__1 
       (.I0(mmcm_lock_count_reg__0[2]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[1]),
        .I3(mmcm_lock_count_reg__0[3]),
        .O(p_0_in__5[3]));
(* SOFT_HLUTNM = "soft_lutpair70" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \mmcm_lock_count[4]_i_1__1 
       (.I0(mmcm_lock_count_reg__0[1]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[3]),
        .I4(mmcm_lock_count_reg__0[4]),
        .O(p_0_in__5[4]));
LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
     \mmcm_lock_count[5]_i_1__1 
       (.I0(mmcm_lock_count_reg__0[4]),
        .I1(mmcm_lock_count_reg__0[3]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[0]),
        .I4(mmcm_lock_count_reg__0[1]),
        .I5(mmcm_lock_count_reg__0[5]),
        .O(p_0_in__5[5]));
LUT2 #(
    .INIT(4'h9)) 
     \mmcm_lock_count[6]_i_1__1 
       (.I0(\n_0_mmcm_lock_count[9]_i_4__1 ),
        .I1(mmcm_lock_count_reg__0[6]),
        .O(p_0_in__5[6]));
(* SOFT_HLUTNM = "soft_lutpair71" *) 
   LUT3 #(
    .INIT(8'hD2)) 
     \mmcm_lock_count[7]_i_1__1 
       (.I0(mmcm_lock_count_reg__0[6]),
        .I1(\n_0_mmcm_lock_count[9]_i_4__1 ),
        .I2(mmcm_lock_count_reg__0[7]),
        .O(p_0_in__5[7]));
(* SOFT_HLUTNM = "soft_lutpair71" *) 
   LUT4 #(
    .INIT(16'hDF20)) 
     \mmcm_lock_count[8]_i_1__1 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(\n_0_mmcm_lock_count[9]_i_4__1 ),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[8]),
        .O(p_0_in__5[8]));
LUT5 #(
    .INIT(32'hDFFFFFFF)) 
     \mmcm_lock_count[9]_i_2__1 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(\n_0_mmcm_lock_count[9]_i_4__1 ),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[8]),
        .I4(mmcm_lock_count_reg__0[9]),
        .O(\n_0_mmcm_lock_count[9]_i_2__1 ));
(* SOFT_HLUTNM = "soft_lutpair67" *) 
   LUT5 #(
    .INIT(32'hF7FF0800)) 
     \mmcm_lock_count[9]_i_3__1 
       (.I0(mmcm_lock_count_reg__0[8]),
        .I1(mmcm_lock_count_reg__0[6]),
        .I2(\n_0_mmcm_lock_count[9]_i_4__1 ),
        .I3(mmcm_lock_count_reg__0[7]),
        .I4(mmcm_lock_count_reg__0[9]),
        .O(p_0_in__5[9]));
LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
     \mmcm_lock_count[9]_i_4__1 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .I2(mmcm_lock_count_reg__0[4]),
        .I3(mmcm_lock_count_reg__0[5]),
        .I4(mmcm_lock_count_reg__0[2]),
        .I5(mmcm_lock_count_reg__0[3]),
        .O(\n_0_mmcm_lock_count[9]_i_4__1 ));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__1 ),
        .D(\n_0_mmcm_lock_count[0]_i_1__1 ),
        .Q(mmcm_lock_count_reg__0[0]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__1 ),
        .D(p_0_in__5[1]),
        .Q(mmcm_lock_count_reg__0[1]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__1 ),
        .D(p_0_in__5[2]),
        .Q(mmcm_lock_count_reg__0[2]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__1 ),
        .D(p_0_in__5[3]),
        .Q(mmcm_lock_count_reg__0[3]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__1 ),
        .D(p_0_in__5[4]),
        .Q(mmcm_lock_count_reg__0[4]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__1 ),
        .D(p_0_in__5[5]),
        .Q(mmcm_lock_count_reg__0[5]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__1 ),
        .D(p_0_in__5[6]),
        .Q(mmcm_lock_count_reg__0[6]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[7] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__1 ),
        .D(p_0_in__5[7]),
        .Q(mmcm_lock_count_reg__0[7]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[8] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__1 ),
        .D(p_0_in__5[8]),
        .Q(mmcm_lock_count_reg__0[8]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "26" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[9] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__1 ),
        .D(p_0_in__5[9]),
        .Q(mmcm_lock_count_reg__0[9]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* SOFT_HLUTNM = "soft_lutpair67" *) 
   LUT5 #(
    .INIT(32'h00800000)) 
     mmcm_lock_reclocked_i_2__1
       (.I0(mmcm_lock_count_reg__0[9]),
        .I1(mmcm_lock_count_reg__0[8]),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(\n_0_mmcm_lock_count[9]_i_4__1 ),
        .I4(mmcm_lock_count_reg__0[7]),
        .O(n_0_mmcm_lock_reclocked_i_2__1));
FDRE #(
    .INIT(1'b0)) 
     mmcm_lock_reclocked_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_1_sync_mmcm_lock_reclocked),
        .Q(mmcm_lock_reclocked),
        .R(1'b0));
(* SOFT_HLUTNM = "soft_lutpair72" *) 
   LUT4 #(
    .INIT(16'h55DC)) 
     pll_reset_asserted_i_1__1
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(n_0_pll_reset_asserted_reg),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1__1 ),
        .I3(\n_0_FSM_onehot_rx_state[5]_i_2__1 ),
        .O(n_0_pll_reset_asserted_i_1__1));
FDRE #(
    .INIT(1'b0)) 
     pll_reset_asserted_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_pll_reset_asserted_i_1__1),
        .Q(n_0_pll_reset_asserted_reg),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair72" *) 
   LUT2 #(
    .INIT(4'h2)) 
     reset_time_out_i_11__1
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_11__1));
(* SOFT_HLUTNM = "soft_lutpair75" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     reset_time_out_i_12__1
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_12__1));
(* SOFT_HLUTNM = "soft_lutpair73" *) 
   LUT4 #(
    .INIT(16'h0002)) 
     reset_time_out_i_13__1
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(n_0_reset_time_out_i_13__1));
LUT6 #(
    .INIT(64'h0000000000080000)) 
     reset_time_out_i_4__1
       (.I0(I1),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_wait_time_cnt[6]_i_4__1 ),
        .I4(\n_0_FSM_onehot_rx_state[5]_i_3__1 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__1 ),
        .O(n_0_reset_time_out_i_4__1));
(* SOFT_HLUTNM = "soft_lutpair64" *) 
   LUT5 #(
    .INIT(32'h00010006)) 
     reset_time_out_i_5__1
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state[10]_i_3__1 ),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2__1 ),
        .I4(run_phase_alignment_int),
        .O(n_0_reset_time_out_i_5__1));
LUT6 #(
    .INIT(64'h0004000F00040004)) 
     reset_time_out_i_6__1
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4__1 ),
        .I1(n_0_reset_time_out_i_12__1),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_3__1 ),
        .I4(\n_0_FSM_onehot_rx_state[2]_i_8__1 ),
        .I5(n_0_reset_time_out_i_13__1),
        .O(n_0_reset_time_out_i_6__1));
(* SOFT_HLUTNM = "soft_lutpair65" *) 
   LUT5 #(
    .INIT(32'h00100000)) 
     reset_time_out_i_8__1
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(mmcm_lock_reclocked),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(check_tlock_max),
        .O(n_0_reset_time_out_i_8__1));
(* SOFT_HLUTNM = "soft_lutpair75" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     reset_time_out_i_9__1
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_9__1));
FDSE #(
    .INIT(1'b0)) 
     reset_time_out_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_4_sync_data_valid),
        .Q(n_0_reset_time_out_reg),
        .S(SOFT_RESET_IN));
LUT4 #(
    .INIT(16'hABA8)) 
     run_phase_alignment_int_i_1__1
       (.I0(run_phase_alignment_int),
        .I1(n_0_run_phase_alignment_int_i_2__1),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1__1 ),
        .I3(n_0_run_phase_alignment_int_reg),
        .O(n_0_run_phase_alignment_int_i_1__1));
(* SOFT_HLUTNM = "soft_lutpair64" *) 
   LUT5 #(
    .INIT(32'h00000010)) 
     run_phase_alignment_int_i_2__1
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2__1 ),
        .I4(\n_0_FSM_onehot_rx_state[10]_i_3__1 ),
        .O(n_0_run_phase_alignment_int_i_2__1));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_run_phase_alignment_int_i_1__1),
        .Q(n_0_run_phase_alignment_int_reg),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_s3_reg
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(run_phase_alignment_int_s2),
        .Q(n_0_run_phase_alignment_int_s3_reg),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     rx_fsm_reset_done_int_i_3__1
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I5(\n_0_FSM_onehot_rx_state[10]_i_3__1 ),
        .O(n_0_rx_fsm_reset_done_int_i_3__1));
(* SOFT_HLUTNM = "soft_lutpair66" *) 
   LUT5 #(
    .INIT(32'h00000004)) 
     rx_fsm_reset_done_int_i_6__1
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state[10]_i_3__1 ),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2__1 ),
        .I4(run_phase_alignment_int),
        .O(n_0_rx_fsm_reset_done_int_i_6__1));
FDRE #(
    .INIT(1'b0)) 
     rx_fsm_reset_done_int_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_5_sync_data_valid),
        .Q(GT2_RX_FSM_RESET_DONE_OUT),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     rx_fsm_reset_done_int_s3_reg
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(rx_fsm_reset_done_int_s2),
        .Q(n_0_rx_fsm_reset_done_int_s3_reg),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     rxresetdone_s3_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(rxresetdone_s2),
        .Q(rxresetdone_s3),
        .R(1'b0));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_19 sync_QPLLLOCK
       (.GT0_QPLLLOCK_IN(GT0_QPLLLOCK_IN),
        .I1(n_0_pll_reset_asserted_reg),
        .I10(I1),
        .I2(\n_0_FSM_onehot_rx_state[11]_i_14__1 ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_15__1 ),
        .I4(n_3_sync_data_valid),
        .I5(n_0_reset_time_out_i_9__1),
        .I6(\n_0_FSM_onehot_rx_state[3]_i_4__1 ),
        .I7(\n_0_FSM_onehot_rx_state[5]_i_3__1 ),
        .I8(\n_0_wait_time_cnt[6]_i_4__1 ),
        .I9(n_0_reset_time_out_i_11__1),
        .O1(n_0_sync_QPLLLOCK),
        .O2(n_1_sync_QPLLLOCK),
        .O3(n_2_sync_QPLLLOCK),
        .O4(n_3_sync_QPLLLOCK),
        .Q({\n_0_FSM_onehot_rx_state_reg[10] ,\n_0_FSM_onehot_rx_state_reg[7] ,\n_0_FSM_onehot_rx_state_reg[5] ,\n_0_FSM_onehot_rx_state_reg[4] ,\n_0_FSM_onehot_rx_state_reg[3] ,\n_0_FSM_onehot_rx_state_reg[2] ,\n_0_FSM_onehot_rx_state_reg[1] }),
        .SYSCLK_IN(SYSCLK_IN));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_20 sync_RXRESETDONE
       (.SYSCLK_IN(SYSCLK_IN),
        .data_out(rxresetdone_s2),
        .gt2_rxresetdone_out(gt2_rxresetdone_out));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_21 sync_data_valid
       (.D({n_1_sync_data_valid,n_2_sync_data_valid}),
        .DONT_RESET_ON_DATA_ERROR_IN(DONT_RESET_ON_DATA_ERROR_IN),
        .E(n_0_sync_data_valid),
        .GT2_DATA_VALID_IN(GT2_DATA_VALID_IN),
        .GT2_RX_FSM_RESET_DONE_OUT(GT2_RX_FSM_RESET_DONE_OUT),
        .I1(n_1_sync_QPLLLOCK),
        .I10(\n_0_FSM_onehot_rx_state[11]_i_12__1 ),
        .I11(n_0_sync_QPLLLOCK),
        .I12(n_0_time_out_1us_reg),
        .I13(n_0_reset_time_out_reg),
        .I14(\n_0_FSM_onehot_rx_state[2]_i_2__1 ),
        .I15(\n_0_FSM_onehot_rx_state[5]_i_2__1 ),
        .I16(n_0_time_out_2ms_reg),
        .I17(\n_0_FSM_onehot_rx_state[2]_i_4__1 ),
        .I18(\n_0_FSM_onehot_rx_state[2]_i_5__1 ),
        .I19(n_3_sync_QPLLLOCK),
        .I2(\n_0_FSM_onehot_rx_state[11]_i_5__1 ),
        .I20(n_0_reset_time_out_i_8__1),
        .I21(\n_0_FSM_onehot_rx_state[10]_i_2__1 ),
        .I22(n_0_time_out_100us_reg),
        .I23(n_0_rx_fsm_reset_done_int_i_6__1),
        .I24(n_2_sync_QPLLLOCK),
        .I25(n_0_reset_time_out_i_4__1),
        .I26(n_0_reset_time_out_i_5__1),
        .I27(n_0_reset_time_out_i_6__1),
        .I28(n_0_rx_fsm_reset_done_int_i_3__1),
        .I3(\n_0_wait_time_cnt[6]_i_2__1 ),
        .I4(\n_0_FSM_onehot_rx_state[11]_i_6__0 ),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_16__0 ),
        .I6(\n_0_FSM_onehot_rx_state[10]_i_3__1 ),
        .I7(\n_0_FSM_onehot_rx_state[11]_i_8__0 ),
        .I8(\n_0_FSM_onehot_rx_state[11]_i_10__0 ),
        .I9(\n_0_FSM_onehot_rx_state[11]_i_11__0 ),
        .O1(n_3_sync_data_valid),
        .O2(n_4_sync_data_valid),
        .O3(n_5_sync_data_valid),
        .Q({\n_0_FSM_onehot_rx_state_reg[11] ,\n_0_FSM_onehot_rx_state_reg[10] ,run_phase_alignment_int,\n_0_FSM_onehot_rx_state_reg[8] }),
        .SYSCLK_IN(SYSCLK_IN),
        .rxresetdone_s3(rxresetdone_s3));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_22 sync_mmcm_lock_reclocked
       (.I1(n_0_mmcm_lock_reclocked_i_2__1),
        .O1(n_1_sync_mmcm_lock_reclocked),
        .SR(n_0_sync_mmcm_lock_reclocked),
        .SYSCLK_IN(SYSCLK_IN),
        .mmcm_lock_reclocked(mmcm_lock_reclocked));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_23 sync_run_phase_alignment_int
       (.data_in(n_0_run_phase_alignment_int_reg),
        .data_out(run_phase_alignment_int_s2),
        .gt2_rxusrclk_in(gt2_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_24 sync_rx_fsm_reset_done_int
       (.GT2_RX_FSM_RESET_DONE_OUT(GT2_RX_FSM_RESET_DONE_OUT),
        .data_out(rx_fsm_reset_done_int_s2),
        .gt2_rxusrclk_in(gt2_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_25 sync_time_out_wait_bypass
       (.SYSCLK_IN(SYSCLK_IN),
        .data_in(n_0_time_out_wait_bypass_reg),
        .data_out(time_out_wait_bypass_s2));
LUT6 #(
    .INIT(64'hFFFFFFFF00010000)) 
     time_out_100us_i_1__1
       (.I0(\n_0_time_out_counter[0]_i_3__1 ),
        .I1(n_0_time_out_100us_i_2__1),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[11]),
        .I4(n_0_time_out_100us_i_3__1),
        .I5(n_0_time_out_100us_reg),
        .O(n_0_time_out_100us_i_1__1));
LUT2 #(
    .INIT(4'hE)) 
     time_out_100us_i_2__1
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[15]),
        .O(n_0_time_out_100us_i_2__1));
LUT6 #(
    .INIT(64'h0010000000000000)) 
     time_out_100us_i_3__1
       (.I0(time_out_counter_reg[16]),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[12]),
        .I3(time_out_counter_reg[3]),
        .I4(time_out_counter_reg[1]),
        .I5(time_out_counter_reg[2]),
        .O(n_0_time_out_100us_i_3__1));
FDRE #(
    .INIT(1'b0)) 
     time_out_100us_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_100us_i_1__1),
        .Q(n_0_time_out_100us_reg),
        .R(n_0_reset_time_out_reg));
LUT6 #(
    .INIT(64'hFFFFFFFF00000002)) 
     time_out_1us_i_1__1
       (.I0(n_0_time_out_1us_i_2__1),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[11]),
        .I4(time_out_counter_reg[10]),
        .I5(n_0_time_out_1us_reg),
        .O(n_0_time_out_1us_i_1__1));
LUT6 #(
    .INIT(64'h0000000100000000)) 
     time_out_1us_i_2__1
       (.I0(n_0_time_out_2ms_i_3__1),
        .I1(time_out_counter_reg[14]),
        .I2(time_out_counter_reg[15]),
        .I3(time_out_counter_reg[8]),
        .I4(time_out_counter_reg[9]),
        .I5(n_0_time_out_1us_i_3__1),
        .O(n_0_time_out_1us_i_2__1));
LUT5 #(
    .INIT(32'h00000020)) 
     time_out_1us_i_3__1
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[6]),
        .I2(time_out_counter_reg[5]),
        .I3(time_out_counter_reg[4]),
        .I4(time_out_counter_reg[7]),
        .O(n_0_time_out_1us_i_3__1));
FDRE #(
    .INIT(1'b0)) 
     time_out_1us_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_1us_i_1__1),
        .Q(n_0_time_out_1us_reg),
        .R(n_0_reset_time_out_reg));
(* SOFT_HLUTNM = "soft_lutpair76" *) 
   LUT4 #(
    .INIT(16'hFF02)) 
     time_out_2ms_i_1__1
       (.I0(n_0_time_out_2ms_i_2__1),
        .I1(\n_0_time_out_counter[0]_i_3__1 ),
        .I2(n_0_time_out_2ms_i_3__1),
        .I3(n_0_time_out_2ms_reg),
        .O(n_0_time_out_2ms_i_1__1));
LUT6 #(
    .INIT(64'h0080000000000000)) 
     time_out_2ms_i_2__1
       (.I0(time_out_counter_reg[13]),
        .I1(time_out_counter_reg[14]),
        .I2(time_out_counter_reg[11]),
        .I3(time_out_counter_reg[10]),
        .I4(time_out_counter_reg[16]),
        .I5(time_out_counter_reg[15]),
        .O(n_0_time_out_2ms_i_2__1));
LUT4 #(
    .INIT(16'hFFEF)) 
     time_out_2ms_i_3__1
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[1]),
        .I2(time_out_counter_reg[3]),
        .I3(time_out_counter_reg[12]),
        .O(n_0_time_out_2ms_i_3__1));
FDRE #(
    .INIT(1'b0)) 
     time_out_2ms_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_2ms_i_1__1),
        .Q(n_0_time_out_2ms_reg),
        .R(n_0_reset_time_out_reg));
LUT3 #(
    .INIT(8'hFE)) 
     \time_out_counter[0]_i_1__1 
       (.I0(time_out_counter_reg[10]),
        .I1(\n_0_time_out_counter[0]_i_3__1 ),
        .I2(\n_0_time_out_counter[0]_i_4__1 ),
        .O(\n_0_time_out_counter[0]_i_1__1 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
     \time_out_counter[0]_i_3__1 
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[5]),
        .I2(time_out_counter_reg[7]),
        .I3(time_out_counter_reg[6]),
        .I4(time_out_counter_reg[0]),
        .I5(\n_0_time_out_counter[0]_i_9__1 ),
        .O(\n_0_time_out_counter[0]_i_3__1 ));
LUT6 #(
    .INIT(64'hFFFFFFFF7FFFFFFF)) 
     \time_out_counter[0]_i_4__1 
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[14]),
        .I4(time_out_counter_reg[11]),
        .I5(n_0_time_out_2ms_i_3__1),
        .O(\n_0_time_out_counter[0]_i_4__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_5__1 
       (.I0(time_out_counter_reg[3]),
        .O(\n_0_time_out_counter[0]_i_5__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_6__1 
       (.I0(time_out_counter_reg[2]),
        .O(\n_0_time_out_counter[0]_i_6__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_7__1 
       (.I0(time_out_counter_reg[1]),
        .O(\n_0_time_out_counter[0]_i_7__1 ));
LUT1 #(
    .INIT(2'h1)) 
     \time_out_counter[0]_i_8__1 
       (.I0(time_out_counter_reg[0]),
        .O(\n_0_time_out_counter[0]_i_8__1 ));
LUT2 #(
    .INIT(4'hE)) 
     \time_out_counter[0]_i_9__1 
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[9]),
        .O(\n_0_time_out_counter[0]_i_9__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_2__1 
       (.I0(time_out_counter_reg[15]),
        .O(\n_0_time_out_counter[12]_i_2__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_3__1 
       (.I0(time_out_counter_reg[14]),
        .O(\n_0_time_out_counter[12]_i_3__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_4__1 
       (.I0(time_out_counter_reg[13]),
        .O(\n_0_time_out_counter[12]_i_4__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_5__1 
       (.I0(time_out_counter_reg[12]),
        .O(\n_0_time_out_counter[12]_i_5__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[16]_i_2__1 
       (.I0(time_out_counter_reg[16]),
        .O(\n_0_time_out_counter[16]_i_2__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_2__1 
       (.I0(time_out_counter_reg[7]),
        .O(\n_0_time_out_counter[4]_i_2__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_3__1 
       (.I0(time_out_counter_reg[6]),
        .O(\n_0_time_out_counter[4]_i_3__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_4__1 
       (.I0(time_out_counter_reg[5]),
        .O(\n_0_time_out_counter[4]_i_4__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_5__1 
       (.I0(time_out_counter_reg[4]),
        .O(\n_0_time_out_counter[4]_i_5__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_2__1 
       (.I0(time_out_counter_reg[11]),
        .O(\n_0_time_out_counter[8]_i_2__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_3__1 
       (.I0(time_out_counter_reg[10]),
        .O(\n_0_time_out_counter[8]_i_3__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_4__1 
       (.I0(time_out_counter_reg[9]),
        .O(\n_0_time_out_counter[8]_i_4__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_5__1 
       (.I0(time_out_counter_reg[8]),
        .O(\n_0_time_out_counter[8]_i_5__1 ));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_7_time_out_counter_reg[0]_i_2__1 ),
        .Q(time_out_counter_reg[0]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[0]_i_2__1 
       (.CI(1'b0),
        .CO({\n_0_time_out_counter_reg[0]_i_2__1 ,\n_1_time_out_counter_reg[0]_i_2__1 ,\n_2_time_out_counter_reg[0]_i_2__1 ,\n_3_time_out_counter_reg[0]_i_2__1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\n_4_time_out_counter_reg[0]_i_2__1 ,\n_5_time_out_counter_reg[0]_i_2__1 ,\n_6_time_out_counter_reg[0]_i_2__1 ,\n_7_time_out_counter_reg[0]_i_2__1 }),
        .S({\n_0_time_out_counter[0]_i_5__1 ,\n_0_time_out_counter[0]_i_6__1 ,\n_0_time_out_counter[0]_i_7__1 ,\n_0_time_out_counter[0]_i_8__1 }));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[10] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_5_time_out_counter_reg[8]_i_1__1 ),
        .Q(time_out_counter_reg[10]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[11] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_4_time_out_counter_reg[8]_i_1__1 ),
        .Q(time_out_counter_reg[11]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[12] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_7_time_out_counter_reg[12]_i_1__1 ),
        .Q(time_out_counter_reg[12]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[12]_i_1__1 
       (.CI(\n_0_time_out_counter_reg[8]_i_1__1 ),
        .CO({\n_0_time_out_counter_reg[12]_i_1__1 ,\n_1_time_out_counter_reg[12]_i_1__1 ,\n_2_time_out_counter_reg[12]_i_1__1 ,\n_3_time_out_counter_reg[12]_i_1__1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[12]_i_1__1 ,\n_5_time_out_counter_reg[12]_i_1__1 ,\n_6_time_out_counter_reg[12]_i_1__1 ,\n_7_time_out_counter_reg[12]_i_1__1 }),
        .S({\n_0_time_out_counter[12]_i_2__1 ,\n_0_time_out_counter[12]_i_3__1 ,\n_0_time_out_counter[12]_i_4__1 ,\n_0_time_out_counter[12]_i_5__1 }));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[13] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_6_time_out_counter_reg[12]_i_1__1 ),
        .Q(time_out_counter_reg[13]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[14] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_5_time_out_counter_reg[12]_i_1__1 ),
        .Q(time_out_counter_reg[14]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[15] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_4_time_out_counter_reg[12]_i_1__1 ),
        .Q(time_out_counter_reg[15]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[16] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_7_time_out_counter_reg[16]_i_1__1 ),
        .Q(time_out_counter_reg[16]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[16]_i_1__1 
       (.CI(\n_0_time_out_counter_reg[12]_i_1__1 ),
        .CO(\NLW_time_out_counter_reg[16]_i_1__1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_time_out_counter_reg[16]_i_1__1_O_UNCONNECTED [3:1],\n_7_time_out_counter_reg[16]_i_1__1 }),
        .S({1'b0,1'b0,1'b0,\n_0_time_out_counter[16]_i_2__1 }));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_6_time_out_counter_reg[0]_i_2__1 ),
        .Q(time_out_counter_reg[1]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_5_time_out_counter_reg[0]_i_2__1 ),
        .Q(time_out_counter_reg[2]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_4_time_out_counter_reg[0]_i_2__1 ),
        .Q(time_out_counter_reg[3]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_7_time_out_counter_reg[4]_i_1__1 ),
        .Q(time_out_counter_reg[4]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[4]_i_1__1 
       (.CI(\n_0_time_out_counter_reg[0]_i_2__1 ),
        .CO({\n_0_time_out_counter_reg[4]_i_1__1 ,\n_1_time_out_counter_reg[4]_i_1__1 ,\n_2_time_out_counter_reg[4]_i_1__1 ,\n_3_time_out_counter_reg[4]_i_1__1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[4]_i_1__1 ,\n_5_time_out_counter_reg[4]_i_1__1 ,\n_6_time_out_counter_reg[4]_i_1__1 ,\n_7_time_out_counter_reg[4]_i_1__1 }),
        .S({\n_0_time_out_counter[4]_i_2__1 ,\n_0_time_out_counter[4]_i_3__1 ,\n_0_time_out_counter[4]_i_4__1 ,\n_0_time_out_counter[4]_i_5__1 }));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_6_time_out_counter_reg[4]_i_1__1 ),
        .Q(time_out_counter_reg[5]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_5_time_out_counter_reg[4]_i_1__1 ),
        .Q(time_out_counter_reg[6]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[7] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_4_time_out_counter_reg[4]_i_1__1 ),
        .Q(time_out_counter_reg[7]),
        .R(n_0_reset_time_out_reg));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[8] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_7_time_out_counter_reg[8]_i_1__1 ),
        .Q(time_out_counter_reg[8]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[8]_i_1__1 
       (.CI(\n_0_time_out_counter_reg[4]_i_1__1 ),
        .CO({\n_0_time_out_counter_reg[8]_i_1__1 ,\n_1_time_out_counter_reg[8]_i_1__1 ,\n_2_time_out_counter_reg[8]_i_1__1 ,\n_3_time_out_counter_reg[8]_i_1__1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[8]_i_1__1 ,\n_5_time_out_counter_reg[8]_i_1__1 ,\n_6_time_out_counter_reg[8]_i_1__1 ,\n_7_time_out_counter_reg[8]_i_1__1 }),
        .S({\n_0_time_out_counter[8]_i_2__1 ,\n_0_time_out_counter[8]_i_3__1 ,\n_0_time_out_counter[8]_i_4__1 ,\n_0_time_out_counter[8]_i_5__1 }));
(* counter = "16" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[9] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__1 ),
        .D(\n_6_time_out_counter_reg[8]_i_1__1 ),
        .Q(time_out_counter_reg[9]),
        .R(n_0_reset_time_out_reg));
LUT6 #(
    .INIT(64'hFF00FF0100000000)) 
     time_out_wait_bypass_i_1__1
       (.I0(\n_0_wait_bypass_count[0]_i_4__1 ),
        .I1(wait_bypass_count_reg[3]),
        .I2(\n_0_wait_bypass_count[0]_i_5__1 ),
        .I3(n_0_time_out_wait_bypass_reg),
        .I4(n_0_rx_fsm_reset_done_int_s3_reg),
        .I5(n_0_run_phase_alignment_int_s3_reg),
        .O(n_0_time_out_wait_bypass_i_1__1));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_reg
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(n_0_time_out_wait_bypass_i_1__1),
        .Q(n_0_time_out_wait_bypass_reg),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_s3_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(time_out_wait_bypass_s2),
        .Q(time_out_wait_bypass_s3),
        .R(1'b0));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_10__1
       (.I0(time_out_counter_reg[12]),
        .I1(time_out_counter_reg[13]),
        .O(n_0_time_tlock_max_i_10__1));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_11__1
       (.I0(time_out_counter_reg[11]),
        .I1(time_out_counter_reg[10]),
        .O(n_0_time_tlock_max_i_11__1));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_12__1
       (.I0(time_out_counter_reg[9]),
        .I1(time_out_counter_reg[8]),
        .O(n_0_time_tlock_max_i_12__1));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_13__1
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[5]),
        .O(n_0_time_tlock_max_i_13__1));
LUT2 #(
    .INIT(4'h8)) 
     time_tlock_max_i_14__1
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[1]),
        .O(n_0_time_tlock_max_i_14__1));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_15__1
       (.I0(time_out_counter_reg[6]),
        .I1(time_out_counter_reg[7]),
        .O(n_0_time_tlock_max_i_15__1));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_16__1
       (.I0(time_out_counter_reg[5]),
        .I1(time_out_counter_reg[4]),
        .O(n_0_time_tlock_max_i_16__1));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_17__1
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[3]),
        .O(n_0_time_tlock_max_i_17__1));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_18__1
       (.I0(time_out_counter_reg[1]),
        .I1(time_out_counter_reg[0]),
        .O(n_0_time_tlock_max_i_18__1));
LUT3 #(
    .INIT(8'hF8)) 
     time_tlock_max_i_1__1
       (.I0(n_0_check_tlock_max_reg),
        .I1(time_tlock_max1),
        .I2(time_tlock_max),
        .O(n_0_time_tlock_max_i_1__1));
LUT1 #(
    .INIT(2'h1)) 
     time_tlock_max_i_4__1
       (.I0(time_out_counter_reg[16]),
        .O(n_0_time_tlock_max_i_4__1));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_6__1
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[15]),
        .O(n_0_time_tlock_max_i_6__1));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_7__1
       (.I0(time_out_counter_reg[10]),
        .I1(time_out_counter_reg[11]),
        .O(n_0_time_tlock_max_i_7__1));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_8__1
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[9]),
        .O(n_0_time_tlock_max_i_8__1));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_9__1
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[14]),
        .O(n_0_time_tlock_max_i_9__1));
FDRE #(
    .INIT(1'b0)) 
     time_tlock_max_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_tlock_max_i_1__1),
        .Q(time_tlock_max),
        .R(n_0_reset_time_out_reg));
CARRY4 time_tlock_max_reg_i_2__1
       (.CI(n_0_time_tlock_max_reg_i_3__1),
        .CO({NLW_time_tlock_max_reg_i_2__1_CO_UNCONNECTED[3:1],time_tlock_max1}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,time_out_counter_reg[16]}),
        .O(NLW_time_tlock_max_reg_i_2__1_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,n_0_time_tlock_max_i_4__1}));
CARRY4 time_tlock_max_reg_i_3__1
       (.CI(n_0_time_tlock_max_reg_i_5__1),
        .CO({n_0_time_tlock_max_reg_i_3__1,n_1_time_tlock_max_reg_i_3__1,n_2_time_tlock_max_reg_i_3__1,n_3_time_tlock_max_reg_i_3__1}),
        .CYINIT(1'b0),
        .DI({n_0_time_tlock_max_i_6__1,time_out_counter_reg[13],n_0_time_tlock_max_i_7__1,n_0_time_tlock_max_i_8__1}),
        .O(NLW_time_tlock_max_reg_i_3__1_O_UNCONNECTED[3:0]),
        .S({n_0_time_tlock_max_i_9__1,n_0_time_tlock_max_i_10__1,n_0_time_tlock_max_i_11__1,n_0_time_tlock_max_i_12__1}));
CARRY4 time_tlock_max_reg_i_5__1
       (.CI(1'b0),
        .CO({n_0_time_tlock_max_reg_i_5__1,n_1_time_tlock_max_reg_i_5__1,n_2_time_tlock_max_reg_i_5__1,n_3_time_tlock_max_reg_i_5__1}),
        .CYINIT(1'b0),
        .DI({time_out_counter_reg[7],n_0_time_tlock_max_i_13__1,time_out_counter_reg[3],n_0_time_tlock_max_i_14__1}),
        .O(NLW_time_tlock_max_reg_i_5__1_O_UNCONNECTED[3:0]),
        .S({n_0_time_tlock_max_i_15__1,n_0_time_tlock_max_i_16__1,n_0_time_tlock_max_i_17__1,n_0_time_tlock_max_i_18__1}));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_1__1 
       (.I0(n_0_run_phase_alignment_int_s3_reg),
        .O(\n_0_wait_bypass_count[0]_i_1__1 ));
LUT4 #(
    .INIT(16'h00FE)) 
     \wait_bypass_count[0]_i_2__1 
       (.I0(\n_0_wait_bypass_count[0]_i_4__1 ),
        .I1(wait_bypass_count_reg[3]),
        .I2(\n_0_wait_bypass_count[0]_i_5__1 ),
        .I3(n_0_rx_fsm_reset_done_int_s3_reg),
        .O(\n_0_wait_bypass_count[0]_i_2__1 ));
LUT6 #(
    .INIT(64'hFFFFEFFFFFFFFFFF)) 
     \wait_bypass_count[0]_i_4__1 
       (.I0(wait_bypass_count_reg[11]),
        .I1(wait_bypass_count_reg[4]),
        .I2(wait_bypass_count_reg[0]),
        .I3(wait_bypass_count_reg[9]),
        .I4(wait_bypass_count_reg[10]),
        .I5(wait_bypass_count_reg[2]),
        .O(\n_0_wait_bypass_count[0]_i_4__1 ));
LUT6 #(
    .INIT(64'hFDFFFFFFFFFFFFFF)) 
     \wait_bypass_count[0]_i_5__1 
       (.I0(wait_bypass_count_reg[1]),
        .I1(wait_bypass_count_reg[6]),
        .I2(wait_bypass_count_reg[5]),
        .I3(wait_bypass_count_reg[12]),
        .I4(wait_bypass_count_reg[8]),
        .I5(wait_bypass_count_reg[7]),
        .O(\n_0_wait_bypass_count[0]_i_5__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_6__1 
       (.I0(wait_bypass_count_reg[3]),
        .O(\n_0_wait_bypass_count[0]_i_6__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_7__1 
       (.I0(wait_bypass_count_reg[2]),
        .O(\n_0_wait_bypass_count[0]_i_7__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_8__1 
       (.I0(wait_bypass_count_reg[1]),
        .O(\n_0_wait_bypass_count[0]_i_8__1 ));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_9__1 
       (.I0(wait_bypass_count_reg[0]),
        .O(\n_0_wait_bypass_count[0]_i_9__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[12]_i_2__1 
       (.I0(wait_bypass_count_reg[12]),
        .O(\n_0_wait_bypass_count[12]_i_2__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_2__1 
       (.I0(wait_bypass_count_reg[7]),
        .O(\n_0_wait_bypass_count[4]_i_2__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_3__1 
       (.I0(wait_bypass_count_reg[6]),
        .O(\n_0_wait_bypass_count[4]_i_3__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_4__1 
       (.I0(wait_bypass_count_reg[5]),
        .O(\n_0_wait_bypass_count[4]_i_4__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_5__1 
       (.I0(wait_bypass_count_reg[4]),
        .O(\n_0_wait_bypass_count[4]_i_5__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_2__1 
       (.I0(wait_bypass_count_reg[11]),
        .O(\n_0_wait_bypass_count[8]_i_2__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_3__1 
       (.I0(wait_bypass_count_reg[10]),
        .O(\n_0_wait_bypass_count[8]_i_3__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_4__1 
       (.I0(wait_bypass_count_reg[9]),
        .O(\n_0_wait_bypass_count[8]_i_4__1 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_5__1 
       (.I0(wait_bypass_count_reg[8]),
        .O(\n_0_wait_bypass_count[8]_i_5__1 ));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[0] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_7_wait_bypass_count_reg[0]_i_3__1 ),
        .Q(wait_bypass_count_reg[0]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
CARRY4 \wait_bypass_count_reg[0]_i_3__1 
       (.CI(1'b0),
        .CO({\n_0_wait_bypass_count_reg[0]_i_3__1 ,\n_1_wait_bypass_count_reg[0]_i_3__1 ,\n_2_wait_bypass_count_reg[0]_i_3__1 ,\n_3_wait_bypass_count_reg[0]_i_3__1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\n_4_wait_bypass_count_reg[0]_i_3__1 ,\n_5_wait_bypass_count_reg[0]_i_3__1 ,\n_6_wait_bypass_count_reg[0]_i_3__1 ,\n_7_wait_bypass_count_reg[0]_i_3__1 }),
        .S({\n_0_wait_bypass_count[0]_i_6__1 ,\n_0_wait_bypass_count[0]_i_7__1 ,\n_0_wait_bypass_count[0]_i_8__1 ,\n_0_wait_bypass_count[0]_i_9__1 }));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[10] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_5_wait_bypass_count_reg[8]_i_1__1 ),
        .Q(wait_bypass_count_reg[10]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[11] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_4_wait_bypass_count_reg[8]_i_1__1 ),
        .Q(wait_bypass_count_reg[11]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[12] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_7_wait_bypass_count_reg[12]_i_1__1 ),
        .Q(wait_bypass_count_reg[12]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
CARRY4 \wait_bypass_count_reg[12]_i_1__1 
       (.CI(\n_0_wait_bypass_count_reg[8]_i_1__1 ),
        .CO(\NLW_wait_bypass_count_reg[12]_i_1__1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_wait_bypass_count_reg[12]_i_1__1_O_UNCONNECTED [3:1],\n_7_wait_bypass_count_reg[12]_i_1__1 }),
        .S({1'b0,1'b0,1'b0,\n_0_wait_bypass_count[12]_i_2__1 }));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[1] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_6_wait_bypass_count_reg[0]_i_3__1 ),
        .Q(wait_bypass_count_reg[1]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[2] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_5_wait_bypass_count_reg[0]_i_3__1 ),
        .Q(wait_bypass_count_reg[2]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[3] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_4_wait_bypass_count_reg[0]_i_3__1 ),
        .Q(wait_bypass_count_reg[3]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[4] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_7_wait_bypass_count_reg[4]_i_1__1 ),
        .Q(wait_bypass_count_reg[4]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
CARRY4 \wait_bypass_count_reg[4]_i_1__1 
       (.CI(\n_0_wait_bypass_count_reg[0]_i_3__1 ),
        .CO({\n_0_wait_bypass_count_reg[4]_i_1__1 ,\n_1_wait_bypass_count_reg[4]_i_1__1 ,\n_2_wait_bypass_count_reg[4]_i_1__1 ,\n_3_wait_bypass_count_reg[4]_i_1__1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_wait_bypass_count_reg[4]_i_1__1 ,\n_5_wait_bypass_count_reg[4]_i_1__1 ,\n_6_wait_bypass_count_reg[4]_i_1__1 ,\n_7_wait_bypass_count_reg[4]_i_1__1 }),
        .S({\n_0_wait_bypass_count[4]_i_2__1 ,\n_0_wait_bypass_count[4]_i_3__1 ,\n_0_wait_bypass_count[4]_i_4__1 ,\n_0_wait_bypass_count[4]_i_5__1 }));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[5] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_6_wait_bypass_count_reg[4]_i_1__1 ),
        .Q(wait_bypass_count_reg[5]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[6] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_5_wait_bypass_count_reg[4]_i_1__1 ),
        .Q(wait_bypass_count_reg[6]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[7] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_4_wait_bypass_count_reg[4]_i_1__1 ),
        .Q(wait_bypass_count_reg[7]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[8] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_7_wait_bypass_count_reg[8]_i_1__1 ),
        .Q(wait_bypass_count_reg[8]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
CARRY4 \wait_bypass_count_reg[8]_i_1__1 
       (.CI(\n_0_wait_bypass_count_reg[4]_i_1__1 ),
        .CO({\n_0_wait_bypass_count_reg[8]_i_1__1 ,\n_1_wait_bypass_count_reg[8]_i_1__1 ,\n_2_wait_bypass_count_reg[8]_i_1__1 ,\n_3_wait_bypass_count_reg[8]_i_1__1 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_wait_bypass_count_reg[8]_i_1__1 ,\n_5_wait_bypass_count_reg[8]_i_1__1 ,\n_6_wait_bypass_count_reg[8]_i_1__1 ,\n_7_wait_bypass_count_reg[8]_i_1__1 }),
        .S({\n_0_wait_bypass_count[8]_i_2__1 ,\n_0_wait_bypass_count[8]_i_3__1 ,\n_0_wait_bypass_count[8]_i_4__1 ,\n_0_wait_bypass_count[8]_i_5__1 }));
(* counter = "17" *) 
   FDRE \wait_bypass_count_reg[9] 
       (.C(gt2_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__1 ),
        .D(\n_6_wait_bypass_count_reg[8]_i_1__1 ),
        .Q(wait_bypass_count_reg[9]),
        .R(\n_0_wait_bypass_count[0]_i_1__1 ));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair84" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \wait_time_cnt[0]_i_1__1 
       (.I0(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0__1[0]));
(* SOFT_HLUTNM = "soft_lutpair84" *) 
   LUT2 #(
    .INIT(4'h9)) 
     \wait_time_cnt[1]_i_1__1 
       (.I0(wait_time_cnt_reg__0[1]),
        .I1(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0__1[1]));
(* SOFT_HLUTNM = "soft_lutpair80" *) 
   LUT3 #(
    .INIT(8'hA9)) 
     \wait_time_cnt[2]_i_1__1 
       (.I0(wait_time_cnt_reg__0[2]),
        .I1(wait_time_cnt_reg__0[0]),
        .I2(wait_time_cnt_reg__0[1]),
        .O(wait_time_cnt0__1[2]));
(* SOFT_HLUTNM = "soft_lutpair61" *) 
   LUT4 #(
    .INIT(16'hFE01)) 
     \wait_time_cnt[3]_i_1__1 
       (.I0(wait_time_cnt_reg__0[1]),
        .I1(wait_time_cnt_reg__0[0]),
        .I2(wait_time_cnt_reg__0[2]),
        .I3(wait_time_cnt_reg__0[3]),
        .O(wait_time_cnt0__1[3]));
(* SOFT_HLUTNM = "soft_lutpair61" *) 
   LUT5 #(
    .INIT(32'hAAAAAAA9)) 
     \wait_time_cnt[4]_i_1__1 
       (.I0(wait_time_cnt_reg__0[4]),
        .I1(wait_time_cnt_reg__0[3]),
        .I2(wait_time_cnt_reg__0[2]),
        .I3(wait_time_cnt_reg__0[0]),
        .I4(wait_time_cnt_reg__0[1]),
        .O(wait_time_cnt0__1[4]));
LUT6 #(
    .INIT(64'hF0F0F0F0F0F0F0E1)) 
     \wait_time_cnt[5]_i_1__1 
       (.I0(wait_time_cnt_reg__0[3]),
        .I1(wait_time_cnt_reg__0[2]),
        .I2(wait_time_cnt_reg__0[5]),
        .I3(wait_time_cnt_reg__0[4]),
        .I4(wait_time_cnt_reg__0[1]),
        .I5(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0__1[5]));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \wait_time_cnt[6]_i_1__1 
       (.I0(\n_0_FSM_onehot_rx_state[11]_i_6__0 ),
        .I1(\n_0_wait_time_cnt[6]_i_4__1 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_3__1 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I4(run_phase_alignment_int),
        .I5(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(\n_0_wait_time_cnt[6]_i_1__1 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \wait_time_cnt[6]_i_2__1 
       (.I0(wait_time_cnt_reg__0[6]),
        .I1(wait_time_cnt_reg__0[1]),
        .I2(wait_time_cnt_reg__0[0]),
        .I3(\n_0_wait_time_cnt[6]_i_5__1 ),
        .I4(wait_time_cnt_reg__0[4]),
        .I5(wait_time_cnt_reg__0[5]),
        .O(\n_0_wait_time_cnt[6]_i_2__1 ));
LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
     \wait_time_cnt[6]_i_3__1 
       (.I0(wait_time_cnt_reg__0[5]),
        .I1(wait_time_cnt_reg__0[4]),
        .I2(\n_0_wait_time_cnt[6]_i_5__1 ),
        .I3(wait_time_cnt_reg__0[0]),
        .I4(wait_time_cnt_reg__0[1]),
        .I5(wait_time_cnt_reg__0[6]),
        .O(wait_time_cnt0__1[6]));
(* SOFT_HLUTNM = "soft_lutpair74" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \wait_time_cnt[6]_i_4__1 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_wait_time_cnt[6]_i_4__1 ));
(* SOFT_HLUTNM = "soft_lutpair80" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \wait_time_cnt[6]_i_5__1 
       (.I0(wait_time_cnt_reg__0[2]),
        .I1(wait_time_cnt_reg__0[3]),
        .O(\n_0_wait_time_cnt[6]_i_5__1 ));
(* counter = "15" *) 
   FDRE \wait_time_cnt_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__1 ),
        .D(wait_time_cnt0__1[0]),
        .Q(wait_time_cnt_reg__0[0]),
        .R(\n_0_wait_time_cnt[6]_i_1__1 ));
(* counter = "15" *) 
   FDRE \wait_time_cnt_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__1 ),
        .D(wait_time_cnt0__1[1]),
        .Q(wait_time_cnt_reg__0[1]),
        .R(\n_0_wait_time_cnt[6]_i_1__1 ));
(* counter = "15" *) 
   FDSE \wait_time_cnt_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__1 ),
        .D(wait_time_cnt0__1[2]),
        .Q(wait_time_cnt_reg__0[2]),
        .S(\n_0_wait_time_cnt[6]_i_1__1 ));
(* counter = "15" *) 
   FDRE \wait_time_cnt_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__1 ),
        .D(wait_time_cnt0__1[3]),
        .Q(wait_time_cnt_reg__0[3]),
        .R(\n_0_wait_time_cnt[6]_i_1__1 ));
(* counter = "15" *) 
   FDRE \wait_time_cnt_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__1 ),
        .D(wait_time_cnt0__1[4]),
        .Q(wait_time_cnt_reg__0[4]),
        .R(\n_0_wait_time_cnt[6]_i_1__1 ));
(* counter = "15" *) 
   FDSE \wait_time_cnt_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__1 ),
        .D(wait_time_cnt0__1[5]),
        .Q(wait_time_cnt_reg__0[5]),
        .S(\n_0_wait_time_cnt[6]_i_1__1 ));
(* counter = "15" *) 
   FDSE \wait_time_cnt_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__1 ),
        .D(wait_time_cnt0__1[6]),
        .Q(wait_time_cnt_reg__0[6]),
        .S(\n_0_wait_time_cnt[6]_i_1__1 ));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_RX_STARTUP_FSM" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_2
   (GT3_RX_FSM_RESET_DONE_OUT,
    O1,
    O2,
    SYSCLK_IN,
    gt3_rxusrclk_in,
    SOFT_RESET_IN,
    I1,
    DONT_RESET_ON_DATA_ERROR_IN,
    gt3_rxresetdone_out,
    GT3_DATA_VALID_IN,
    GT0_QPLLLOCK_IN);
  output GT3_RX_FSM_RESET_DONE_OUT;
  output O1;
  output O2;
  input SYSCLK_IN;
  input gt3_rxusrclk_in;
  input SOFT_RESET_IN;
  input I1;
  input DONT_RESET_ON_DATA_ERROR_IN;
  input gt3_rxresetdone_out;
  input GT3_DATA_VALID_IN;
  input GT0_QPLLLOCK_IN;

  wire DONT_RESET_ON_DATA_ERROR_IN;
  wire GT0_QPLLLOCK_IN;
  wire GT3_DATA_VALID_IN;
  wire GT3_RX_FSM_RESET_DONE_OUT;
  wire I1;
  wire O1;
  wire O2;
  wire SOFT_RESET_IN;
  wire SYSCLK_IN;
  wire check_tlock_max;
  wire gt3_rxresetdone_out;
  wire gt3_rxusrclk_in;
  wire [4:0]init_wait_count_reg__0;
  wire init_wait_done;
  wire [9:0]mmcm_lock_count_reg__0;
  wire mmcm_lock_reclocked;
  wire \n_0_FSM_onehot_rx_state[10]_i_1__2 ;
  wire \n_0_FSM_onehot_rx_state[10]_i_2__2 ;
  wire \n_0_FSM_onehot_rx_state[10]_i_3__2 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_10__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_11__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_12__2 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_14__2 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_15__2 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_16__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_5__2 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_6__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_8__1 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_10__2 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_2__2 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_4__2 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_5__2 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_6__2 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_7__2 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_8__2 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_1__2 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_2__2 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_3__2 ;
  wire \n_0_FSM_onehot_rx_state[3]_i_4__2 ;
  wire \n_0_FSM_onehot_rx_state[4]_i_1__2 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_1__2 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_2__2 ;
  wire \n_0_FSM_onehot_rx_state[5]_i_3__2 ;
  wire \n_0_FSM_onehot_rx_state[6]_i_1__2 ;
  wire \n_0_FSM_onehot_rx_state[6]_i_2__2 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_1__2 ;
  wire \n_0_FSM_onehot_rx_state[7]_i_2__2 ;
  wire \n_0_FSM_onehot_rx_state[8]_i_1__2 ;
  wire \n_0_FSM_onehot_rx_state[9]_i_1__2 ;
  wire \n_0_FSM_onehot_rx_state[9]_i_2__2 ;
  wire \n_0_FSM_onehot_rx_state_reg[10] ;
  wire \n_0_FSM_onehot_rx_state_reg[11] ;
  wire \n_0_FSM_onehot_rx_state_reg[1] ;
  wire \n_0_FSM_onehot_rx_state_reg[2] ;
  wire \n_0_FSM_onehot_rx_state_reg[3] ;
  wire \n_0_FSM_onehot_rx_state_reg[4] ;
  wire \n_0_FSM_onehot_rx_state_reg[5] ;
  wire \n_0_FSM_onehot_rx_state_reg[7] ;
  wire \n_0_FSM_onehot_rx_state_reg[8] ;
  wire n_0_RXUSERRDY_i_1__2;
  wire n_0_check_tlock_max_i_1__2;
  wire n_0_check_tlock_max_reg;
  wire n_0_gtrxreset_i_i_1__2;
  wire \n_0_init_wait_count[4]_i_1__2 ;
  wire n_0_init_wait_done_i_1__2;
  wire \n_0_mmcm_lock_count[0]_i_1__2 ;
  wire \n_0_mmcm_lock_count[9]_i_2__2 ;
  wire \n_0_mmcm_lock_count[9]_i_4__2 ;
  wire n_0_mmcm_lock_reclocked_i_2__2;
  wire n_0_pll_reset_asserted_i_1__2;
  wire n_0_pll_reset_asserted_reg;
  wire n_0_reset_time_out_i_11__2;
  wire n_0_reset_time_out_i_12__2;
  wire n_0_reset_time_out_i_13__2;
  wire n_0_reset_time_out_i_4__2;
  wire n_0_reset_time_out_i_5__2;
  wire n_0_reset_time_out_i_6__2;
  wire n_0_reset_time_out_i_8__2;
  wire n_0_reset_time_out_i_9__2;
  wire n_0_reset_time_out_reg;
  wire n_0_run_phase_alignment_int_i_1__2;
  wire n_0_run_phase_alignment_int_i_2__2;
  wire n_0_run_phase_alignment_int_reg;
  wire n_0_run_phase_alignment_int_s3_reg;
  wire n_0_rx_fsm_reset_done_int_i_3__2;
  wire n_0_rx_fsm_reset_done_int_i_6__2;
  wire n_0_rx_fsm_reset_done_int_s3_reg;
  wire n_0_sync_QPLLLOCK;
  wire n_0_sync_data_valid;
  wire n_0_sync_mmcm_lock_reclocked;
  wire n_0_time_out_100us_i_1__2;
  wire n_0_time_out_100us_i_2__2;
  wire n_0_time_out_100us_i_3__2;
  wire n_0_time_out_100us_reg;
  wire n_0_time_out_1us_i_1__2;
  wire n_0_time_out_1us_i_2__2;
  wire n_0_time_out_1us_i_3__2;
  wire n_0_time_out_1us_reg;
  wire n_0_time_out_2ms_i_1__2;
  wire n_0_time_out_2ms_i_2__2;
  wire n_0_time_out_2ms_i_3__2;
  wire n_0_time_out_2ms_reg;
  wire \n_0_time_out_counter[0]_i_1__2 ;
  wire \n_0_time_out_counter[0]_i_3__2 ;
  wire \n_0_time_out_counter[0]_i_4__2 ;
  wire \n_0_time_out_counter[0]_i_5__2 ;
  wire \n_0_time_out_counter[0]_i_6__2 ;
  wire \n_0_time_out_counter[0]_i_7__2 ;
  wire \n_0_time_out_counter[0]_i_8__2 ;
  wire \n_0_time_out_counter[0]_i_9__2 ;
  wire \n_0_time_out_counter[12]_i_2__2 ;
  wire \n_0_time_out_counter[12]_i_3__2 ;
  wire \n_0_time_out_counter[12]_i_4__2 ;
  wire \n_0_time_out_counter[12]_i_5__2 ;
  wire \n_0_time_out_counter[16]_i_2__2 ;
  wire \n_0_time_out_counter[4]_i_2__2 ;
  wire \n_0_time_out_counter[4]_i_3__2 ;
  wire \n_0_time_out_counter[4]_i_4__2 ;
  wire \n_0_time_out_counter[4]_i_5__2 ;
  wire \n_0_time_out_counter[8]_i_2__2 ;
  wire \n_0_time_out_counter[8]_i_3__2 ;
  wire \n_0_time_out_counter[8]_i_4__2 ;
  wire \n_0_time_out_counter[8]_i_5__2 ;
  wire \n_0_time_out_counter_reg[0]_i_2__2 ;
  wire \n_0_time_out_counter_reg[12]_i_1__2 ;
  wire \n_0_time_out_counter_reg[4]_i_1__2 ;
  wire \n_0_time_out_counter_reg[8]_i_1__2 ;
  wire n_0_time_out_wait_bypass_i_1__2;
  wire n_0_time_out_wait_bypass_reg;
  wire n_0_time_tlock_max_i_10__2;
  wire n_0_time_tlock_max_i_11__2;
  wire n_0_time_tlock_max_i_12__2;
  wire n_0_time_tlock_max_i_13__2;
  wire n_0_time_tlock_max_i_14__2;
  wire n_0_time_tlock_max_i_15__2;
  wire n_0_time_tlock_max_i_16__2;
  wire n_0_time_tlock_max_i_17__2;
  wire n_0_time_tlock_max_i_18__2;
  wire n_0_time_tlock_max_i_1__2;
  wire n_0_time_tlock_max_i_4__2;
  wire n_0_time_tlock_max_i_6__2;
  wire n_0_time_tlock_max_i_7__2;
  wire n_0_time_tlock_max_i_8__2;
  wire n_0_time_tlock_max_i_9__2;
  wire n_0_time_tlock_max_reg_i_3__2;
  wire n_0_time_tlock_max_reg_i_5__2;
  wire \n_0_wait_bypass_count[0]_i_1__2 ;
  wire \n_0_wait_bypass_count[0]_i_2__2 ;
  wire \n_0_wait_bypass_count[0]_i_4__2 ;
  wire \n_0_wait_bypass_count[0]_i_5__2 ;
  wire \n_0_wait_bypass_count[0]_i_6__2 ;
  wire \n_0_wait_bypass_count[0]_i_7__2 ;
  wire \n_0_wait_bypass_count[0]_i_8__2 ;
  wire \n_0_wait_bypass_count[0]_i_9__2 ;
  wire \n_0_wait_bypass_count[12]_i_2__2 ;
  wire \n_0_wait_bypass_count[4]_i_2__2 ;
  wire \n_0_wait_bypass_count[4]_i_3__2 ;
  wire \n_0_wait_bypass_count[4]_i_4__2 ;
  wire \n_0_wait_bypass_count[4]_i_5__2 ;
  wire \n_0_wait_bypass_count[8]_i_2__2 ;
  wire \n_0_wait_bypass_count[8]_i_3__2 ;
  wire \n_0_wait_bypass_count[8]_i_4__2 ;
  wire \n_0_wait_bypass_count[8]_i_5__2 ;
  wire \n_0_wait_bypass_count_reg[0]_i_3__2 ;
  wire \n_0_wait_bypass_count_reg[4]_i_1__2 ;
  wire \n_0_wait_bypass_count_reg[8]_i_1__2 ;
  wire \n_0_wait_time_cnt[6]_i_1__2 ;
  wire \n_0_wait_time_cnt[6]_i_2__2 ;
  wire \n_0_wait_time_cnt[6]_i_4__2 ;
  wire \n_0_wait_time_cnt[6]_i_5__2 ;
  wire n_1_sync_QPLLLOCK;
  wire n_1_sync_data_valid;
  wire n_1_sync_mmcm_lock_reclocked;
  wire \n_1_time_out_counter_reg[0]_i_2__2 ;
  wire \n_1_time_out_counter_reg[12]_i_1__2 ;
  wire \n_1_time_out_counter_reg[4]_i_1__2 ;
  wire \n_1_time_out_counter_reg[8]_i_1__2 ;
  wire n_1_time_tlock_max_reg_i_3__2;
  wire n_1_time_tlock_max_reg_i_5__2;
  wire \n_1_wait_bypass_count_reg[0]_i_3__2 ;
  wire \n_1_wait_bypass_count_reg[4]_i_1__2 ;
  wire \n_1_wait_bypass_count_reg[8]_i_1__2 ;
  wire n_2_sync_QPLLLOCK;
  wire n_2_sync_data_valid;
  wire \n_2_time_out_counter_reg[0]_i_2__2 ;
  wire \n_2_time_out_counter_reg[12]_i_1__2 ;
  wire \n_2_time_out_counter_reg[4]_i_1__2 ;
  wire \n_2_time_out_counter_reg[8]_i_1__2 ;
  wire n_2_time_tlock_max_reg_i_3__2;
  wire n_2_time_tlock_max_reg_i_5__2;
  wire \n_2_wait_bypass_count_reg[0]_i_3__2 ;
  wire \n_2_wait_bypass_count_reg[4]_i_1__2 ;
  wire \n_2_wait_bypass_count_reg[8]_i_1__2 ;
  wire n_3_sync_QPLLLOCK;
  wire n_3_sync_data_valid;
  wire \n_3_time_out_counter_reg[0]_i_2__2 ;
  wire \n_3_time_out_counter_reg[12]_i_1__2 ;
  wire \n_3_time_out_counter_reg[4]_i_1__2 ;
  wire \n_3_time_out_counter_reg[8]_i_1__2 ;
  wire n_3_time_tlock_max_reg_i_3__2;
  wire n_3_time_tlock_max_reg_i_5__2;
  wire \n_3_wait_bypass_count_reg[0]_i_3__2 ;
  wire \n_3_wait_bypass_count_reg[4]_i_1__2 ;
  wire \n_3_wait_bypass_count_reg[8]_i_1__2 ;
  wire n_4_sync_data_valid;
  wire \n_4_time_out_counter_reg[0]_i_2__2 ;
  wire \n_4_time_out_counter_reg[12]_i_1__2 ;
  wire \n_4_time_out_counter_reg[4]_i_1__2 ;
  wire \n_4_time_out_counter_reg[8]_i_1__2 ;
  wire \n_4_wait_bypass_count_reg[0]_i_3__2 ;
  wire \n_4_wait_bypass_count_reg[4]_i_1__2 ;
  wire \n_4_wait_bypass_count_reg[8]_i_1__2 ;
  wire n_5_sync_data_valid;
  wire \n_5_time_out_counter_reg[0]_i_2__2 ;
  wire \n_5_time_out_counter_reg[12]_i_1__2 ;
  wire \n_5_time_out_counter_reg[4]_i_1__2 ;
  wire \n_5_time_out_counter_reg[8]_i_1__2 ;
  wire \n_5_wait_bypass_count_reg[0]_i_3__2 ;
  wire \n_5_wait_bypass_count_reg[4]_i_1__2 ;
  wire \n_5_wait_bypass_count_reg[8]_i_1__2 ;
  wire \n_6_time_out_counter_reg[0]_i_2__2 ;
  wire \n_6_time_out_counter_reg[12]_i_1__2 ;
  wire \n_6_time_out_counter_reg[4]_i_1__2 ;
  wire \n_6_time_out_counter_reg[8]_i_1__2 ;
  wire \n_6_wait_bypass_count_reg[0]_i_3__2 ;
  wire \n_6_wait_bypass_count_reg[4]_i_1__2 ;
  wire \n_6_wait_bypass_count_reg[8]_i_1__2 ;
  wire \n_7_time_out_counter_reg[0]_i_2__2 ;
  wire \n_7_time_out_counter_reg[12]_i_1__2 ;
  wire \n_7_time_out_counter_reg[16]_i_1__2 ;
  wire \n_7_time_out_counter_reg[4]_i_1__2 ;
  wire \n_7_time_out_counter_reg[8]_i_1__2 ;
  wire \n_7_wait_bypass_count_reg[0]_i_3__2 ;
  wire \n_7_wait_bypass_count_reg[12]_i_1__2 ;
  wire \n_7_wait_bypass_count_reg[4]_i_1__2 ;
  wire \n_7_wait_bypass_count_reg[8]_i_1__2 ;
  wire [4:0]p_0_in__2;
  wire [9:1]p_0_in__6;
  wire run_phase_alignment_int;
  wire run_phase_alignment_int_s2;
  wire rx_fsm_reset_done_int_s2;
  wire rxresetdone_s2;
  wire rxresetdone_s3;
  wire [16:0]time_out_counter_reg;
  wire time_out_wait_bypass_s2;
  wire time_out_wait_bypass_s3;
  wire time_tlock_max;
  wire time_tlock_max1;
  wire [12:0]wait_bypass_count_reg;
  wire [6:0]wait_time_cnt0__2;
  wire [6:0]wait_time_cnt_reg__0;
  wire [3:0]\NLW_time_out_counter_reg[16]_i_1__2_CO_UNCONNECTED ;
  wire [3:1]\NLW_time_out_counter_reg[16]_i_1__2_O_UNCONNECTED ;
  wire [3:1]NLW_time_tlock_max_reg_i_2__2_CO_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_2__2_O_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_3__2_O_UNCONNECTED;
  wire [3:0]NLW_time_tlock_max_reg_i_5__2_O_UNCONNECTED;
  wire [3:0]\NLW_wait_bypass_count_reg[12]_i_1__2_CO_UNCONNECTED ;
  wire [3:1]\NLW_wait_bypass_count_reg[12]_i_1__2_O_UNCONNECTED ;

LUT6 #(
    .INIT(64'h000000000000010C)) 
     \FSM_onehot_rx_state[10]_i_1__2 
       (.I0(time_out_wait_bypass_s3),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[10]_i_2__2 ),
        .I5(\n_0_FSM_onehot_rx_state[10]_i_3__2 ),
        .O(\n_0_FSM_onehot_rx_state[10]_i_1__2 ));
(* SOFT_HLUTNM = "soft_lutpair96" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[10]_i_2__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(\n_0_FSM_onehot_rx_state[10]_i_2__2 ));
(* SOFT_HLUTNM = "soft_lutpair105" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[10]_i_3__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I3(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[10]_i_3__2 ));
LUT6 #(
    .INIT(64'hFFFEFFFEFFFE0000)) 
     \FSM_onehot_rx_state[11]_i_10__1 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[10] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_10__1 ));
(* SOFT_HLUTNM = "soft_lutpair111" *) 
   LUT3 #(
    .INIT(8'h08)) 
     \FSM_onehot_rx_state[11]_i_11__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(n_0_time_out_2ms_reg),
        .I2(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[11]_i_11__1 ));
(* SOFT_HLUTNM = "soft_lutpair90" *) 
   LUT5 #(
    .INIT(32'h8F888888)) 
     \FSM_onehot_rx_state[11]_i_12__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I2(n_0_reset_time_out_reg),
        .I3(time_tlock_max),
        .I4(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[11]_i_12__2 ));
LUT6 #(
    .INIT(64'hF8F8F8F8F8F8F888)) 
     \FSM_onehot_rx_state[11]_i_14__2 
       (.I0(check_tlock_max),
        .I1(mmcm_lock_reclocked),
        .I2(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_14__2 ));
LUT6 #(
    .INIT(64'hFCFCFCECFCFCFCE0)) 
     \FSM_onehot_rx_state[11]_i_15__2 
       (.I0(I1),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(check_tlock_max),
        .I5(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[11]_i_15__2 ));
(* SOFT_HLUTNM = "soft_lutpair96" *) 
   LUT5 #(
    .INIT(32'h00000203)) 
     \FSM_onehot_rx_state[11]_i_16__1 
       (.I0(init_wait_done),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_16__1 ));
LUT6 #(
    .INIT(64'hEEEEEEEEEEEEEEE0)) 
     \FSM_onehot_rx_state[11]_i_5__2 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_3__2 ),
        .I1(\n_0_FSM_onehot_rx_state[10]_i_3__2 ),
        .I2(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I5(\n_0_FSM_onehot_rx_state_reg[8] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_5__2 ));
(* SOFT_HLUTNM = "soft_lutpair90" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[11]_i_6__1 
       (.I0(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_6__1 ));
LUT2 #(
    .INIT(4'h8)) 
     \FSM_onehot_rx_state[11]_i_8__1 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_FSM_onehot_rx_state[11]_i_8__1 ));
(* SOFT_HLUTNM = "soft_lutpair106" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \FSM_onehot_rx_state[2]_i_10__2 
       (.I0(n_0_reset_time_out_reg),
        .I1(time_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[2]_i_10__2 ));
LUT6 #(
    .INIT(64'h00000000000C0400)) 
     \FSM_onehot_rx_state[2]_i_2__2 
       (.I0(\n_0_FSM_onehot_rx_state[2]_i_6__2 ),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_7__2 ),
        .I2(\n_0_FSM_onehot_rx_state[2]_i_8__2 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_6__1 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_2__2 ));
LUT6 #(
    .INIT(64'h0000000000000400)) 
     \FSM_onehot_rx_state[2]_i_4__2 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4__2 ),
        .I1(\n_0_FSM_onehot_rx_state[5]_i_3__2 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2__2 ),
        .I3(check_tlock_max),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I5(\n_0_FSM_onehot_rx_state[2]_i_10__2 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_4__2 ));
LUT6 #(
    .INIT(64'h0000001000000000)) 
     \FSM_onehot_rx_state[2]_i_5__2 
       (.I0(\n_0_FSM_onehot_rx_state[10]_i_3__2 ),
        .I1(\n_0_FSM_onehot_rx_state[10]_i_2__2 ),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I5(time_out_wait_bypass_s3),
        .O(\n_0_FSM_onehot_rx_state[2]_i_5__2 ));
(* SOFT_HLUTNM = "soft_lutpair104" *) 
   LUT2 #(
    .INIT(4'hB)) 
     \FSM_onehot_rx_state[2]_i_6__2 
       (.I0(n_0_reset_time_out_reg),
        .I1(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[2]_i_6__2 ));
(* SOFT_HLUTNM = "soft_lutpair94" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[2]_i_7__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(run_phase_alignment_int),
        .O(\n_0_FSM_onehot_rx_state[2]_i_7__2 ));
(* SOFT_HLUTNM = "soft_lutpair93" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[2]_i_8__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_8__2 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \FSM_onehot_rx_state[3]_i_1__2 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2__2 ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_3__2 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__2 ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_1__2 ));
(* SOFT_HLUTNM = "soft_lutpair91" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[3]_i_2__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_2__2 ));
(* SOFT_HLUTNM = "soft_lutpair109" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \FSM_onehot_rx_state[3]_i_3__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_3__2 ));
(* SOFT_HLUTNM = "soft_lutpair101" *) 
   LUT4 #(
    .INIT(16'hFFFE)) 
     \FSM_onehot_rx_state[3]_i_4__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .O(\n_0_FSM_onehot_rx_state[3]_i_4__2 ));
(* SOFT_HLUTNM = "soft_lutpair97" *) 
   LUT5 #(
    .INIT(32'h00020000)) 
     \FSM_onehot_rx_state[4]_i_1__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state[9]_i_2__2 ),
        .O(\n_0_FSM_onehot_rx_state[4]_i_1__2 ));
(* SOFT_HLUTNM = "soft_lutpair111" *) 
   LUT2 #(
    .INIT(4'h2)) 
     \FSM_onehot_rx_state[5]_i_1__2 
       (.I0(\n_0_FSM_onehot_rx_state[5]_i_2__2 ),
        .I1(n_0_time_out_2ms_reg),
        .O(\n_0_FSM_onehot_rx_state[5]_i_1__2 ));
LUT6 #(
    .INIT(64'h0000000000040000)) 
     \FSM_onehot_rx_state[5]_i_2__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(check_tlock_max),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(\n_0_FSM_onehot_rx_state[5]_i_3__2 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__2 ),
        .O(\n_0_FSM_onehot_rx_state[5]_i_2__2 ));
(* SOFT_HLUTNM = "soft_lutpair109" *) 
   LUT3 #(
    .INIT(8'h01)) 
     \FSM_onehot_rx_state[5]_i_3__2 
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[10] ),
        .O(\n_0_FSM_onehot_rx_state[5]_i_3__2 ));
(* SOFT_HLUTNM = "soft_lutpair105" *) 
   LUT3 #(
    .INIT(8'h40)) 
     \FSM_onehot_rx_state[6]_i_1__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state[6]_i_2__2 ),
        .O(\n_0_FSM_onehot_rx_state[6]_i_1__2 ));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \FSM_onehot_rx_state[6]_i_2__2 
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4__2 ),
        .I1(run_phase_alignment_int),
        .I2(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I5(check_tlock_max),
        .O(\n_0_FSM_onehot_rx_state[6]_i_2__2 ));
(* SOFT_HLUTNM = "soft_lutpair106" *) 
   LUT3 #(
    .INIT(8'hA2)) 
     \FSM_onehot_rx_state[7]_i_1__2 
       (.I0(\n_0_FSM_onehot_rx_state[7]_i_2__2 ),
        .I1(time_tlock_max),
        .I2(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[7]_i_1__2 ));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \FSM_onehot_rx_state[7]_i_2__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_2__2 ),
        .I3(run_phase_alignment_int),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_3__2 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__2 ),
        .O(\n_0_FSM_onehot_rx_state[7]_i_2__2 ));
(* SOFT_HLUTNM = "soft_lutpair97" *) 
   LUT5 #(
    .INIT(32'h00100000)) 
     \FSM_onehot_rx_state[8]_i_1__2 
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I4(\n_0_FSM_onehot_rx_state[9]_i_2__2 ),
        .O(\n_0_FSM_onehot_rx_state[8]_i_1__2 ));
LUT6 #(
    .INIT(64'h0008000800000008)) 
     \FSM_onehot_rx_state[9]_i_1__2 
       (.I0(\n_0_FSM_onehot_rx_state[9]_i_2__2 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_6__1 ),
        .I4(n_0_time_out_2ms_reg),
        .I5(n_0_reset_time_out_reg),
        .O(\n_0_FSM_onehot_rx_state[9]_i_1__2 ));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     \FSM_onehot_rx_state[9]_i_2__2 
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_2__2 ),
        .I4(check_tlock_max),
        .I5(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_FSM_onehot_rx_state[9]_i_2__2 ));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[10] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[10]_i_1__2 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[10] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[11] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(n_1_sync_data_valid),
        .Q(\n_0_FSM_onehot_rx_state_reg[11] ),
        .R(SOFT_RESET_IN));
FDSE #(
    .INIT(1'b1)) 
     \FSM_onehot_rx_state_reg[1] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(1'b0),
        .Q(\n_0_FSM_onehot_rx_state_reg[1] ),
        .S(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[2] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(n_2_sync_data_valid),
        .Q(\n_0_FSM_onehot_rx_state_reg[2] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[3] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[3]_i_1__2 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[3] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[4] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[4]_i_1__2 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[4] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[5] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[5]_i_1__2 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[5] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[6] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[6]_i_1__2 ),
        .Q(check_tlock_max),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[7] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[7]_i_1__2 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[7] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[8] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[8]_i_1__2 ),
        .Q(\n_0_FSM_onehot_rx_state_reg[8] ),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     \FSM_onehot_rx_state_reg[9] 
       (.C(SYSCLK_IN),
        .CE(n_0_sync_data_valid),
        .D(\n_0_FSM_onehot_rx_state[9]_i_1__2 ),
        .Q(run_phase_alignment_int),
        .R(SOFT_RESET_IN));
LUT6 #(
    .INIT(64'hCCCCFFFFCCCC0008)) 
     RXUSERRDY_i_1__2
       (.I0(\n_0_FSM_onehot_rx_state[9]_i_2__2 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_6__1 ),
        .I4(\n_0_FSM_onehot_rx_state[3]_i_1__2 ),
        .I5(O1),
        .O(n_0_RXUSERRDY_i_1__2));
FDRE #(
    .INIT(1'b0)) 
     RXUSERRDY_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_RXUSERRDY_i_1__2),
        .Q(O1),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair102" *) 
   LUT4 #(
    .INIT(16'hABA8)) 
     check_tlock_max_i_1__2
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state[7]_i_2__2 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1__2 ),
        .I3(n_0_check_tlock_max_reg),
        .O(n_0_check_tlock_max_i_1__2));
FDRE #(
    .INIT(1'b0)) 
     check_tlock_max_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_check_tlock_max_i_1__2),
        .Q(n_0_check_tlock_max_reg),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair91" *) 
   LUT5 #(
    .INIT(32'h33F73300)) 
     gtrxreset_i_i_1__2
       (.I0(\n_0_FSM_onehot_rx_state[6]_i_2__2 ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_1__2 ),
        .I4(O2),
        .O(n_0_gtrxreset_i_i_1__2));
FDRE #(
    .INIT(1'b0)) 
     gtrxreset_i_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_gtrxreset_i_i_1__2),
        .Q(O2),
        .R(SOFT_RESET_IN));
LUT1 #(
    .INIT(2'h1)) 
     \init_wait_count[0]_i_1__2 
       (.I0(init_wait_count_reg__0[0]),
        .O(p_0_in__2[0]));
(* SOFT_HLUTNM = "soft_lutpair107" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \init_wait_count[1]_i_1__2 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .O(p_0_in__2[1]));
(* SOFT_HLUTNM = "soft_lutpair107" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \init_wait_count[2]_i_1__2 
       (.I0(init_wait_count_reg__0[1]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[2]),
        .O(p_0_in__2[2]));
(* SOFT_HLUTNM = "soft_lutpair88" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \init_wait_count[3]_i_1__2 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[3]),
        .O(p_0_in__2[3]));
LUT5 #(
    .INIT(32'hDFFFFFFF)) 
     \init_wait_count[4]_i_1__2 
       (.I0(init_wait_count_reg__0[2]),
        .I1(init_wait_count_reg__0[0]),
        .I2(init_wait_count_reg__0[1]),
        .I3(init_wait_count_reg__0[4]),
        .I4(init_wait_count_reg__0[3]),
        .O(\n_0_init_wait_count[4]_i_1__2 ));
(* SOFT_HLUTNM = "soft_lutpair88" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \init_wait_count[4]_i_2__2 
       (.I0(init_wait_count_reg__0[3]),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[0]),
        .I3(init_wait_count_reg__0[2]),
        .I4(init_wait_count_reg__0[4]),
        .O(p_0_in__2[4]));
(* counter = "18" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__2 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__2[0]),
        .Q(init_wait_count_reg__0[0]));
(* counter = "18" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__2 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__2[1]),
        .Q(init_wait_count_reg__0[1]));
(* counter = "18" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__2 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__2[2]),
        .Q(init_wait_count_reg__0[2]));
(* counter = "18" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__2 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__2[3]),
        .Q(init_wait_count_reg__0[3]));
(* counter = "18" *) 
   FDCE #(
    .INIT(1'b0)) 
     \init_wait_count_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_init_wait_count[4]_i_1__2 ),
        .CLR(SOFT_RESET_IN),
        .D(p_0_in__2[4]),
        .Q(init_wait_count_reg__0[4]));
LUT6 #(
    .INIT(64'hFFFFFFFF40000000)) 
     init_wait_done_i_1__2
       (.I0(init_wait_count_reg__0[0]),
        .I1(init_wait_count_reg__0[1]),
        .I2(init_wait_count_reg__0[4]),
        .I3(init_wait_count_reg__0[3]),
        .I4(init_wait_count_reg__0[2]),
        .I5(init_wait_done),
        .O(n_0_init_wait_done_i_1__2));
FDCE #(
    .INIT(1'b0)) 
     init_wait_done_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .CLR(SOFT_RESET_IN),
        .D(n_0_init_wait_done_i_1__2),
        .Q(init_wait_done));
LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[0]_i_1__2 
       (.I0(mmcm_lock_count_reg__0[0]),
        .O(\n_0_mmcm_lock_count[0]_i_1__2 ));
(* SOFT_HLUTNM = "soft_lutpair110" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \mmcm_lock_count[1]_i_1__2 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .O(p_0_in__6[1]));
(* SOFT_HLUTNM = "soft_lutpair110" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \mmcm_lock_count[2]_i_1__2 
       (.I0(mmcm_lock_count_reg__0[1]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[2]),
        .O(p_0_in__6[2]));
(* SOFT_HLUTNM = "soft_lutpair98" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \mmcm_lock_count[3]_i_1__2 
       (.I0(mmcm_lock_count_reg__0[2]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[1]),
        .I3(mmcm_lock_count_reg__0[3]),
        .O(p_0_in__6[3]));
(* SOFT_HLUTNM = "soft_lutpair98" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \mmcm_lock_count[4]_i_1__2 
       (.I0(mmcm_lock_count_reg__0[1]),
        .I1(mmcm_lock_count_reg__0[0]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[3]),
        .I4(mmcm_lock_count_reg__0[4]),
        .O(p_0_in__6[4]));
LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
     \mmcm_lock_count[5]_i_1__2 
       (.I0(mmcm_lock_count_reg__0[4]),
        .I1(mmcm_lock_count_reg__0[3]),
        .I2(mmcm_lock_count_reg__0[2]),
        .I3(mmcm_lock_count_reg__0[0]),
        .I4(mmcm_lock_count_reg__0[1]),
        .I5(mmcm_lock_count_reg__0[5]),
        .O(p_0_in__6[5]));
LUT2 #(
    .INIT(4'h9)) 
     \mmcm_lock_count[6]_i_1__2 
       (.I0(\n_0_mmcm_lock_count[9]_i_4__2 ),
        .I1(mmcm_lock_count_reg__0[6]),
        .O(p_0_in__6[6]));
(* SOFT_HLUTNM = "soft_lutpair99" *) 
   LUT3 #(
    .INIT(8'hD2)) 
     \mmcm_lock_count[7]_i_1__2 
       (.I0(mmcm_lock_count_reg__0[6]),
        .I1(\n_0_mmcm_lock_count[9]_i_4__2 ),
        .I2(mmcm_lock_count_reg__0[7]),
        .O(p_0_in__6[7]));
(* SOFT_HLUTNM = "soft_lutpair99" *) 
   LUT4 #(
    .INIT(16'hDF20)) 
     \mmcm_lock_count[8]_i_1__2 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(\n_0_mmcm_lock_count[9]_i_4__2 ),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[8]),
        .O(p_0_in__6[8]));
LUT5 #(
    .INIT(32'hDFFFFFFF)) 
     \mmcm_lock_count[9]_i_2__2 
       (.I0(mmcm_lock_count_reg__0[7]),
        .I1(\n_0_mmcm_lock_count[9]_i_4__2 ),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(mmcm_lock_count_reg__0[8]),
        .I4(mmcm_lock_count_reg__0[9]),
        .O(\n_0_mmcm_lock_count[9]_i_2__2 ));
(* SOFT_HLUTNM = "soft_lutpair95" *) 
   LUT5 #(
    .INIT(32'hF7FF0800)) 
     \mmcm_lock_count[9]_i_3__2 
       (.I0(mmcm_lock_count_reg__0[8]),
        .I1(mmcm_lock_count_reg__0[6]),
        .I2(\n_0_mmcm_lock_count[9]_i_4__2 ),
        .I3(mmcm_lock_count_reg__0[7]),
        .I4(mmcm_lock_count_reg__0[9]),
        .O(p_0_in__6[9]));
LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
     \mmcm_lock_count[9]_i_4__2 
       (.I0(mmcm_lock_count_reg__0[0]),
        .I1(mmcm_lock_count_reg__0[1]),
        .I2(mmcm_lock_count_reg__0[4]),
        .I3(mmcm_lock_count_reg__0[5]),
        .I4(mmcm_lock_count_reg__0[2]),
        .I5(mmcm_lock_count_reg__0[3]),
        .O(\n_0_mmcm_lock_count[9]_i_4__2 ));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__2 ),
        .D(\n_0_mmcm_lock_count[0]_i_1__2 ),
        .Q(mmcm_lock_count_reg__0[0]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__2 ),
        .D(p_0_in__6[1]),
        .Q(mmcm_lock_count_reg__0[1]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__2 ),
        .D(p_0_in__6[2]),
        .Q(mmcm_lock_count_reg__0[2]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__2 ),
        .D(p_0_in__6[3]),
        .Q(mmcm_lock_count_reg__0[3]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__2 ),
        .D(p_0_in__6[4]),
        .Q(mmcm_lock_count_reg__0[4]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__2 ),
        .D(p_0_in__6[5]),
        .Q(mmcm_lock_count_reg__0[5]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__2 ),
        .D(p_0_in__6[6]),
        .Q(mmcm_lock_count_reg__0[6]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[7] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__2 ),
        .D(p_0_in__6[7]),
        .Q(mmcm_lock_count_reg__0[7]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[8] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__2 ),
        .D(p_0_in__6[8]),
        .Q(mmcm_lock_count_reg__0[8]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* counter = "28" *) 
   FDRE #(
    .INIT(1'b0)) 
     \mmcm_lock_count_reg[9] 
       (.C(SYSCLK_IN),
        .CE(\n_0_mmcm_lock_count[9]_i_2__2 ),
        .D(p_0_in__6[9]),
        .Q(mmcm_lock_count_reg__0[9]),
        .R(n_0_sync_mmcm_lock_reclocked));
(* SOFT_HLUTNM = "soft_lutpair95" *) 
   LUT5 #(
    .INIT(32'h00800000)) 
     mmcm_lock_reclocked_i_2__2
       (.I0(mmcm_lock_count_reg__0[9]),
        .I1(mmcm_lock_count_reg__0[8]),
        .I2(mmcm_lock_count_reg__0[6]),
        .I3(\n_0_mmcm_lock_count[9]_i_4__2 ),
        .I4(mmcm_lock_count_reg__0[7]),
        .O(n_0_mmcm_lock_reclocked_i_2__2));
FDRE #(
    .INIT(1'b0)) 
     mmcm_lock_reclocked_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_1_sync_mmcm_lock_reclocked),
        .Q(mmcm_lock_reclocked),
        .R(1'b0));
(* SOFT_HLUTNM = "soft_lutpair100" *) 
   LUT4 #(
    .INIT(16'h55DC)) 
     pll_reset_asserted_i_1__2
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(n_0_pll_reset_asserted_reg),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1__2 ),
        .I3(\n_0_FSM_onehot_rx_state[5]_i_2__2 ),
        .O(n_0_pll_reset_asserted_i_1__2));
FDRE #(
    .INIT(1'b0)) 
     pll_reset_asserted_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_pll_reset_asserted_i_1__2),
        .Q(n_0_pll_reset_asserted_reg),
        .R(SOFT_RESET_IN));
(* SOFT_HLUTNM = "soft_lutpair100" *) 
   LUT2 #(
    .INIT(4'h2)) 
     reset_time_out_i_11__2
       (.I0(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_11__2));
(* SOFT_HLUTNM = "soft_lutpair103" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     reset_time_out_i_12__2
       (.I0(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I1(check_tlock_max),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_12__2));
(* SOFT_HLUTNM = "soft_lutpair101" *) 
   LUT4 #(
    .INIT(16'h0002)) 
     reset_time_out_i_13__2
       (.I0(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[3] ),
        .O(n_0_reset_time_out_i_13__2));
LUT6 #(
    .INIT(64'h0000000000080000)) 
     reset_time_out_i_4__2
       (.I0(I1),
        .I1(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_wait_time_cnt[6]_i_4__2 ),
        .I4(\n_0_FSM_onehot_rx_state[5]_i_3__2 ),
        .I5(\n_0_FSM_onehot_rx_state[3]_i_4__2 ),
        .O(n_0_reset_time_out_i_4__2));
(* SOFT_HLUTNM = "soft_lutpair92" *) 
   LUT5 #(
    .INIT(32'h00010006)) 
     reset_time_out_i_5__2
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state[10]_i_3__2 ),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2__2 ),
        .I4(run_phase_alignment_int),
        .O(n_0_reset_time_out_i_5__2));
LUT6 #(
    .INIT(64'h0004000F00040004)) 
     reset_time_out_i_6__2
       (.I0(\n_0_FSM_onehot_rx_state[3]_i_4__2 ),
        .I1(n_0_reset_time_out_i_12__2),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state[3]_i_3__2 ),
        .I4(\n_0_FSM_onehot_rx_state[2]_i_8__2 ),
        .I5(n_0_reset_time_out_i_13__2),
        .O(n_0_reset_time_out_i_6__2));
(* SOFT_HLUTNM = "soft_lutpair93" *) 
   LUT5 #(
    .INIT(32'h00100000)) 
     reset_time_out_i_8__2
       (.I0(\n_0_FSM_onehot_rx_state_reg[5] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I2(mmcm_lock_reclocked),
        .I3(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I4(check_tlock_max),
        .O(n_0_reset_time_out_i_8__2));
(* SOFT_HLUTNM = "soft_lutpair103" *) 
   LUT4 #(
    .INIT(16'h0004)) 
     reset_time_out_i_9__2
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[4] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[5] ),
        .O(n_0_reset_time_out_i_9__2));
FDSE #(
    .INIT(1'b0)) 
     reset_time_out_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_4_sync_data_valid),
        .Q(n_0_reset_time_out_reg),
        .S(SOFT_RESET_IN));
LUT4 #(
    .INIT(16'hABA8)) 
     run_phase_alignment_int_i_1__2
       (.I0(run_phase_alignment_int),
        .I1(n_0_run_phase_alignment_int_i_2__2),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_1__2 ),
        .I3(n_0_run_phase_alignment_int_reg),
        .O(n_0_run_phase_alignment_int_i_1__2));
(* SOFT_HLUTNM = "soft_lutpair92" *) 
   LUT5 #(
    .INIT(32'h00000010)) 
     run_phase_alignment_int_i_2__2
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(run_phase_alignment_int),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2__2 ),
        .I4(\n_0_FSM_onehot_rx_state[10]_i_3__2 ),
        .O(n_0_run_phase_alignment_int_i_2__2));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_run_phase_alignment_int_i_1__2),
        .Q(n_0_run_phase_alignment_int_reg),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     run_phase_alignment_int_s3_reg
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(run_phase_alignment_int_s2),
        .Q(n_0_run_phase_alignment_int_s3_reg),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0000000000000001)) 
     rx_fsm_reset_done_int_i_3__2
       (.I0(run_phase_alignment_int),
        .I1(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I2(\n_0_FSM_onehot_rx_state_reg[1] ),
        .I3(\n_0_FSM_onehot_rx_state_reg[7] ),
        .I4(\n_0_FSM_onehot_rx_state_reg[3] ),
        .I5(\n_0_FSM_onehot_rx_state[10]_i_3__2 ),
        .O(n_0_rx_fsm_reset_done_int_i_3__2));
(* SOFT_HLUTNM = "soft_lutpair94" *) 
   LUT5 #(
    .INIT(32'h00000004)) 
     rx_fsm_reset_done_int_i_6__2
       (.I0(\n_0_FSM_onehot_rx_state_reg[11] ),
        .I1(\n_0_FSM_onehot_rx_state_reg[10] ),
        .I2(\n_0_FSM_onehot_rx_state[10]_i_3__2 ),
        .I3(\n_0_FSM_onehot_rx_state[10]_i_2__2 ),
        .I4(run_phase_alignment_int),
        .O(n_0_rx_fsm_reset_done_int_i_6__2));
FDRE #(
    .INIT(1'b0)) 
     rx_fsm_reset_done_int_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_5_sync_data_valid),
        .Q(GT3_RX_FSM_RESET_DONE_OUT),
        .R(SOFT_RESET_IN));
FDRE #(
    .INIT(1'b0)) 
     rx_fsm_reset_done_int_s3_reg
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(rx_fsm_reset_done_int_s2),
        .Q(n_0_rx_fsm_reset_done_int_s3_reg),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     rxresetdone_s3_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(rxresetdone_s2),
        .Q(rxresetdone_s3),
        .R(1'b0));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_12 sync_QPLLLOCK
       (.GT0_QPLLLOCK_IN(GT0_QPLLLOCK_IN),
        .I1(n_0_pll_reset_asserted_reg),
        .I10(I1),
        .I2(\n_0_FSM_onehot_rx_state[11]_i_14__2 ),
        .I3(\n_0_FSM_onehot_rx_state[11]_i_15__2 ),
        .I4(n_3_sync_data_valid),
        .I5(n_0_reset_time_out_i_9__2),
        .I6(\n_0_FSM_onehot_rx_state[3]_i_4__2 ),
        .I7(\n_0_FSM_onehot_rx_state[5]_i_3__2 ),
        .I8(\n_0_wait_time_cnt[6]_i_4__2 ),
        .I9(n_0_reset_time_out_i_11__2),
        .O1(n_0_sync_QPLLLOCK),
        .O2(n_1_sync_QPLLLOCK),
        .O3(n_2_sync_QPLLLOCK),
        .O4(n_3_sync_QPLLLOCK),
        .Q({\n_0_FSM_onehot_rx_state_reg[10] ,\n_0_FSM_onehot_rx_state_reg[7] ,\n_0_FSM_onehot_rx_state_reg[5] ,\n_0_FSM_onehot_rx_state_reg[4] ,\n_0_FSM_onehot_rx_state_reg[3] ,\n_0_FSM_onehot_rx_state_reg[2] ,\n_0_FSM_onehot_rx_state_reg[1] }),
        .SYSCLK_IN(SYSCLK_IN));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_13 sync_RXRESETDONE
       (.SYSCLK_IN(SYSCLK_IN),
        .data_out(rxresetdone_s2),
        .gt3_rxresetdone_out(gt3_rxresetdone_out));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_14 sync_data_valid
       (.D({n_1_sync_data_valid,n_2_sync_data_valid}),
        .DONT_RESET_ON_DATA_ERROR_IN(DONT_RESET_ON_DATA_ERROR_IN),
        .E(n_0_sync_data_valid),
        .GT3_DATA_VALID_IN(GT3_DATA_VALID_IN),
        .GT3_RX_FSM_RESET_DONE_OUT(GT3_RX_FSM_RESET_DONE_OUT),
        .I1(n_1_sync_QPLLLOCK),
        .I10(\n_0_FSM_onehot_rx_state[11]_i_12__2 ),
        .I11(n_0_sync_QPLLLOCK),
        .I12(n_0_time_out_1us_reg),
        .I13(n_0_reset_time_out_reg),
        .I14(\n_0_FSM_onehot_rx_state[2]_i_2__2 ),
        .I15(\n_0_FSM_onehot_rx_state[5]_i_2__2 ),
        .I16(n_0_time_out_2ms_reg),
        .I17(\n_0_FSM_onehot_rx_state[2]_i_4__2 ),
        .I18(\n_0_FSM_onehot_rx_state[2]_i_5__2 ),
        .I19(n_3_sync_QPLLLOCK),
        .I2(\n_0_FSM_onehot_rx_state[11]_i_5__2 ),
        .I20(n_0_reset_time_out_i_8__2),
        .I21(\n_0_FSM_onehot_rx_state[10]_i_2__2 ),
        .I22(n_0_time_out_100us_reg),
        .I23(n_0_rx_fsm_reset_done_int_i_6__2),
        .I24(n_2_sync_QPLLLOCK),
        .I25(n_0_reset_time_out_i_4__2),
        .I26(n_0_reset_time_out_i_5__2),
        .I27(n_0_reset_time_out_i_6__2),
        .I28(n_0_rx_fsm_reset_done_int_i_3__2),
        .I3(\n_0_wait_time_cnt[6]_i_2__2 ),
        .I4(\n_0_FSM_onehot_rx_state[11]_i_6__1 ),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_16__1 ),
        .I6(\n_0_FSM_onehot_rx_state[10]_i_3__2 ),
        .I7(\n_0_FSM_onehot_rx_state[11]_i_8__1 ),
        .I8(\n_0_FSM_onehot_rx_state[11]_i_10__1 ),
        .I9(\n_0_FSM_onehot_rx_state[11]_i_11__1 ),
        .O1(n_3_sync_data_valid),
        .O2(n_4_sync_data_valid),
        .O3(n_5_sync_data_valid),
        .Q({\n_0_FSM_onehot_rx_state_reg[11] ,\n_0_FSM_onehot_rx_state_reg[10] ,run_phase_alignment_int,\n_0_FSM_onehot_rx_state_reg[8] }),
        .SYSCLK_IN(SYSCLK_IN),
        .rxresetdone_s3(rxresetdone_s3));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_15 sync_mmcm_lock_reclocked
       (.I1(n_0_mmcm_lock_reclocked_i_2__2),
        .O1(n_1_sync_mmcm_lock_reclocked),
        .SR(n_0_sync_mmcm_lock_reclocked),
        .SYSCLK_IN(SYSCLK_IN),
        .mmcm_lock_reclocked(mmcm_lock_reclocked));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_16 sync_run_phase_alignment_int
       (.data_in(n_0_run_phase_alignment_int_reg),
        .data_out(run_phase_alignment_int_s2),
        .gt3_rxusrclk_in(gt3_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_17 sync_rx_fsm_reset_done_int
       (.GT3_RX_FSM_RESET_DONE_OUT(GT3_RX_FSM_RESET_DONE_OUT),
        .data_out(rx_fsm_reset_done_int_s2),
        .gt3_rxusrclk_in(gt3_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_18 sync_time_out_wait_bypass
       (.SYSCLK_IN(SYSCLK_IN),
        .data_in(n_0_time_out_wait_bypass_reg),
        .data_out(time_out_wait_bypass_s2));
LUT6 #(
    .INIT(64'hFFFFFFFF00010000)) 
     time_out_100us_i_1__2
       (.I0(\n_0_time_out_counter[0]_i_3__2 ),
        .I1(n_0_time_out_100us_i_2__2),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[11]),
        .I4(n_0_time_out_100us_i_3__2),
        .I5(n_0_time_out_100us_reg),
        .O(n_0_time_out_100us_i_1__2));
LUT2 #(
    .INIT(4'hE)) 
     time_out_100us_i_2__2
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[15]),
        .O(n_0_time_out_100us_i_2__2));
LUT6 #(
    .INIT(64'h0010000000000000)) 
     time_out_100us_i_3__2
       (.I0(time_out_counter_reg[16]),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[12]),
        .I3(time_out_counter_reg[3]),
        .I4(time_out_counter_reg[1]),
        .I5(time_out_counter_reg[2]),
        .O(n_0_time_out_100us_i_3__2));
FDRE #(
    .INIT(1'b0)) 
     time_out_100us_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_100us_i_1__2),
        .Q(n_0_time_out_100us_reg),
        .R(n_0_reset_time_out_reg));
LUT6 #(
    .INIT(64'hFFFFFFFF00000002)) 
     time_out_1us_i_1__2
       (.I0(n_0_time_out_1us_i_2__2),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[11]),
        .I4(time_out_counter_reg[10]),
        .I5(n_0_time_out_1us_reg),
        .O(n_0_time_out_1us_i_1__2));
LUT6 #(
    .INIT(64'h0000000100000000)) 
     time_out_1us_i_2__2
       (.I0(n_0_time_out_2ms_i_3__2),
        .I1(time_out_counter_reg[14]),
        .I2(time_out_counter_reg[15]),
        .I3(time_out_counter_reg[8]),
        .I4(time_out_counter_reg[9]),
        .I5(n_0_time_out_1us_i_3__2),
        .O(n_0_time_out_1us_i_2__2));
LUT5 #(
    .INIT(32'h00000020)) 
     time_out_1us_i_3__2
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[6]),
        .I2(time_out_counter_reg[5]),
        .I3(time_out_counter_reg[4]),
        .I4(time_out_counter_reg[7]),
        .O(n_0_time_out_1us_i_3__2));
FDRE #(
    .INIT(1'b0)) 
     time_out_1us_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_1us_i_1__2),
        .Q(n_0_time_out_1us_reg),
        .R(n_0_reset_time_out_reg));
(* SOFT_HLUTNM = "soft_lutpair104" *) 
   LUT4 #(
    .INIT(16'hFF02)) 
     time_out_2ms_i_1__2
       (.I0(n_0_time_out_2ms_i_2__2),
        .I1(\n_0_time_out_counter[0]_i_3__2 ),
        .I2(n_0_time_out_2ms_i_3__2),
        .I3(n_0_time_out_2ms_reg),
        .O(n_0_time_out_2ms_i_1__2));
LUT6 #(
    .INIT(64'h0080000000000000)) 
     time_out_2ms_i_2__2
       (.I0(time_out_counter_reg[13]),
        .I1(time_out_counter_reg[14]),
        .I2(time_out_counter_reg[11]),
        .I3(time_out_counter_reg[10]),
        .I4(time_out_counter_reg[16]),
        .I5(time_out_counter_reg[15]),
        .O(n_0_time_out_2ms_i_2__2));
LUT4 #(
    .INIT(16'hFFEF)) 
     time_out_2ms_i_3__2
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[1]),
        .I2(time_out_counter_reg[3]),
        .I3(time_out_counter_reg[12]),
        .O(n_0_time_out_2ms_i_3__2));
FDRE #(
    .INIT(1'b0)) 
     time_out_2ms_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_out_2ms_i_1__2),
        .Q(n_0_time_out_2ms_reg),
        .R(n_0_reset_time_out_reg));
LUT3 #(
    .INIT(8'hFE)) 
     \time_out_counter[0]_i_1__2 
       (.I0(time_out_counter_reg[10]),
        .I1(\n_0_time_out_counter[0]_i_3__2 ),
        .I2(\n_0_time_out_counter[0]_i_4__2 ),
        .O(\n_0_time_out_counter[0]_i_1__2 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
     \time_out_counter[0]_i_3__2 
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[5]),
        .I2(time_out_counter_reg[7]),
        .I3(time_out_counter_reg[6]),
        .I4(time_out_counter_reg[0]),
        .I5(\n_0_time_out_counter[0]_i_9__2 ),
        .O(\n_0_time_out_counter[0]_i_3__2 ));
LUT6 #(
    .INIT(64'hFFFFFFFF7FFFFFFF)) 
     \time_out_counter[0]_i_4__2 
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[13]),
        .I3(time_out_counter_reg[14]),
        .I4(time_out_counter_reg[11]),
        .I5(n_0_time_out_2ms_i_3__2),
        .O(\n_0_time_out_counter[0]_i_4__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_5__2 
       (.I0(time_out_counter_reg[3]),
        .O(\n_0_time_out_counter[0]_i_5__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_6__2 
       (.I0(time_out_counter_reg[2]),
        .O(\n_0_time_out_counter[0]_i_6__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[0]_i_7__2 
       (.I0(time_out_counter_reg[1]),
        .O(\n_0_time_out_counter[0]_i_7__2 ));
LUT1 #(
    .INIT(2'h1)) 
     \time_out_counter[0]_i_8__2 
       (.I0(time_out_counter_reg[0]),
        .O(\n_0_time_out_counter[0]_i_8__2 ));
LUT2 #(
    .INIT(4'hE)) 
     \time_out_counter[0]_i_9__2 
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[9]),
        .O(\n_0_time_out_counter[0]_i_9__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_2__2 
       (.I0(time_out_counter_reg[15]),
        .O(\n_0_time_out_counter[12]_i_2__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_3__2 
       (.I0(time_out_counter_reg[14]),
        .O(\n_0_time_out_counter[12]_i_3__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_4__2 
       (.I0(time_out_counter_reg[13]),
        .O(\n_0_time_out_counter[12]_i_4__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[12]_i_5__2 
       (.I0(time_out_counter_reg[12]),
        .O(\n_0_time_out_counter[12]_i_5__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[16]_i_2__2 
       (.I0(time_out_counter_reg[16]),
        .O(\n_0_time_out_counter[16]_i_2__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_2__2 
       (.I0(time_out_counter_reg[7]),
        .O(\n_0_time_out_counter[4]_i_2__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_3__2 
       (.I0(time_out_counter_reg[6]),
        .O(\n_0_time_out_counter[4]_i_3__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_4__2 
       (.I0(time_out_counter_reg[5]),
        .O(\n_0_time_out_counter[4]_i_4__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[4]_i_5__2 
       (.I0(time_out_counter_reg[4]),
        .O(\n_0_time_out_counter[4]_i_5__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_2__2 
       (.I0(time_out_counter_reg[11]),
        .O(\n_0_time_out_counter[8]_i_2__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_3__2 
       (.I0(time_out_counter_reg[10]),
        .O(\n_0_time_out_counter[8]_i_3__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_4__2 
       (.I0(time_out_counter_reg[9]),
        .O(\n_0_time_out_counter[8]_i_4__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \time_out_counter[8]_i_5__2 
       (.I0(time_out_counter_reg[8]),
        .O(\n_0_time_out_counter[8]_i_5__2 ));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_7_time_out_counter_reg[0]_i_2__2 ),
        .Q(time_out_counter_reg[0]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[0]_i_2__2 
       (.CI(1'b0),
        .CO({\n_0_time_out_counter_reg[0]_i_2__2 ,\n_1_time_out_counter_reg[0]_i_2__2 ,\n_2_time_out_counter_reg[0]_i_2__2 ,\n_3_time_out_counter_reg[0]_i_2__2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\n_4_time_out_counter_reg[0]_i_2__2 ,\n_5_time_out_counter_reg[0]_i_2__2 ,\n_6_time_out_counter_reg[0]_i_2__2 ,\n_7_time_out_counter_reg[0]_i_2__2 }),
        .S({\n_0_time_out_counter[0]_i_5__2 ,\n_0_time_out_counter[0]_i_6__2 ,\n_0_time_out_counter[0]_i_7__2 ,\n_0_time_out_counter[0]_i_8__2 }));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[10] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_5_time_out_counter_reg[8]_i_1__2 ),
        .Q(time_out_counter_reg[10]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[11] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_4_time_out_counter_reg[8]_i_1__2 ),
        .Q(time_out_counter_reg[11]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[12] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_7_time_out_counter_reg[12]_i_1__2 ),
        .Q(time_out_counter_reg[12]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[12]_i_1__2 
       (.CI(\n_0_time_out_counter_reg[8]_i_1__2 ),
        .CO({\n_0_time_out_counter_reg[12]_i_1__2 ,\n_1_time_out_counter_reg[12]_i_1__2 ,\n_2_time_out_counter_reg[12]_i_1__2 ,\n_3_time_out_counter_reg[12]_i_1__2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[12]_i_1__2 ,\n_5_time_out_counter_reg[12]_i_1__2 ,\n_6_time_out_counter_reg[12]_i_1__2 ,\n_7_time_out_counter_reg[12]_i_1__2 }),
        .S({\n_0_time_out_counter[12]_i_2__2 ,\n_0_time_out_counter[12]_i_3__2 ,\n_0_time_out_counter[12]_i_4__2 ,\n_0_time_out_counter[12]_i_5__2 }));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[13] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_6_time_out_counter_reg[12]_i_1__2 ),
        .Q(time_out_counter_reg[13]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[14] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_5_time_out_counter_reg[12]_i_1__2 ),
        .Q(time_out_counter_reg[14]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[15] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_4_time_out_counter_reg[12]_i_1__2 ),
        .Q(time_out_counter_reg[15]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[16] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_7_time_out_counter_reg[16]_i_1__2 ),
        .Q(time_out_counter_reg[16]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[16]_i_1__2 
       (.CI(\n_0_time_out_counter_reg[12]_i_1__2 ),
        .CO(\NLW_time_out_counter_reg[16]_i_1__2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_time_out_counter_reg[16]_i_1__2_O_UNCONNECTED [3:1],\n_7_time_out_counter_reg[16]_i_1__2 }),
        .S({1'b0,1'b0,1'b0,\n_0_time_out_counter[16]_i_2__2 }));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_6_time_out_counter_reg[0]_i_2__2 ),
        .Q(time_out_counter_reg[1]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_5_time_out_counter_reg[0]_i_2__2 ),
        .Q(time_out_counter_reg[2]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_4_time_out_counter_reg[0]_i_2__2 ),
        .Q(time_out_counter_reg[3]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_7_time_out_counter_reg[4]_i_1__2 ),
        .Q(time_out_counter_reg[4]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[4]_i_1__2 
       (.CI(\n_0_time_out_counter_reg[0]_i_2__2 ),
        .CO({\n_0_time_out_counter_reg[4]_i_1__2 ,\n_1_time_out_counter_reg[4]_i_1__2 ,\n_2_time_out_counter_reg[4]_i_1__2 ,\n_3_time_out_counter_reg[4]_i_1__2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[4]_i_1__2 ,\n_5_time_out_counter_reg[4]_i_1__2 ,\n_6_time_out_counter_reg[4]_i_1__2 ,\n_7_time_out_counter_reg[4]_i_1__2 }),
        .S({\n_0_time_out_counter[4]_i_2__2 ,\n_0_time_out_counter[4]_i_3__2 ,\n_0_time_out_counter[4]_i_4__2 ,\n_0_time_out_counter[4]_i_5__2 }));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_6_time_out_counter_reg[4]_i_1__2 ),
        .Q(time_out_counter_reg[5]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_5_time_out_counter_reg[4]_i_1__2 ),
        .Q(time_out_counter_reg[6]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[7] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_4_time_out_counter_reg[4]_i_1__2 ),
        .Q(time_out_counter_reg[7]),
        .R(n_0_reset_time_out_reg));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[8] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_7_time_out_counter_reg[8]_i_1__2 ),
        .Q(time_out_counter_reg[8]),
        .R(n_0_reset_time_out_reg));
CARRY4 \time_out_counter_reg[8]_i_1__2 
       (.CI(\n_0_time_out_counter_reg[4]_i_1__2 ),
        .CO({\n_0_time_out_counter_reg[8]_i_1__2 ,\n_1_time_out_counter_reg[8]_i_1__2 ,\n_2_time_out_counter_reg[8]_i_1__2 ,\n_3_time_out_counter_reg[8]_i_1__2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_time_out_counter_reg[8]_i_1__2 ,\n_5_time_out_counter_reg[8]_i_1__2 ,\n_6_time_out_counter_reg[8]_i_1__2 ,\n_7_time_out_counter_reg[8]_i_1__2 }),
        .S({\n_0_time_out_counter[8]_i_2__2 ,\n_0_time_out_counter[8]_i_3__2 ,\n_0_time_out_counter[8]_i_4__2 ,\n_0_time_out_counter[8]_i_5__2 }));
(* counter = "20" *) 
   FDRE #(
    .INIT(1'b0)) 
     \time_out_counter_reg[9] 
       (.C(SYSCLK_IN),
        .CE(\n_0_time_out_counter[0]_i_1__2 ),
        .D(\n_6_time_out_counter_reg[8]_i_1__2 ),
        .Q(time_out_counter_reg[9]),
        .R(n_0_reset_time_out_reg));
LUT6 #(
    .INIT(64'hFF00FF0100000000)) 
     time_out_wait_bypass_i_1__2
       (.I0(\n_0_wait_bypass_count[0]_i_4__2 ),
        .I1(wait_bypass_count_reg[3]),
        .I2(\n_0_wait_bypass_count[0]_i_5__2 ),
        .I3(n_0_time_out_wait_bypass_reg),
        .I4(n_0_rx_fsm_reset_done_int_s3_reg),
        .I5(n_0_run_phase_alignment_int_s3_reg),
        .O(n_0_time_out_wait_bypass_i_1__2));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_reg
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(n_0_time_out_wait_bypass_i_1__2),
        .Q(n_0_time_out_wait_bypass_reg),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     time_out_wait_bypass_s3_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(time_out_wait_bypass_s2),
        .Q(time_out_wait_bypass_s3),
        .R(1'b0));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_10__2
       (.I0(time_out_counter_reg[12]),
        .I1(time_out_counter_reg[13]),
        .O(n_0_time_tlock_max_i_10__2));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_11__2
       (.I0(time_out_counter_reg[11]),
        .I1(time_out_counter_reg[10]),
        .O(n_0_time_tlock_max_i_11__2));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_12__2
       (.I0(time_out_counter_reg[9]),
        .I1(time_out_counter_reg[8]),
        .O(n_0_time_tlock_max_i_12__2));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_13__2
       (.I0(time_out_counter_reg[4]),
        .I1(time_out_counter_reg[5]),
        .O(n_0_time_tlock_max_i_13__2));
LUT2 #(
    .INIT(4'h8)) 
     time_tlock_max_i_14__2
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[1]),
        .O(n_0_time_tlock_max_i_14__2));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_15__2
       (.I0(time_out_counter_reg[6]),
        .I1(time_out_counter_reg[7]),
        .O(n_0_time_tlock_max_i_15__2));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_16__2
       (.I0(time_out_counter_reg[5]),
        .I1(time_out_counter_reg[4]),
        .O(n_0_time_tlock_max_i_16__2));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_17__2
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[3]),
        .O(n_0_time_tlock_max_i_17__2));
LUT2 #(
    .INIT(4'h2)) 
     time_tlock_max_i_18__2
       (.I0(time_out_counter_reg[1]),
        .I1(time_out_counter_reg[0]),
        .O(n_0_time_tlock_max_i_18__2));
LUT3 #(
    .INIT(8'hF8)) 
     time_tlock_max_i_1__2
       (.I0(n_0_check_tlock_max_reg),
        .I1(time_tlock_max1),
        .I2(time_tlock_max),
        .O(n_0_time_tlock_max_i_1__2));
LUT1 #(
    .INIT(2'h1)) 
     time_tlock_max_i_4__2
       (.I0(time_out_counter_reg[16]),
        .O(n_0_time_tlock_max_i_4__2));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_6__2
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[15]),
        .O(n_0_time_tlock_max_i_6__2));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_7__2
       (.I0(time_out_counter_reg[10]),
        .I1(time_out_counter_reg[11]),
        .O(n_0_time_tlock_max_i_7__2));
LUT2 #(
    .INIT(4'hE)) 
     time_tlock_max_i_8__2
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[9]),
        .O(n_0_time_tlock_max_i_8__2));
LUT2 #(
    .INIT(4'h1)) 
     time_tlock_max_i_9__2
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[14]),
        .O(n_0_time_tlock_max_i_9__2));
FDRE #(
    .INIT(1'b0)) 
     time_tlock_max_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_time_tlock_max_i_1__2),
        .Q(time_tlock_max),
        .R(n_0_reset_time_out_reg));
CARRY4 time_tlock_max_reg_i_2__2
       (.CI(n_0_time_tlock_max_reg_i_3__2),
        .CO({NLW_time_tlock_max_reg_i_2__2_CO_UNCONNECTED[3:1],time_tlock_max1}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,time_out_counter_reg[16]}),
        .O(NLW_time_tlock_max_reg_i_2__2_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,n_0_time_tlock_max_i_4__2}));
CARRY4 time_tlock_max_reg_i_3__2
       (.CI(n_0_time_tlock_max_reg_i_5__2),
        .CO({n_0_time_tlock_max_reg_i_3__2,n_1_time_tlock_max_reg_i_3__2,n_2_time_tlock_max_reg_i_3__2,n_3_time_tlock_max_reg_i_3__2}),
        .CYINIT(1'b0),
        .DI({n_0_time_tlock_max_i_6__2,time_out_counter_reg[13],n_0_time_tlock_max_i_7__2,n_0_time_tlock_max_i_8__2}),
        .O(NLW_time_tlock_max_reg_i_3__2_O_UNCONNECTED[3:0]),
        .S({n_0_time_tlock_max_i_9__2,n_0_time_tlock_max_i_10__2,n_0_time_tlock_max_i_11__2,n_0_time_tlock_max_i_12__2}));
CARRY4 time_tlock_max_reg_i_5__2
       (.CI(1'b0),
        .CO({n_0_time_tlock_max_reg_i_5__2,n_1_time_tlock_max_reg_i_5__2,n_2_time_tlock_max_reg_i_5__2,n_3_time_tlock_max_reg_i_5__2}),
        .CYINIT(1'b0),
        .DI({time_out_counter_reg[7],n_0_time_tlock_max_i_13__2,time_out_counter_reg[3],n_0_time_tlock_max_i_14__2}),
        .O(NLW_time_tlock_max_reg_i_5__2_O_UNCONNECTED[3:0]),
        .S({n_0_time_tlock_max_i_15__2,n_0_time_tlock_max_i_16__2,n_0_time_tlock_max_i_17__2,n_0_time_tlock_max_i_18__2}));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_1__2 
       (.I0(n_0_run_phase_alignment_int_s3_reg),
        .O(\n_0_wait_bypass_count[0]_i_1__2 ));
LUT4 #(
    .INIT(16'h00FE)) 
     \wait_bypass_count[0]_i_2__2 
       (.I0(\n_0_wait_bypass_count[0]_i_4__2 ),
        .I1(wait_bypass_count_reg[3]),
        .I2(\n_0_wait_bypass_count[0]_i_5__2 ),
        .I3(n_0_rx_fsm_reset_done_int_s3_reg),
        .O(\n_0_wait_bypass_count[0]_i_2__2 ));
LUT6 #(
    .INIT(64'hFFFFEFFFFFFFFFFF)) 
     \wait_bypass_count[0]_i_4__2 
       (.I0(wait_bypass_count_reg[11]),
        .I1(wait_bypass_count_reg[4]),
        .I2(wait_bypass_count_reg[0]),
        .I3(wait_bypass_count_reg[9]),
        .I4(wait_bypass_count_reg[10]),
        .I5(wait_bypass_count_reg[2]),
        .O(\n_0_wait_bypass_count[0]_i_4__2 ));
LUT6 #(
    .INIT(64'hFDFFFFFFFFFFFFFF)) 
     \wait_bypass_count[0]_i_5__2 
       (.I0(wait_bypass_count_reg[1]),
        .I1(wait_bypass_count_reg[6]),
        .I2(wait_bypass_count_reg[5]),
        .I3(wait_bypass_count_reg[12]),
        .I4(wait_bypass_count_reg[8]),
        .I5(wait_bypass_count_reg[7]),
        .O(\n_0_wait_bypass_count[0]_i_5__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_6__2 
       (.I0(wait_bypass_count_reg[3]),
        .O(\n_0_wait_bypass_count[0]_i_6__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_7__2 
       (.I0(wait_bypass_count_reg[2]),
        .O(\n_0_wait_bypass_count[0]_i_7__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[0]_i_8__2 
       (.I0(wait_bypass_count_reg[1]),
        .O(\n_0_wait_bypass_count[0]_i_8__2 ));
LUT1 #(
    .INIT(2'h1)) 
     \wait_bypass_count[0]_i_9__2 
       (.I0(wait_bypass_count_reg[0]),
        .O(\n_0_wait_bypass_count[0]_i_9__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[12]_i_2__2 
       (.I0(wait_bypass_count_reg[12]),
        .O(\n_0_wait_bypass_count[12]_i_2__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_2__2 
       (.I0(wait_bypass_count_reg[7]),
        .O(\n_0_wait_bypass_count[4]_i_2__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_3__2 
       (.I0(wait_bypass_count_reg[6]),
        .O(\n_0_wait_bypass_count[4]_i_3__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_4__2 
       (.I0(wait_bypass_count_reg[5]),
        .O(\n_0_wait_bypass_count[4]_i_4__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[4]_i_5__2 
       (.I0(wait_bypass_count_reg[4]),
        .O(\n_0_wait_bypass_count[4]_i_5__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_2__2 
       (.I0(wait_bypass_count_reg[11]),
        .O(\n_0_wait_bypass_count[8]_i_2__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_3__2 
       (.I0(wait_bypass_count_reg[10]),
        .O(\n_0_wait_bypass_count[8]_i_3__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_4__2 
       (.I0(wait_bypass_count_reg[9]),
        .O(\n_0_wait_bypass_count[8]_i_4__2 ));
LUT1 #(
    .INIT(2'h2)) 
     \wait_bypass_count[8]_i_5__2 
       (.I0(wait_bypass_count_reg[8]),
        .O(\n_0_wait_bypass_count[8]_i_5__2 ));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[0] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_7_wait_bypass_count_reg[0]_i_3__2 ),
        .Q(wait_bypass_count_reg[0]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
CARRY4 \wait_bypass_count_reg[0]_i_3__2 
       (.CI(1'b0),
        .CO({\n_0_wait_bypass_count_reg[0]_i_3__2 ,\n_1_wait_bypass_count_reg[0]_i_3__2 ,\n_2_wait_bypass_count_reg[0]_i_3__2 ,\n_3_wait_bypass_count_reg[0]_i_3__2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\n_4_wait_bypass_count_reg[0]_i_3__2 ,\n_5_wait_bypass_count_reg[0]_i_3__2 ,\n_6_wait_bypass_count_reg[0]_i_3__2 ,\n_7_wait_bypass_count_reg[0]_i_3__2 }),
        .S({\n_0_wait_bypass_count[0]_i_6__2 ,\n_0_wait_bypass_count[0]_i_7__2 ,\n_0_wait_bypass_count[0]_i_8__2 ,\n_0_wait_bypass_count[0]_i_9__2 }));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[10] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_5_wait_bypass_count_reg[8]_i_1__2 ),
        .Q(wait_bypass_count_reg[10]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[11] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_4_wait_bypass_count_reg[8]_i_1__2 ),
        .Q(wait_bypass_count_reg[11]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[12] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_7_wait_bypass_count_reg[12]_i_1__2 ),
        .Q(wait_bypass_count_reg[12]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
CARRY4 \wait_bypass_count_reg[12]_i_1__2 
       (.CI(\n_0_wait_bypass_count_reg[8]_i_1__2 ),
        .CO(\NLW_wait_bypass_count_reg[12]_i_1__2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_wait_bypass_count_reg[12]_i_1__2_O_UNCONNECTED [3:1],\n_7_wait_bypass_count_reg[12]_i_1__2 }),
        .S({1'b0,1'b0,1'b0,\n_0_wait_bypass_count[12]_i_2__2 }));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[1] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_6_wait_bypass_count_reg[0]_i_3__2 ),
        .Q(wait_bypass_count_reg[1]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[2] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_5_wait_bypass_count_reg[0]_i_3__2 ),
        .Q(wait_bypass_count_reg[2]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[3] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_4_wait_bypass_count_reg[0]_i_3__2 ),
        .Q(wait_bypass_count_reg[3]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[4] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_7_wait_bypass_count_reg[4]_i_1__2 ),
        .Q(wait_bypass_count_reg[4]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
CARRY4 \wait_bypass_count_reg[4]_i_1__2 
       (.CI(\n_0_wait_bypass_count_reg[0]_i_3__2 ),
        .CO({\n_0_wait_bypass_count_reg[4]_i_1__2 ,\n_1_wait_bypass_count_reg[4]_i_1__2 ,\n_2_wait_bypass_count_reg[4]_i_1__2 ,\n_3_wait_bypass_count_reg[4]_i_1__2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_wait_bypass_count_reg[4]_i_1__2 ,\n_5_wait_bypass_count_reg[4]_i_1__2 ,\n_6_wait_bypass_count_reg[4]_i_1__2 ,\n_7_wait_bypass_count_reg[4]_i_1__2 }),
        .S({\n_0_wait_bypass_count[4]_i_2__2 ,\n_0_wait_bypass_count[4]_i_3__2 ,\n_0_wait_bypass_count[4]_i_4__2 ,\n_0_wait_bypass_count[4]_i_5__2 }));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[5] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_6_wait_bypass_count_reg[4]_i_1__2 ),
        .Q(wait_bypass_count_reg[5]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[6] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_5_wait_bypass_count_reg[4]_i_1__2 ),
        .Q(wait_bypass_count_reg[6]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[7] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_4_wait_bypass_count_reg[4]_i_1__2 ),
        .Q(wait_bypass_count_reg[7]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[8] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_7_wait_bypass_count_reg[8]_i_1__2 ),
        .Q(wait_bypass_count_reg[8]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
CARRY4 \wait_bypass_count_reg[8]_i_1__2 
       (.CI(\n_0_wait_bypass_count_reg[4]_i_1__2 ),
        .CO({\n_0_wait_bypass_count_reg[8]_i_1__2 ,\n_1_wait_bypass_count_reg[8]_i_1__2 ,\n_2_wait_bypass_count_reg[8]_i_1__2 ,\n_3_wait_bypass_count_reg[8]_i_1__2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_4_wait_bypass_count_reg[8]_i_1__2 ,\n_5_wait_bypass_count_reg[8]_i_1__2 ,\n_6_wait_bypass_count_reg[8]_i_1__2 ,\n_7_wait_bypass_count_reg[8]_i_1__2 }),
        .S({\n_0_wait_bypass_count[8]_i_2__2 ,\n_0_wait_bypass_count[8]_i_3__2 ,\n_0_wait_bypass_count[8]_i_4__2 ,\n_0_wait_bypass_count[8]_i_5__2 }));
(* counter = "21" *) 
   FDRE \wait_bypass_count_reg[9] 
       (.C(gt3_rxusrclk_in),
        .CE(\n_0_wait_bypass_count[0]_i_2__2 ),
        .D(\n_6_wait_bypass_count_reg[8]_i_1__2 ),
        .Q(wait_bypass_count_reg[9]),
        .R(\n_0_wait_bypass_count[0]_i_1__2 ));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair112" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \wait_time_cnt[0]_i_1__2 
       (.I0(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0__2[0]));
(* SOFT_HLUTNM = "soft_lutpair112" *) 
   LUT2 #(
    .INIT(4'h9)) 
     \wait_time_cnt[1]_i_1__2 
       (.I0(wait_time_cnt_reg__0[1]),
        .I1(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0__2[1]));
(* SOFT_HLUTNM = "soft_lutpair108" *) 
   LUT3 #(
    .INIT(8'hA9)) 
     \wait_time_cnt[2]_i_1__2 
       (.I0(wait_time_cnt_reg__0[2]),
        .I1(wait_time_cnt_reg__0[0]),
        .I2(wait_time_cnt_reg__0[1]),
        .O(wait_time_cnt0__2[2]));
(* SOFT_HLUTNM = "soft_lutpair89" *) 
   LUT4 #(
    .INIT(16'hFE01)) 
     \wait_time_cnt[3]_i_1__2 
       (.I0(wait_time_cnt_reg__0[1]),
        .I1(wait_time_cnt_reg__0[0]),
        .I2(wait_time_cnt_reg__0[2]),
        .I3(wait_time_cnt_reg__0[3]),
        .O(wait_time_cnt0__2[3]));
(* SOFT_HLUTNM = "soft_lutpair89" *) 
   LUT5 #(
    .INIT(32'hAAAAAAA9)) 
     \wait_time_cnt[4]_i_1__2 
       (.I0(wait_time_cnt_reg__0[4]),
        .I1(wait_time_cnt_reg__0[3]),
        .I2(wait_time_cnt_reg__0[2]),
        .I3(wait_time_cnt_reg__0[0]),
        .I4(wait_time_cnt_reg__0[1]),
        .O(wait_time_cnt0__2[4]));
LUT6 #(
    .INIT(64'hF0F0F0F0F0F0F0E1)) 
     \wait_time_cnt[5]_i_1__2 
       (.I0(wait_time_cnt_reg__0[3]),
        .I1(wait_time_cnt_reg__0[2]),
        .I2(wait_time_cnt_reg__0[5]),
        .I3(wait_time_cnt_reg__0[4]),
        .I4(wait_time_cnt_reg__0[1]),
        .I5(wait_time_cnt_reg__0[0]),
        .O(wait_time_cnt0__2[5]));
LUT6 #(
    .INIT(64'h0000000000000004)) 
     \wait_time_cnt[6]_i_1__2 
       (.I0(\n_0_FSM_onehot_rx_state[11]_i_6__1 ),
        .I1(\n_0_wait_time_cnt[6]_i_4__2 ),
        .I2(\n_0_FSM_onehot_rx_state[3]_i_3__2 ),
        .I3(\n_0_FSM_onehot_rx_state_reg[8] ),
        .I4(run_phase_alignment_int),
        .I5(\n_0_FSM_onehot_rx_state_reg[4] ),
        .O(\n_0_wait_time_cnt[6]_i_1__2 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \wait_time_cnt[6]_i_2__2 
       (.I0(wait_time_cnt_reg__0[6]),
        .I1(wait_time_cnt_reg__0[1]),
        .I2(wait_time_cnt_reg__0[0]),
        .I3(\n_0_wait_time_cnt[6]_i_5__2 ),
        .I4(wait_time_cnt_reg__0[4]),
        .I5(wait_time_cnt_reg__0[5]),
        .O(\n_0_wait_time_cnt[6]_i_2__2 ));
LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
     \wait_time_cnt[6]_i_3__2 
       (.I0(wait_time_cnt_reg__0[5]),
        .I1(wait_time_cnt_reg__0[4]),
        .I2(\n_0_wait_time_cnt[6]_i_5__2 ),
        .I3(wait_time_cnt_reg__0[0]),
        .I4(wait_time_cnt_reg__0[1]),
        .I5(wait_time_cnt_reg__0[6]),
        .O(wait_time_cnt0__2[6]));
(* SOFT_HLUTNM = "soft_lutpair102" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \wait_time_cnt[6]_i_4__2 
       (.I0(check_tlock_max),
        .I1(\n_0_FSM_onehot_rx_state_reg[2] ),
        .O(\n_0_wait_time_cnt[6]_i_4__2 ));
(* SOFT_HLUTNM = "soft_lutpair108" *) 
   LUT2 #(
    .INIT(4'hE)) 
     \wait_time_cnt[6]_i_5__2 
       (.I0(wait_time_cnt_reg__0[2]),
        .I1(wait_time_cnt_reg__0[3]),
        .O(\n_0_wait_time_cnt[6]_i_5__2 ));
(* counter = "19" *) 
   FDRE \wait_time_cnt_reg[0] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__2 ),
        .D(wait_time_cnt0__2[0]),
        .Q(wait_time_cnt_reg__0[0]),
        .R(\n_0_wait_time_cnt[6]_i_1__2 ));
(* counter = "19" *) 
   FDRE \wait_time_cnt_reg[1] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__2 ),
        .D(wait_time_cnt0__2[1]),
        .Q(wait_time_cnt_reg__0[1]),
        .R(\n_0_wait_time_cnt[6]_i_1__2 ));
(* counter = "19" *) 
   FDSE \wait_time_cnt_reg[2] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__2 ),
        .D(wait_time_cnt0__2[2]),
        .Q(wait_time_cnt_reg__0[2]),
        .S(\n_0_wait_time_cnt[6]_i_1__2 ));
(* counter = "19" *) 
   FDRE \wait_time_cnt_reg[3] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__2 ),
        .D(wait_time_cnt0__2[3]),
        .Q(wait_time_cnt_reg__0[3]),
        .R(\n_0_wait_time_cnt[6]_i_1__2 ));
(* counter = "19" *) 
   FDRE \wait_time_cnt_reg[4] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__2 ),
        .D(wait_time_cnt0__2[4]),
        .Q(wait_time_cnt_reg__0[4]),
        .R(\n_0_wait_time_cnt[6]_i_1__2 ));
(* counter = "19" *) 
   FDSE \wait_time_cnt_reg[5] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__2 ),
        .D(wait_time_cnt0__2[5]),
        .Q(wait_time_cnt_reg__0[5]),
        .S(\n_0_wait_time_cnt[6]_i_1__2 ));
(* counter = "19" *) 
   FDSE \wait_time_cnt_reg[6] 
       (.C(SYSCLK_IN),
        .CE(\n_0_wait_time_cnt[6]_i_2__2 ),
        .D(wait_time_cnt0__2[6]),
        .Q(wait_time_cnt_reg__0[6]),
        .S(\n_0_wait_time_cnt[6]_i_1__2 ));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_init" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_init__parameterized0
   (gt0_drprdy_out,
    gt0_eyescandataerror_out,
    gt0_rxoutclk_out,
    gt0_rxresetdone_out,
    gt0_dmonitorout_out,
    gt0_drpdo_out,
    gt0_rxbufstatus_out,
    gt0_rxdata_out,
    gt0_rxmonitorout_out,
    gt0_rxchariscomma_out,
    gt0_rxcharisk_out,
    gt0_rxdisperr_out,
    gt0_rxnotintable_out,
    gt1_drprdy_out,
    gt1_eyescandataerror_out,
    gt1_rxoutclk_out,
    gt1_rxresetdone_out,
    gt1_dmonitorout_out,
    gt1_drpdo_out,
    gt1_rxbufstatus_out,
    gt1_rxdata_out,
    gt1_rxmonitorout_out,
    gt1_rxchariscomma_out,
    gt1_rxcharisk_out,
    gt1_rxdisperr_out,
    gt1_rxnotintable_out,
    gt2_drprdy_out,
    gt2_eyescandataerror_out,
    gt2_rxoutclk_out,
    gt2_rxresetdone_out,
    gt2_dmonitorout_out,
    gt2_drpdo_out,
    gt2_rxbufstatus_out,
    gt2_rxdata_out,
    gt2_rxmonitorout_out,
    gt2_rxchariscomma_out,
    gt2_rxcharisk_out,
    gt2_rxdisperr_out,
    gt2_rxnotintable_out,
    gt3_drprdy_out,
    gt3_eyescandataerror_out,
    gt3_rxoutclk_out,
    gt3_rxresetdone_out,
    gt3_dmonitorout_out,
    gt3_drpdo_out,
    gt3_rxbufstatus_out,
    gt3_rxdata_out,
    gt3_rxmonitorout_out,
    gt3_rxchariscomma_out,
    gt3_rxcharisk_out,
    gt3_rxdisperr_out,
    gt3_rxnotintable_out,
    GT0_RX_FSM_RESET_DONE_OUT,
    GT1_RX_FSM_RESET_DONE_OUT,
    GT2_RX_FSM_RESET_DONE_OUT,
    GT3_RX_FSM_RESET_DONE_OUT,
    GT0_QPLLRESET_OUT,
    GT0_DRP_BUSY_OUT,
    GT1_DRP_BUSY_OUT,
    GT2_DRP_BUSY_OUT,
    GT3_DRP_BUSY_OUT,
    gt0_drpclk_in,
    gt0_eyescanreset_in,
    gt0_eyescantrigger_in,
    gt0_gthrxn_in,
    gt0_gthrxp_in,
    GT0_QPLLOUTCLK_IN,
    GT0_QPLLOUTREFCLK_IN,
    gt0_rxbufreset_in,
    gt0_rxmcommaalignen_in,
    gt0_rxpcommaalignen_in,
    gt0_rxusrclk_in,
    gt0_rxusrclk2_in,
    gt0_rxmonitorsel_in,
    gt0_rxpd_in,
    gt1_drpclk_in,
    gt1_eyescanreset_in,
    gt1_eyescantrigger_in,
    gt1_gthrxn_in,
    gt1_gthrxp_in,
    gt1_rxbufreset_in,
    gt1_rxmcommaalignen_in,
    gt1_rxpcommaalignen_in,
    gt1_rxusrclk_in,
    gt1_rxusrclk2_in,
    gt1_rxmonitorsel_in,
    gt1_rxpd_in,
    gt2_drpclk_in,
    gt2_eyescanreset_in,
    gt2_eyescantrigger_in,
    gt2_gthrxn_in,
    gt2_gthrxp_in,
    gt2_rxbufreset_in,
    gt2_rxmcommaalignen_in,
    gt2_rxpcommaalignen_in,
    gt2_rxusrclk_in,
    gt2_rxusrclk2_in,
    gt2_rxmonitorsel_in,
    gt2_rxpd_in,
    gt3_drpclk_in,
    gt3_eyescanreset_in,
    gt3_eyescantrigger_in,
    gt3_gthrxn_in,
    gt3_gthrxp_in,
    gt3_rxbufreset_in,
    gt3_rxmcommaalignen_in,
    gt3_rxpcommaalignen_in,
    gt3_rxusrclk_in,
    gt3_rxusrclk2_in,
    gt3_rxmonitorsel_in,
    gt3_rxpd_in,
    SYSCLK_IN,
    GT0_DATA_VALID_IN,
    GT0_QPLLLOCK_IN,
    SOFT_RESET_IN,
    GT1_DATA_VALID_IN,
    GT2_DATA_VALID_IN,
    GT3_DATA_VALID_IN,
    gt0_drpen_in,
    gt0_drpdi_in,
    gt0_drpwe_in,
    gt0_drpaddr_in,
    gt1_drpen_in,
    gt1_drpdi_in,
    gt1_drpwe_in,
    gt1_drpaddr_in,
    gt2_drpen_in,
    gt2_drpdi_in,
    gt2_drpwe_in,
    gt2_drpaddr_in,
    gt3_drpen_in,
    gt3_drpdi_in,
    gt3_drpwe_in,
    gt3_drpaddr_in,
    DONT_RESET_ON_DATA_ERROR_IN);
  output gt0_drprdy_out;
  output gt0_eyescandataerror_out;
  output gt0_rxoutclk_out;
  output gt0_rxresetdone_out;
  output [14:0]gt0_dmonitorout_out;
  output [15:0]gt0_drpdo_out;
  output [2:0]gt0_rxbufstatus_out;
  output [15:0]gt0_rxdata_out;
  output [6:0]gt0_rxmonitorout_out;
  output [1:0]gt0_rxchariscomma_out;
  output [1:0]gt0_rxcharisk_out;
  output [1:0]gt0_rxdisperr_out;
  output [1:0]gt0_rxnotintable_out;
  output gt1_drprdy_out;
  output gt1_eyescandataerror_out;
  output gt1_rxoutclk_out;
  output gt1_rxresetdone_out;
  output [14:0]gt1_dmonitorout_out;
  output [15:0]gt1_drpdo_out;
  output [2:0]gt1_rxbufstatus_out;
  output [15:0]gt1_rxdata_out;
  output [6:0]gt1_rxmonitorout_out;
  output [1:0]gt1_rxchariscomma_out;
  output [1:0]gt1_rxcharisk_out;
  output [1:0]gt1_rxdisperr_out;
  output [1:0]gt1_rxnotintable_out;
  output gt2_drprdy_out;
  output gt2_eyescandataerror_out;
  output gt2_rxoutclk_out;
  output gt2_rxresetdone_out;
  output [14:0]gt2_dmonitorout_out;
  output [15:0]gt2_drpdo_out;
  output [2:0]gt2_rxbufstatus_out;
  output [15:0]gt2_rxdata_out;
  output [6:0]gt2_rxmonitorout_out;
  output [1:0]gt2_rxchariscomma_out;
  output [1:0]gt2_rxcharisk_out;
  output [1:0]gt2_rxdisperr_out;
  output [1:0]gt2_rxnotintable_out;
  output gt3_drprdy_out;
  output gt3_eyescandataerror_out;
  output gt3_rxoutclk_out;
  output gt3_rxresetdone_out;
  output [14:0]gt3_dmonitorout_out;
  output [15:0]gt3_drpdo_out;
  output [2:0]gt3_rxbufstatus_out;
  output [15:0]gt3_rxdata_out;
  output [6:0]gt3_rxmonitorout_out;
  output [1:0]gt3_rxchariscomma_out;
  output [1:0]gt3_rxcharisk_out;
  output [1:0]gt3_rxdisperr_out;
  output [1:0]gt3_rxnotintable_out;
  output GT0_RX_FSM_RESET_DONE_OUT;
  output GT1_RX_FSM_RESET_DONE_OUT;
  output GT2_RX_FSM_RESET_DONE_OUT;
  output GT3_RX_FSM_RESET_DONE_OUT;
  output GT0_QPLLRESET_OUT;
  output GT0_DRP_BUSY_OUT;
  output GT1_DRP_BUSY_OUT;
  output GT2_DRP_BUSY_OUT;
  output GT3_DRP_BUSY_OUT;
  input gt0_drpclk_in;
  input gt0_eyescanreset_in;
  input gt0_eyescantrigger_in;
  input gt0_gthrxn_in;
  input gt0_gthrxp_in;
  input GT0_QPLLOUTCLK_IN;
  input GT0_QPLLOUTREFCLK_IN;
  input gt0_rxbufreset_in;
  input gt0_rxmcommaalignen_in;
  input gt0_rxpcommaalignen_in;
  input gt0_rxusrclk_in;
  input gt0_rxusrclk2_in;
  input [1:0]gt0_rxmonitorsel_in;
  input [1:0]gt0_rxpd_in;
  input gt1_drpclk_in;
  input gt1_eyescanreset_in;
  input gt1_eyescantrigger_in;
  input gt1_gthrxn_in;
  input gt1_gthrxp_in;
  input gt1_rxbufreset_in;
  input gt1_rxmcommaalignen_in;
  input gt1_rxpcommaalignen_in;
  input gt1_rxusrclk_in;
  input gt1_rxusrclk2_in;
  input [1:0]gt1_rxmonitorsel_in;
  input [1:0]gt1_rxpd_in;
  input gt2_drpclk_in;
  input gt2_eyescanreset_in;
  input gt2_eyescantrigger_in;
  input gt2_gthrxn_in;
  input gt2_gthrxp_in;
  input gt2_rxbufreset_in;
  input gt2_rxmcommaalignen_in;
  input gt2_rxpcommaalignen_in;
  input gt2_rxusrclk_in;
  input gt2_rxusrclk2_in;
  input [1:0]gt2_rxmonitorsel_in;
  input [1:0]gt2_rxpd_in;
  input gt3_drpclk_in;
  input gt3_eyescanreset_in;
  input gt3_eyescantrigger_in;
  input gt3_gthrxn_in;
  input gt3_gthrxp_in;
  input gt3_rxbufreset_in;
  input gt3_rxmcommaalignen_in;
  input gt3_rxpcommaalignen_in;
  input gt3_rxusrclk_in;
  input gt3_rxusrclk2_in;
  input [1:0]gt3_rxmonitorsel_in;
  input [1:0]gt3_rxpd_in;
  input SYSCLK_IN;
  input GT0_DATA_VALID_IN;
  input GT0_QPLLLOCK_IN;
  input SOFT_RESET_IN;
  input GT1_DATA_VALID_IN;
  input GT2_DATA_VALID_IN;
  input GT3_DATA_VALID_IN;
  input gt0_drpen_in;
  input [15:0]gt0_drpdi_in;
  input gt0_drpwe_in;
  input [8:0]gt0_drpaddr_in;
  input gt1_drpen_in;
  input [15:0]gt1_drpdi_in;
  input gt1_drpwe_in;
  input [8:0]gt1_drpaddr_in;
  input gt2_drpen_in;
  input [15:0]gt2_drpdi_in;
  input gt2_drpwe_in;
  input [8:0]gt2_drpaddr_in;
  input gt3_drpen_in;
  input [15:0]gt3_drpdi_in;
  input gt3_drpwe_in;
  input [8:0]gt3_drpaddr_in;
  input DONT_RESET_ON_DATA_ERROR_IN;

  wire DONT_RESET_ON_DATA_ERROR_IN;
  wire GT0_DATA_VALID_IN;
  wire GT0_DRP_BUSY_OUT;
  wire GT0_QPLLLOCK_IN;
  wire GT0_QPLLOUTCLK_IN;
  wire GT0_QPLLOUTREFCLK_IN;
  wire GT0_QPLLRESET_OUT;
  wire GT0_RX_FSM_RESET_DONE_OUT;
  wire GT1_DATA_VALID_IN;
  wire GT1_DRP_BUSY_OUT;
  wire GT1_RX_FSM_RESET_DONE_OUT;
  wire GT2_DATA_VALID_IN;
  wire GT2_DRP_BUSY_OUT;
  wire GT2_RX_FSM_RESET_DONE_OUT;
  wire GT3_DATA_VALID_IN;
  wire GT3_DRP_BUSY_OUT;
  wire GT3_RX_FSM_RESET_DONE_OUT;
  wire RXUSERRDY;
  wire SOFT_RESET_IN;
  wire SYSCLK_IN;
  wire [14:0]gt0_dmonitorout_out;
  wire [8:0]gt0_drpaddr_in;
  wire gt0_drpclk_in;
  wire [15:0]gt0_drpdi_in;
  wire [15:0]gt0_drpdo_out;
  wire gt0_drpen_in;
  wire gt0_drprdy_out;
  wire gt0_drpwe_in;
  wire gt0_eyescandataerror_out;
  wire gt0_eyescanreset_in;
  wire gt0_eyescantrigger_in;
  wire gt0_gthrxn_in;
  wire gt0_gthrxp_in;
  wire [8:0]gt0_rx_cdrlock_counter;
  wire [8:0]gt0_rx_cdrlock_counter_0;
  wire gt0_rxbufreset_in;
  wire [2:0]gt0_rxbufstatus_out;
  wire [1:0]gt0_rxchariscomma_out;
  wire [1:0]gt0_rxcharisk_out;
  wire [15:0]gt0_rxdata_out;
  wire [1:0]gt0_rxdisperr_out;
  wire gt0_rxmcommaalignen_in;
  wire [6:0]gt0_rxmonitorout_out;
  wire [1:0]gt0_rxmonitorsel_in;
  wire [1:0]gt0_rxnotintable_out;
  wire gt0_rxoutclk_out;
  wire gt0_rxpcommaalignen_in;
  wire [1:0]gt0_rxpd_in;
  wire gt0_rxresetdone_out;
  wire gt0_rxusrclk2_in;
  wire gt0_rxusrclk_in;
  wire [14:0]gt1_dmonitorout_out;
  wire [8:0]gt1_drpaddr_in;
  wire gt1_drpclk_in;
  wire [15:0]gt1_drpdi_in;
  wire [15:0]gt1_drpdo_out;
  wire gt1_drpen_in;
  wire gt1_drprdy_out;
  wire gt1_drpwe_in;
  wire gt1_eyescandataerror_out;
  wire gt1_eyescanreset_in;
  wire gt1_eyescantrigger_in;
  wire gt1_gthrxn_in;
  wire gt1_gthrxp_in;
  wire gt1_rxbufreset_in;
  wire [2:0]gt1_rxbufstatus_out;
  wire [1:0]gt1_rxchariscomma_out;
  wire [1:0]gt1_rxcharisk_out;
  wire [15:0]gt1_rxdata_out;
  wire [1:0]gt1_rxdisperr_out;
  wire gt1_rxmcommaalignen_in;
  wire [6:0]gt1_rxmonitorout_out;
  wire [1:0]gt1_rxmonitorsel_in;
  wire [1:0]gt1_rxnotintable_out;
  wire gt1_rxoutclk_out;
  wire gt1_rxpcommaalignen_in;
  wire [1:0]gt1_rxpd_in;
  wire gt1_rxresetdone_out;
  wire gt1_rxusrclk2_in;
  wire gt1_rxusrclk_in;
  wire [14:0]gt2_dmonitorout_out;
  wire [8:0]gt2_drpaddr_in;
  wire gt2_drpclk_in;
  wire [15:0]gt2_drpdi_in;
  wire [15:0]gt2_drpdo_out;
  wire gt2_drpen_in;
  wire gt2_drprdy_out;
  wire gt2_drpwe_in;
  wire gt2_eyescandataerror_out;
  wire gt2_eyescanreset_in;
  wire gt2_eyescantrigger_in;
  wire gt2_gthrxn_in;
  wire gt2_gthrxp_in;
  wire gt2_rxbufreset_in;
  wire [2:0]gt2_rxbufstatus_out;
  wire [1:0]gt2_rxchariscomma_out;
  wire [1:0]gt2_rxcharisk_out;
  wire [15:0]gt2_rxdata_out;
  wire [1:0]gt2_rxdisperr_out;
  wire gt2_rxmcommaalignen_in;
  wire [6:0]gt2_rxmonitorout_out;
  wire [1:0]gt2_rxmonitorsel_in;
  wire [1:0]gt2_rxnotintable_out;
  wire gt2_rxoutclk_out;
  wire gt2_rxpcommaalignen_in;
  wire [1:0]gt2_rxpd_in;
  wire gt2_rxresetdone_out;
  wire gt2_rxusrclk2_in;
  wire gt2_rxusrclk_in;
  wire [14:0]gt3_dmonitorout_out;
  wire [8:0]gt3_drpaddr_in;
  wire gt3_drpclk_in;
  wire [15:0]gt3_drpdi_in;
  wire [15:0]gt3_drpdo_out;
  wire gt3_drpen_in;
  wire gt3_drprdy_out;
  wire gt3_drpwe_in;
  wire gt3_eyescandataerror_out;
  wire gt3_eyescanreset_in;
  wire gt3_eyescantrigger_in;
  wire gt3_gthrxn_in;
  wire gt3_gthrxp_in;
  wire gt3_rxbufreset_in;
  wire [2:0]gt3_rxbufstatus_out;
  wire [1:0]gt3_rxchariscomma_out;
  wire [1:0]gt3_rxcharisk_out;
  wire [15:0]gt3_rxdata_out;
  wire [1:0]gt3_rxdisperr_out;
  wire gt3_rxmcommaalignen_in;
  wire [6:0]gt3_rxmonitorout_out;
  wire [1:0]gt3_rxmonitorsel_in;
  wire [1:0]gt3_rxnotintable_out;
  wire gt3_rxoutclk_out;
  wire gt3_rxpcommaalignen_in;
  wire [1:0]gt3_rxpd_in;
  wire gt3_rxresetdone_out;
  wire gt3_rxusrclk2_in;
  wire gt3_rxusrclk_in;
  wire gtrxreset_i;
  wire \n_0_gt0_rx_cdrlock_counter[2]_i_2 ;
  wire \n_0_gt0_rx_cdrlock_counter[7]_i_2 ;
  wire \n_0_gt0_rx_cdrlock_counter[8]_i_2 ;
  wire n_0_gt0_rx_cdrlocked_i_1;
  wire n_0_gt0_rx_cdrlocked_reg;
  wire n_1_gt1_rxresetfsm_i;
  wire n_1_gt2_rxresetfsm_i;
  wire n_1_gt3_rxresetfsm_i;
  wire n_2_gt1_rxresetfsm_i;
  wire n_2_gt2_rxresetfsm_i;
  wire n_2_gt3_rxresetfsm_i;

(* SOFT_HLUTNM = "soft_lutpair137" *) 
   LUT5 #(
    .INIT(32'h8000FFFF)) 
     \gt0_rx_cdrlock_counter[0]_i_1 
       (.I0(gt0_rx_cdrlock_counter[3]),
        .I1(gt0_rx_cdrlock_counter[4]),
        .I2(\n_0_gt0_rx_cdrlock_counter[2]_i_2 ),
        .I3(gt0_rx_cdrlock_counter[1]),
        .I4(gt0_rx_cdrlock_counter[0]),
        .O(gt0_rx_cdrlock_counter_0[0]));
(* SOFT_HLUTNM = "soft_lutpair137" *) 
   LUT5 #(
    .INIT(32'h80FFFF00)) 
     \gt0_rx_cdrlock_counter[1]_i_1 
       (.I0(gt0_rx_cdrlock_counter[3]),
        .I1(gt0_rx_cdrlock_counter[4]),
        .I2(\n_0_gt0_rx_cdrlock_counter[2]_i_2 ),
        .I3(gt0_rx_cdrlock_counter[1]),
        .I4(gt0_rx_cdrlock_counter[0]),
        .O(gt0_rx_cdrlock_counter_0[1]));
LUT6 #(
    .INIT(64'h00FFFFFF7F000000)) 
     \gt0_rx_cdrlock_counter[2]_i_1 
       (.I0(gt0_rx_cdrlock_counter[3]),
        .I1(gt0_rx_cdrlock_counter[4]),
        .I2(\n_0_gt0_rx_cdrlock_counter[2]_i_2 ),
        .I3(gt0_rx_cdrlock_counter[1]),
        .I4(gt0_rx_cdrlock_counter[0]),
        .I5(gt0_rx_cdrlock_counter[2]),
        .O(gt0_rx_cdrlock_counter_0[2]));
LUT5 #(
    .INIT(32'h00000008)) 
     \gt0_rx_cdrlock_counter[2]_i_2 
       (.I0(gt0_rx_cdrlock_counter[8]),
        .I1(gt0_rx_cdrlock_counter[6]),
        .I2(gt0_rx_cdrlock_counter[5]),
        .I3(gt0_rx_cdrlock_counter[2]),
        .I4(gt0_rx_cdrlock_counter[7]),
        .O(\n_0_gt0_rx_cdrlock_counter[2]_i_2 ));
(* SOFT_HLUTNM = "soft_lutpair138" *) 
   LUT4 #(
    .INIT(16'h6AAA)) 
     \gt0_rx_cdrlock_counter[3]_i_1 
       (.I0(gt0_rx_cdrlock_counter[3]),
        .I1(gt0_rx_cdrlock_counter[0]),
        .I2(gt0_rx_cdrlock_counter[1]),
        .I3(gt0_rx_cdrlock_counter[2]),
        .O(gt0_rx_cdrlock_counter_0[3]));
(* SOFT_HLUTNM = "soft_lutpair138" *) 
   LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \gt0_rx_cdrlock_counter[4]_i_1 
       (.I0(gt0_rx_cdrlock_counter[4]),
        .I1(gt0_rx_cdrlock_counter[2]),
        .I2(gt0_rx_cdrlock_counter[1]),
        .I3(gt0_rx_cdrlock_counter[0]),
        .I4(gt0_rx_cdrlock_counter[3]),
        .O(gt0_rx_cdrlock_counter_0[4]));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \gt0_rx_cdrlock_counter[5]_i_1 
       (.I0(gt0_rx_cdrlock_counter[5]),
        .I1(gt0_rx_cdrlock_counter[3]),
        .I2(gt0_rx_cdrlock_counter[4]),
        .I3(gt0_rx_cdrlock_counter[2]),
        .I4(gt0_rx_cdrlock_counter[1]),
        .I5(gt0_rx_cdrlock_counter[0]),
        .O(gt0_rx_cdrlock_counter_0[5]));
LUT5 #(
    .INIT(32'h6AAAAAAA)) 
     \gt0_rx_cdrlock_counter[6]_i_1 
       (.I0(gt0_rx_cdrlock_counter[6]),
        .I1(\n_0_gt0_rx_cdrlock_counter[7]_i_2 ),
        .I2(gt0_rx_cdrlock_counter[4]),
        .I3(gt0_rx_cdrlock_counter[3]),
        .I4(gt0_rx_cdrlock_counter[5]),
        .O(gt0_rx_cdrlock_counter_0[6]));
LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
     \gt0_rx_cdrlock_counter[7]_i_1 
       (.I0(gt0_rx_cdrlock_counter[7]),
        .I1(gt0_rx_cdrlock_counter[5]),
        .I2(gt0_rx_cdrlock_counter[3]),
        .I3(gt0_rx_cdrlock_counter[4]),
        .I4(\n_0_gt0_rx_cdrlock_counter[7]_i_2 ),
        .I5(gt0_rx_cdrlock_counter[6]),
        .O(gt0_rx_cdrlock_counter_0[7]));
LUT3 #(
    .INIT(8'h80)) 
     \gt0_rx_cdrlock_counter[7]_i_2 
       (.I0(gt0_rx_cdrlock_counter[2]),
        .I1(gt0_rx_cdrlock_counter[1]),
        .I2(gt0_rx_cdrlock_counter[0]),
        .O(\n_0_gt0_rx_cdrlock_counter[7]_i_2 ));
LUT4 #(
    .INIT(16'h6AAA)) 
     \gt0_rx_cdrlock_counter[8]_i_1 
       (.I0(gt0_rx_cdrlock_counter[8]),
        .I1(gt0_rx_cdrlock_counter[6]),
        .I2(\n_0_gt0_rx_cdrlock_counter[8]_i_2 ),
        .I3(gt0_rx_cdrlock_counter[7]),
        .O(gt0_rx_cdrlock_counter_0[8]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \gt0_rx_cdrlock_counter[8]_i_2 
       (.I0(gt0_rx_cdrlock_counter[5]),
        .I1(gt0_rx_cdrlock_counter[3]),
        .I2(gt0_rx_cdrlock_counter[4]),
        .I3(gt0_rx_cdrlock_counter[2]),
        .I4(gt0_rx_cdrlock_counter[1]),
        .I5(gt0_rx_cdrlock_counter[0]),
        .O(\n_0_gt0_rx_cdrlock_counter[8]_i_2 ));
FDRE #(
    .INIT(1'b0)) 
     \gt0_rx_cdrlock_counter_reg[0] 
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[0]),
        .Q(gt0_rx_cdrlock_counter[0]),
        .R(gtrxreset_i));
FDRE #(
    .INIT(1'b0)) 
     \gt0_rx_cdrlock_counter_reg[1] 
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[1]),
        .Q(gt0_rx_cdrlock_counter[1]),
        .R(gtrxreset_i));
FDRE #(
    .INIT(1'b0)) 
     \gt0_rx_cdrlock_counter_reg[2] 
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[2]),
        .Q(gt0_rx_cdrlock_counter[2]),
        .R(gtrxreset_i));
FDRE #(
    .INIT(1'b0)) 
     \gt0_rx_cdrlock_counter_reg[3] 
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[3]),
        .Q(gt0_rx_cdrlock_counter[3]),
        .R(gtrxreset_i));
FDRE #(
    .INIT(1'b0)) 
     \gt0_rx_cdrlock_counter_reg[4] 
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[4]),
        .Q(gt0_rx_cdrlock_counter[4]),
        .R(gtrxreset_i));
FDRE #(
    .INIT(1'b0)) 
     \gt0_rx_cdrlock_counter_reg[5] 
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[5]),
        .Q(gt0_rx_cdrlock_counter[5]),
        .R(gtrxreset_i));
FDRE #(
    .INIT(1'b0)) 
     \gt0_rx_cdrlock_counter_reg[6] 
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[6]),
        .Q(gt0_rx_cdrlock_counter[6]),
        .R(gtrxreset_i));
FDRE #(
    .INIT(1'b0)) 
     \gt0_rx_cdrlock_counter_reg[7] 
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[7]),
        .Q(gt0_rx_cdrlock_counter[7]),
        .R(gtrxreset_i));
FDRE #(
    .INIT(1'b0)) 
     \gt0_rx_cdrlock_counter_reg[8] 
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[8]),
        .Q(gt0_rx_cdrlock_counter[8]),
        .R(gtrxreset_i));
LUT6 #(
    .INIT(64'hFFFFFFFF80000000)) 
     gt0_rx_cdrlocked_i_1
       (.I0(gt0_rx_cdrlock_counter[3]),
        .I1(gt0_rx_cdrlock_counter[4]),
        .I2(\n_0_gt0_rx_cdrlock_counter[2]_i_2 ),
        .I3(gt0_rx_cdrlock_counter[1]),
        .I4(gt0_rx_cdrlock_counter[0]),
        .I5(n_0_gt0_rx_cdrlocked_reg),
        .O(n_0_gt0_rx_cdrlocked_i_1));
FDRE gt0_rx_cdrlocked_reg
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(n_0_gt0_rx_cdrlocked_i_1),
        .Q(n_0_gt0_rx_cdrlocked_reg),
        .R(gtrxreset_i));
gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0 gt0_rxresetfsm_i
       (.AR(GT0_QPLLRESET_OUT),
        .DONT_RESET_ON_DATA_ERROR_IN(DONT_RESET_ON_DATA_ERROR_IN),
        .GT0_DATA_VALID_IN(GT0_DATA_VALID_IN),
        .GT0_QPLLLOCK_IN(GT0_QPLLLOCK_IN),
        .GT0_RX_FSM_RESET_DONE_OUT(GT0_RX_FSM_RESET_DONE_OUT),
        .I1(n_0_gt0_rx_cdrlocked_reg),
        .RXUSERRDY(RXUSERRDY),
        .SOFT_RESET_IN(SOFT_RESET_IN),
        .SYSCLK_IN(SYSCLK_IN),
        .gt0_rxresetdone_out(gt0_rxresetdone_out),
        .gt0_rxusrclk_in(gt0_rxusrclk_in),
        .gtrxreset_i(gtrxreset_i));
gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_0 gt1_rxresetfsm_i
       (.DONT_RESET_ON_DATA_ERROR_IN(DONT_RESET_ON_DATA_ERROR_IN),
        .GT0_QPLLLOCK_IN(GT0_QPLLLOCK_IN),
        .GT1_DATA_VALID_IN(GT1_DATA_VALID_IN),
        .GT1_RX_FSM_RESET_DONE_OUT(GT1_RX_FSM_RESET_DONE_OUT),
        .I1(n_0_gt0_rx_cdrlocked_reg),
        .O1(n_1_gt1_rxresetfsm_i),
        .O2(n_2_gt1_rxresetfsm_i),
        .SOFT_RESET_IN(SOFT_RESET_IN),
        .SYSCLK_IN(SYSCLK_IN),
        .gt1_rxresetdone_out(gt1_rxresetdone_out),
        .gt1_rxusrclk_in(gt1_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_1 gt2_rxresetfsm_i
       (.DONT_RESET_ON_DATA_ERROR_IN(DONT_RESET_ON_DATA_ERROR_IN),
        .GT0_QPLLLOCK_IN(GT0_QPLLLOCK_IN),
        .GT2_DATA_VALID_IN(GT2_DATA_VALID_IN),
        .GT2_RX_FSM_RESET_DONE_OUT(GT2_RX_FSM_RESET_DONE_OUT),
        .I1(n_0_gt0_rx_cdrlocked_reg),
        .O1(n_1_gt2_rxresetfsm_i),
        .O2(n_2_gt2_rxresetfsm_i),
        .SOFT_RESET_IN(SOFT_RESET_IN),
        .SYSCLK_IN(SYSCLK_IN),
        .gt2_rxresetdone_out(gt2_rxresetdone_out),
        .gt2_rxusrclk_in(gt2_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_2 gt3_rxresetfsm_i
       (.DONT_RESET_ON_DATA_ERROR_IN(DONT_RESET_ON_DATA_ERROR_IN),
        .GT0_QPLLLOCK_IN(GT0_QPLLLOCK_IN),
        .GT3_DATA_VALID_IN(GT3_DATA_VALID_IN),
        .GT3_RX_FSM_RESET_DONE_OUT(GT3_RX_FSM_RESET_DONE_OUT),
        .I1(n_0_gt0_rx_cdrlocked_reg),
        .O1(n_1_gt3_rxresetfsm_i),
        .O2(n_2_gt3_rxresetfsm_i),
        .SOFT_RESET_IN(SOFT_RESET_IN),
        .SYSCLK_IN(SYSCLK_IN),
        .gt3_rxresetdone_out(gt3_rxresetdone_out),
        .gt3_rxusrclk_in(gt3_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_multi_gt__parameterized0 gtwizard_32_Rx_i
       (.AR(GT0_QPLLRESET_OUT),
        .GT0_DRP_BUSY_OUT(GT0_DRP_BUSY_OUT),
        .GT0_QPLLOUTCLK_IN(GT0_QPLLOUTCLK_IN),
        .GT0_QPLLOUTREFCLK_IN(GT0_QPLLOUTREFCLK_IN),
        .GT1_DRP_BUSY_OUT(GT1_DRP_BUSY_OUT),
        .GT2_DRP_BUSY_OUT(GT2_DRP_BUSY_OUT),
        .GT3_DRP_BUSY_OUT(GT3_DRP_BUSY_OUT),
        .I1(n_1_gt1_rxresetfsm_i),
        .I2(n_1_gt2_rxresetfsm_i),
        .I3(n_1_gt3_rxresetfsm_i),
        .I4(n_2_gt1_rxresetfsm_i),
        .I5(n_2_gt2_rxresetfsm_i),
        .I6(n_2_gt3_rxresetfsm_i),
        .O1(gt0_drprdy_out),
        .O2(gt1_drprdy_out),
        .O3(gt2_drprdy_out),
        .O4(gt3_drprdy_out),
        .RXUSERRDY(RXUSERRDY),
        .gt0_dmonitorout_out(gt0_dmonitorout_out),
        .gt0_drpaddr_in(gt0_drpaddr_in),
        .gt0_drpclk_in(gt0_drpclk_in),
        .gt0_drpdi_in(gt0_drpdi_in),
        .gt0_drpdo_out(gt0_drpdo_out),
        .gt0_drpen_in(gt0_drpen_in),
        .gt0_drpwe_in(gt0_drpwe_in),
        .gt0_eyescandataerror_out(gt0_eyescandataerror_out),
        .gt0_eyescanreset_in(gt0_eyescanreset_in),
        .gt0_eyescantrigger_in(gt0_eyescantrigger_in),
        .gt0_gthrxn_in(gt0_gthrxn_in),
        .gt0_gthrxp_in(gt0_gthrxp_in),
        .gt0_rxbufreset_in(gt0_rxbufreset_in),
        .gt0_rxbufstatus_out(gt0_rxbufstatus_out),
        .gt0_rxchariscomma_out(gt0_rxchariscomma_out),
        .gt0_rxcharisk_out(gt0_rxcharisk_out),
        .gt0_rxdata_out(gt0_rxdata_out),
        .gt0_rxdisperr_out(gt0_rxdisperr_out),
        .gt0_rxmcommaalignen_in(gt0_rxmcommaalignen_in),
        .gt0_rxmonitorout_out(gt0_rxmonitorout_out),
        .gt0_rxmonitorsel_in(gt0_rxmonitorsel_in),
        .gt0_rxnotintable_out(gt0_rxnotintable_out),
        .gt0_rxoutclk_out(gt0_rxoutclk_out),
        .gt0_rxpcommaalignen_in(gt0_rxpcommaalignen_in),
        .gt0_rxpd_in(gt0_rxpd_in),
        .gt0_rxresetdone_out(gt0_rxresetdone_out),
        .gt0_rxusrclk2_in(gt0_rxusrclk2_in),
        .gt0_rxusrclk_in(gt0_rxusrclk_in),
        .gt1_dmonitorout_out(gt1_dmonitorout_out),
        .gt1_drpaddr_in(gt1_drpaddr_in),
        .gt1_drpclk_in(gt1_drpclk_in),
        .gt1_drpdi_in(gt1_drpdi_in),
        .gt1_drpdo_out(gt1_drpdo_out),
        .gt1_drpen_in(gt1_drpen_in),
        .gt1_drpwe_in(gt1_drpwe_in),
        .gt1_eyescandataerror_out(gt1_eyescandataerror_out),
        .gt1_eyescanreset_in(gt1_eyescanreset_in),
        .gt1_eyescantrigger_in(gt1_eyescantrigger_in),
        .gt1_gthrxn_in(gt1_gthrxn_in),
        .gt1_gthrxp_in(gt1_gthrxp_in),
        .gt1_rxbufreset_in(gt1_rxbufreset_in),
        .gt1_rxbufstatus_out(gt1_rxbufstatus_out),
        .gt1_rxchariscomma_out(gt1_rxchariscomma_out),
        .gt1_rxcharisk_out(gt1_rxcharisk_out),
        .gt1_rxdata_out(gt1_rxdata_out),
        .gt1_rxdisperr_out(gt1_rxdisperr_out),
        .gt1_rxmcommaalignen_in(gt1_rxmcommaalignen_in),
        .gt1_rxmonitorout_out(gt1_rxmonitorout_out),
        .gt1_rxmonitorsel_in(gt1_rxmonitorsel_in),
        .gt1_rxnotintable_out(gt1_rxnotintable_out),
        .gt1_rxoutclk_out(gt1_rxoutclk_out),
        .gt1_rxpcommaalignen_in(gt1_rxpcommaalignen_in),
        .gt1_rxpd_in(gt1_rxpd_in),
        .gt1_rxresetdone_out(gt1_rxresetdone_out),
        .gt1_rxusrclk2_in(gt1_rxusrclk2_in),
        .gt1_rxusrclk_in(gt1_rxusrclk_in),
        .gt2_dmonitorout_out(gt2_dmonitorout_out),
        .gt2_drpaddr_in(gt2_drpaddr_in),
        .gt2_drpclk_in(gt2_drpclk_in),
        .gt2_drpdi_in(gt2_drpdi_in),
        .gt2_drpdo_out(gt2_drpdo_out),
        .gt2_drpen_in(gt2_drpen_in),
        .gt2_drpwe_in(gt2_drpwe_in),
        .gt2_eyescandataerror_out(gt2_eyescandataerror_out),
        .gt2_eyescanreset_in(gt2_eyescanreset_in),
        .gt2_eyescantrigger_in(gt2_eyescantrigger_in),
        .gt2_gthrxn_in(gt2_gthrxn_in),
        .gt2_gthrxp_in(gt2_gthrxp_in),
        .gt2_rxbufreset_in(gt2_rxbufreset_in),
        .gt2_rxbufstatus_out(gt2_rxbufstatus_out),
        .gt2_rxchariscomma_out(gt2_rxchariscomma_out),
        .gt2_rxcharisk_out(gt2_rxcharisk_out),
        .gt2_rxdata_out(gt2_rxdata_out),
        .gt2_rxdisperr_out(gt2_rxdisperr_out),
        .gt2_rxmcommaalignen_in(gt2_rxmcommaalignen_in),
        .gt2_rxmonitorout_out(gt2_rxmonitorout_out),
        .gt2_rxmonitorsel_in(gt2_rxmonitorsel_in),
        .gt2_rxnotintable_out(gt2_rxnotintable_out),
        .gt2_rxoutclk_out(gt2_rxoutclk_out),
        .gt2_rxpcommaalignen_in(gt2_rxpcommaalignen_in),
        .gt2_rxpd_in(gt2_rxpd_in),
        .gt2_rxresetdone_out(gt2_rxresetdone_out),
        .gt2_rxusrclk2_in(gt2_rxusrclk2_in),
        .gt2_rxusrclk_in(gt2_rxusrclk_in),
        .gt3_dmonitorout_out(gt3_dmonitorout_out),
        .gt3_drpaddr_in(gt3_drpaddr_in),
        .gt3_drpclk_in(gt3_drpclk_in),
        .gt3_drpdi_in(gt3_drpdi_in),
        .gt3_drpdo_out(gt3_drpdo_out),
        .gt3_drpen_in(gt3_drpen_in),
        .gt3_drpwe_in(gt3_drpwe_in),
        .gt3_eyescandataerror_out(gt3_eyescandataerror_out),
        .gt3_eyescanreset_in(gt3_eyescanreset_in),
        .gt3_eyescantrigger_in(gt3_eyescantrigger_in),
        .gt3_gthrxn_in(gt3_gthrxn_in),
        .gt3_gthrxp_in(gt3_gthrxp_in),
        .gt3_rxbufreset_in(gt3_rxbufreset_in),
        .gt3_rxbufstatus_out(gt3_rxbufstatus_out),
        .gt3_rxchariscomma_out(gt3_rxchariscomma_out),
        .gt3_rxcharisk_out(gt3_rxcharisk_out),
        .gt3_rxdata_out(gt3_rxdata_out),
        .gt3_rxdisperr_out(gt3_rxdisperr_out),
        .gt3_rxmcommaalignen_in(gt3_rxmcommaalignen_in),
        .gt3_rxmonitorout_out(gt3_rxmonitorout_out),
        .gt3_rxmonitorsel_in(gt3_rxmonitorsel_in),
        .gt3_rxnotintable_out(gt3_rxnotintable_out),
        .gt3_rxoutclk_out(gt3_rxoutclk_out),
        .gt3_rxpcommaalignen_in(gt3_rxpcommaalignen_in),
        .gt3_rxpd_in(gt3_rxpd_in),
        .gt3_rxresetdone_out(gt3_rxresetdone_out),
        .gt3_rxusrclk2_in(gt3_rxusrclk2_in),
        .gt3_rxusrclk_in(gt3_rxusrclk_in),
        .gtrxreset_i(gtrxreset_i));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_multi_gt" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_multi_gt__parameterized0
   (O1,
    gt0_eyescandataerror_out,
    gt0_rxoutclk_out,
    gt0_rxresetdone_out,
    gt0_dmonitorout_out,
    gt0_drpdo_out,
    gt0_rxbufstatus_out,
    gt0_rxdata_out,
    gt0_rxmonitorout_out,
    gt0_rxchariscomma_out,
    gt0_rxcharisk_out,
    gt0_rxdisperr_out,
    gt0_rxnotintable_out,
    O2,
    gt1_eyescandataerror_out,
    gt1_rxoutclk_out,
    gt1_rxresetdone_out,
    gt1_dmonitorout_out,
    gt1_drpdo_out,
    gt1_rxbufstatus_out,
    gt1_rxdata_out,
    gt1_rxmonitorout_out,
    gt1_rxchariscomma_out,
    gt1_rxcharisk_out,
    gt1_rxdisperr_out,
    gt1_rxnotintable_out,
    O3,
    gt2_eyescandataerror_out,
    gt2_rxoutclk_out,
    gt2_rxresetdone_out,
    gt2_dmonitorout_out,
    gt2_drpdo_out,
    gt2_rxbufstatus_out,
    gt2_rxdata_out,
    gt2_rxmonitorout_out,
    gt2_rxchariscomma_out,
    gt2_rxcharisk_out,
    gt2_rxdisperr_out,
    gt2_rxnotintable_out,
    O4,
    gt3_eyescandataerror_out,
    gt3_rxoutclk_out,
    gt3_rxresetdone_out,
    gt3_dmonitorout_out,
    gt3_drpdo_out,
    gt3_rxbufstatus_out,
    gt3_rxdata_out,
    gt3_rxmonitorout_out,
    gt3_rxchariscomma_out,
    gt3_rxcharisk_out,
    gt3_rxdisperr_out,
    gt3_rxnotintable_out,
    GT0_DRP_BUSY_OUT,
    GT1_DRP_BUSY_OUT,
    GT2_DRP_BUSY_OUT,
    GT3_DRP_BUSY_OUT,
    gt0_drpclk_in,
    gt0_eyescanreset_in,
    gt0_eyescantrigger_in,
    gt0_gthrxn_in,
    gt0_gthrxp_in,
    GT0_QPLLOUTCLK_IN,
    GT0_QPLLOUTREFCLK_IN,
    gt0_rxbufreset_in,
    gt0_rxmcommaalignen_in,
    gt0_rxpcommaalignen_in,
    RXUSERRDY,
    gt0_rxusrclk_in,
    gt0_rxusrclk2_in,
    gt0_rxmonitorsel_in,
    gt0_rxpd_in,
    gt1_drpclk_in,
    gt1_eyescanreset_in,
    gt1_eyescantrigger_in,
    gt1_gthrxn_in,
    gt1_gthrxp_in,
    gt1_rxbufreset_in,
    gt1_rxmcommaalignen_in,
    gt1_rxpcommaalignen_in,
    I1,
    gt1_rxusrclk_in,
    gt1_rxusrclk2_in,
    gt1_rxmonitorsel_in,
    gt1_rxpd_in,
    gt2_drpclk_in,
    gt2_eyescanreset_in,
    gt2_eyescantrigger_in,
    gt2_gthrxn_in,
    gt2_gthrxp_in,
    gt2_rxbufreset_in,
    gt2_rxmcommaalignen_in,
    gt2_rxpcommaalignen_in,
    I2,
    gt2_rxusrclk_in,
    gt2_rxusrclk2_in,
    gt2_rxmonitorsel_in,
    gt2_rxpd_in,
    gt3_drpclk_in,
    gt3_eyescanreset_in,
    gt3_eyescantrigger_in,
    gt3_gthrxn_in,
    gt3_gthrxp_in,
    gt3_rxbufreset_in,
    gt3_rxmcommaalignen_in,
    gt3_rxpcommaalignen_in,
    I3,
    gt3_rxusrclk_in,
    gt3_rxusrclk2_in,
    gt3_rxmonitorsel_in,
    gt3_rxpd_in,
    AR,
    gtrxreset_i,
    I4,
    I5,
    I6,
    gt0_drpen_in,
    gt0_drpdi_in,
    gt0_drpwe_in,
    gt0_drpaddr_in,
    gt1_drpen_in,
    gt1_drpdi_in,
    gt1_drpwe_in,
    gt1_drpaddr_in,
    gt2_drpen_in,
    gt2_drpdi_in,
    gt2_drpwe_in,
    gt2_drpaddr_in,
    gt3_drpen_in,
    gt3_drpdi_in,
    gt3_drpwe_in,
    gt3_drpaddr_in);
  output O1;
  output gt0_eyescandataerror_out;
  output gt0_rxoutclk_out;
  output gt0_rxresetdone_out;
  output [14:0]gt0_dmonitorout_out;
  output [15:0]gt0_drpdo_out;
  output [2:0]gt0_rxbufstatus_out;
  output [15:0]gt0_rxdata_out;
  output [6:0]gt0_rxmonitorout_out;
  output [1:0]gt0_rxchariscomma_out;
  output [1:0]gt0_rxcharisk_out;
  output [1:0]gt0_rxdisperr_out;
  output [1:0]gt0_rxnotintable_out;
  output O2;
  output gt1_eyescandataerror_out;
  output gt1_rxoutclk_out;
  output gt1_rxresetdone_out;
  output [14:0]gt1_dmonitorout_out;
  output [15:0]gt1_drpdo_out;
  output [2:0]gt1_rxbufstatus_out;
  output [15:0]gt1_rxdata_out;
  output [6:0]gt1_rxmonitorout_out;
  output [1:0]gt1_rxchariscomma_out;
  output [1:0]gt1_rxcharisk_out;
  output [1:0]gt1_rxdisperr_out;
  output [1:0]gt1_rxnotintable_out;
  output O3;
  output gt2_eyescandataerror_out;
  output gt2_rxoutclk_out;
  output gt2_rxresetdone_out;
  output [14:0]gt2_dmonitorout_out;
  output [15:0]gt2_drpdo_out;
  output [2:0]gt2_rxbufstatus_out;
  output [15:0]gt2_rxdata_out;
  output [6:0]gt2_rxmonitorout_out;
  output [1:0]gt2_rxchariscomma_out;
  output [1:0]gt2_rxcharisk_out;
  output [1:0]gt2_rxdisperr_out;
  output [1:0]gt2_rxnotintable_out;
  output O4;
  output gt3_eyescandataerror_out;
  output gt3_rxoutclk_out;
  output gt3_rxresetdone_out;
  output [14:0]gt3_dmonitorout_out;
  output [15:0]gt3_drpdo_out;
  output [2:0]gt3_rxbufstatus_out;
  output [15:0]gt3_rxdata_out;
  output [6:0]gt3_rxmonitorout_out;
  output [1:0]gt3_rxchariscomma_out;
  output [1:0]gt3_rxcharisk_out;
  output [1:0]gt3_rxdisperr_out;
  output [1:0]gt3_rxnotintable_out;
  output GT0_DRP_BUSY_OUT;
  output GT1_DRP_BUSY_OUT;
  output GT2_DRP_BUSY_OUT;
  output GT3_DRP_BUSY_OUT;
  input gt0_drpclk_in;
  input gt0_eyescanreset_in;
  input gt0_eyescantrigger_in;
  input gt0_gthrxn_in;
  input gt0_gthrxp_in;
  input GT0_QPLLOUTCLK_IN;
  input GT0_QPLLOUTREFCLK_IN;
  input gt0_rxbufreset_in;
  input gt0_rxmcommaalignen_in;
  input gt0_rxpcommaalignen_in;
  input RXUSERRDY;
  input gt0_rxusrclk_in;
  input gt0_rxusrclk2_in;
  input [1:0]gt0_rxmonitorsel_in;
  input [1:0]gt0_rxpd_in;
  input gt1_drpclk_in;
  input gt1_eyescanreset_in;
  input gt1_eyescantrigger_in;
  input gt1_gthrxn_in;
  input gt1_gthrxp_in;
  input gt1_rxbufreset_in;
  input gt1_rxmcommaalignen_in;
  input gt1_rxpcommaalignen_in;
  input I1;
  input gt1_rxusrclk_in;
  input gt1_rxusrclk2_in;
  input [1:0]gt1_rxmonitorsel_in;
  input [1:0]gt1_rxpd_in;
  input gt2_drpclk_in;
  input gt2_eyescanreset_in;
  input gt2_eyescantrigger_in;
  input gt2_gthrxn_in;
  input gt2_gthrxp_in;
  input gt2_rxbufreset_in;
  input gt2_rxmcommaalignen_in;
  input gt2_rxpcommaalignen_in;
  input I2;
  input gt2_rxusrclk_in;
  input gt2_rxusrclk2_in;
  input [1:0]gt2_rxmonitorsel_in;
  input [1:0]gt2_rxpd_in;
  input gt3_drpclk_in;
  input gt3_eyescanreset_in;
  input gt3_eyescantrigger_in;
  input gt3_gthrxn_in;
  input gt3_gthrxp_in;
  input gt3_rxbufreset_in;
  input gt3_rxmcommaalignen_in;
  input gt3_rxpcommaalignen_in;
  input I3;
  input gt3_rxusrclk_in;
  input gt3_rxusrclk2_in;
  input [1:0]gt3_rxmonitorsel_in;
  input [1:0]gt3_rxpd_in;
  input [0:0]AR;
  input gtrxreset_i;
  input I4;
  input I5;
  input I6;
  input gt0_drpen_in;
  input [15:0]gt0_drpdi_in;
  input gt0_drpwe_in;
  input [8:0]gt0_drpaddr_in;
  input gt1_drpen_in;
  input [15:0]gt1_drpdi_in;
  input gt1_drpwe_in;
  input [8:0]gt1_drpaddr_in;
  input gt2_drpen_in;
  input [15:0]gt2_drpdi_in;
  input gt2_drpwe_in;
  input [8:0]gt2_drpaddr_in;
  input gt3_drpen_in;
  input [15:0]gt3_drpdi_in;
  input gt3_drpwe_in;
  input [8:0]gt3_drpaddr_in;

  wire [0:0]AR;
  wire GT0_DRP_BUSY_OUT;
  wire GT0_QPLLOUTCLK_IN;
  wire GT0_QPLLOUTREFCLK_IN;
  wire GT1_DRP_BUSY_OUT;
  wire GT2_DRP_BUSY_OUT;
  wire GT3_DRP_BUSY_OUT;
  wire I1;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire RXUSERRDY;
  wire [14:0]gt0_dmonitorout_out;
  wire [8:0]gt0_drpaddr_in;
  wire gt0_drpclk_in;
  wire [15:0]gt0_drpdi_in;
  wire [15:0]gt0_drpdo_out;
  wire gt0_drpen_in;
  wire gt0_drpwe_in;
  wire gt0_eyescandataerror_out;
  wire gt0_eyescanreset_in;
  wire gt0_eyescantrigger_in;
  wire gt0_gthrxn_in;
  wire gt0_gthrxp_in;
  wire gt0_rxbufreset_in;
  wire [2:0]gt0_rxbufstatus_out;
  wire [1:0]gt0_rxchariscomma_out;
  wire [1:0]gt0_rxcharisk_out;
  wire [15:0]gt0_rxdata_out;
  wire [1:0]gt0_rxdisperr_out;
  wire gt0_rxmcommaalignen_in;
  wire [6:0]gt0_rxmonitorout_out;
  wire [1:0]gt0_rxmonitorsel_in;
  wire [1:0]gt0_rxnotintable_out;
  wire gt0_rxoutclk_out;
  wire gt0_rxpcommaalignen_in;
  wire [1:0]gt0_rxpd_in;
  wire gt0_rxresetdone_out;
  wire gt0_rxusrclk2_in;
  wire gt0_rxusrclk_in;
  wire [14:0]gt1_dmonitorout_out;
  wire [8:0]gt1_drpaddr_in;
  wire gt1_drpclk_in;
  wire [15:0]gt1_drpdi_in;
  wire [15:0]gt1_drpdo_out;
  wire gt1_drpen_in;
  wire gt1_drpwe_in;
  wire gt1_eyescandataerror_out;
  wire gt1_eyescanreset_in;
  wire gt1_eyescantrigger_in;
  wire gt1_gthrxn_in;
  wire gt1_gthrxp_in;
  wire gt1_rxbufreset_in;
  wire [2:0]gt1_rxbufstatus_out;
  wire [1:0]gt1_rxchariscomma_out;
  wire [1:0]gt1_rxcharisk_out;
  wire [15:0]gt1_rxdata_out;
  wire [1:0]gt1_rxdisperr_out;
  wire gt1_rxmcommaalignen_in;
  wire [6:0]gt1_rxmonitorout_out;
  wire [1:0]gt1_rxmonitorsel_in;
  wire [1:0]gt1_rxnotintable_out;
  wire gt1_rxoutclk_out;
  wire gt1_rxpcommaalignen_in;
  wire [1:0]gt1_rxpd_in;
  wire gt1_rxresetdone_out;
  wire gt1_rxusrclk2_in;
  wire gt1_rxusrclk_in;
  wire [14:0]gt2_dmonitorout_out;
  wire [8:0]gt2_drpaddr_in;
  wire gt2_drpclk_in;
  wire [15:0]gt2_drpdi_in;
  wire [15:0]gt2_drpdo_out;
  wire gt2_drpen_in;
  wire gt2_drpwe_in;
  wire gt2_eyescandataerror_out;
  wire gt2_eyescanreset_in;
  wire gt2_eyescantrigger_in;
  wire gt2_gthrxn_in;
  wire gt2_gthrxp_in;
  wire gt2_rxbufreset_in;
  wire [2:0]gt2_rxbufstatus_out;
  wire [1:0]gt2_rxchariscomma_out;
  wire [1:0]gt2_rxcharisk_out;
  wire [15:0]gt2_rxdata_out;
  wire [1:0]gt2_rxdisperr_out;
  wire gt2_rxmcommaalignen_in;
  wire [6:0]gt2_rxmonitorout_out;
  wire [1:0]gt2_rxmonitorsel_in;
  wire [1:0]gt2_rxnotintable_out;
  wire gt2_rxoutclk_out;
  wire gt2_rxpcommaalignen_in;
  wire [1:0]gt2_rxpd_in;
  wire gt2_rxresetdone_out;
  wire gt2_rxusrclk2_in;
  wire gt2_rxusrclk_in;
  wire [14:0]gt3_dmonitorout_out;
  wire [8:0]gt3_drpaddr_in;
  wire gt3_drpclk_in;
  wire [15:0]gt3_drpdi_in;
  wire [15:0]gt3_drpdo_out;
  wire gt3_drpen_in;
  wire gt3_drpwe_in;
  wire gt3_eyescandataerror_out;
  wire gt3_eyescanreset_in;
  wire gt3_eyescantrigger_in;
  wire gt3_gthrxn_in;
  wire gt3_gthrxp_in;
  wire gt3_rxbufreset_in;
  wire [2:0]gt3_rxbufstatus_out;
  wire [1:0]gt3_rxchariscomma_out;
  wire [1:0]gt3_rxcharisk_out;
  wire [15:0]gt3_rxdata_out;
  wire [1:0]gt3_rxdisperr_out;
  wire gt3_rxmcommaalignen_in;
  wire [6:0]gt3_rxmonitorout_out;
  wire [1:0]gt3_rxmonitorsel_in;
  wire [1:0]gt3_rxnotintable_out;
  wire gt3_rxoutclk_out;
  wire gt3_rxpcommaalignen_in;
  wire [1:0]gt3_rxpd_in;
  wire gt3_rxresetdone_out;
  wire gt3_rxusrclk2_in;
  wire gt3_rxusrclk_in;
  wire gtrxreset_i;

gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0 gt0_gtwizard_32_Rx_i
       (.AR(AR),
        .GT0_DRP_BUSY_OUT(GT0_DRP_BUSY_OUT),
        .GT0_QPLLOUTCLK_IN(GT0_QPLLOUTCLK_IN),
        .GT0_QPLLOUTREFCLK_IN(GT0_QPLLOUTREFCLK_IN),
        .O1(O1),
        .RXUSERRDY(RXUSERRDY),
        .gt0_dmonitorout_out(gt0_dmonitorout_out),
        .gt0_drpaddr_in(gt0_drpaddr_in),
        .gt0_drpclk_in(gt0_drpclk_in),
        .gt0_drpdi_in(gt0_drpdi_in),
        .gt0_drpdo_out(gt0_drpdo_out),
        .gt0_drpen_in(gt0_drpen_in),
        .gt0_drpwe_in(gt0_drpwe_in),
        .gt0_eyescandataerror_out(gt0_eyescandataerror_out),
        .gt0_eyescanreset_in(gt0_eyescanreset_in),
        .gt0_eyescantrigger_in(gt0_eyescantrigger_in),
        .gt0_gthrxn_in(gt0_gthrxn_in),
        .gt0_gthrxp_in(gt0_gthrxp_in),
        .gt0_rxbufreset_in(gt0_rxbufreset_in),
        .gt0_rxbufstatus_out(gt0_rxbufstatus_out),
        .gt0_rxchariscomma_out(gt0_rxchariscomma_out),
        .gt0_rxcharisk_out(gt0_rxcharisk_out),
        .gt0_rxdata_out(gt0_rxdata_out),
        .gt0_rxdisperr_out(gt0_rxdisperr_out),
        .gt0_rxmcommaalignen_in(gt0_rxmcommaalignen_in),
        .gt0_rxmonitorout_out(gt0_rxmonitorout_out),
        .gt0_rxmonitorsel_in(gt0_rxmonitorsel_in),
        .gt0_rxnotintable_out(gt0_rxnotintable_out),
        .gt0_rxoutclk_out(gt0_rxoutclk_out),
        .gt0_rxpcommaalignen_in(gt0_rxpcommaalignen_in),
        .gt0_rxpd_in(gt0_rxpd_in),
        .gt0_rxresetdone_out(gt0_rxresetdone_out),
        .gt0_rxusrclk2_in(gt0_rxusrclk2_in),
        .gt0_rxusrclk_in(gt0_rxusrclk_in),
        .gtrxreset_i(gtrxreset_i));
gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_3 gt1_gtwizard_32_Rx_i
       (.AR(AR),
        .GT0_QPLLOUTCLK_IN(GT0_QPLLOUTCLK_IN),
        .GT0_QPLLOUTREFCLK_IN(GT0_QPLLOUTREFCLK_IN),
        .GT1_DRP_BUSY_OUT(GT1_DRP_BUSY_OUT),
        .I1(I1),
        .I4(I4),
        .O1(O2),
        .gt1_dmonitorout_out(gt1_dmonitorout_out),
        .gt1_drpaddr_in(gt1_drpaddr_in),
        .gt1_drpclk_in(gt1_drpclk_in),
        .gt1_drpdi_in(gt1_drpdi_in),
        .gt1_drpdo_out(gt1_drpdo_out),
        .gt1_drpen_in(gt1_drpen_in),
        .gt1_drpwe_in(gt1_drpwe_in),
        .gt1_eyescandataerror_out(gt1_eyescandataerror_out),
        .gt1_eyescanreset_in(gt1_eyescanreset_in),
        .gt1_eyescantrigger_in(gt1_eyescantrigger_in),
        .gt1_gthrxn_in(gt1_gthrxn_in),
        .gt1_gthrxp_in(gt1_gthrxp_in),
        .gt1_rxbufreset_in(gt1_rxbufreset_in),
        .gt1_rxbufstatus_out(gt1_rxbufstatus_out),
        .gt1_rxchariscomma_out(gt1_rxchariscomma_out),
        .gt1_rxcharisk_out(gt1_rxcharisk_out),
        .gt1_rxdata_out(gt1_rxdata_out),
        .gt1_rxdisperr_out(gt1_rxdisperr_out),
        .gt1_rxmcommaalignen_in(gt1_rxmcommaalignen_in),
        .gt1_rxmonitorout_out(gt1_rxmonitorout_out),
        .gt1_rxmonitorsel_in(gt1_rxmonitorsel_in),
        .gt1_rxnotintable_out(gt1_rxnotintable_out),
        .gt1_rxoutclk_out(gt1_rxoutclk_out),
        .gt1_rxpcommaalignen_in(gt1_rxpcommaalignen_in),
        .gt1_rxpd_in(gt1_rxpd_in),
        .gt1_rxresetdone_out(gt1_rxresetdone_out),
        .gt1_rxusrclk2_in(gt1_rxusrclk2_in),
        .gt1_rxusrclk_in(gt1_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_4 gt2_gtwizard_32_Rx_i
       (.AR(AR),
        .GT0_QPLLOUTCLK_IN(GT0_QPLLOUTCLK_IN),
        .GT0_QPLLOUTREFCLK_IN(GT0_QPLLOUTREFCLK_IN),
        .GT2_DRP_BUSY_OUT(GT2_DRP_BUSY_OUT),
        .I2(I2),
        .I5(I5),
        .O1(O3),
        .gt2_dmonitorout_out(gt2_dmonitorout_out),
        .gt2_drpaddr_in(gt2_drpaddr_in),
        .gt2_drpclk_in(gt2_drpclk_in),
        .gt2_drpdi_in(gt2_drpdi_in),
        .gt2_drpdo_out(gt2_drpdo_out),
        .gt2_drpen_in(gt2_drpen_in),
        .gt2_drpwe_in(gt2_drpwe_in),
        .gt2_eyescandataerror_out(gt2_eyescandataerror_out),
        .gt2_eyescanreset_in(gt2_eyescanreset_in),
        .gt2_eyescantrigger_in(gt2_eyescantrigger_in),
        .gt2_gthrxn_in(gt2_gthrxn_in),
        .gt2_gthrxp_in(gt2_gthrxp_in),
        .gt2_rxbufreset_in(gt2_rxbufreset_in),
        .gt2_rxbufstatus_out(gt2_rxbufstatus_out),
        .gt2_rxchariscomma_out(gt2_rxchariscomma_out),
        .gt2_rxcharisk_out(gt2_rxcharisk_out),
        .gt2_rxdata_out(gt2_rxdata_out),
        .gt2_rxdisperr_out(gt2_rxdisperr_out),
        .gt2_rxmcommaalignen_in(gt2_rxmcommaalignen_in),
        .gt2_rxmonitorout_out(gt2_rxmonitorout_out),
        .gt2_rxmonitorsel_in(gt2_rxmonitorsel_in),
        .gt2_rxnotintable_out(gt2_rxnotintable_out),
        .gt2_rxoutclk_out(gt2_rxoutclk_out),
        .gt2_rxpcommaalignen_in(gt2_rxpcommaalignen_in),
        .gt2_rxpd_in(gt2_rxpd_in),
        .gt2_rxresetdone_out(gt2_rxresetdone_out),
        .gt2_rxusrclk2_in(gt2_rxusrclk2_in),
        .gt2_rxusrclk_in(gt2_rxusrclk_in));
gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_5 gt3_gtwizard_32_Rx_i
       (.AR(AR),
        .GT0_QPLLOUTCLK_IN(GT0_QPLLOUTCLK_IN),
        .GT0_QPLLOUTREFCLK_IN(GT0_QPLLOUTREFCLK_IN),
        .GT3_DRP_BUSY_OUT(GT3_DRP_BUSY_OUT),
        .I3(I3),
        .I6(I6),
        .O1(O4),
        .gt3_dmonitorout_out(gt3_dmonitorout_out),
        .gt3_drpaddr_in(gt3_drpaddr_in),
        .gt3_drpclk_in(gt3_drpclk_in),
        .gt3_drpdi_in(gt3_drpdi_in),
        .gt3_drpdo_out(gt3_drpdo_out),
        .gt3_drpen_in(gt3_drpen_in),
        .gt3_drpwe_in(gt3_drpwe_in),
        .gt3_eyescandataerror_out(gt3_eyescandataerror_out),
        .gt3_eyescanreset_in(gt3_eyescanreset_in),
        .gt3_eyescantrigger_in(gt3_eyescantrigger_in),
        .gt3_gthrxn_in(gt3_gthrxn_in),
        .gt3_gthrxp_in(gt3_gthrxp_in),
        .gt3_rxbufreset_in(gt3_rxbufreset_in),
        .gt3_rxbufstatus_out(gt3_rxbufstatus_out),
        .gt3_rxchariscomma_out(gt3_rxchariscomma_out),
        .gt3_rxcharisk_out(gt3_rxcharisk_out),
        .gt3_rxdata_out(gt3_rxdata_out),
        .gt3_rxdisperr_out(gt3_rxdisperr_out),
        .gt3_rxmcommaalignen_in(gt3_rxmcommaalignen_in),
        .gt3_rxmonitorout_out(gt3_rxmonitorout_out),
        .gt3_rxmonitorsel_in(gt3_rxmonitorsel_in),
        .gt3_rxnotintable_out(gt3_rxnotintable_out),
        .gt3_rxoutclk_out(gt3_rxoutclk_out),
        .gt3_rxpcommaalignen_in(gt3_rxpcommaalignen_in),
        .gt3_rxpd_in(gt3_rxpd_in),
        .gt3_rxresetdone_out(gt3_rxresetdone_out),
        .gt3_rxusrclk2_in(gt3_rxusrclk2_in),
        .gt3_rxusrclk_in(gt3_rxusrclk_in));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0
   (D,
    data_out,
    I1,
    rxpmaresetdone_sss,
    Q,
    gtrxreset_ss,
    data_in,
    gt3_drpclk_in);
  output [1:0]D;
  output data_out;
  input I1;
  input rxpmaresetdone_sss;
  input [2:0]Q;
  input gtrxreset_ss;
  input data_in;
  input gt3_drpclk_in;

  wire [1:0]D;
  wire I1;
  wire [2:0]Q;
  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt3_drpclk_in;
  wire gtrxreset_ss;
  wire \n_0_state[0]_i_2__2 ;
  wire rxpmaresetdone_sss;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0C880C88FCF3FCC0)) 
     \state[0]_i_1__2 
       (.I0(\n_0_state[0]_i_2__2 ),
        .I1(Q[2]),
        .I2(I1),
        .I3(Q[1]),
        .I4(gtrxreset_ss),
        .I5(Q[0]),
        .O(D[0]));
LUT2 #(
    .INIT(4'hB)) 
     \state[0]_i_2__2 
       (.I0(data_out),
        .I1(rxpmaresetdone_sss),
        .O(\n_0_state[0]_i_2__2 ));
LUT6 #(
    .INIT(64'h5500FFFF30FF0000)) 
     \state[1]_i_1__2 
       (.I0(I1),
        .I1(data_out),
        .I2(rxpmaresetdone_sss),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(D[1]));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_11
   (D,
    data_out,
    I1,
    rxpmaresetdone_sss,
    Q,
    gtrxreset_ss,
    data_in,
    gt0_drpclk_in);
  output [1:0]D;
  output data_out;
  input I1;
  input rxpmaresetdone_sss;
  input [2:0]Q;
  input gtrxreset_ss;
  input data_in;
  input gt0_drpclk_in;

  wire [1:0]D;
  wire I1;
  wire [2:0]Q;
  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt0_drpclk_in;
  wire gtrxreset_ss;
  wire \n_0_state[0]_i_2 ;
  wire rxpmaresetdone_sss;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0C880C88FCF3FCC0)) 
     \state[0]_i_1 
       (.I0(\n_0_state[0]_i_2 ),
        .I1(Q[2]),
        .I2(I1),
        .I3(Q[1]),
        .I4(gtrxreset_ss),
        .I5(Q[0]),
        .O(D[0]));
LUT2 #(
    .INIT(4'hB)) 
     \state[0]_i_2 
       (.I0(data_out),
        .I1(rxpmaresetdone_sss),
        .O(\n_0_state[0]_i_2 ));
LUT6 #(
    .INIT(64'h5500FFFF30FF0000)) 
     \state[1]_i_1 
       (.I0(I1),
        .I1(data_out),
        .I2(rxpmaresetdone_sss),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(D[1]));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_12
   (O1,
    O2,
    O3,
    O4,
    Q,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    I7,
    I8,
    I9,
    I10,
    GT0_QPLLLOCK_IN,
    SYSCLK_IN);
  output O1;
  output O2;
  output O3;
  output O4;
  input [6:0]Q;
  input I1;
  input I2;
  input I3;
  input I4;
  input I5;
  input I6;
  input I7;
  input I8;
  input I9;
  input I10;
  input GT0_QPLLLOCK_IN;
  input SYSCLK_IN;

  wire GT0_QPLLLOCK_IN;
  wire I1;
  wire I10;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire [6:0]Q;
  wire SYSCLK_IN;
  wire adapt_count_reset;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire n_0_reset_time_out_i_10__2;

LUT6 #(
    .INIT(64'hE0E0E0E0FFE0E0E0)) 
     \FSM_onehot_rx_state[11]_i_13__2 
       (.I0(Q[5]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(I1),
        .I4(Q[1]),
        .I5(adapt_count_reset),
        .O(O1));
LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
     \FSM_onehot_rx_state[11]_i_4__2 
       (.I0(I2),
        .I1(I3),
        .I2(adapt_count_reset),
        .I3(Q[3]),
        .I4(Q[6]),
        .I5(I4),
        .O(O2));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(GT0_QPLLLOCK_IN),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(adapt_count_reset),
        .R(1'b0));
LUT2 #(
    .INIT(4'h2)) 
     reset_time_out_i_10__2
       (.I0(I1),
        .I1(adapt_count_reset),
        .O(n_0_reset_time_out_i_10__2));
LUT6 #(
    .INIT(64'h08000F0008000800)) 
     reset_time_out_i_3__2
       (.I0(I5),
        .I1(n_0_reset_time_out_i_10__2),
        .I2(I6),
        .I3(I7),
        .I4(I8),
        .I5(I9),
        .O(O3));
LUT6 #(
    .INIT(64'h44444444AAF0AA00)) 
     reset_time_out_i_7__2
       (.I0(adapt_count_reset),
        .I1(I1),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(I10),
        .I5(Q[1]),
        .O(O4));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_13
   (data_out,
    gt3_rxresetdone_out,
    SYSCLK_IN);
  output data_out;
  input gt3_rxresetdone_out;
  input SYSCLK_IN;

  wire SYSCLK_IN;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt3_rxresetdone_out;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt3_rxresetdone_out),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_14
   (E,
    D,
    O1,
    O2,
    O3,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    Q,
    I7,
    I8,
    I9,
    I10,
    I11,
    I12,
    I13,
    I14,
    I15,
    I16,
    I17,
    I18,
    I19,
    I20,
    I21,
    DONT_RESET_ON_DATA_ERROR_IN,
    I22,
    I23,
    rxresetdone_s3,
    I24,
    I25,
    I26,
    I27,
    I28,
    GT3_RX_FSM_RESET_DONE_OUT,
    GT3_DATA_VALID_IN,
    SYSCLK_IN);
  output [0:0]E;
  output [1:0]D;
  output O1;
  output O2;
  output O3;
  input I1;
  input I2;
  input [0:0]I3;
  input I4;
  input I5;
  input I6;
  input [3:0]Q;
  input I7;
  input I8;
  input I9;
  input I10;
  input I11;
  input I12;
  input I13;
  input I14;
  input I15;
  input I16;
  input I17;
  input I18;
  input I19;
  input I20;
  input I21;
  input DONT_RESET_ON_DATA_ERROR_IN;
  input I22;
  input I23;
  input rxresetdone_s3;
  input I24;
  input I25;
  input I26;
  input I27;
  input I28;
  input GT3_RX_FSM_RESET_DONE_OUT;
  input GT3_DATA_VALID_IN;
  input SYSCLK_IN;

  wire [1:0]D;
  wire DONT_RESET_ON_DATA_ERROR_IN;
  wire [0:0]E;
  wire GT3_DATA_VALID_IN;
  wire GT3_RX_FSM_RESET_DONE_OUT;
  wire I1;
  wire I10;
  wire I11;
  wire I12;
  wire I13;
  wire I14;
  wire I15;
  wire I16;
  wire I17;
  wire I18;
  wire I19;
  wire I2;
  wire I20;
  wire I21;
  wire I22;
  wire I23;
  wire I24;
  wire I25;
  wire I26;
  wire I27;
  wire I28;
  wire [0:0]I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O3;
  wire [3:0]Q;
  wire SYSCLK_IN;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_valid_sync;
  wire \n_0_FSM_onehot_rx_state[11]_i_3__2 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_7__2 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_9__1 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_3__2 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_9__2 ;
  wire n_0_rx_fsm_reset_done_int_i_4__2;
  wire reset_time_out;
  wire rx_fsm_reset_done_int;
  wire rxresetdone_s3;

LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFEFE)) 
     \FSM_onehot_rx_state[11]_i_1__2 
       (.I0(\n_0_FSM_onehot_rx_state[11]_i_3__2 ),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_7__2 ),
        .O(E));
(* SOFT_HLUTNM = "soft_lutpair85" *) 
   LUT5 #(
    .INIT(32'hFEFF0000)) 
     \FSM_onehot_rx_state[11]_i_2__2 
       (.I0(data_valid_sync),
        .I1(I13),
        .I2(DONT_RESET_ON_DATA_ERROR_IN),
        .I3(I22),
        .I4(I23),
        .O(D[1]));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \FSM_onehot_rx_state[11]_i_3__2 
       (.I0(I7),
        .I1(\n_0_FSM_onehot_rx_state[11]_i_9__1 ),
        .I2(I8),
        .I3(I9),
        .I4(I10),
        .I5(I11),
        .O(\n_0_FSM_onehot_rx_state[11]_i_3__2 ));
LUT5 #(
    .INIT(32'h02000222)) 
     \FSM_onehot_rx_state[11]_i_7__2 
       (.I0(I5),
        .I1(I6),
        .I2(Q[3]),
        .I3(data_valid_sync),
        .I4(Q[2]),
        .O(\n_0_FSM_onehot_rx_state[11]_i_7__2 ));
LUT5 #(
    .INIT(32'hFFFFF222)) 
     \FSM_onehot_rx_state[11]_i_9__1 
       (.I0(Q[3]),
        .I1(data_valid_sync),
        .I2(Q[0]),
        .I3(rxresetdone_s3),
        .I4(Q[1]),
        .O(\n_0_FSM_onehot_rx_state[11]_i_9__1 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
     \FSM_onehot_rx_state[2]_i_1__2 
       (.I0(I14),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_3__2 ),
        .I2(I15),
        .I3(I16),
        .I4(I17),
        .I5(I18),
        .O(D[0]));
LUT6 #(
    .INIT(64'h0000000000000100)) 
     \FSM_onehot_rx_state[2]_i_3__2 
       (.I0(Q[1]),
        .I1(I21),
        .I2(I6),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(\n_0_FSM_onehot_rx_state[2]_i_9__2 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_3__2 ));
LUT4 #(
    .INIT(16'hFFFD)) 
     \FSM_onehot_rx_state[2]_i_9__2 
       (.I0(I22),
        .I1(DONT_RESET_ON_DATA_ERROR_IN),
        .I2(I13),
        .I3(data_valid_sync),
        .O(\n_0_FSM_onehot_rx_state[2]_i_9__2 ));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(GT3_DATA_VALID_IN),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_valid_sync),
        .R(1'b0));
LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
     reset_time_out_i_1__2
       (.I0(reset_time_out),
        .I1(I24),
        .I2(I25),
        .I3(I26),
        .I4(I27),
        .I5(I13),
        .O(O2));
LUT6 #(
    .INIT(64'hEEEEFFFFEEEEFEEE)) 
     reset_time_out_i_2__2
       (.I0(I19),
        .I1(I20),
        .I2(data_valid_sync),
        .I3(Q[2]),
        .I4(I6),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_9__1 ),
        .O(reset_time_out));
LUT6 #(
    .INIT(64'hAABFBFBFAA808080)) 
     rx_fsm_reset_done_int_i_1__2
       (.I0(rx_fsm_reset_done_int),
        .I1(I28),
        .I2(n_0_rx_fsm_reset_done_int_i_4__2),
        .I3(O1),
        .I4(I23),
        .I5(GT3_RX_FSM_RESET_DONE_OUT),
        .O(O3));
(* SOFT_HLUTNM = "soft_lutpair86" *) 
   LUT4 #(
    .INIT(16'h0800)) 
     rx_fsm_reset_done_int_i_2__2
       (.I0(I12),
        .I1(data_valid_sync),
        .I2(I13),
        .I3(Q[3]),
        .O(rx_fsm_reset_done_int));
(* SOFT_HLUTNM = "soft_lutpair86" *) 
   LUT5 #(
    .INIT(32'h04044404)) 
     rx_fsm_reset_done_int_i_4__2
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(data_valid_sync),
        .I3(I12),
        .I4(I13),
        .O(n_0_rx_fsm_reset_done_int_i_4__2));
(* SOFT_HLUTNM = "soft_lutpair85" *) 
   LUT4 #(
    .INIT(16'hFF02)) 
     rx_fsm_reset_done_int_i_5__2
       (.I0(I22),
        .I1(DONT_RESET_ON_DATA_ERROR_IN),
        .I2(I13),
        .I3(data_valid_sync),
        .O(O1));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_15
   (SR,
    O1,
    mmcm_lock_reclocked,
    I1,
    SYSCLK_IN);
  output [0:0]SR;
  output O1;
  input mmcm_lock_reclocked;
  input I1;
  input SYSCLK_IN;

  wire I1;
  wire O1;
  wire [0:0]SR;
  wire SYSCLK_IN;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire mmcm_lock_i;
  wire mmcm_lock_reclocked;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(1'b1),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(mmcm_lock_i),
        .R(1'b0));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair87" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[9]_i_1__2 
       (.I0(mmcm_lock_i),
        .O(SR));
(* SOFT_HLUTNM = "soft_lutpair87" *) 
   LUT3 #(
    .INIT(8'hE0)) 
     mmcm_lock_reclocked_i_1__2
       (.I0(mmcm_lock_reclocked),
        .I1(I1),
        .I2(mmcm_lock_i),
        .O(O1));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_16
   (data_out,
    data_in,
    gt3_rxusrclk_in);
  output data_out;
  input data_in;
  input gt3_rxusrclk_in;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt3_rxusrclk_in;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_17
   (data_out,
    GT3_RX_FSM_RESET_DONE_OUT,
    gt3_rxusrclk_in);
  output data_out;
  input GT3_RX_FSM_RESET_DONE_OUT;
  input gt3_rxusrclk_in;

  wire GT3_RX_FSM_RESET_DONE_OUT;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt3_rxusrclk_in;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(GT3_RX_FSM_RESET_DONE_OUT),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt3_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_18
   (data_out,
    data_in,
    SYSCLK_IN);
  output data_out;
  input data_in;
  input SYSCLK_IN;

  wire SYSCLK_IN;
  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_19
   (O1,
    O2,
    O3,
    O4,
    Q,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    I7,
    I8,
    I9,
    I10,
    GT0_QPLLLOCK_IN,
    SYSCLK_IN);
  output O1;
  output O2;
  output O3;
  output O4;
  input [6:0]Q;
  input I1;
  input I2;
  input I3;
  input I4;
  input I5;
  input I6;
  input I7;
  input I8;
  input I9;
  input I10;
  input GT0_QPLLLOCK_IN;
  input SYSCLK_IN;

  wire GT0_QPLLLOCK_IN;
  wire I1;
  wire I10;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire [6:0]Q;
  wire SYSCLK_IN;
  wire adapt_count_reset;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire n_0_reset_time_out_i_10__1;

LUT6 #(
    .INIT(64'hE0E0E0E0FFE0E0E0)) 
     \FSM_onehot_rx_state[11]_i_13__1 
       (.I0(Q[5]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(I1),
        .I4(Q[1]),
        .I5(adapt_count_reset),
        .O(O1));
LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
     \FSM_onehot_rx_state[11]_i_4__1 
       (.I0(I2),
        .I1(I3),
        .I2(adapt_count_reset),
        .I3(Q[3]),
        .I4(Q[6]),
        .I5(I4),
        .O(O2));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(GT0_QPLLLOCK_IN),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(adapt_count_reset),
        .R(1'b0));
LUT2 #(
    .INIT(4'h2)) 
     reset_time_out_i_10__1
       (.I0(I1),
        .I1(adapt_count_reset),
        .O(n_0_reset_time_out_i_10__1));
LUT6 #(
    .INIT(64'h08000F0008000800)) 
     reset_time_out_i_3__1
       (.I0(I5),
        .I1(n_0_reset_time_out_i_10__1),
        .I2(I6),
        .I3(I7),
        .I4(I8),
        .I5(I9),
        .O(O3));
LUT6 #(
    .INIT(64'h44444444AAF0AA00)) 
     reset_time_out_i_7__1
       (.I0(adapt_count_reset),
        .I1(I1),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(I10),
        .I5(Q[1]),
        .O(O4));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_20
   (data_out,
    gt2_rxresetdone_out,
    SYSCLK_IN);
  output data_out;
  input gt2_rxresetdone_out;
  input SYSCLK_IN;

  wire SYSCLK_IN;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt2_rxresetdone_out;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt2_rxresetdone_out),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_21
   (E,
    D,
    O1,
    O2,
    O3,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    Q,
    I7,
    I8,
    I9,
    I10,
    I11,
    I12,
    I13,
    I14,
    I15,
    I16,
    I17,
    I18,
    I19,
    I20,
    I21,
    DONT_RESET_ON_DATA_ERROR_IN,
    I22,
    I23,
    rxresetdone_s3,
    I24,
    I25,
    I26,
    I27,
    I28,
    GT2_RX_FSM_RESET_DONE_OUT,
    GT2_DATA_VALID_IN,
    SYSCLK_IN);
  output [0:0]E;
  output [1:0]D;
  output O1;
  output O2;
  output O3;
  input I1;
  input I2;
  input [0:0]I3;
  input I4;
  input I5;
  input I6;
  input [3:0]Q;
  input I7;
  input I8;
  input I9;
  input I10;
  input I11;
  input I12;
  input I13;
  input I14;
  input I15;
  input I16;
  input I17;
  input I18;
  input I19;
  input I20;
  input I21;
  input DONT_RESET_ON_DATA_ERROR_IN;
  input I22;
  input I23;
  input rxresetdone_s3;
  input I24;
  input I25;
  input I26;
  input I27;
  input I28;
  input GT2_RX_FSM_RESET_DONE_OUT;
  input GT2_DATA_VALID_IN;
  input SYSCLK_IN;

  wire [1:0]D;
  wire DONT_RESET_ON_DATA_ERROR_IN;
  wire [0:0]E;
  wire GT2_DATA_VALID_IN;
  wire GT2_RX_FSM_RESET_DONE_OUT;
  wire I1;
  wire I10;
  wire I11;
  wire I12;
  wire I13;
  wire I14;
  wire I15;
  wire I16;
  wire I17;
  wire I18;
  wire I19;
  wire I2;
  wire I20;
  wire I21;
  wire I22;
  wire I23;
  wire I24;
  wire I25;
  wire I26;
  wire I27;
  wire I28;
  wire [0:0]I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O3;
  wire [3:0]Q;
  wire SYSCLK_IN;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_valid_sync;
  wire \n_0_FSM_onehot_rx_state[11]_i_3__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_7__1 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_9__0 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_3__1 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_9__1 ;
  wire n_0_rx_fsm_reset_done_int_i_4__1;
  wire reset_time_out;
  wire rx_fsm_reset_done_int;
  wire rxresetdone_s3;

LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFEFE)) 
     \FSM_onehot_rx_state[11]_i_1__1 
       (.I0(\n_0_FSM_onehot_rx_state[11]_i_3__1 ),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_7__1 ),
        .O(E));
(* SOFT_HLUTNM = "soft_lutpair57" *) 
   LUT5 #(
    .INIT(32'hFEFF0000)) 
     \FSM_onehot_rx_state[11]_i_2__1 
       (.I0(data_valid_sync),
        .I1(I13),
        .I2(DONT_RESET_ON_DATA_ERROR_IN),
        .I3(I22),
        .I4(I23),
        .O(D[1]));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \FSM_onehot_rx_state[11]_i_3__1 
       (.I0(I7),
        .I1(\n_0_FSM_onehot_rx_state[11]_i_9__0 ),
        .I2(I8),
        .I3(I9),
        .I4(I10),
        .I5(I11),
        .O(\n_0_FSM_onehot_rx_state[11]_i_3__1 ));
LUT5 #(
    .INIT(32'h02000222)) 
     \FSM_onehot_rx_state[11]_i_7__1 
       (.I0(I5),
        .I1(I6),
        .I2(Q[3]),
        .I3(data_valid_sync),
        .I4(Q[2]),
        .O(\n_0_FSM_onehot_rx_state[11]_i_7__1 ));
LUT5 #(
    .INIT(32'hFFFFF222)) 
     \FSM_onehot_rx_state[11]_i_9__0 
       (.I0(Q[3]),
        .I1(data_valid_sync),
        .I2(Q[0]),
        .I3(rxresetdone_s3),
        .I4(Q[1]),
        .O(\n_0_FSM_onehot_rx_state[11]_i_9__0 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
     \FSM_onehot_rx_state[2]_i_1__1 
       (.I0(I14),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_3__1 ),
        .I2(I15),
        .I3(I16),
        .I4(I17),
        .I5(I18),
        .O(D[0]));
LUT6 #(
    .INIT(64'h0000000000000100)) 
     \FSM_onehot_rx_state[2]_i_3__1 
       (.I0(Q[1]),
        .I1(I21),
        .I2(I6),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(\n_0_FSM_onehot_rx_state[2]_i_9__1 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_3__1 ));
LUT4 #(
    .INIT(16'hFFFD)) 
     \FSM_onehot_rx_state[2]_i_9__1 
       (.I0(I22),
        .I1(DONT_RESET_ON_DATA_ERROR_IN),
        .I2(I13),
        .I3(data_valid_sync),
        .O(\n_0_FSM_onehot_rx_state[2]_i_9__1 ));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(GT2_DATA_VALID_IN),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_valid_sync),
        .R(1'b0));
LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
     reset_time_out_i_1__1
       (.I0(reset_time_out),
        .I1(I24),
        .I2(I25),
        .I3(I26),
        .I4(I27),
        .I5(I13),
        .O(O2));
LUT6 #(
    .INIT(64'hEEEEFFFFEEEEFEEE)) 
     reset_time_out_i_2__1
       (.I0(I19),
        .I1(I20),
        .I2(data_valid_sync),
        .I3(Q[2]),
        .I4(I6),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_9__0 ),
        .O(reset_time_out));
LUT6 #(
    .INIT(64'hAABFBFBFAA808080)) 
     rx_fsm_reset_done_int_i_1__1
       (.I0(rx_fsm_reset_done_int),
        .I1(I28),
        .I2(n_0_rx_fsm_reset_done_int_i_4__1),
        .I3(O1),
        .I4(I23),
        .I5(GT2_RX_FSM_RESET_DONE_OUT),
        .O(O3));
(* SOFT_HLUTNM = "soft_lutpair58" *) 
   LUT4 #(
    .INIT(16'h0800)) 
     rx_fsm_reset_done_int_i_2__1
       (.I0(I12),
        .I1(data_valid_sync),
        .I2(I13),
        .I3(Q[3]),
        .O(rx_fsm_reset_done_int));
(* SOFT_HLUTNM = "soft_lutpair58" *) 
   LUT5 #(
    .INIT(32'h04044404)) 
     rx_fsm_reset_done_int_i_4__1
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(data_valid_sync),
        .I3(I12),
        .I4(I13),
        .O(n_0_rx_fsm_reset_done_int_i_4__1));
(* SOFT_HLUTNM = "soft_lutpair57" *) 
   LUT4 #(
    .INIT(16'hFF02)) 
     rx_fsm_reset_done_int_i_5__1
       (.I0(I22),
        .I1(DONT_RESET_ON_DATA_ERROR_IN),
        .I2(I13),
        .I3(data_valid_sync),
        .O(O1));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_22
   (SR,
    O1,
    mmcm_lock_reclocked,
    I1,
    SYSCLK_IN);
  output [0:0]SR;
  output O1;
  input mmcm_lock_reclocked;
  input I1;
  input SYSCLK_IN;

  wire I1;
  wire O1;
  wire [0:0]SR;
  wire SYSCLK_IN;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire mmcm_lock_i;
  wire mmcm_lock_reclocked;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(1'b1),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(mmcm_lock_i),
        .R(1'b0));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair59" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[9]_i_1__1 
       (.I0(mmcm_lock_i),
        .O(SR));
(* SOFT_HLUTNM = "soft_lutpair59" *) 
   LUT3 #(
    .INIT(8'hE0)) 
     mmcm_lock_reclocked_i_1__1
       (.I0(mmcm_lock_reclocked),
        .I1(I1),
        .I2(mmcm_lock_i),
        .O(O1));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_23
   (data_out,
    data_in,
    gt2_rxusrclk_in);
  output data_out;
  input data_in;
  input gt2_rxusrclk_in;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt2_rxusrclk_in;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_24
   (data_out,
    GT2_RX_FSM_RESET_DONE_OUT,
    gt2_rxusrclk_in);
  output data_out;
  input GT2_RX_FSM_RESET_DONE_OUT;
  input gt2_rxusrclk_in;

  wire GT2_RX_FSM_RESET_DONE_OUT;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt2_rxusrclk_in;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(GT2_RX_FSM_RESET_DONE_OUT),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt2_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_25
   (data_out,
    data_in,
    SYSCLK_IN);
  output data_out;
  input data_in;
  input SYSCLK_IN;

  wire SYSCLK_IN;
  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_26
   (O1,
    O2,
    O3,
    O4,
    Q,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    I7,
    I8,
    I9,
    I10,
    GT0_QPLLLOCK_IN,
    SYSCLK_IN);
  output O1;
  output O2;
  output O3;
  output O4;
  input [6:0]Q;
  input I1;
  input I2;
  input I3;
  input I4;
  input I5;
  input I6;
  input I7;
  input I8;
  input I9;
  input I10;
  input GT0_QPLLLOCK_IN;
  input SYSCLK_IN;

  wire GT0_QPLLLOCK_IN;
  wire I1;
  wire I10;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire [6:0]Q;
  wire SYSCLK_IN;
  wire adapt_count_reset;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire n_0_reset_time_out_i_10__0;

LUT6 #(
    .INIT(64'hE0E0E0E0FFE0E0E0)) 
     \FSM_onehot_rx_state[11]_i_13__0 
       (.I0(Q[5]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(I1),
        .I4(Q[1]),
        .I5(adapt_count_reset),
        .O(O1));
LUT6 #(
    .INIT(64'hFFFFFEEEFEEEFEEE)) 
     \FSM_onehot_rx_state[11]_i_4__0 
       (.I0(I2),
        .I1(I3),
        .I2(adapt_count_reset),
        .I3(Q[3]),
        .I4(Q[6]),
        .I5(I4),
        .O(O2));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(GT0_QPLLLOCK_IN),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(adapt_count_reset),
        .R(1'b0));
LUT2 #(
    .INIT(4'h2)) 
     reset_time_out_i_10__0
       (.I0(I1),
        .I1(adapt_count_reset),
        .O(n_0_reset_time_out_i_10__0));
LUT6 #(
    .INIT(64'h08000F0008000800)) 
     reset_time_out_i_3__0
       (.I0(I5),
        .I1(n_0_reset_time_out_i_10__0),
        .I2(I6),
        .I3(I7),
        .I4(I8),
        .I5(I9),
        .O(O3));
LUT6 #(
    .INIT(64'h44444444AAF0AA00)) 
     reset_time_out_i_7__0
       (.I0(adapt_count_reset),
        .I1(I1),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(I10),
        .I5(Q[1]),
        .O(O4));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_27
   (data_out,
    gt1_rxresetdone_out,
    SYSCLK_IN);
  output data_out;
  input gt1_rxresetdone_out;
  input SYSCLK_IN;

  wire SYSCLK_IN;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt1_rxresetdone_out;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt1_rxresetdone_out),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_28
   (E,
    D,
    O1,
    O2,
    O3,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    Q,
    I7,
    I8,
    I9,
    I10,
    I11,
    I12,
    I13,
    I14,
    I15,
    I16,
    I17,
    I18,
    I19,
    I20,
    I21,
    DONT_RESET_ON_DATA_ERROR_IN,
    I22,
    I23,
    rxresetdone_s3,
    I24,
    I25,
    I26,
    I27,
    I28,
    GT1_RX_FSM_RESET_DONE_OUT,
    GT1_DATA_VALID_IN,
    SYSCLK_IN);
  output [0:0]E;
  output [1:0]D;
  output O1;
  output O2;
  output O3;
  input I1;
  input I2;
  input [0:0]I3;
  input I4;
  input I5;
  input I6;
  input [3:0]Q;
  input I7;
  input I8;
  input I9;
  input I10;
  input I11;
  input I12;
  input I13;
  input I14;
  input I15;
  input I16;
  input I17;
  input I18;
  input I19;
  input I20;
  input I21;
  input DONT_RESET_ON_DATA_ERROR_IN;
  input I22;
  input I23;
  input rxresetdone_s3;
  input I24;
  input I25;
  input I26;
  input I27;
  input I28;
  input GT1_RX_FSM_RESET_DONE_OUT;
  input GT1_DATA_VALID_IN;
  input SYSCLK_IN;

  wire [1:0]D;
  wire DONT_RESET_ON_DATA_ERROR_IN;
  wire [0:0]E;
  wire GT1_DATA_VALID_IN;
  wire GT1_RX_FSM_RESET_DONE_OUT;
  wire I1;
  wire I10;
  wire I11;
  wire I12;
  wire I13;
  wire I14;
  wire I15;
  wire I16;
  wire I17;
  wire I18;
  wire I19;
  wire I2;
  wire I20;
  wire I21;
  wire I22;
  wire I23;
  wire I24;
  wire I25;
  wire I26;
  wire I27;
  wire I28;
  wire [0:0]I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O3;
  wire [3:0]Q;
  wire SYSCLK_IN;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_valid_sync;
  wire \n_0_FSM_onehot_rx_state[11]_i_3__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_7__0 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_9 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_3__0 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_9__0 ;
  wire n_0_rx_fsm_reset_done_int_i_4__0;
  wire reset_time_out;
  wire rx_fsm_reset_done_int;
  wire rxresetdone_s3;

LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFEFE)) 
     \FSM_onehot_rx_state[11]_i_1__0 
       (.I0(\n_0_FSM_onehot_rx_state[11]_i_3__0 ),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_7__0 ),
        .O(E));
(* SOFT_HLUTNM = "soft_lutpair29" *) 
   LUT5 #(
    .INIT(32'hFEFF0000)) 
     \FSM_onehot_rx_state[11]_i_2__0 
       (.I0(data_valid_sync),
        .I1(I13),
        .I2(DONT_RESET_ON_DATA_ERROR_IN),
        .I3(I22),
        .I4(I23),
        .O(D[1]));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \FSM_onehot_rx_state[11]_i_3__0 
       (.I0(I7),
        .I1(\n_0_FSM_onehot_rx_state[11]_i_9 ),
        .I2(I8),
        .I3(I9),
        .I4(I10),
        .I5(I11),
        .O(\n_0_FSM_onehot_rx_state[11]_i_3__0 ));
LUT5 #(
    .INIT(32'h02000222)) 
     \FSM_onehot_rx_state[11]_i_7__0 
       (.I0(I5),
        .I1(I6),
        .I2(Q[3]),
        .I3(data_valid_sync),
        .I4(Q[2]),
        .O(\n_0_FSM_onehot_rx_state[11]_i_7__0 ));
LUT5 #(
    .INIT(32'hFFFFF222)) 
     \FSM_onehot_rx_state[11]_i_9 
       (.I0(Q[3]),
        .I1(data_valid_sync),
        .I2(Q[0]),
        .I3(rxresetdone_s3),
        .I4(Q[1]),
        .O(\n_0_FSM_onehot_rx_state[11]_i_9 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
     \FSM_onehot_rx_state[2]_i_1__0 
       (.I0(I14),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_3__0 ),
        .I2(I15),
        .I3(I16),
        .I4(I17),
        .I5(I18),
        .O(D[0]));
LUT6 #(
    .INIT(64'h0000000000000100)) 
     \FSM_onehot_rx_state[2]_i_3__0 
       (.I0(Q[1]),
        .I1(I21),
        .I2(I6),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(\n_0_FSM_onehot_rx_state[2]_i_9__0 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_3__0 ));
LUT4 #(
    .INIT(16'hFFFD)) 
     \FSM_onehot_rx_state[2]_i_9__0 
       (.I0(I22),
        .I1(DONT_RESET_ON_DATA_ERROR_IN),
        .I2(I13),
        .I3(data_valid_sync),
        .O(\n_0_FSM_onehot_rx_state[2]_i_9__0 ));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(GT1_DATA_VALID_IN),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_valid_sync),
        .R(1'b0));
LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
     reset_time_out_i_1__0
       (.I0(reset_time_out),
        .I1(I24),
        .I2(I25),
        .I3(I26),
        .I4(I27),
        .I5(I13),
        .O(O2));
LUT6 #(
    .INIT(64'hEEEEFFFFEEEEFEEE)) 
     reset_time_out_i_2__0
       (.I0(I19),
        .I1(I20),
        .I2(data_valid_sync),
        .I3(Q[2]),
        .I4(I6),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_9 ),
        .O(reset_time_out));
LUT6 #(
    .INIT(64'hAABFBFBFAA808080)) 
     rx_fsm_reset_done_int_i_1__0
       (.I0(rx_fsm_reset_done_int),
        .I1(I28),
        .I2(n_0_rx_fsm_reset_done_int_i_4__0),
        .I3(O1),
        .I4(I23),
        .I5(GT1_RX_FSM_RESET_DONE_OUT),
        .O(O3));
(* SOFT_HLUTNM = "soft_lutpair30" *) 
   LUT4 #(
    .INIT(16'h0800)) 
     rx_fsm_reset_done_int_i_2__0
       (.I0(I12),
        .I1(data_valid_sync),
        .I2(I13),
        .I3(Q[3]),
        .O(rx_fsm_reset_done_int));
(* SOFT_HLUTNM = "soft_lutpair30" *) 
   LUT5 #(
    .INIT(32'h04044404)) 
     rx_fsm_reset_done_int_i_4__0
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(data_valid_sync),
        .I3(I12),
        .I4(I13),
        .O(n_0_rx_fsm_reset_done_int_i_4__0));
(* SOFT_HLUTNM = "soft_lutpair29" *) 
   LUT4 #(
    .INIT(16'hFF02)) 
     rx_fsm_reset_done_int_i_5__0
       (.I0(I22),
        .I1(DONT_RESET_ON_DATA_ERROR_IN),
        .I2(I13),
        .I3(data_valid_sync),
        .O(O1));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_29
   (SR,
    O1,
    mmcm_lock_reclocked,
    I1,
    SYSCLK_IN);
  output [0:0]SR;
  output O1;
  input mmcm_lock_reclocked;
  input I1;
  input SYSCLK_IN;

  wire I1;
  wire O1;
  wire [0:0]SR;
  wire SYSCLK_IN;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire mmcm_lock_i;
  wire mmcm_lock_reclocked;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(1'b1),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(mmcm_lock_i),
        .R(1'b0));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair31" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[9]_i_1__0 
       (.I0(mmcm_lock_i),
        .O(SR));
(* SOFT_HLUTNM = "soft_lutpair31" *) 
   LUT3 #(
    .INIT(8'hE0)) 
     mmcm_lock_reclocked_i_1__0
       (.I0(mmcm_lock_reclocked),
        .I1(I1),
        .I2(mmcm_lock_i),
        .O(O1));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_30
   (data_out,
    data_in,
    gt1_rxusrclk_in);
  output data_out;
  input data_in;
  input gt1_rxusrclk_in;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt1_rxusrclk_in;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_31
   (data_out,
    GT1_RX_FSM_RESET_DONE_OUT,
    gt1_rxusrclk_in);
  output data_out;
  input GT1_RX_FSM_RESET_DONE_OUT;
  input gt1_rxusrclk_in;

  wire GT1_RX_FSM_RESET_DONE_OUT;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt1_rxusrclk_in;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(GT1_RX_FSM_RESET_DONE_OUT),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt1_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_32
   (data_out,
    data_in,
    SYSCLK_IN);
  output data_out;
  input data_in;
  input SYSCLK_IN;

  wire SYSCLK_IN;
  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_33
   (O1,
    O2,
    O3,
    O4,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    Q,
    mmcm_lock_reclocked,
    I7,
    I8,
    I9,
    GT0_QPLLLOCK_IN,
    SYSCLK_IN);
  output O1;
  output O2;
  output O3;
  output O4;
  input I1;
  input I2;
  input I3;
  input I4;
  input I5;
  input I6;
  input [4:0]Q;
  input mmcm_lock_reclocked;
  input I7;
  input I8;
  input I9;
  input GT0_QPLLLOCK_IN;
  input SYSCLK_IN;

  wire GT0_QPLLLOCK_IN;
  wire I1;
  wire I2;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O3;
  wire O4;
  wire [4:0]Q;
  wire SYSCLK_IN;
  wire adapt_count_reset;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire mmcm_lock_reclocked;
  wire \n_0_FSM_onehot_rx_state[11]_i_13 ;
  wire n_0_reset_time_out_i_10;

(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT3 #(
    .INIT(8'h40)) 
     \FSM_onehot_rx_state[11]_i_13 
       (.I0(adapt_count_reset),
        .I1(Q[0]),
        .I2(I8),
        .O(\n_0_FSM_onehot_rx_state[11]_i_13 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFF8F8F8)) 
     \FSM_onehot_rx_state[11]_i_6__2 
       (.I0(I6),
        .I1(Q[4]),
        .I2(\n_0_FSM_onehot_rx_state[11]_i_13 ),
        .I3(mmcm_lock_reclocked),
        .I4(Q[3]),
        .I5(I7),
        .O(O2));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT4 #(
    .INIT(16'hF888)) 
     \FSM_onehot_rx_state[11]_i_9__2 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(adapt_count_reset),
        .I3(Q[1]),
        .O(O3));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(GT0_QPLLLOCK_IN),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(adapt_count_reset),
        .R(1'b0));
LUT2 #(
    .INIT(4'h2)) 
     reset_time_out_i_10
       (.I0(I8),
        .I1(adapt_count_reset),
        .O(n_0_reset_time_out_i_10));
LUT6 #(
    .INIT(64'h08000F0008000800)) 
     reset_time_out_i_3
       (.I0(I1),
        .I1(n_0_reset_time_out_i_10),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .O(O1));
LUT6 #(
    .INIT(64'h44444444AAF0AA00)) 
     reset_time_out_i_7
       (.I0(adapt_count_reset),
        .I1(I8),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(I9),
        .I5(Q[0]),
        .O(O4));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_34
   (data_out,
    gt0_rxresetdone_out,
    SYSCLK_IN);
  output data_out;
  input gt0_rxresetdone_out;
  input SYSCLK_IN;

  wire SYSCLK_IN;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt0_rxresetdone_out;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(gt0_rxresetdone_out),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_35
   (E,
    D,
    O1,
    O2,
    O3,
    I1,
    I2,
    I3,
    I4,
    I5,
    I6,
    Q,
    I7,
    I8,
    I9,
    I10,
    I11,
    I12,
    I13,
    I14,
    I15,
    I16,
    I17,
    I18,
    DONT_RESET_ON_DATA_ERROR_IN,
    I19,
    I20,
    rxresetdone_s3,
    I21,
    I22,
    I23,
    I24,
    I25,
    GT0_RX_FSM_RESET_DONE_OUT,
    GT0_DATA_VALID_IN,
    SYSCLK_IN);
  output [0:0]E;
  output [1:0]D;
  output O1;
  output O2;
  output O3;
  input I1;
  input [0:0]I2;
  input I3;
  input I4;
  input I5;
  input I6;
  input [5:0]Q;
  input I7;
  input I8;
  input I9;
  input I10;
  input I11;
  input I12;
  input I13;
  input I14;
  input I15;
  input I16;
  input I17;
  input I18;
  input DONT_RESET_ON_DATA_ERROR_IN;
  input I19;
  input I20;
  input rxresetdone_s3;
  input I21;
  input I22;
  input I23;
  input I24;
  input I25;
  input GT0_RX_FSM_RESET_DONE_OUT;
  input GT0_DATA_VALID_IN;
  input SYSCLK_IN;

  wire [1:0]D;
  wire DONT_RESET_ON_DATA_ERROR_IN;
  wire [0:0]E;
  wire GT0_DATA_VALID_IN;
  wire GT0_RX_FSM_RESET_DONE_OUT;
  wire I1;
  wire I10;
  wire I11;
  wire I12;
  wire I13;
  wire I14;
  wire I15;
  wire I16;
  wire I17;
  wire I18;
  wire I19;
  wire [0:0]I2;
  wire I20;
  wire I21;
  wire I22;
  wire I23;
  wire I24;
  wire I25;
  wire I3;
  wire I4;
  wire I5;
  wire I6;
  wire I7;
  wire I8;
  wire I9;
  wire O1;
  wire O2;
  wire O3;
  wire [5:0]Q;
  wire SYSCLK_IN;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_valid_sync;
  wire \n_0_FSM_onehot_rx_state[11]_i_3 ;
  wire \n_0_FSM_onehot_rx_state[11]_i_7 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_3 ;
  wire \n_0_FSM_onehot_rx_state[2]_i_9 ;
  wire n_0_rx_fsm_reset_done_int_i_4;
  wire n_0_rx_fsm_reset_done_int_i_5;
  wire reset_time_out;
  wire rx_fsm_reset_done_int;
  wire rxresetdone_s3;

LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFEE)) 
     \FSM_onehot_rx_state[11]_i_1 
       (.I0(\n_0_FSM_onehot_rx_state[11]_i_3 ),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(\n_0_FSM_onehot_rx_state[11]_i_7 ),
        .O(E));
LUT5 #(
    .INIT(32'hFFFFF222)) 
     \FSM_onehot_rx_state[11]_i_14 
       (.I0(Q[5]),
        .I1(data_valid_sync),
        .I2(Q[2]),
        .I3(rxresetdone_s3),
        .I4(Q[3]),
        .O(O1));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT5 #(
    .INIT(32'hFEFF0000)) 
     \FSM_onehot_rx_state[11]_i_2 
       (.I0(data_valid_sync),
        .I1(I11),
        .I2(DONT_RESET_ON_DATA_ERROR_IN),
        .I3(I19),
        .I4(I20),
        .O(D[1]));
LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
     \FSM_onehot_rx_state[11]_i_3 
       (.I0(I8),
        .I1(Q[4]),
        .I2(n_0_rx_fsm_reset_done_int_i_5),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(I9),
        .O(\n_0_FSM_onehot_rx_state[11]_i_3 ));
LUT6 #(
    .INIT(64'hFFFFFFFA0008020A)) 
     \FSM_onehot_rx_state[11]_i_7 
       (.I0(I5),
        .I1(data_valid_sync),
        .I2(I6),
        .I3(Q[5]),
        .I4(Q[4]),
        .I5(I7),
        .O(\n_0_FSM_onehot_rx_state[11]_i_7 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
     \FSM_onehot_rx_state[2]_i_1 
       (.I0(I12),
        .I1(\n_0_FSM_onehot_rx_state[2]_i_3 ),
        .I2(I13),
        .I3(I14),
        .I4(I15),
        .I5(I16),
        .O(D[0]));
LUT6 #(
    .INIT(64'h0000000000000100)) 
     \FSM_onehot_rx_state[2]_i_3 
       (.I0(Q[3]),
        .I1(I7),
        .I2(I6),
        .I3(Q[4]),
        .I4(Q[5]),
        .I5(\n_0_FSM_onehot_rx_state[2]_i_9 ),
        .O(\n_0_FSM_onehot_rx_state[2]_i_3 ));
LUT4 #(
    .INIT(16'hFFFD)) 
     \FSM_onehot_rx_state[2]_i_9 
       (.I0(I19),
        .I1(DONT_RESET_ON_DATA_ERROR_IN),
        .I2(I11),
        .I3(data_valid_sync),
        .O(\n_0_FSM_onehot_rx_state[2]_i_9 ));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(GT0_DATA_VALID_IN),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_valid_sync),
        .R(1'b0));
LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
     reset_time_out_i_1
       (.I0(reset_time_out),
        .I1(I21),
        .I2(I22),
        .I3(I23),
        .I4(I24),
        .I5(I11),
        .O(O2));
LUT6 #(
    .INIT(64'hEEEEFFFFEEEEFEEE)) 
     reset_time_out_i_2
       (.I0(I17),
        .I1(I18),
        .I2(data_valid_sync),
        .I3(Q[4]),
        .I4(I6),
        .I5(O1),
        .O(reset_time_out));
LUT6 #(
    .INIT(64'hAABFBFBFAA808080)) 
     rx_fsm_reset_done_int_i_1
       (.I0(rx_fsm_reset_done_int),
        .I1(I25),
        .I2(n_0_rx_fsm_reset_done_int_i_4),
        .I3(n_0_rx_fsm_reset_done_int_i_5),
        .I4(I20),
        .I5(GT0_RX_FSM_RESET_DONE_OUT),
        .O(O3));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT4 #(
    .INIT(16'h0800)) 
     rx_fsm_reset_done_int_i_2
       (.I0(I10),
        .I1(data_valid_sync),
        .I2(I11),
        .I3(Q[5]),
        .O(rx_fsm_reset_done_int));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT5 #(
    .INIT(32'h04044404)) 
     rx_fsm_reset_done_int_i_4
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(data_valid_sync),
        .I3(I10),
        .I4(I11),
        .O(n_0_rx_fsm_reset_done_int_i_4));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT4 #(
    .INIT(16'hFF02)) 
     rx_fsm_reset_done_int_i_5
       (.I0(I19),
        .I1(DONT_RESET_ON_DATA_ERROR_IN),
        .I2(I11),
        .I3(data_valid_sync),
        .O(n_0_rx_fsm_reset_done_int_i_5));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_36
   (SR,
    O1,
    mmcm_lock_reclocked,
    I1,
    SYSCLK_IN);
  output [0:0]SR;
  output O1;
  input mmcm_lock_reclocked;
  input I1;
  input SYSCLK_IN;

  wire I1;
  wire O1;
  wire [0:0]SR;
  wire SYSCLK_IN;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire mmcm_lock_i;
  wire mmcm_lock_reclocked;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(1'b1),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(mmcm_lock_i),
        .R(1'b0));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \mmcm_lock_count[9]_i_1 
       (.I0(mmcm_lock_i),
        .O(SR));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT3 #(
    .INIT(8'hE0)) 
     mmcm_lock_reclocked_i_1
       (.I0(mmcm_lock_reclocked),
        .I1(I1),
        .I2(mmcm_lock_i),
        .O(O1));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_37
   (data_out,
    data_in,
    gt0_rxusrclk_in);
  output data_out;
  input data_in;
  input gt0_rxusrclk_in;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt0_rxusrclk_in;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_38
   (data_out,
    GT0_RX_FSM_RESET_DONE_OUT,
    gt0_rxusrclk_in);
  output data_out;
  input GT0_RX_FSM_RESET_DONE_OUT;
  input gt0_rxusrclk_in;

  wire GT0_RX_FSM_RESET_DONE_OUT;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt0_rxusrclk_in;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(GT0_RX_FSM_RESET_DONE_OUT),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt0_rxusrclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_39
   (data_out,
    data_in,
    SYSCLK_IN);
  output data_out;
  input data_in;
  input SYSCLK_IN;

  wire SYSCLK_IN;
  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(SYSCLK_IN),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_7
   (D,
    data_out,
    I1,
    rxpmaresetdone_sss,
    Q,
    gtrxreset_ss,
    data_in,
    gt2_drpclk_in);
  output [1:0]D;
  output data_out;
  input I1;
  input rxpmaresetdone_sss;
  input [2:0]Q;
  input gtrxreset_ss;
  input data_in;
  input gt2_drpclk_in;

  wire [1:0]D;
  wire I1;
  wire [2:0]Q;
  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt2_drpclk_in;
  wire gtrxreset_ss;
  wire \n_0_state[0]_i_2__1 ;
  wire rxpmaresetdone_sss;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0C880C88FCF3FCC0)) 
     \state[0]_i_1__1 
       (.I0(\n_0_state[0]_i_2__1 ),
        .I1(Q[2]),
        .I2(I1),
        .I3(Q[1]),
        .I4(gtrxreset_ss),
        .I5(Q[0]),
        .O(D[0]));
LUT2 #(
    .INIT(4'hB)) 
     \state[0]_i_2__1 
       (.I0(data_out),
        .I1(rxpmaresetdone_sss),
        .O(\n_0_state[0]_i_2__1 ));
LUT6 #(
    .INIT(64'h5500FFFF30FF0000)) 
     \state[1]_i_1__1 
       (.I0(I1),
        .I1(data_out),
        .I2(rxpmaresetdone_sss),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(D[1]));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_Rx_sync_block" *) 
module gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_9
   (D,
    data_out,
    I1,
    rxpmaresetdone_sss,
    Q,
    gtrxreset_ss,
    data_in,
    gt1_drpclk_in);
  output [1:0]D;
  output data_out;
  input I1;
  input rxpmaresetdone_sss;
  input [2:0]Q;
  input gtrxreset_ss;
  input data_in;
  input gt1_drpclk_in;

  wire [1:0]D;
  wire I1;
  wire [2:0]Q;
  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire gt1_drpclk_in;
  wire gtrxreset_ss;
  wire \n_0_state[0]_i_2__0 ;
  wire rxpmaresetdone_sss;

(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg1
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg2
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg3
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg4
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg5
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
(* ASYNC_REG *) 
   (* SHREG_EXTRACT = "no" *) 
   (* XILINX_LEGACY_PRIM = "FD" *) 
   (* box_type = "PRIMITIVE" *) 
   FDRE #(
    .INIT(1'b0)) 
     data_sync_reg6
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
LUT6 #(
    .INIT(64'h0C880C88FCF3FCC0)) 
     \state[0]_i_1__0 
       (.I0(\n_0_state[0]_i_2__0 ),
        .I1(Q[2]),
        .I2(I1),
        .I3(Q[1]),
        .I4(gtrxreset_ss),
        .I5(Q[0]),
        .O(D[0]));
LUT2 #(
    .INIT(4'hB)) 
     \state[0]_i_2__0 
       (.I0(data_out),
        .I1(rxpmaresetdone_sss),
        .O(\n_0_state[0]_i_2__0 ));
LUT6 #(
    .INIT(64'h5500FFFF30FF0000)) 
     \state[1]_i_1__0 
       (.I0(I1),
        .I1(data_out),
        .I2(rxpmaresetdone_sss),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(D[1]));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_rx_gtrxreset_seq" *) 
module gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq
   (GTRXRESET_OUT,
    O1,
    DRPDI,
    O2,
    O3,
    DRPADDR,
    gt3_drpclk_in,
    AR,
    I6,
    I1,
    data_in,
    gt3_drpdo_out,
    gt3_drpen_in,
    gt3_drpdi_in,
    gt3_drpwe_in,
    gt3_drpaddr_in);
  output GTRXRESET_OUT;
  output O1;
  output [15:0]DRPDI;
  output O2;
  output O3;
  output [8:0]DRPADDR;
  input gt3_drpclk_in;
  input [0:0]AR;
  input I6;
  input I1;
  input data_in;
  input [15:0]gt3_drpdo_out;
  input gt3_drpen_in;
  input [15:0]gt3_drpdi_in;
  input gt3_drpwe_in;
  input [8:0]gt3_drpaddr_in;

  wire [0:0]AR;
  wire [8:0]DRPADDR;
  wire [15:0]DRPDI;
  wire DRP_OP_DONE;
  wire GTRXRESET_OUT;
  wire I1;
  wire I6;
  wire O1;
  wire O2;
  wire O3;
  wire data_in;
  wire data_out;
  wire [8:0]gt3_drpaddr_in;
  wire gt3_drpclk_in;
  wire [15:0]gt3_drpdi_in;
  wire [15:0]gt3_drpdo_out;
  wire gt3_drpen_in;
  wire gt3_drpwe_in;
  wire gtrxreset_i;
  wire gtrxreset_ss;
  wire n_0_drp_op_done_o_i_1__2;
  wire n_0_gtrxreset_s_reg;
  wire \n_0_rd_data[15]_i_1__2 ;
  wire \n_0_rd_data_reg[0] ;
  wire \n_0_rd_data_reg[10] ;
  wire \n_0_rd_data_reg[11] ;
  wire \n_0_rd_data_reg[12] ;
  wire \n_0_rd_data_reg[13] ;
  wire \n_0_rd_data_reg[14] ;
  wire \n_0_rd_data_reg[15] ;
  wire \n_0_rd_data_reg[1] ;
  wire \n_0_rd_data_reg[2] ;
  wire \n_0_rd_data_reg[3] ;
  wire \n_0_rd_data_reg[4] ;
  wire \n_0_rd_data_reg[5] ;
  wire \n_0_rd_data_reg[6] ;
  wire \n_0_rd_data_reg[7] ;
  wire \n_0_rd_data_reg[8] ;
  wire \n_0_rd_data_reg[9] ;
  wire [2:0]next_state;
  wire rxpmaresetdone_sss;
  wire [2:0]state;

(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair131" *) 
   LUT1 #(
    .INIT(2'h1)) 
     drp_busy_i1_i_1__2
       (.I0(DRP_OP_DONE),
        .O(O3));
LUT5 #(
    .INIT(32'hFFFF8000)) 
     drp_op_done_o_i_1__2
       (.I0(I1),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(DRP_OP_DONE),
        .O(n_0_drp_op_done_o_i_1__2));
FDCE drp_op_done_o_reg
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .CLR(I6),
        .D(n_0_drp_op_done_o_i_1__2),
        .Q(DRP_OP_DONE));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_10__2
       (.I0(gt3_drpdi_in[8]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[8] ),
        .O(DRPDI[8]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_11__2
       (.I0(gt3_drpdi_in[7]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[7] ),
        .O(DRPDI[7]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_12__2
       (.I0(gt3_drpdi_in[6]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[6] ),
        .O(DRPDI[6]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_13__2
       (.I0(gt3_drpdi_in[5]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[5] ),
        .O(DRPDI[5]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_14__2
       (.I0(gt3_drpdi_in[4]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[4] ),
        .O(DRPDI[4]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_15__2
       (.I0(gt3_drpdi_in[3]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[3] ),
        .O(DRPDI[3]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_16__2
       (.I0(gt3_drpdi_in[2]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[2] ),
        .O(DRPDI[2]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_17__2
       (.I0(gt3_drpdi_in[1]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[1] ),
        .O(DRPDI[1]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_18__2
       (.I0(gt3_drpdi_in[0]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[0] ),
        .O(DRPDI[0]));
(* SOFT_HLUTNM = "soft_lutpair133" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_19__2
       (.I0(DRP_OP_DONE),
        .I1(gt3_drpaddr_in[8]),
        .O(DRPADDR[8]));
(* SOFT_HLUTNM = "soft_lutpair131" *) 
   LUT5 #(
    .INIT(32'h8B88B8B8)) 
     gthe2_i_i_1__2
       (.I0(gt3_drpen_in),
        .I1(DRP_OP_DONE),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[2]),
        .O(O1));
(* SOFT_HLUTNM = "soft_lutpair134" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_20__2
       (.I0(DRP_OP_DONE),
        .I1(gt3_drpaddr_in[7]),
        .O(DRPADDR[7]));
(* SOFT_HLUTNM = "soft_lutpair133" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_21__2
       (.I0(DRP_OP_DONE),
        .I1(gt3_drpaddr_in[6]),
        .O(DRPADDR[6]));
(* SOFT_HLUTNM = "soft_lutpair134" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_22__2
       (.I0(DRP_OP_DONE),
        .I1(gt3_drpaddr_in[5]),
        .O(DRPADDR[5]));
(* SOFT_HLUTNM = "soft_lutpair135" *) 
   LUT2 #(
    .INIT(4'hB)) 
     gthe2_i_i_23__2
       (.I0(gt3_drpaddr_in[4]),
        .I1(DRP_OP_DONE),
        .O(DRPADDR[4]));
(* SOFT_HLUTNM = "soft_lutpair135" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_24__2
       (.I0(DRP_OP_DONE),
        .I1(gt3_drpaddr_in[3]),
        .O(DRPADDR[3]));
(* SOFT_HLUTNM = "soft_lutpair136" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_25__2
       (.I0(DRP_OP_DONE),
        .I1(gt3_drpaddr_in[2]),
        .O(DRPADDR[2]));
(* SOFT_HLUTNM = "soft_lutpair136" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_26__2
       (.I0(DRP_OP_DONE),
        .I1(gt3_drpaddr_in[1]),
        .O(DRPADDR[1]));
LUT2 #(
    .INIT(4'hB)) 
     gthe2_i_i_27__2
       (.I0(gt3_drpaddr_in[0]),
        .I1(DRP_OP_DONE),
        .O(DRPADDR[0]));
LUT5 #(
    .INIT(32'hAA3CAA00)) 
     gthe2_i_i_2__2
       (.I0(gt3_drpwe_in),
        .I1(state[2]),
        .I2(state[0]),
        .I3(DRP_OP_DONE),
        .I4(state[1]),
        .O(O2));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_3__2
       (.I0(gt3_drpdi_in[15]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[15] ),
        .O(DRPDI[15]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_4__2
       (.I0(gt3_drpdi_in[14]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[14] ),
        .O(DRPDI[14]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_5__2
       (.I0(gt3_drpdi_in[13]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[13] ),
        .O(DRPDI[13]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_6__2
       (.I0(gt3_drpdi_in[12]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[12] ),
        .O(DRPDI[12]));
LUT6 #(
    .INIT(64'h8B88888888888888)) 
     gthe2_i_i_7__2
       (.I0(gt3_drpdi_in[11]),
        .I1(DRP_OP_DONE),
        .I2(state[0]),
        .I3(state[2]),
        .I4(\n_0_rd_data_reg[11] ),
        .I5(state[1]),
        .O(DRPDI[11]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_8__2
       (.I0(gt3_drpdi_in[10]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[10] ),
        .O(DRPDI[10]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_9__2
       (.I0(gt3_drpdi_in[9]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[9] ),
        .O(DRPDI[9]));
(* SOFT_HLUTNM = "soft_lutpair132" *) 
   LUT4 #(
    .INIT(16'h0FDA)) 
     gtrxreset_o_i_1__2
       (.I0(state[0]),
        .I1(gtrxreset_ss),
        .I2(state[2]),
        .I3(state[1]),
        .O(gtrxreset_i));
FDCE gtrxreset_o_reg
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(gtrxreset_i),
        .Q(GTRXRESET_OUT));
FDCE gtrxreset_s_reg
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(I6),
        .Q(n_0_gtrxreset_s_reg));
FDCE gtrxreset_ss_reg
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(n_0_gtrxreset_s_reg),
        .Q(gtrxreset_ss));
LUT4 #(
    .INIT(16'h0040)) 
     \rd_data[15]_i_1__2 
       (.I0(state[2]),
        .I1(I1),
        .I2(state[1]),
        .I3(state[0]),
        .O(\n_0_rd_data[15]_i_1__2 ));
FDCE \rd_data_reg[0] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[0]),
        .Q(\n_0_rd_data_reg[0] ));
FDCE \rd_data_reg[10] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[10]),
        .Q(\n_0_rd_data_reg[10] ));
FDCE \rd_data_reg[11] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[11]),
        .Q(\n_0_rd_data_reg[11] ));
FDCE \rd_data_reg[12] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[12]),
        .Q(\n_0_rd_data_reg[12] ));
FDCE \rd_data_reg[13] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[13]),
        .Q(\n_0_rd_data_reg[13] ));
FDCE \rd_data_reg[14] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[14]),
        .Q(\n_0_rd_data_reg[14] ));
FDCE \rd_data_reg[15] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[15]),
        .Q(\n_0_rd_data_reg[15] ));
FDCE \rd_data_reg[1] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[1]),
        .Q(\n_0_rd_data_reg[1] ));
FDCE \rd_data_reg[2] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[2]),
        .Q(\n_0_rd_data_reg[2] ));
FDCE \rd_data_reg[3] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[3]),
        .Q(\n_0_rd_data_reg[3] ));
FDCE \rd_data_reg[4] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[4]),
        .Q(\n_0_rd_data_reg[4] ));
FDCE \rd_data_reg[5] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[5]),
        .Q(\n_0_rd_data_reg[5] ));
FDCE \rd_data_reg[6] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[6]),
        .Q(\n_0_rd_data_reg[6] ));
FDCE \rd_data_reg[7] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[7]),
        .Q(\n_0_rd_data_reg[7] ));
FDCE \rd_data_reg[8] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[8]),
        .Q(\n_0_rd_data_reg[8] ));
FDCE \rd_data_reg[9] 
       (.C(gt3_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__2 ),
        .CLR(AR),
        .D(gt3_drpdo_out[9]),
        .Q(\n_0_rd_data_reg[9] ));
FDCE rxpmaresetdone_sss_reg
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(data_out),
        .Q(rxpmaresetdone_sss));
(* SOFT_HLUTNM = "soft_lutpair132" *) 
   LUT4 #(
    .INIT(16'h7F88)) 
     \state[2]_i_1__2 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(I1),
        .I3(state[2]),
        .O(next_state[2]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[0] 
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[0]),
        .Q(state[0]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[1] 
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[1]),
        .Q(state[1]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[2] 
       (.C(gt3_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[2]),
        .Q(state[2]));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0 sync0_RXPMARESETDONE
       (.D(next_state[1:0]),
        .I1(I1),
        .Q(state),
        .data_in(data_in),
        .data_out(data_out),
        .gt3_drpclk_in(gt3_drpclk_in),
        .gtrxreset_ss(gtrxreset_ss),
        .rxpmaresetdone_sss(rxpmaresetdone_sss));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_rx_gtrxreset_seq" *) 
module gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_10
   (GTRXRESET_OUT,
    O1,
    DRPDI,
    O2,
    O3,
    DRPADDR,
    gt0_drpclk_in,
    AR,
    gtrxreset_i,
    I1,
    data_in,
    gt0_drpdo_out,
    gt0_drpen_in,
    gt0_drpdi_in,
    gt0_drpwe_in,
    gt0_drpaddr_in);
  output GTRXRESET_OUT;
  output O1;
  output [15:0]DRPDI;
  output O2;
  output O3;
  output [8:0]DRPADDR;
  input gt0_drpclk_in;
  input [0:0]AR;
  input gtrxreset_i;
  input I1;
  input data_in;
  input [15:0]gt0_drpdo_out;
  input gt0_drpen_in;
  input [15:0]gt0_drpdi_in;
  input gt0_drpwe_in;
  input [8:0]gt0_drpaddr_in;

  wire [0:0]AR;
  wire [8:0]DRPADDR;
  wire [15:0]DRPDI;
  wire DRP_OP_DONE;
  wire GTRXRESET_OUT;
  wire I1;
  wire O1;
  wire O2;
  wire O3;
  wire data_in;
  wire data_out;
  wire [8:0]gt0_drpaddr_in;
  wire gt0_drpclk_in;
  wire [15:0]gt0_drpdi_in;
  wire [15:0]gt0_drpdo_out;
  wire gt0_drpen_in;
  wire gt0_drpwe_in;
  wire gtrxreset_i;
  wire gtrxreset_i_0;
  wire gtrxreset_s;
  wire gtrxreset_ss;
  wire n_0_drp_op_done_o_i_1;
  wire \n_0_rd_data[15]_i_1 ;
  wire [2:0]next_state;
  wire [15:0]rd_data;
  wire rxpmaresetdone_sss;
  wire [2:0]state;

(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair113" *) 
   LUT1 #(
    .INIT(2'h1)) 
     drp_busy_i1_i_1
       (.I0(DRP_OP_DONE),
        .O(O3));
LUT5 #(
    .INIT(32'hFFFF8000)) 
     drp_op_done_o_i_1
       (.I0(I1),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(DRP_OP_DONE),
        .O(n_0_drp_op_done_o_i_1));
FDCE drp_op_done_o_reg
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .CLR(gtrxreset_i),
        .D(n_0_drp_op_done_o_i_1),
        .Q(DRP_OP_DONE));
(* SOFT_HLUTNM = "soft_lutpair113" *) 
   LUT5 #(
    .INIT(32'h8B88B8B8)) 
     gthe2_i_i_1
       (.I0(gt0_drpen_in),
        .I1(DRP_OP_DONE),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[2]),
        .O(O1));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_10
       (.I0(gt0_drpdi_in[8]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[8]),
        .O(DRPDI[8]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_11
       (.I0(gt0_drpdi_in[7]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[7]),
        .O(DRPDI[7]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_12
       (.I0(gt0_drpdi_in[6]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[6]),
        .O(DRPDI[6]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_13
       (.I0(gt0_drpdi_in[5]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[5]),
        .O(DRPDI[5]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_14
       (.I0(gt0_drpdi_in[4]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[4]),
        .O(DRPDI[4]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_15
       (.I0(gt0_drpdi_in[3]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[3]),
        .O(DRPDI[3]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_16
       (.I0(gt0_drpdi_in[2]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[2]),
        .O(DRPDI[2]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_17
       (.I0(gt0_drpdi_in[1]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[1]),
        .O(DRPDI[1]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_18
       (.I0(gt0_drpdi_in[0]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[0]),
        .O(DRPDI[0]));
(* SOFT_HLUTNM = "soft_lutpair115" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_19
       (.I0(DRP_OP_DONE),
        .I1(gt0_drpaddr_in[8]),
        .O(DRPADDR[8]));
LUT5 #(
    .INIT(32'hAA3CAA00)) 
     gthe2_i_i_2
       (.I0(gt0_drpwe_in),
        .I1(state[2]),
        .I2(state[0]),
        .I3(DRP_OP_DONE),
        .I4(state[1]),
        .O(O2));
(* SOFT_HLUTNM = "soft_lutpair116" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_20
       (.I0(DRP_OP_DONE),
        .I1(gt0_drpaddr_in[7]),
        .O(DRPADDR[7]));
(* SOFT_HLUTNM = "soft_lutpair115" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_21
       (.I0(DRP_OP_DONE),
        .I1(gt0_drpaddr_in[6]),
        .O(DRPADDR[6]));
(* SOFT_HLUTNM = "soft_lutpair116" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_22
       (.I0(DRP_OP_DONE),
        .I1(gt0_drpaddr_in[5]),
        .O(DRPADDR[5]));
(* SOFT_HLUTNM = "soft_lutpair117" *) 
   LUT2 #(
    .INIT(4'hB)) 
     gthe2_i_i_23
       (.I0(gt0_drpaddr_in[4]),
        .I1(DRP_OP_DONE),
        .O(DRPADDR[4]));
(* SOFT_HLUTNM = "soft_lutpair117" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_24
       (.I0(DRP_OP_DONE),
        .I1(gt0_drpaddr_in[3]),
        .O(DRPADDR[3]));
(* SOFT_HLUTNM = "soft_lutpair118" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_25
       (.I0(DRP_OP_DONE),
        .I1(gt0_drpaddr_in[2]),
        .O(DRPADDR[2]));
(* SOFT_HLUTNM = "soft_lutpair118" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_26
       (.I0(DRP_OP_DONE),
        .I1(gt0_drpaddr_in[1]),
        .O(DRPADDR[1]));
LUT2 #(
    .INIT(4'hB)) 
     gthe2_i_i_27
       (.I0(gt0_drpaddr_in[0]),
        .I1(DRP_OP_DONE),
        .O(DRPADDR[0]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_3
       (.I0(gt0_drpdi_in[15]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[15]),
        .O(DRPDI[15]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_4
       (.I0(gt0_drpdi_in[14]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[14]),
        .O(DRPDI[14]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_5
       (.I0(gt0_drpdi_in[13]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[13]),
        .O(DRPDI[13]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_6
       (.I0(gt0_drpdi_in[12]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[12]),
        .O(DRPDI[12]));
LUT6 #(
    .INIT(64'h8B88888888888888)) 
     gthe2_i_i_7
       (.I0(gt0_drpdi_in[11]),
        .I1(DRP_OP_DONE),
        .I2(state[0]),
        .I3(state[2]),
        .I4(rd_data[11]),
        .I5(state[1]),
        .O(DRPDI[11]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_8
       (.I0(gt0_drpdi_in[10]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[10]),
        .O(DRPDI[10]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_9
       (.I0(gt0_drpdi_in[9]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(rd_data[9]),
        .O(DRPDI[9]));
(* SOFT_HLUTNM = "soft_lutpair114" *) 
   LUT4 #(
    .INIT(16'h0FDA)) 
     gtrxreset_o_i_1
       (.I0(state[0]),
        .I1(gtrxreset_ss),
        .I2(state[2]),
        .I3(state[1]),
        .O(gtrxreset_i_0));
FDCE gtrxreset_o_reg
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(gtrxreset_i_0),
        .Q(GTRXRESET_OUT));
FDCE gtrxreset_s_reg
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(gtrxreset_i),
        .Q(gtrxreset_s));
FDCE gtrxreset_ss_reg
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(gtrxreset_s),
        .Q(gtrxreset_ss));
LUT4 #(
    .INIT(16'h0040)) 
     \rd_data[15]_i_1 
       (.I0(state[2]),
        .I1(I1),
        .I2(state[1]),
        .I3(state[0]),
        .O(\n_0_rd_data[15]_i_1 ));
FDCE \rd_data_reg[0] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[0]),
        .Q(rd_data[0]));
FDCE \rd_data_reg[10] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[10]),
        .Q(rd_data[10]));
FDCE \rd_data_reg[11] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[11]),
        .Q(rd_data[11]));
FDCE \rd_data_reg[12] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[12]),
        .Q(rd_data[12]));
FDCE \rd_data_reg[13] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[13]),
        .Q(rd_data[13]));
FDCE \rd_data_reg[14] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[14]),
        .Q(rd_data[14]));
FDCE \rd_data_reg[15] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[15]),
        .Q(rd_data[15]));
FDCE \rd_data_reg[1] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[1]),
        .Q(rd_data[1]));
FDCE \rd_data_reg[2] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[2]),
        .Q(rd_data[2]));
FDCE \rd_data_reg[3] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[3]),
        .Q(rd_data[3]));
FDCE \rd_data_reg[4] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[4]),
        .Q(rd_data[4]));
FDCE \rd_data_reg[5] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[5]),
        .Q(rd_data[5]));
FDCE \rd_data_reg[6] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[6]),
        .Q(rd_data[6]));
FDCE \rd_data_reg[7] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[7]),
        .Q(rd_data[7]));
FDCE \rd_data_reg[8] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[8]),
        .Q(rd_data[8]));
FDCE \rd_data_reg[9] 
       (.C(gt0_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1 ),
        .CLR(AR),
        .D(gt0_drpdo_out[9]),
        .Q(rd_data[9]));
FDCE rxpmaresetdone_sss_reg
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(data_out),
        .Q(rxpmaresetdone_sss));
(* SOFT_HLUTNM = "soft_lutpair114" *) 
   LUT4 #(
    .INIT(16'h7F88)) 
     \state[2]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(I1),
        .I3(state[2]),
        .O(next_state[2]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[0] 
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[0]),
        .Q(state[0]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[1] 
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[1]),
        .Q(state[1]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[2] 
       (.C(gt0_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[2]),
        .Q(state[2]));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_11 sync0_RXPMARESETDONE
       (.D(next_state[1:0]),
        .I1(I1),
        .Q(state),
        .data_in(data_in),
        .data_out(data_out),
        .gt0_drpclk_in(gt0_drpclk_in),
        .gtrxreset_ss(gtrxreset_ss),
        .rxpmaresetdone_sss(rxpmaresetdone_sss));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_rx_gtrxreset_seq" *) 
module gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_6
   (GTRXRESET_OUT,
    O1,
    DRPDI,
    O2,
    O3,
    DRPADDR,
    gt2_drpclk_in,
    AR,
    I5,
    I1,
    data_in,
    gt2_drpdo_out,
    gt2_drpen_in,
    gt2_drpdi_in,
    gt2_drpwe_in,
    gt2_drpaddr_in);
  output GTRXRESET_OUT;
  output O1;
  output [15:0]DRPDI;
  output O2;
  output O3;
  output [8:0]DRPADDR;
  input gt2_drpclk_in;
  input [0:0]AR;
  input I5;
  input I1;
  input data_in;
  input [15:0]gt2_drpdo_out;
  input gt2_drpen_in;
  input [15:0]gt2_drpdi_in;
  input gt2_drpwe_in;
  input [8:0]gt2_drpaddr_in;

  wire [0:0]AR;
  wire [8:0]DRPADDR;
  wire [15:0]DRPDI;
  wire DRP_OP_DONE;
  wire GTRXRESET_OUT;
  wire I1;
  wire I5;
  wire O1;
  wire O2;
  wire O3;
  wire data_in;
  wire data_out;
  wire [8:0]gt2_drpaddr_in;
  wire gt2_drpclk_in;
  wire [15:0]gt2_drpdi_in;
  wire [15:0]gt2_drpdo_out;
  wire gt2_drpen_in;
  wire gt2_drpwe_in;
  wire gtrxreset_i;
  wire gtrxreset_ss;
  wire n_0_drp_op_done_o_i_1__1;
  wire n_0_gtrxreset_s_reg;
  wire \n_0_rd_data[15]_i_1__1 ;
  wire \n_0_rd_data_reg[0] ;
  wire \n_0_rd_data_reg[10] ;
  wire \n_0_rd_data_reg[11] ;
  wire \n_0_rd_data_reg[12] ;
  wire \n_0_rd_data_reg[13] ;
  wire \n_0_rd_data_reg[14] ;
  wire \n_0_rd_data_reg[15] ;
  wire \n_0_rd_data_reg[1] ;
  wire \n_0_rd_data_reg[2] ;
  wire \n_0_rd_data_reg[3] ;
  wire \n_0_rd_data_reg[4] ;
  wire \n_0_rd_data_reg[5] ;
  wire \n_0_rd_data_reg[6] ;
  wire \n_0_rd_data_reg[7] ;
  wire \n_0_rd_data_reg[8] ;
  wire \n_0_rd_data_reg[9] ;
  wire [2:0]next_state;
  wire rxpmaresetdone_sss;
  wire [2:0]state;

(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair125" *) 
   LUT1 #(
    .INIT(2'h1)) 
     drp_busy_i1_i_1__1
       (.I0(DRP_OP_DONE),
        .O(O3));
LUT5 #(
    .INIT(32'hFFFF8000)) 
     drp_op_done_o_i_1__1
       (.I0(I1),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(DRP_OP_DONE),
        .O(n_0_drp_op_done_o_i_1__1));
FDCE drp_op_done_o_reg
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .CLR(I5),
        .D(n_0_drp_op_done_o_i_1__1),
        .Q(DRP_OP_DONE));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_10__1
       (.I0(gt2_drpdi_in[8]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[8] ),
        .O(DRPDI[8]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_11__1
       (.I0(gt2_drpdi_in[7]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[7] ),
        .O(DRPDI[7]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_12__1
       (.I0(gt2_drpdi_in[6]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[6] ),
        .O(DRPDI[6]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_13__1
       (.I0(gt2_drpdi_in[5]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[5] ),
        .O(DRPDI[5]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_14__1
       (.I0(gt2_drpdi_in[4]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[4] ),
        .O(DRPDI[4]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_15__1
       (.I0(gt2_drpdi_in[3]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[3] ),
        .O(DRPDI[3]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_16__1
       (.I0(gt2_drpdi_in[2]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[2] ),
        .O(DRPDI[2]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_17__1
       (.I0(gt2_drpdi_in[1]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[1] ),
        .O(DRPDI[1]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_18__1
       (.I0(gt2_drpdi_in[0]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[0] ),
        .O(DRPDI[0]));
(* SOFT_HLUTNM = "soft_lutpair127" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_19__1
       (.I0(DRP_OP_DONE),
        .I1(gt2_drpaddr_in[8]),
        .O(DRPADDR[8]));
(* SOFT_HLUTNM = "soft_lutpair125" *) 
   LUT5 #(
    .INIT(32'h8B88B8B8)) 
     gthe2_i_i_1__1
       (.I0(gt2_drpen_in),
        .I1(DRP_OP_DONE),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[2]),
        .O(O1));
(* SOFT_HLUTNM = "soft_lutpair128" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_20__1
       (.I0(DRP_OP_DONE),
        .I1(gt2_drpaddr_in[7]),
        .O(DRPADDR[7]));
(* SOFT_HLUTNM = "soft_lutpair127" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_21__1
       (.I0(DRP_OP_DONE),
        .I1(gt2_drpaddr_in[6]),
        .O(DRPADDR[6]));
(* SOFT_HLUTNM = "soft_lutpair128" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_22__1
       (.I0(DRP_OP_DONE),
        .I1(gt2_drpaddr_in[5]),
        .O(DRPADDR[5]));
(* SOFT_HLUTNM = "soft_lutpair129" *) 
   LUT2 #(
    .INIT(4'hB)) 
     gthe2_i_i_23__1
       (.I0(gt2_drpaddr_in[4]),
        .I1(DRP_OP_DONE),
        .O(DRPADDR[4]));
(* SOFT_HLUTNM = "soft_lutpair129" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_24__1
       (.I0(DRP_OP_DONE),
        .I1(gt2_drpaddr_in[3]),
        .O(DRPADDR[3]));
(* SOFT_HLUTNM = "soft_lutpair130" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_25__1
       (.I0(DRP_OP_DONE),
        .I1(gt2_drpaddr_in[2]),
        .O(DRPADDR[2]));
(* SOFT_HLUTNM = "soft_lutpair130" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_26__1
       (.I0(DRP_OP_DONE),
        .I1(gt2_drpaddr_in[1]),
        .O(DRPADDR[1]));
LUT2 #(
    .INIT(4'hB)) 
     gthe2_i_i_27__1
       (.I0(gt2_drpaddr_in[0]),
        .I1(DRP_OP_DONE),
        .O(DRPADDR[0]));
LUT5 #(
    .INIT(32'hAA3CAA00)) 
     gthe2_i_i_2__1
       (.I0(gt2_drpwe_in),
        .I1(state[2]),
        .I2(state[0]),
        .I3(DRP_OP_DONE),
        .I4(state[1]),
        .O(O2));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_3__1
       (.I0(gt2_drpdi_in[15]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[15] ),
        .O(DRPDI[15]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_4__1
       (.I0(gt2_drpdi_in[14]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[14] ),
        .O(DRPDI[14]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_5__1
       (.I0(gt2_drpdi_in[13]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[13] ),
        .O(DRPDI[13]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_6__1
       (.I0(gt2_drpdi_in[12]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[12] ),
        .O(DRPDI[12]));
LUT6 #(
    .INIT(64'h8B88888888888888)) 
     gthe2_i_i_7__1
       (.I0(gt2_drpdi_in[11]),
        .I1(DRP_OP_DONE),
        .I2(state[0]),
        .I3(state[2]),
        .I4(\n_0_rd_data_reg[11] ),
        .I5(state[1]),
        .O(DRPDI[11]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_8__1
       (.I0(gt2_drpdi_in[10]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[10] ),
        .O(DRPDI[10]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_9__1
       (.I0(gt2_drpdi_in[9]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[9] ),
        .O(DRPDI[9]));
(* SOFT_HLUTNM = "soft_lutpair126" *) 
   LUT4 #(
    .INIT(16'h0FDA)) 
     gtrxreset_o_i_1__1
       (.I0(state[0]),
        .I1(gtrxreset_ss),
        .I2(state[2]),
        .I3(state[1]),
        .O(gtrxreset_i));
FDCE gtrxreset_o_reg
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(gtrxreset_i),
        .Q(GTRXRESET_OUT));
FDCE gtrxreset_s_reg
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(I5),
        .Q(n_0_gtrxreset_s_reg));
FDCE gtrxreset_ss_reg
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(n_0_gtrxreset_s_reg),
        .Q(gtrxreset_ss));
LUT4 #(
    .INIT(16'h0040)) 
     \rd_data[15]_i_1__1 
       (.I0(state[2]),
        .I1(I1),
        .I2(state[1]),
        .I3(state[0]),
        .O(\n_0_rd_data[15]_i_1__1 ));
FDCE \rd_data_reg[0] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[0]),
        .Q(\n_0_rd_data_reg[0] ));
FDCE \rd_data_reg[10] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[10]),
        .Q(\n_0_rd_data_reg[10] ));
FDCE \rd_data_reg[11] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[11]),
        .Q(\n_0_rd_data_reg[11] ));
FDCE \rd_data_reg[12] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[12]),
        .Q(\n_0_rd_data_reg[12] ));
FDCE \rd_data_reg[13] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[13]),
        .Q(\n_0_rd_data_reg[13] ));
FDCE \rd_data_reg[14] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[14]),
        .Q(\n_0_rd_data_reg[14] ));
FDCE \rd_data_reg[15] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[15]),
        .Q(\n_0_rd_data_reg[15] ));
FDCE \rd_data_reg[1] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[1]),
        .Q(\n_0_rd_data_reg[1] ));
FDCE \rd_data_reg[2] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[2]),
        .Q(\n_0_rd_data_reg[2] ));
FDCE \rd_data_reg[3] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[3]),
        .Q(\n_0_rd_data_reg[3] ));
FDCE \rd_data_reg[4] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[4]),
        .Q(\n_0_rd_data_reg[4] ));
FDCE \rd_data_reg[5] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[5]),
        .Q(\n_0_rd_data_reg[5] ));
FDCE \rd_data_reg[6] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[6]),
        .Q(\n_0_rd_data_reg[6] ));
FDCE \rd_data_reg[7] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[7]),
        .Q(\n_0_rd_data_reg[7] ));
FDCE \rd_data_reg[8] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[8]),
        .Q(\n_0_rd_data_reg[8] ));
FDCE \rd_data_reg[9] 
       (.C(gt2_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__1 ),
        .CLR(AR),
        .D(gt2_drpdo_out[9]),
        .Q(\n_0_rd_data_reg[9] ));
FDCE rxpmaresetdone_sss_reg
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(data_out),
        .Q(rxpmaresetdone_sss));
(* SOFT_HLUTNM = "soft_lutpair126" *) 
   LUT4 #(
    .INIT(16'h7F88)) 
     \state[2]_i_1__1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(I1),
        .I3(state[2]),
        .O(next_state[2]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[0] 
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[0]),
        .Q(state[0]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[1] 
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[1]),
        .Q(state[1]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[2] 
       (.C(gt2_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[2]),
        .Q(state[2]));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_7 sync0_RXPMARESETDONE
       (.D(next_state[1:0]),
        .I1(I1),
        .Q(state),
        .data_in(data_in),
        .data_out(data_out),
        .gt2_drpclk_in(gt2_drpclk_in),
        .gtrxreset_ss(gtrxreset_ss),
        .rxpmaresetdone_sss(rxpmaresetdone_sss));
endmodule

(* ORIG_REF_NAME = "gtwizard_32_rx_gtrxreset_seq" *) 
module gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_8
   (GTRXRESET_OUT,
    O1,
    DRPDI,
    O2,
    O3,
    DRPADDR,
    gt1_drpclk_in,
    AR,
    I4,
    I1,
    data_in,
    gt1_drpdo_out,
    gt1_drpen_in,
    gt1_drpdi_in,
    gt1_drpwe_in,
    gt1_drpaddr_in);
  output GTRXRESET_OUT;
  output O1;
  output [15:0]DRPDI;
  output O2;
  output O3;
  output [8:0]DRPADDR;
  input gt1_drpclk_in;
  input [0:0]AR;
  input I4;
  input I1;
  input data_in;
  input [15:0]gt1_drpdo_out;
  input gt1_drpen_in;
  input [15:0]gt1_drpdi_in;
  input gt1_drpwe_in;
  input [8:0]gt1_drpaddr_in;

  wire [0:0]AR;
  wire [8:0]DRPADDR;
  wire [15:0]DRPDI;
  wire DRP_OP_DONE;
  wire GTRXRESET_OUT;
  wire I1;
  wire I4;
  wire O1;
  wire O2;
  wire O3;
  wire data_in;
  wire data_out;
  wire [8:0]gt1_drpaddr_in;
  wire gt1_drpclk_in;
  wire [15:0]gt1_drpdi_in;
  wire [15:0]gt1_drpdo_out;
  wire gt1_drpen_in;
  wire gt1_drpwe_in;
  wire gtrxreset_i;
  wire gtrxreset_ss;
  wire n_0_drp_op_done_o_i_1__0;
  wire n_0_gtrxreset_s_reg;
  wire \n_0_rd_data[15]_i_1__0 ;
  wire \n_0_rd_data_reg[0] ;
  wire \n_0_rd_data_reg[10] ;
  wire \n_0_rd_data_reg[11] ;
  wire \n_0_rd_data_reg[12] ;
  wire \n_0_rd_data_reg[13] ;
  wire \n_0_rd_data_reg[14] ;
  wire \n_0_rd_data_reg[15] ;
  wire \n_0_rd_data_reg[1] ;
  wire \n_0_rd_data_reg[2] ;
  wire \n_0_rd_data_reg[3] ;
  wire \n_0_rd_data_reg[4] ;
  wire \n_0_rd_data_reg[5] ;
  wire \n_0_rd_data_reg[6] ;
  wire \n_0_rd_data_reg[7] ;
  wire \n_0_rd_data_reg[8] ;
  wire \n_0_rd_data_reg[9] ;
  wire [2:0]next_state;
  wire rxpmaresetdone_sss;
  wire [2:0]state;

(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair119" *) 
   LUT1 #(
    .INIT(2'h1)) 
     drp_busy_i1_i_1__0
       (.I0(DRP_OP_DONE),
        .O(O3));
LUT5 #(
    .INIT(32'hFFFF8000)) 
     drp_op_done_o_i_1__0
       (.I0(I1),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[1]),
        .I4(DRP_OP_DONE),
        .O(n_0_drp_op_done_o_i_1__0));
FDCE drp_op_done_o_reg
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .CLR(I4),
        .D(n_0_drp_op_done_o_i_1__0),
        .Q(DRP_OP_DONE));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_10__0
       (.I0(gt1_drpdi_in[8]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[8] ),
        .O(DRPDI[8]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_11__0
       (.I0(gt1_drpdi_in[7]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[7] ),
        .O(DRPDI[7]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_12__0
       (.I0(gt1_drpdi_in[6]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[6] ),
        .O(DRPDI[6]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_13__0
       (.I0(gt1_drpdi_in[5]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[5] ),
        .O(DRPDI[5]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_14__0
       (.I0(gt1_drpdi_in[4]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[4] ),
        .O(DRPDI[4]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_15__0
       (.I0(gt1_drpdi_in[3]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[3] ),
        .O(DRPDI[3]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_16__0
       (.I0(gt1_drpdi_in[2]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[2] ),
        .O(DRPDI[2]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_17__0
       (.I0(gt1_drpdi_in[1]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[1] ),
        .O(DRPDI[1]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_18__0
       (.I0(gt1_drpdi_in[0]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[0] ),
        .O(DRPDI[0]));
(* SOFT_HLUTNM = "soft_lutpair121" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_19__0
       (.I0(DRP_OP_DONE),
        .I1(gt1_drpaddr_in[8]),
        .O(DRPADDR[8]));
(* SOFT_HLUTNM = "soft_lutpair119" *) 
   LUT5 #(
    .INIT(32'h8B88B8B8)) 
     gthe2_i_i_1__0
       (.I0(gt1_drpen_in),
        .I1(DRP_OP_DONE),
        .I2(state[0]),
        .I3(state[1]),
        .I4(state[2]),
        .O(O1));
(* SOFT_HLUTNM = "soft_lutpair122" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_20__0
       (.I0(DRP_OP_DONE),
        .I1(gt1_drpaddr_in[7]),
        .O(DRPADDR[7]));
(* SOFT_HLUTNM = "soft_lutpair121" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_21__0
       (.I0(DRP_OP_DONE),
        .I1(gt1_drpaddr_in[6]),
        .O(DRPADDR[6]));
(* SOFT_HLUTNM = "soft_lutpair122" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_22__0
       (.I0(DRP_OP_DONE),
        .I1(gt1_drpaddr_in[5]),
        .O(DRPADDR[5]));
(* SOFT_HLUTNM = "soft_lutpair123" *) 
   LUT2 #(
    .INIT(4'hB)) 
     gthe2_i_i_23__0
       (.I0(gt1_drpaddr_in[4]),
        .I1(DRP_OP_DONE),
        .O(DRPADDR[4]));
(* SOFT_HLUTNM = "soft_lutpair123" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_24__0
       (.I0(DRP_OP_DONE),
        .I1(gt1_drpaddr_in[3]),
        .O(DRPADDR[3]));
(* SOFT_HLUTNM = "soft_lutpair124" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_25__0
       (.I0(DRP_OP_DONE),
        .I1(gt1_drpaddr_in[2]),
        .O(DRPADDR[2]));
(* SOFT_HLUTNM = "soft_lutpair124" *) 
   LUT2 #(
    .INIT(4'h8)) 
     gthe2_i_i_26__0
       (.I0(DRP_OP_DONE),
        .I1(gt1_drpaddr_in[1]),
        .O(DRPADDR[1]));
LUT2 #(
    .INIT(4'hB)) 
     gthe2_i_i_27__0
       (.I0(gt1_drpaddr_in[0]),
        .I1(DRP_OP_DONE),
        .O(DRPADDR[0]));
LUT5 #(
    .INIT(32'hAA3CAA00)) 
     gthe2_i_i_2__0
       (.I0(gt1_drpwe_in),
        .I1(state[2]),
        .I2(state[0]),
        .I3(DRP_OP_DONE),
        .I4(state[1]),
        .O(O2));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_3__0
       (.I0(gt1_drpdi_in[15]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[15] ),
        .O(DRPDI[15]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_4__0
       (.I0(gt1_drpdi_in[14]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[14] ),
        .O(DRPDI[14]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_5__0
       (.I0(gt1_drpdi_in[13]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[13] ),
        .O(DRPDI[13]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_6__0
       (.I0(gt1_drpdi_in[12]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[12] ),
        .O(DRPDI[12]));
LUT6 #(
    .INIT(64'h8B88888888888888)) 
     gthe2_i_i_7__0
       (.I0(gt1_drpdi_in[11]),
        .I1(DRP_OP_DONE),
        .I2(state[0]),
        .I3(state[2]),
        .I4(\n_0_rd_data_reg[11] ),
        .I5(state[1]),
        .O(DRPDI[11]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_8__0
       (.I0(gt1_drpdi_in[10]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[10] ),
        .O(DRPDI[10]));
LUT6 #(
    .INIT(64'hA0ACACA0A0A0A0A0)) 
     gthe2_i_i_9__0
       (.I0(gt1_drpdi_in[9]),
        .I1(state[1]),
        .I2(DRP_OP_DONE),
        .I3(state[0]),
        .I4(state[2]),
        .I5(\n_0_rd_data_reg[9] ),
        .O(DRPDI[9]));
(* SOFT_HLUTNM = "soft_lutpair120" *) 
   LUT4 #(
    .INIT(16'h0FDA)) 
     gtrxreset_o_i_1__0
       (.I0(state[0]),
        .I1(gtrxreset_ss),
        .I2(state[2]),
        .I3(state[1]),
        .O(gtrxreset_i));
FDCE gtrxreset_o_reg
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(gtrxreset_i),
        .Q(GTRXRESET_OUT));
FDCE gtrxreset_s_reg
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(I4),
        .Q(n_0_gtrxreset_s_reg));
FDCE gtrxreset_ss_reg
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(n_0_gtrxreset_s_reg),
        .Q(gtrxreset_ss));
LUT4 #(
    .INIT(16'h0040)) 
     \rd_data[15]_i_1__0 
       (.I0(state[2]),
        .I1(I1),
        .I2(state[1]),
        .I3(state[0]),
        .O(\n_0_rd_data[15]_i_1__0 ));
FDCE \rd_data_reg[0] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[0]),
        .Q(\n_0_rd_data_reg[0] ));
FDCE \rd_data_reg[10] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[10]),
        .Q(\n_0_rd_data_reg[10] ));
FDCE \rd_data_reg[11] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[11]),
        .Q(\n_0_rd_data_reg[11] ));
FDCE \rd_data_reg[12] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[12]),
        .Q(\n_0_rd_data_reg[12] ));
FDCE \rd_data_reg[13] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[13]),
        .Q(\n_0_rd_data_reg[13] ));
FDCE \rd_data_reg[14] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[14]),
        .Q(\n_0_rd_data_reg[14] ));
FDCE \rd_data_reg[15] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[15]),
        .Q(\n_0_rd_data_reg[15] ));
FDCE \rd_data_reg[1] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[1]),
        .Q(\n_0_rd_data_reg[1] ));
FDCE \rd_data_reg[2] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[2]),
        .Q(\n_0_rd_data_reg[2] ));
FDCE \rd_data_reg[3] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[3]),
        .Q(\n_0_rd_data_reg[3] ));
FDCE \rd_data_reg[4] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[4]),
        .Q(\n_0_rd_data_reg[4] ));
FDCE \rd_data_reg[5] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[5]),
        .Q(\n_0_rd_data_reg[5] ));
FDCE \rd_data_reg[6] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[6]),
        .Q(\n_0_rd_data_reg[6] ));
FDCE \rd_data_reg[7] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[7]),
        .Q(\n_0_rd_data_reg[7] ));
FDCE \rd_data_reg[8] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[8]),
        .Q(\n_0_rd_data_reg[8] ));
FDCE \rd_data_reg[9] 
       (.C(gt1_drpclk_in),
        .CE(\n_0_rd_data[15]_i_1__0 ),
        .CLR(AR),
        .D(gt1_drpdo_out[9]),
        .Q(\n_0_rd_data_reg[9] ));
FDCE rxpmaresetdone_sss_reg
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(data_out),
        .Q(rxpmaresetdone_sss));
(* SOFT_HLUTNM = "soft_lutpair120" *) 
   LUT4 #(
    .INIT(16'h7F88)) 
     \state[2]_i_1__0 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(I1),
        .I3(state[2]),
        .O(next_state[2]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[0] 
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[0]),
        .Q(state[0]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[1] 
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[1]),
        .Q(state[1]));
FDCE #(
    .INIT(1'b0)) 
     \state_reg[2] 
       (.C(gt1_drpclk_in),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[2]),
        .Q(state[2]));
gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_9 sync0_RXPMARESETDONE
       (.D(next_state[1:0]),
        .I1(I1),
        .Q(state),
        .data_in(data_in),
        .data_out(data_out),
        .gt1_drpclk_in(gt1_drpclk_in),
        .gtrxreset_ss(gtrxreset_ss),
        .rxpmaresetdone_sss(rxpmaresetdone_sss));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
