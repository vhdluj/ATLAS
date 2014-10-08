// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.1 (lin64) Build 881834 Fri Apr  4 14:00:25 MDT 2014
// Date        : Fri May 16 16:34:12 2014
// Host        : wetap129 running 64-bit Debian GNU/Linux 7.4 (wheezy)
// Command     : write_verilog -force -mode funcsim
//               /net/fs01/vol/ma06/homes/seartz/workspace-vivado/CRC_Transmitter/CRC_Transmitter.srcs/sources_1/new/crc_distmem/crc_distmem_funcsim.v
// Design      : crc_distmem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0,Vivado 2014.1" *) (* CHECK_LICENSE_TYPE = "crc_distmem,dist_mem_gen_v8_0,{}" *) 
(* core_generation_info = "crc_distmem,dist_mem_gen_v8_0,{x_ipProduct=Vivado 2014.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=dist_mem_gen,x_ipVersion=8.0,x_ipCoreRevision=4,x_ipLanguage=VHDL,C_FAMILY=virtex7,C_ADDR_WIDTH=8,C_DEFAULT_DATA=0,C_DEPTH=256,C_HAS_CLK=0,C_HAS_D=0,C_HAS_DPO=0,C_HAS_DPRA=0,C_HAS_I_CE=0,C_HAS_QDPO=0,C_HAS_QDPO_CE=0,C_HAS_QDPO_CLK=0,C_HAS_QDPO_RST=0,C_HAS_QDPO_SRST=0,C_HAS_QSPO=0,C_HAS_QSPO_CE=0,C_HAS_QSPO_RST=0,C_HAS_QSPO_SRST=0,C_HAS_SPO=1,C_HAS_WE=0,C_MEM_INIT_FILE=crc_distmem.mif,C_ELABORATION_DIR=./,C_MEM_TYPE=0,C_PIPELINE_STAGES=0,C_QCE_JOINED=0,C_QUALIFY_WE=0,C_READ_MIF=1,C_REG_A_D_INPUTS=0,C_REG_DPRA_INPUT=0,C_SYNC_ENABLE=1,C_WIDTH=12,C_PARSER_TYPE=1}" *) 
(* NotValidForBitStream *)
module crc_distmem
   (a,
    spo);
  input [7:0]a;
  output [11:0]spo;

  wire [7:0]a;
  wire [11:0]spo;
  wire [11:0]NLW_U0_dpo_UNCONNECTED;
  wire [11:0]NLW_U0_qdpo_UNCONNECTED;
  wire [11:0]NLW_U0_qspo_UNCONNECTED;

(* C_FAMILY = "virtex7" *) 
   (* C_HAS_D = "0" *) 
   (* C_HAS_DPO = "0" *) 
   (* C_HAS_DPRA = "0" *) 
   (* C_HAS_I_CE = "0" *) 
   (* C_HAS_QDPO = "0" *) 
   (* C_HAS_QDPO_CE = "0" *) 
   (* C_HAS_QDPO_CLK = "0" *) 
   (* C_HAS_QDPO_RST = "0" *) 
   (* C_HAS_QDPO_SRST = "0" *) 
   (* C_HAS_WE = "0" *) 
   (* C_MEM_TYPE = "0" *) 
   (* C_PIPELINE_STAGES = "0" *) 
   (* C_QCE_JOINED = "0" *) 
   (* C_QUALIFY_WE = "0" *) 
   (* C_REG_DPRA_INPUT = "0" *) 
   (* DONT_TOUCH *) 
   (* c_addr_width = "8" *) 
   (* c_default_data = "0" *) 
   (* c_depth = "256" *) 
   (* c_elaboration_dir = "./" *) 
   (* c_has_clk = "0" *) 
   (* c_has_qspo = "0" *) 
   (* c_has_qspo_ce = "0" *) 
   (* c_has_qspo_rst = "0" *) 
   (* c_has_qspo_srst = "0" *) 
   (* c_has_spo = "1" *) 
   (* c_mem_init_file = "crc_distmem.mif" *) 
   (* c_parser_type = "1" *) 
   (* c_read_mif = "1" *) 
   (* c_reg_a_d_inputs = "0" *) 
   (* c_sync_enable = "1" *) 
   (* c_width = "12" *) 
   crc_distmemdist_mem_gen_v8_0__parameterized0 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[11:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[11:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[11:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule

(* ORIG_REF_NAME = "dist_mem_gen_v8_0" *) (* C_FAMILY = "virtex7" *) (* C_ADDR_WIDTH = "8" *) 
(* C_DEFAULT_DATA = "0" *) (* C_DEPTH = "256" *) (* C_HAS_CLK = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_DPO = "0" *) (* C_HAS_DPRA = "0" *) 
(* C_HAS_I_CE = "0" *) (* C_HAS_QDPO = "0" *) (* C_HAS_QDPO_CE = "0" *) 
(* C_HAS_QDPO_CLK = "0" *) (* C_HAS_QDPO_RST = "0" *) (* C_HAS_QDPO_SRST = "0" *) 
(* C_HAS_QSPO = "0" *) (* C_HAS_QSPO_CE = "0" *) (* C_HAS_QSPO_RST = "0" *) 
(* C_HAS_QSPO_SRST = "0" *) (* C_HAS_SPO = "1" *) (* C_HAS_WE = "0" *) 
(* C_MEM_INIT_FILE = "crc_distmem.mif" *) (* C_ELABORATION_DIR = "./" *) (* C_MEM_TYPE = "0" *) 
(* C_PIPELINE_STAGES = "0" *) (* C_QCE_JOINED = "0" *) (* C_QUALIFY_WE = "0" *) 
(* C_READ_MIF = "1" *) (* C_REG_A_D_INPUTS = "0" *) (* C_REG_DPRA_INPUT = "0" *) 
(* C_SYNC_ENABLE = "1" *) (* C_WIDTH = "12" *) (* C_PARSER_TYPE = "1" *) 
module crc_distmemdist_mem_gen_v8_0__parameterized0
   (a,
    d,
    dpra,
    clk,
    we,
    i_ce,
    qspo_ce,
    qdpo_ce,
    qdpo_clk,
    qspo_rst,
    qdpo_rst,
    qspo_srst,
    qdpo_srst,
    spo,
    dpo,
    qspo,
    qdpo);
  input [7:0]a;
  input [11:0]d;
  input [7:0]dpra;
  input clk;
  input we;
  input i_ce;
  input qspo_ce;
  input qdpo_ce;
  input qdpo_clk;
  input qspo_rst;
  input qdpo_rst;
  input qspo_srst;
  input qdpo_srst;
  output [11:0]spo;
  output [11:0]dpo;
  output [11:0]qspo;
  output [11:0]qdpo;

  wire \<const0> ;
  wire [7:0]a;
  wire [11:0]\^spo ;

  assign dpo[11] = \<const0> ;
  assign dpo[10] = \<const0> ;
  assign dpo[9] = \<const0> ;
  assign dpo[8] = \<const0> ;
  assign dpo[7] = \<const0> ;
  assign dpo[6] = \<const0> ;
  assign dpo[5] = \<const0> ;
  assign dpo[4] = \<const0> ;
  assign dpo[3] = \<const0> ;
  assign dpo[2] = \<const0> ;
  assign dpo[1] = \<const0> ;
  assign dpo[0] = \<const0> ;
  assign qdpo[11] = \<const0> ;
  assign qdpo[10] = \<const0> ;
  assign qdpo[9] = \<const0> ;
  assign qdpo[8] = \<const0> ;
  assign qdpo[7] = \<const0> ;
  assign qdpo[6] = \<const0> ;
  assign qdpo[5] = \<const0> ;
  assign qdpo[4] = \<const0> ;
  assign qdpo[3] = \<const0> ;
  assign qdpo[2] = \<const0> ;
  assign qdpo[1] = \<const0> ;
  assign qdpo[0] = \<const0> ;
  assign qspo[11] = \<const0> ;
  assign qspo[10] = \<const0> ;
  assign qspo[9] = \<const0> ;
  assign qspo[8] = \<const0> ;
  assign qspo[7] = \<const0> ;
  assign qspo[6] = \<const0> ;
  assign qspo[5] = \<const0> ;
  assign qspo[4] = \<const0> ;
  assign qspo[3] = \<const0> ;
  assign qspo[2] = \<const0> ;
  assign qspo[1] = \<const0> ;
  assign qspo[0] = \<const0> ;
  assign spo[11] = \^spo [11];
  assign spo[10:9] = a[7:6];
  assign spo[8:2] = \^spo [8:2];
  assign spo[1] = a[0];
  assign spo[0] = \^spo [0];
GND GND
       (.G(\<const0> ));
LUT2 #(
    .INIT(4'h6)) 
     g1_b7
       (.I0(a[4]),
        .I1(a[6]),
        .O(\^spo [7]));
LUT2 #(
    .INIT(4'h6)) 
     g2_b8
       (.I0(a[5]),
        .I1(a[7]),
        .O(\^spo [8]));
crc_distmemdist_mem_gen_v8_0_synth \synth_options.dist_mem_inst 
       (.a(a),
        .spo({\^spo [11],\^spo [6:2],\^spo [0]}));
endmodule

(* ORIG_REF_NAME = "dist_mem_gen_v8_0_synth" *) 
module crc_distmemdist_mem_gen_v8_0_synth
   (spo,
    a);
  output [6:0]spo;
  input [7:0]a;

  wire [7:0]a;
  wire [6:0]spo;

crc_distmemrom__parameterized0 \gen_rom.rom_inst 
       (.a(a),
        .spo(spo));
endmodule

(* ORIG_REF_NAME = "rom" *) 
module crc_distmemrom__parameterized0
   (spo,
    a);
  output [6:0]spo;
  input [7:0]a;

  wire [7:0]a;
  wire n_0_g0_b0;
  wire n_0_g0_b11;
  wire n_0_g0_b2;
  wire n_0_g0_b3;
  wire n_0_g0_b4;
  wire n_0_g0_b5;
  wire n_0_g0_b6;
  wire n_0_g1_b0;
  wire n_0_g1_b11;
  wire n_0_g1_b2;
  wire n_0_g1_b3;
  wire n_0_g1_b4;
  wire n_0_g1_b5;
  wire n_0_g1_b6;
  wire n_0_g2_b0;
  wire n_0_g2_b11;
  wire n_0_g2_b2;
  wire n_0_g2_b3;
  wire n_0_g2_b4;
  wire n_0_g2_b5;
  wire n_0_g2_b6;
  wire n_0_g3_b0;
  wire n_0_g3_b11;
  wire n_0_g3_b2;
  wire n_0_g3_b3;
  wire n_0_g3_b4;
  wire n_0_g3_b5;
  wire n_0_g3_b6;
  wire [6:0]spo;

LUT6 #(
    .INIT(64'h6996966996696996)) 
     g0_b0
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .I5(a[5]),
        .O(n_0_g0_b0));
LUT6 #(
    .INIT(64'h6996966996696996)) 
     g0_b11
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .I5(a[5]),
        .O(n_0_g0_b11));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT5 #(
    .INIT(32'h96696996)) 
     g0_b2
       (.I0(a[0]),
        .I1(a[2]),
        .I2(a[3]),
        .I3(a[4]),
        .I4(a[5]),
        .O(n_0_g0_b2));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g0_b3
       (.I0(a[0]),
        .I1(a[2]),
        .O(n_0_g0_b3));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g0_b4
       (.I0(a[1]),
        .I1(a[3]),
        .O(n_0_g0_b4));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g0_b5
       (.I0(a[2]),
        .I1(a[4]),
        .O(n_0_g0_b5));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g0_b6
       (.I0(a[3]),
        .I1(a[5]),
        .O(n_0_g0_b6));
LUT6 #(
    .INIT(64'h9669699669969669)) 
     g1_b0
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .I5(a[5]),
        .O(n_0_g1_b0));
LUT6 #(
    .INIT(64'h9669699669969669)) 
     g1_b11
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .I5(a[5]),
        .O(n_0_g1_b11));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT5 #(
    .INIT(32'h69969669)) 
     g1_b2
       (.I0(a[0]),
        .I1(a[2]),
        .I2(a[3]),
        .I3(a[4]),
        .I4(a[5]),
        .O(n_0_g1_b2));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g1_b3
       (.I0(a[0]),
        .I1(a[2]),
        .O(n_0_g1_b3));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g1_b4
       (.I0(a[1]),
        .I1(a[3]),
        .O(n_0_g1_b4));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g1_b5
       (.I0(a[2]),
        .I1(a[4]),
        .O(n_0_g1_b5));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g1_b6
       (.I0(a[3]),
        .I1(a[5]),
        .O(n_0_g1_b6));
LUT6 #(
    .INIT(64'h9669699669969669)) 
     g2_b0
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .I5(a[5]),
        .O(n_0_g2_b0));
LUT6 #(
    .INIT(64'h9669699669969669)) 
     g2_b11
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .I5(a[5]),
        .O(n_0_g2_b11));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT5 #(
    .INIT(32'h69969669)) 
     g2_b2
       (.I0(a[0]),
        .I1(a[2]),
        .I2(a[3]),
        .I3(a[4]),
        .I4(a[5]),
        .O(n_0_g2_b2));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g2_b3
       (.I0(a[0]),
        .I1(a[2]),
        .O(n_0_g2_b3));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g2_b4
       (.I0(a[1]),
        .I1(a[3]),
        .O(n_0_g2_b4));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g2_b5
       (.I0(a[2]),
        .I1(a[4]),
        .O(n_0_g2_b5));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g2_b6
       (.I0(a[3]),
        .I1(a[5]),
        .O(n_0_g2_b6));
LUT6 #(
    .INIT(64'h6996966996696996)) 
     g3_b0
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .I5(a[5]),
        .O(n_0_g3_b0));
LUT6 #(
    .INIT(64'h6996966996696996)) 
     g3_b11
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(a[3]),
        .I4(a[4]),
        .I5(a[5]),
        .O(n_0_g3_b11));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT5 #(
    .INIT(32'h96696996)) 
     g3_b2
       (.I0(a[0]),
        .I1(a[2]),
        .I2(a[3]),
        .I3(a[4]),
        .I4(a[5]),
        .O(n_0_g3_b2));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g3_b3
       (.I0(a[0]),
        .I1(a[2]),
        .O(n_0_g3_b3));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g3_b4
       (.I0(a[1]),
        .I1(a[3]),
        .O(n_0_g3_b4));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g3_b5
       (.I0(a[2]),
        .I1(a[4]),
        .O(n_0_g3_b5));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT2 #(
    .INIT(4'h6)) 
     g3_b6
       (.I0(a[3]),
        .I1(a[5]),
        .O(n_0_g3_b6));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[0]_INST_0 
       (.I0(n_0_g3_b0),
        .I1(n_0_g2_b0),
        .I2(a[7]),
        .I3(n_0_g1_b0),
        .I4(a[6]),
        .I5(n_0_g0_b0),
        .O(spo[0]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[11]_INST_0 
       (.I0(n_0_g3_b11),
        .I1(n_0_g2_b11),
        .I2(a[7]),
        .I3(n_0_g1_b11),
        .I4(a[6]),
        .I5(n_0_g0_b11),
        .O(spo[6]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[2]_INST_0 
       (.I0(n_0_g3_b2),
        .I1(n_0_g2_b2),
        .I2(a[7]),
        .I3(n_0_g1_b2),
        .I4(a[6]),
        .I5(n_0_g0_b2),
        .O(spo[1]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[3]_INST_0 
       (.I0(n_0_g3_b3),
        .I1(n_0_g2_b3),
        .I2(a[7]),
        .I3(n_0_g1_b3),
        .I4(a[6]),
        .I5(n_0_g0_b3),
        .O(spo[2]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[4]_INST_0 
       (.I0(n_0_g3_b4),
        .I1(n_0_g2_b4),
        .I2(a[7]),
        .I3(n_0_g1_b4),
        .I4(a[6]),
        .I5(n_0_g0_b4),
        .O(spo[3]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[5]_INST_0 
       (.I0(n_0_g3_b5),
        .I1(n_0_g2_b5),
        .I2(a[7]),
        .I3(n_0_g1_b5),
        .I4(a[6]),
        .I5(n_0_g0_b5),
        .O(spo[4]));
LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
     \spo[6]_INST_0 
       (.I0(n_0_g3_b6),
        .I1(n_0_g2_b6),
        .I2(a[7]),
        .I3(n_0_g1_b6),
        .I4(a[6]),
        .I5(n_0_g0_b6),
        .O(spo[5]));
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
