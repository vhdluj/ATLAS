// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 928826 Thu Jun  5 18:21:07 MDT 2014
// Date        : Thu Jul 10 21:05:55 2014
// Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               D:/TP_P_F_690T/TopoQPLL_80GTs_v3.7_485Update/TopoGTH_QPLL_AV2.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_funcsim.v
// Design      : clk_wiz_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* core_generation_info = "clk_wiz_1,clk_wiz_v5_1,{component_name=clk_wiz_1,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=4,clkin1_period=24.95,clkin2_period=10.0,use_power_down=false,use_reset=false,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}" *) 
(* NotValidForBitStream *)
module clk_wiz_1
   (LHCClkIn_p,
    LHCClkIn_n,
    SysClk40,
    SysClk80,
    SysClk160,
    SysClk320,
    locked);
  input LHCClkIn_p;
  input LHCClkIn_n;
  output SysClk40;
  output SysClk80;
  output SysClk160;
  output SysClk320;
  output locked;

(* DIFF_TERM=0 *) (* IBUF_LOW_PWR *)   wire LHCClkIn_n;
(* DIFF_TERM=0 *) (* IBUF_LOW_PWR *)   wire LHCClkIn_p;
  wire SysClk160;
  wire SysClk320;
  wire SysClk40;
  wire SysClk80;
  wire locked;

clk_wiz_1_clk_wiz_1_clk_wiz U0
       (.LHCClkIn_n(LHCClkIn_n),
        .LHCClkIn_p(LHCClkIn_p),
        .SysClk160(SysClk160),
        .SysClk320(SysClk320),
        .SysClk40(SysClk40),
        .SysClk80(SysClk80),
        .locked(locked));
endmodule

(* ORIG_REF_NAME = "clk_wiz_1_clk_wiz" *) 
module clk_wiz_1_clk_wiz_1_clk_wiz
   (LHCClkIn_p,
    LHCClkIn_n,
    SysClk40,
    SysClk80,
    SysClk160,
    SysClk320,
    locked);
  input LHCClkIn_p;
  input LHCClkIn_n;
  output SysClk40;
  output SysClk80;
  output SysClk160;
  output SysClk320;
  output locked;

  wire CLKFBOUT;
  wire CLKIN1;
  wire CLKOUT0;
  wire CLKOUT1;
  wire CLKOUT2;
  wire CLKOUT3;
(* DIFF_TERM=0 *) (* IBUF_LOW_PWR *)   wire LHCClkIn_n;
(* DIFF_TERM=0 *) (* IBUF_LOW_PWR *)   wire LHCClkIn_p;
  wire O;
  wire SysClk160;
  wire SysClk320;
  wire SysClk40;
  wire SysClk80;
  wire locked;
  wire n_0_clkout1_buf_en;
  wire n_0_clkout2_buf_en;
  wire n_0_clkout3_buf_en;
  wire n_0_clkout4_buf_en;
(* RTL_KEEP = "TRUE" *) (* async_reg = "true" *)   wire [7:0]seq_reg1;
(* RTL_KEEP = "TRUE" *) (* async_reg = "true" *)   wire [7:0]seq_reg2;
(* RTL_KEEP = "TRUE" *) (* async_reg = "true" *)   wire [7:0]seq_reg3;
(* RTL_KEEP = "TRUE" *) (* async_reg = "true" *)   wire [7:0]seq_reg4;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

(* box_type = "PRIMITIVE" *) 
   BUFG clkf_buf
       (.I(CLKFBOUT),
        .O(O));
(* CAPACITANCE = "DONT_CARE" *) 
   (* IBUF_DELAY_VALUE = "0" *) 
   (* IFD_DELAY_VALUE = "AUTO" *) 
   (* box_type = "PRIMITIVE" *) 
   IBUFDS #(
    .DQS_BIAS("FALSE"),
    .IOSTANDARD("DEFAULT")) 
     clkin1_ibufgds
       (.I(LHCClkIn_p),
        .IB(LHCClkIn_n),
        .O(CLKIN1));
(* CE_TYPE = "SYNC" *) 
   (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
   (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
   (* box_type = "PRIMITIVE" *) 
   BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
     clkout1_buf
       (.CE0(seq_reg1[7]),
        .CE1(1'b0),
        .I0(CLKOUT0),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(SysClk40),
        .S0(1'b1),
        .S1(1'b0));
(* box_type = "PRIMITIVE" *) 
   BUFH clkout1_buf_en
       (.I(CLKOUT0),
        .O(n_0_clkout1_buf_en));
(* CE_TYPE = "SYNC" *) 
   (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
   (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
   (* box_type = "PRIMITIVE" *) 
   BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
     clkout2_buf
       (.CE0(seq_reg2[7]),
        .CE1(1'b0),
        .I0(CLKOUT1),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(SysClk80),
        .S0(1'b1),
        .S1(1'b0));
(* box_type = "PRIMITIVE" *) 
   BUFH clkout2_buf_en
       (.I(CLKOUT1),
        .O(n_0_clkout2_buf_en));
(* CE_TYPE = "SYNC" *) 
   (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
   (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
   (* box_type = "PRIMITIVE" *) 
   BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
     clkout3_buf
       (.CE0(seq_reg3[7]),
        .CE1(1'b0),
        .I0(CLKOUT2),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(SysClk160),
        .S0(1'b1),
        .S1(1'b0));
(* box_type = "PRIMITIVE" *) 
   BUFH clkout3_buf_en
       (.I(CLKOUT2),
        .O(n_0_clkout3_buf_en));
(* CE_TYPE = "SYNC" *) 
   (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
   (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
   (* box_type = "PRIMITIVE" *) 
   BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
     clkout4_buf
       (.CE0(seq_reg4[7]),
        .CE1(1'b0),
        .I0(CLKOUT3),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(SysClk320),
        .S0(1'b1),
        .S1(1'b0));
(* box_type = "PRIMITIVE" *) 
   BUFH clkout4_buf_en
       (.I(CLKOUT3),
        .O(n_0_clkout4_buf_en));
(* box_type = "PRIMITIVE" *) 
   MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(24.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(24.950001),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(24.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(12),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(6),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(3),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.000000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
     mmcm_adv_inst
       (.CLKFBIN(O),
        .CLKFBOUT(CLKFBOUT),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(CLKIN1),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(CLKOUT0),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(CLKOUT1),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(CLKOUT2),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(CLKOUT3),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(locked),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[0] 
       (.C(n_0_clkout1_buf_en),
        .CE(1'b1),
        .D(locked),
        .Q(seq_reg1[0]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[1] 
       (.C(n_0_clkout1_buf_en),
        .CE(1'b1),
        .D(seq_reg1[0]),
        .Q(seq_reg1[1]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[2] 
       (.C(n_0_clkout1_buf_en),
        .CE(1'b1),
        .D(seq_reg1[1]),
        .Q(seq_reg1[2]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[3] 
       (.C(n_0_clkout1_buf_en),
        .CE(1'b1),
        .D(seq_reg1[2]),
        .Q(seq_reg1[3]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[4] 
       (.C(n_0_clkout1_buf_en),
        .CE(1'b1),
        .D(seq_reg1[3]),
        .Q(seq_reg1[4]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[5] 
       (.C(n_0_clkout1_buf_en),
        .CE(1'b1),
        .D(seq_reg1[4]),
        .Q(seq_reg1[5]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[6] 
       (.C(n_0_clkout1_buf_en),
        .CE(1'b1),
        .D(seq_reg1[5]),
        .Q(seq_reg1[6]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[7] 
       (.C(n_0_clkout1_buf_en),
        .CE(1'b1),
        .D(seq_reg1[6]),
        .Q(seq_reg1[7]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg2_reg[0] 
       (.C(n_0_clkout2_buf_en),
        .CE(1'b1),
        .D(locked),
        .Q(seq_reg2[0]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg2_reg[1] 
       (.C(n_0_clkout2_buf_en),
        .CE(1'b1),
        .D(seq_reg2[0]),
        .Q(seq_reg2[1]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg2_reg[2] 
       (.C(n_0_clkout2_buf_en),
        .CE(1'b1),
        .D(seq_reg2[1]),
        .Q(seq_reg2[2]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg2_reg[3] 
       (.C(n_0_clkout2_buf_en),
        .CE(1'b1),
        .D(seq_reg2[2]),
        .Q(seq_reg2[3]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg2_reg[4] 
       (.C(n_0_clkout2_buf_en),
        .CE(1'b1),
        .D(seq_reg2[3]),
        .Q(seq_reg2[4]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg2_reg[5] 
       (.C(n_0_clkout2_buf_en),
        .CE(1'b1),
        .D(seq_reg2[4]),
        .Q(seq_reg2[5]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg2_reg[6] 
       (.C(n_0_clkout2_buf_en),
        .CE(1'b1),
        .D(seq_reg2[5]),
        .Q(seq_reg2[6]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg2_reg[7] 
       (.C(n_0_clkout2_buf_en),
        .CE(1'b1),
        .D(seq_reg2[6]),
        .Q(seq_reg2[7]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg3_reg[0] 
       (.C(n_0_clkout3_buf_en),
        .CE(1'b1),
        .D(locked),
        .Q(seq_reg3[0]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg3_reg[1] 
       (.C(n_0_clkout3_buf_en),
        .CE(1'b1),
        .D(seq_reg3[0]),
        .Q(seq_reg3[1]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg3_reg[2] 
       (.C(n_0_clkout3_buf_en),
        .CE(1'b1),
        .D(seq_reg3[1]),
        .Q(seq_reg3[2]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg3_reg[3] 
       (.C(n_0_clkout3_buf_en),
        .CE(1'b1),
        .D(seq_reg3[2]),
        .Q(seq_reg3[3]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg3_reg[4] 
       (.C(n_0_clkout3_buf_en),
        .CE(1'b1),
        .D(seq_reg3[3]),
        .Q(seq_reg3[4]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg3_reg[5] 
       (.C(n_0_clkout3_buf_en),
        .CE(1'b1),
        .D(seq_reg3[4]),
        .Q(seq_reg3[5]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg3_reg[6] 
       (.C(n_0_clkout3_buf_en),
        .CE(1'b1),
        .D(seq_reg3[5]),
        .Q(seq_reg3[6]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg3_reg[7] 
       (.C(n_0_clkout3_buf_en),
        .CE(1'b1),
        .D(seq_reg3[6]),
        .Q(seq_reg3[7]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg4_reg[0] 
       (.C(n_0_clkout4_buf_en),
        .CE(1'b1),
        .D(locked),
        .Q(seq_reg4[0]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg4_reg[1] 
       (.C(n_0_clkout4_buf_en),
        .CE(1'b1),
        .D(seq_reg4[0]),
        .Q(seq_reg4[1]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg4_reg[2] 
       (.C(n_0_clkout4_buf_en),
        .CE(1'b1),
        .D(seq_reg4[1]),
        .Q(seq_reg4[2]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg4_reg[3] 
       (.C(n_0_clkout4_buf_en),
        .CE(1'b1),
        .D(seq_reg4[2]),
        .Q(seq_reg4[3]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg4_reg[4] 
       (.C(n_0_clkout4_buf_en),
        .CE(1'b1),
        .D(seq_reg4[3]),
        .Q(seq_reg4[4]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg4_reg[5] 
       (.C(n_0_clkout4_buf_en),
        .CE(1'b1),
        .D(seq_reg4[4]),
        .Q(seq_reg4[5]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg4_reg[6] 
       (.C(n_0_clkout4_buf_en),
        .CE(1'b1),
        .D(seq_reg4[5]),
        .Q(seq_reg4[6]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg4_reg[7] 
       (.C(n_0_clkout4_buf_en),
        .CE(1'b1),
        .D(seq_reg4[6]),
        .Q(seq_reg4[7]),
        .R(1'b0));
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
