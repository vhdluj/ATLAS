--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.68d
--  \   \         Application: netgen
--  /   /         Filename: gig_eth_pcs_pma_v11_5.vhd
-- /___/   /\     Timestamp: Tue Feb 18 13:35:15 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -w -sim -ofmt vhdl C:/Users/Grzegorz/SkyDrive/Atlas/IPbus_svn/ControlFPGA/IPbus/ipcores/tmp/_cg/gig_eth_pcs_pma_v11_5.ngc C:/Users/Grzegorz/SkyDrive/Atlas/IPbus_svn/ControlFPGA/IPbus/ipcores/tmp/_cg/gig_eth_pcs_pma_v11_5.vhd 
-- Device	: 7k325tffg900-2
-- Input file	: C:/Users/Grzegorz/SkyDrive/Atlas/IPbus_svn/ControlFPGA/IPbus/ipcores/tmp/_cg/gig_eth_pcs_pma_v11_5.ngc
-- Output file	: C:/Users/Grzegorz/SkyDrive/Atlas/IPbus_svn/ControlFPGA/IPbus/ipcores/tmp/_cg/gig_eth_pcs_pma_v11_5.vhd
-- # of Entities	: 1
-- Design Name	: gig_eth_pcs_pma_v11_5
-- Xilinx	: C:\Xilinx\14.6\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity gig_eth_pcs_pma_v11_5 is
  port (
    reset : in STD_LOGIC := 'X'; 
    signal_detect : in STD_LOGIC := 'X'; 
    userclk : in STD_LOGIC := 'X'; 
    userclk2 : in STD_LOGIC := 'X'; 
    dcm_locked : in STD_LOGIC := 'X'; 
    txbuferr : in STD_LOGIC := 'X'; 
    gmii_tx_en : in STD_LOGIC := 'X'; 
    gmii_tx_er : in STD_LOGIC := 'X'; 
    an_restart_config : in STD_LOGIC := 'X'; 
    mgt_rx_reset : out STD_LOGIC; 
    mgt_tx_reset : out STD_LOGIC; 
    powerdown : out STD_LOGIC; 
    txchardispmode : out STD_LOGIC; 
    txchardispval : out STD_LOGIC; 
    txcharisk : out STD_LOGIC; 
    enablealign : out STD_LOGIC; 
    gmii_rx_dv : out STD_LOGIC; 
    gmii_rx_er : out STD_LOGIC; 
    gmii_isolate : out STD_LOGIC; 
    an_interrupt : out STD_LOGIC; 
    link_timer_value : in STD_LOGIC_VECTOR ( 8 downto 0 ); 
    rxbufstatus : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
    rxchariscomma : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxcharisk : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxclkcorcnt : in STD_LOGIC_VECTOR ( 2 downto 0 ); 
    rxdata : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    rxdisperr : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxnotintable : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxrundisp : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    gmii_txd : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    an_adv_config_vector : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    configuration_vector : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    txdata : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    gmii_rxd : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    status_vector : out STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end gig_eth_pcs_pma_v11_5;

architecture STRUCTURE of gig_eth_pcs_pma_v11_5 is
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT : STD_LOGIC; 
  signal U0_gpcs_pma_inst_STATUS_VECTOR_12_64 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_16 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_REG_69 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_REG_70 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RUDI_INVALID_71 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RUDI_I_72 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RUDI_C_73 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_STATUS_VECTOR_1_74 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_STATUS_VECTOR_0_75 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPMODE_79 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPVAL_80 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARISK_81 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_ER_84 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_88 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_89 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_90 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_91 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_95 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_96 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_97 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_98 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SRESET_PIPE_PWR_15_o_MUX_1_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_199_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_198_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPVAL_INT_GND_15_o_MUX_368_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPMODE_INT_TXEVEN_MUX_367_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARISK_INT_TXEVEN_MUX_366_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESTART_AN_SET_117 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_3_GND_15_o_Mux_12_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_3_GND_15_o_Mux_8_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXBUFERR_INT_120 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_INT_125 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_INT_126 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISK_INT_135 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISCOMMA_INT_136 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESTART_AN_EN_REG_137 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESTART_AN_EN_138 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SRESET_139 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SRESET_PIPE_140 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RUDI_INVALID : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_143 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_SRL : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_SRL : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_PIPE_164 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_165 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SIGNAL_DETECT_REG : STD_LOGIC; 
  signal U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_171 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE_172 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_173 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_0_GND_15_o_MUX_356_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_0_GND_15_o_MUX_357_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_17_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_17_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_17_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISK_0_TXCHARISK_INT_MUX_359_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_360_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXBUFSTATUS_1_GND_15_o_mux_16_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_XMIT_CONFIG : STD_LOGIC; 
  signal U0_gpcs_pma_inst_XMIT_DATA : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_13_201 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_14_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ACKNOWLEDGE_MATCH_3_GND_22_o_MUX_42_o11_205 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER121 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_208 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_4_Q_230 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_3_Q_231 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_3_Q_232 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_2_Q_233 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_2_Q_234 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_1_Q_235 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_1_Q_236 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_0_Q_237 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_0_Q_238 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_4_Q_239 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_3_Q_240 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_3_Q_241 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_2_Q_242 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_2_Q_243 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_1_Q_244 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_1_Q_245 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_0_Q_246 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_0_Q_247 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_8_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_7_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_6_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_5_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_4_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_3_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_2_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_1_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_0_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER8 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER7 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER6 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER5 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER4 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER3 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_LINK_TIMER_SATURATED_OR_38_o_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0578_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0581_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_MR_AN_ENABLE_REG2_XOR_49_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_GND_22_o_MUX_42_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_GND_22_o_MUX_34_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0571_322 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_MR_AN_ENABLE_OR_69_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_PWR_18_o_OR_65_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_327 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_67_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_70_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_PHY_MODE_RX_CONFIG_REG_15_AND_49_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED_1_PWR_18_o_mux_90_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED_1_PWR_18_o_mux_90_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_SYNC_STATUS_OR_86_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG2_AND_17_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG4_AND_15_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG2_339 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_340 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_341 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_352 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_353 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_354 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_355 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_356 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_357 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_367 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_368 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_2_369 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_370 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_2_371 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_372 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_373 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_22_o_Mux_70_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PWR_18_o_STATE_3_equal_58_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_STATE_3_equal_54_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG4_380 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_381 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2_382 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG1_383 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG2_384 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG1_385 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_386 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_387 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_REG_388 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_389 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG2_390 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG1_391 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_392 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG2_399 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_MSB_REG_402 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2_405 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG1_406 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_407 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT511 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_24_o_Mux_5_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_98_o_0 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISP5 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_100_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_77_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_CODE_GRP_CNT_1_MUX_266_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_GND_24_o_MUX_272_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISP3_K28p5_OR_110_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_111_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_PWR_19_o_MUX_259_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_473 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_V_474 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_R_475 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_478 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_479 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_481 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_K28p5_482 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_484 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_T_485 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S_486 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_S_487 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_493 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_502 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_503 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_14_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_519 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In3 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_21_o_equal_19_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_26_o_mux_30_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_26_o_mux_30_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD_GND_26_o_AND_121_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG_531 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_194_o2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_180_o1_533 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p51_534 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG2_535 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_185_o_norst : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_197_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_196_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_142_o_539 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_147_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D0p0_541 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_166_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_REG1_SYNC_STATUS_OR_170_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_148_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_236_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_LINK_OK_AND_200_o_556 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_LINK_OK_WAIT_FOR_K_AND_205_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_LINK_OK_K28p5_REG2_AND_207_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_213_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_11_RXDATA_3_MUX_296_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_3_RXDATA_3_MUX_288_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_12_RXDATA_4_MUX_295_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_4_RXDATA_4_MUX_287_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_13_RXDATA_5_MUX_294_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_5_RXDATA_5_MUX_286_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_14_RXDATA_6_MUX_293_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_6_RXDATA_6_MUX_285_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_15_RXDATA_7_MUX_292_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_7_RXDATA_7_MUX_284_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_8_RXDATA_0_MUX_299_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_0_RXDATA_0_MUX_291_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_9_RXDATA_1_MUX_298_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_1_RXDATA_1_MUX_290_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_10_RXDATA_2_MUX_297_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_2_RXDATA_2_MUX_289_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_251_o_576 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_194_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_LINK_OK : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_184_o_579 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_196_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_280_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K23p7 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_180_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K29p7 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_119_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_588 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RECEIVE_589 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_INVALID_590 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_591 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_592 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_600 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_K_601 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_602 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2_603 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1_604 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_605 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR_606 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2_607 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1_608 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_609 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_610 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_REG1_611 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_612 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SOP_613 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX_614 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FROM_RX_K_615 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FROM_IDLE_D_616 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG_618 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_619 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_CGBAD_620 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_R_621 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_630 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SOP_REG2_633 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_CGBAD_REG2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG3_638 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG1_639 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_R_REG1_640 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_REG2_641 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_REG1_642 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D0p0_REG_643 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG2_644 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_646 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_647 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_648 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_S_649 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER21 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB9 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB91_654 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB92_655 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In2_656 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In21_657 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In21_658 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o1_660 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o2_661 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_89_o1_665 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_89_o2_666 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In31_669 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In21_670 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_121_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_121_o1_676 : STD_LOGIC; 
  signal N28 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o1_679 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o2_680 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o3_681 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o4_682 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o12_684 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o13_685 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_147_o1_686 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_162_o2_687 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_8_glue_rst_688 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_7_glue_rst_689 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_6_glue_rst_690 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_5_glue_rst_691 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_4_glue_rst_692 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_3_glue_rst_693 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_2_glue_rst_694 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_1_glue_rst_695 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_0_glue_rst_696 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_glue_set_697 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_glue_set_698 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT_glue_set_699 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_glue_set_700 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_glue_set_701 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_glue_rst_702 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_glue_set_703 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_glue_set_704 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_glue_set_705 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_glue_set_706 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_707 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set_708 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_R_glue_set_709 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst_710 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_glue_set_711 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set_712 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set_713 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set_714 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set_715 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_716 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set_717 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set_718 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_rt_719 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_rt_720 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_rt_721 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_rt_722 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_rt_723 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_rt_724 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_rt_725 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_rt_726 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_rt_727 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_rt_728 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_rt_729 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_rt_730 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_rt_731 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_rt_732 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_rt_733 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_rt_734 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_rt_735 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_11_rt_736 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_8_rt_737 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_rstpot_738 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot_739 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot_740 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot_741 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESTART_AN_EN_rstpot_742 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_rstpot_743 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_rstpot_744 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_rstpot_745 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_747 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_rstpot_748 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_K28p5_rstpot_749 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot_750 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot_751 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_S_rstpot_752 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot_753 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_rstpot_754 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_755 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot_756 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_757 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758 : STD_LOGIC; 
  signal N34 : STD_LOGIC; 
  signal N35 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_dpot1_762 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_dpot1_763 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_dpot1_764 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_dpot1_765 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_dpot1_766 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_dpot1_767 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_dpot1_768 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_dpot1_769 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_dpot1_770 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_dpot1_771 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_dpot1_772 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_dpot1_773 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_dpot1_774 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_dpot1_775 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_dpot1_776 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot_lut_777 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ABILITY_MATCH_2_GND_22_o_MUX_34_o11_lut_778 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal N58 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_rstpot_786 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_rstpot_787 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_788 : STD_LOGIC; 
  signal N60 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal N62 : STD_LOGIC; 
  signal N63 : STD_LOGIC; 
  signal N64 : STD_LOGIC; 
  signal N65 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_797 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12_798 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1_799 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_800 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_801 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_802 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_803 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_804 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_805 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_806 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_807 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_808 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_809 : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_CGBAD_REG2_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_FALSE_CARRIER_REG2_Q15_UNCONNECTED : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RXD : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_BASEX_REMOTE_FAULT : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG : STD_LOGIC_VECTOR ( 3 downto 2 ); 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_INT : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal U0_gpcs_pma_inst_RXBUFSTATUS_INT : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U0_gpcs_pma_inst_RXDATA_INT : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXDATA : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal NlwRenamedSig_OI_status_vector : STD_LOGIC_VECTOR ( 8 downto 8 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096 : STD_LOGIC_VECTOR ( 11 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result : STD_LOGIC_VECTOR ( 11 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0616 : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_Result : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_IDLE_REG : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  txdata(7) <= U0_gpcs_pma_inst_TXDATA(7);
  txdata(6) <= U0_gpcs_pma_inst_TXDATA(6);
  txdata(5) <= U0_gpcs_pma_inst_TXDATA(5);
  txdata(4) <= U0_gpcs_pma_inst_TXDATA(4);
  txdata(3) <= U0_gpcs_pma_inst_TXDATA(3);
  txdata(2) <= U0_gpcs_pma_inst_TXDATA(2);
  txdata(1) <= U0_gpcs_pma_inst_TXDATA(1);
  txdata(0) <= U0_gpcs_pma_inst_TXDATA(0);
  gmii_rxd(7) <= U0_gpcs_pma_inst_RECEIVER_RXD(7);
  gmii_rxd(6) <= U0_gpcs_pma_inst_RECEIVER_RXD(6);
  gmii_rxd(5) <= U0_gpcs_pma_inst_RECEIVER_RXD(5);
  gmii_rxd(4) <= U0_gpcs_pma_inst_RECEIVER_RXD(4);
  gmii_rxd(3) <= U0_gpcs_pma_inst_RECEIVER_RXD(3);
  gmii_rxd(2) <= U0_gpcs_pma_inst_RECEIVER_RXD(2);
  gmii_rxd(1) <= U0_gpcs_pma_inst_RECEIVER_RXD(1);
  gmii_rxd(0) <= U0_gpcs_pma_inst_RECEIVER_RXD(0);
  status_vector(15) <= NlwRenamedSig_OI_status_vector(8);
  status_vector(14) <= NlwRenamedSig_OI_status_vector(8);
  status_vector(13) <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT;
  status_vector(12) <= U0_gpcs_pma_inst_STATUS_VECTOR_12_64;
  status_vector(11) <= U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED(1);
  status_vector(10) <= U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED(0);
  status_vector(9) <= U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_BASEX_REMOTE_FAULT(1);
  status_vector(8) <= NlwRenamedSig_OI_status_vector(8);
  status_vector(7) <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_16;
  status_vector(6) <= U0_gpcs_pma_inst_RXNOTINTABLE_REG_69;
  status_vector(5) <= U0_gpcs_pma_inst_RXDISPERR_REG_70;
  status_vector(4) <= U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RUDI_INVALID_71;
  status_vector(3) <= U0_gpcs_pma_inst_RECEIVER_RUDI_I_72;
  status_vector(2) <= U0_gpcs_pma_inst_RECEIVER_RUDI_C_73;
  status_vector(1) <= U0_gpcs_pma_inst_STATUS_VECTOR_1_74;
  status_vector(0) <= U0_gpcs_pma_inst_STATUS_VECTOR_0_75;
  mgt_rx_reset <= NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT;
  mgt_tx_reset <= NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT;
  powerdown <= NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(2);
  txchardispmode <= U0_gpcs_pma_inst_TXCHARDISPMODE_79;
  txchardispval <= U0_gpcs_pma_inst_TXCHARDISPVAL_80;
  txcharisk <= U0_gpcs_pma_inst_TXCHARISK_81;
  enablealign <= NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN;
  gmii_rx_dv <= NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV;
  gmii_rx_er <= U0_gpcs_pma_inst_RECEIVER_RX_ER_84;
  gmii_isolate <= NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3);
  an_interrupt <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE;
  XST_VCC : VCC
    port map (
      P => N0
    );
  XST_GND : GND
    port map (
      G => NlwRenamedSig_OI_status_vector(8)
    );
  U0_gpcs_pma_inst_DELAY_RXNOTINTABLE : SRL16
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(8),
      A1 => NlwRenamedSig_OI_status_vector(8),
      A2 => N0,
      A3 => NlwRenamedSig_OI_status_vector(8),
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXNOTINTABLE_INT_125,
      Q => U0_gpcs_pma_inst_RXNOTINTABLE_SRL
    );
  U0_gpcs_pma_inst_DELAY_RXDISPERR : SRL16
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(8),
      A1 => NlwRenamedSig_OI_status_vector(8),
      A2 => N0,
      A3 => NlwRenamedSig_OI_status_vector(8),
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDISPERR_INT_126,
      Q => U0_gpcs_pma_inst_RXDISPERR_SRL
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In,
      R => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_199_o,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_89
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In,
      R => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_199_o,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_90
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In,
      R => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_199_o,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_88
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In,
      R => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_198_o,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_95
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In,
      R => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_198_o,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_96
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In,
      R => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_198_o,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_97
    );
  U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => signal_detect,
      Q => U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync1
    );
  U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync_reg : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync1,
      Q => U0_gpcs_pma_inst_SIGNAL_DETECT_REG
    );
  U0_gpcs_pma_inst_RXDISPERR_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDISPERR_SRL,
      Q => U0_gpcs_pma_inst_RXDISPERR_REG_70
    );
  U0_gpcs_pma_inst_RXNOTINTABLE_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXNOTINTABLE_SRL,
      Q => U0_gpcs_pma_inst_RXNOTINTABLE_REG_69
    );
  U0_gpcs_pma_inst_TXCHARDISPVAL : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXCHARDISPVAL_INT_GND_15_o_MUX_368_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXCHARDISPVAL_80
    );
  U0_gpcs_pma_inst_TXCHARISK : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXCHARISK_INT_TXEVEN_MUX_366_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXCHARISK_81
    );
  U0_gpcs_pma_inst_TXDATA_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(7)
    );
  U0_gpcs_pma_inst_TXDATA_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(6)
    );
  U0_gpcs_pma_inst_TXDATA_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(5)
    );
  U0_gpcs_pma_inst_TXDATA_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(4)
    );
  U0_gpcs_pma_inst_TXDATA_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(3)
    );
  U0_gpcs_pma_inst_TXDATA_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(2)
    );
  U0_gpcs_pma_inst_TXDATA_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(1)
    );
  U0_gpcs_pma_inst_TXDATA_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(0)
    );
  U0_gpcs_pma_inst_TXCHARDISPMODE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXCHARDISPMODE_INT_TXEVEN_MUX_367_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXCHARDISPMODE_79
    );
  U0_gpcs_pma_inst_RXDATA_INT_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(7)
    );
  U0_gpcs_pma_inst_RXDATA_INT_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(6)
    );
  U0_gpcs_pma_inst_RXDATA_INT_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(5)
    );
  U0_gpcs_pma_inst_RXDATA_INT_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(4)
    );
  U0_gpcs_pma_inst_RXDATA_INT_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(3)
    );
  U0_gpcs_pma_inst_RXDATA_INT_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(2)
    );
  U0_gpcs_pma_inst_RXDATA_INT_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(1)
    );
  U0_gpcs_pma_inst_RXDATA_INT_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(0)
    );
  U0_gpcs_pma_inst_RXCHARISK_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCHARISK_0_TXCHARISK_INT_MUX_359_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCHARISK_INT_135
    );
  U0_gpcs_pma_inst_RXCHARISCOMMA_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_360_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_136
    );
  U0_gpcs_pma_inst_RXBUFSTATUS_INT_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXBUFSTATUS_1_GND_15_o_mux_16_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1)
    );
  U0_gpcs_pma_inst_RXCLKCORCNT_INT_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_17_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2)
    );
  U0_gpcs_pma_inst_RXCLKCORCNT_INT_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_17_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1)
    );
  U0_gpcs_pma_inst_RXCLKCORCNT_INT_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_17_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0)
    );
  U0_gpcs_pma_inst_RXDISPERR_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDISPERR_0_GND_15_o_MUX_357_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDISPERR_INT_126
    );
  U0_gpcs_pma_inst_RXNOTINTABLE_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXNOTINTABLE_0_GND_15_o_MUX_356_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXNOTINTABLE_INT_125
    );
  U0_gpcs_pma_inst_RESTART_AN_EN_REG : FDR
    port map (
      C => userclk2,
      D => an_restart_config,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_RESTART_AN_EN_REG_137
    );
  U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4 : FDR
    port map (
      C => userclk2,
      D => configuration_vector(4),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q
    );
  U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_3 : FDR
    port map (
      C => userclk2,
      D => configuration_vector(3),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3)
    );
  U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_2 : FDR
    port map (
      C => userclk2,
      D => configuration_vector(2),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(2)
    );
  U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1 : FDR
    port map (
      C => userclk2,
      D => configuration_vector(1),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q
    );
  U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_0 : FDR
    port map (
      C => userclk2,
      D => configuration_vector(0),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_0_Q
    );
  U0_gpcs_pma_inst_SRESET : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SRESET_PIPE_PWR_15_o_MUX_1_o,
      Q => U0_gpcs_pma_inst_SRESET_139
    );
  U0_gpcs_pma_inst_TXBUFERR_INT : FDR
    port map (
      C => userclk2,
      D => txbuferr,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXBUFERR_INT_120
    );
  U0_gpcs_pma_inst_SRESET_PIPE : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RESET_INT_165,
      Q => U0_gpcs_pma_inst_SRESET_PIPE_140
    );
  U0_gpcs_pma_inst_MGT_RX_RESET_INT : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_3_GND_15_o_Mux_12_o,
      S => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_199_o,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT
    );
  U0_gpcs_pma_inst_MGT_TX_RESET_INT : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_3_GND_15_o_Mux_8_o,
      S => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_198_o,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT
    );
  U0_gpcs_pma_inst_RESET_INT : FDP
    port map (
      C => userclk,
      D => U0_gpcs_pma_inst_RESET_INT_PIPE_164,
      PRE => U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o,
      Q => U0_gpcs_pma_inst_RESET_INT_165
    );
  U0_gpcs_pma_inst_RESET_INT_PIPE : FDP
    port map (
      C => userclk,
      D => NlwRenamedSig_OI_status_vector(8),
      PRE => U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o,
      Q => U0_gpcs_pma_inst_RESET_INT_PIPE_164
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_11_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(10),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_11_rt_736,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(11)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_10_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(9),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_rt_719,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(10)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(9),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_rt_719,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(10)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_9_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(8),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_rt_720,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(9)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(8),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_rt_720,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(9)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_8_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(7),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_rt_721,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(7),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_rt_721,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_7_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(6),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_rt_722,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(6),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_rt_722,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_6_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(5),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_rt_723,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(5),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_rt_723,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_5_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(4),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_rt_724,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(4),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_rt_724,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_4_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(3),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_rt_725,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(3),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_rt_725,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_3_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(2),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_rt_726,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(2),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_rt_726,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_2_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(1),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_rt_727,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(1),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_rt_727,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_1_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(0),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_rt_728,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(0),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_rt_728,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_0_Q : XORCY
    port map (
      CI => NlwRenamedSig_OI_status_vector(8),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_0_Q : MUXCY
    port map (
      CI => NlwRenamedSig_OI_status_vector(8),
      DI => N0,
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_8_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(7),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_8_rt_737,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_8_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_7_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(6),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_rt_729,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_7_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(6),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_rt_729,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_6_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(5),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_rt_730,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_6_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(5),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_rt_730,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_5_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(4),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_rt_731,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_5_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(4),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_rt_731,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_4_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(3),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_rt_732,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_4_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(3),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_rt_732,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_3_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(2),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_rt_733,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_3_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(2),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_rt_733,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_2_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(1),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_rt_734,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_2_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(1),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_rt_734,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_1_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(0),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_rt_735,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_1_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(0),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_rt_735,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_0_Q : XORCY
    port map (
      CI => NlwRenamedSig_OI_status_vector(8),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_0_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_0_Q : MUXCY
    port map (
      CI => NlwRenamedSig_OI_status_vector(8),
      DI => N0,
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_4_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_3_Q_231,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_4_Q_230,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_4_Q : LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_Q,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_4_Q_230
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_3_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_2_Q_233,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_3_Q_232,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_3_Q_231
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_3_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_Q,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_Q,
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_3_Q_232
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_2_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_1_Q_235,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_2_Q_234,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_2_Q_233
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_2_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_Q,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_Q,
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_2_Q_234
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_1_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_0_Q_237,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_1_Q_236,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_1_Q_235
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_1_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_Q,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_Q,
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_1_Q_236
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_0_Q_238,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_0_Q_237
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_0_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_Q,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_Q,
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_0_Q_238
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_4_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_3_Q_240,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_4_Q_239,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_4_Q : LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(12),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(13),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_4_Q_239
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_3_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_2_Q_242,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_3_Q_241,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_3_Q_240
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_3_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(9),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(10),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(11),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_3_Q_241
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_2_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_1_Q_244,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_2_Q_243,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_2_Q_242
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_2_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(6),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(7),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(8),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_2_Q_243
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_1_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_0_Q_246,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_1_Q_245,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_1_Q_244
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_1_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(3),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(4),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(5),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_1_Q_245
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_0_Q_247,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_0_Q_246
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_0_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(0),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(1),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(2),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_0_Q_247
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_8 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER8,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_7 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER7,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_6 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER6,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_5 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER5,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_4 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER4,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_3 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER3,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER2,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER1,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_11 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(11),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(11)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_10 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(10),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(10)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_9 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(9),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(9)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_8 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(8),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(7),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(6),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(5),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(4),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(3),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(2),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(1),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(0),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_8_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(7),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER8
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_7_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(6),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER7
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_7_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(6),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_6_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(5),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER6
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_6_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(5),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_5_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(4),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER5
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_5_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(4),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_4_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(3),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(4),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER4
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_4_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(3),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(4),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_3_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(2),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER3
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_3_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(2),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_2_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(1),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER2
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_2_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(1),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_1_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(0),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_1_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(0),
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_0_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_LINK_TIMER_SATURATED_OR_38_o_inv,
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_0_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_LINK_TIMER_SATURATED_OR_38_o_inv,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG2_399
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_14 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_22_o_Mux_70_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER121,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_14_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_22_o_Mux_70_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0616(1),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_0_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PWR_18_o_STATE_3_equal_58_o,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(2),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(1),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(0),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0581_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_208,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_372
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2_405,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG2_AND_17_o,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_368
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2_405,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG4_AND_15_o,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_2_369
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG1_383,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2_382
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG1_385,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG2_384
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_MR_AN_ENABLE_REG2_XOR_49_o,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_392
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0581_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ACKNOWLEDGE_MATCH_3_GND_22_o_MUX_42_o11_205,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_2_371
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0581_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_GND_22_o_MUX_42_o,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_370
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED_1 : FDE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0578_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED_1_PWR_18_o_mux_90_OUT_1_Q,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED_0 : FDE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0578_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED_1_PWR_18_o_mux_90_OUT_0_Q,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0581_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_GND_22_o_MUX_34_o,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_373
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_381,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG4_380
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_386,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG1_383
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_387,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG1_385
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG1_391,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG2_390
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RUDI_INVALID : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY(1),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RUDI_INVALID_71
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_MSB_REG : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(11),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_MSB_REG_402
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG1_406,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2_405
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_340
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_340,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG2_339
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_BASEX_REMOTE_FAULT_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0571_322,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_PHY_MODE_RX_CONFIG_REG_15_AND_49_o,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_BASEX_REMOTE_FAULT(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_16 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0571_322,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_16
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_13 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0571_322,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_13_201
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_70_o,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_386
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_67_o,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_387
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_REG : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RUDI_INVALID,
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_SYNC_STATUS_OR_86_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_REG_388
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_PWR_18_o_OR_65_o,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_327
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RESTART_AN_SET_117,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG1_391
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY(0),
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o1,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG1_406
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_dpot1_776,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_dpot1_775,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_dpot1_774,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_dpot1_773,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_dpot1_772,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_dpot1_771,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_dpot1_770,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_dpot1_769,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_dpot1_768,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_dpot1_767,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_dpot1_766,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_dpot1_765,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_dpot1_764,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_dpot1_763,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_dpot1_762,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_15 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(15)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_14 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(14)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(13)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_12 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(12)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_11 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(11)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_10 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(10)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_9 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(9)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_8 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_7 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_6 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_5 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_4 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_3 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_Result(1),
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_0 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_Result(0),
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(7)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(6)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(5)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(4)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_GND_24_o_MUX_272_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_173
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_7_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(7)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_6 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_6_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(6)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_5 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_5_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(5)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_4_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(4)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_3_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_2_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_1_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_0 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_0_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_CODE_GRP_CNT_1_MUX_266_o,
      Q => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_493
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_7_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_6_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_24_o_Mux_5_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_3_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_1_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_0_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT : FDSE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_24_o_Mux_5_o,
      D => U0_gpcs_pma_inst_XMIT_CONFIG,
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_111_o,
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE_172
    );
  U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_24_o_Mux_5_o,
      D => U0_gpcs_pma_inst_XMIT_DATA,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_478
    );
  U0_gpcs_pma_inst_TRANSMITTER_T : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_100_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_T_485
    );
  U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_77_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S_486
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1 : FD
    port map (
      C => userclk2,
      D => gmii_tx_er,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_502
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1 : FD
    port map (
      C => userclk2,
      D => gmii_tx_en,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_503
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_14 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_24_o_Mux_5_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_14_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_14_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_24_o_Mux_5_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_0_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_7 : FD
    port map (
      C => userclk2,
      D => gmii_txd(7),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(7)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_6 : FD
    port map (
      C => userclk2,
      D => gmii_txd(6),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(6)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_5 : FD
    port map (
      C => userclk2,
      D => gmii_txd(5),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(5)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_4 : FD
    port map (
      C => userclk2,
      D => gmii_txd(4),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(4)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_3 : FD
    port map (
      C => userclk2,
      D => gmii_txd(3),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_2 : FD
    port map (
      C => userclk2,
      D => gmii_txd(2),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_1 : FD
    port map (
      C => userclk2,
      D => gmii_txd(1),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_0 : FD
    port map (
      C => userclk2,
      D => gmii_txd(0),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(0)
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In2,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In2,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_519,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In3,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_26_o_mux_30_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1)
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_26_o_mux_30_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0)
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG_531
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(7)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(6)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(5)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(4)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(3)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(2)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(1)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(0)
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_REG2_535,
      Q => U0_gpcs_pma_inst_RECEIVER_C_REG3_638
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG2,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617
    );
  U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG2,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_619
    );
  U0_gpcs_pma_inst_RECEIVER_SOP_REG3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_SOP_REG2_633,
      Q => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      Q => U0_gpcs_pma_inst_RECEIVER_C_REG2_535
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(1),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(2)
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(0),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(1)
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(0)
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1_604,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2_603
    );
  U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1_608,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2_607
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_646,
      Q => U0_gpcs_pma_inst_RECEIVER_C_REG1_639
    );
  U0_gpcs_pma_inst_RECEIVER_T_REG2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_T_REG1_642,
      Q => U0_gpcs_pma_inst_RECEIVER_T_REG2_641
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(2),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(3)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(1),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(2)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(0),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(1)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(0)
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_605,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1_604
    );
  U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_609,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1_608
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_588,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_15 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_15_RXDATA_7_MUX_292_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_14 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_14_RXDATA_6_MUX_293_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_13 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_13_RXDATA_5_MUX_294_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_12 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_12_RXDATA_4_MUX_295_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_11 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_11_RXDATA_3_MUX_296_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_10 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_10_RXDATA_2_MUX_297_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_9 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_9_RXDATA_1_MUX_298_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_8 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_8_RXDATA_0_MUX_299_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_7 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_7_RXDATA_7_MUX_284_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_6 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_6_RXDATA_6_MUX_285_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_5 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_5_RXDATA_5_MUX_286_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_4_RXDATA_4_MUX_287_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_3_RXDATA_3_MUX_288_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_2_RXDATA_2_MUX_289_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_1_RXDATA_1_MUX_290_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_0 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_0_RXDATA_0_MUX_291_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0)
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_647,
      Q => U0_gpcs_pma_inst_RECEIVER_I_REG_143
    );
  U0_gpcs_pma_inst_RECEIVER_R_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_R_621,
      Q => U0_gpcs_pma_inst_RECEIVER_R_REG1_640
    );
  U0_gpcs_pma_inst_RECEIVER_T_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_T_648,
      Q => U0_gpcs_pma_inst_RECEIVER_T_REG1_642
    );
  U0_gpcs_pma_inst_RECEIVER_K28p5_REG2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      Q => U0_gpcs_pma_inst_RECEIVER_K28p5_REG2_644
    );
  U0_gpcs_pma_inst_RECEIVER_RUDI_I : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_197_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RUDI_I_72
    );
  U0_gpcs_pma_inst_RECEIVER_RUDI_C : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_196_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RUDI_C_73
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_280_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_K_601
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_602
    );
  U0_gpcs_pma_inst_RECEIVER_RX_ER : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_251_o_576,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_ER_84
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_166_o,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR_606
    );
  U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_236_o,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_609
    );
  U0_gpcs_pma_inst_RECEIVER_EOP : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_147_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_EOP_612
    );
  U0_gpcs_pma_inst_RECEIVER_SOP : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_213_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_SOP_613
    );
  U0_gpcs_pma_inst_RECEIVER_EOP_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_148_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_EOP_REG1_611
    );
  U0_gpcs_pma_inst_RECEIVER_FROM_RX_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_LINK_OK_K28p5_REG2_AND_207_o,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FROM_RX_K_615
    );
  U0_gpcs_pma_inst_RECEIVER_FROM_IDLE_D : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_LINK_OK_WAIT_FOR_K_AND_205_o,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FROM_IDLE_D_616
    );
  U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_142_o_539,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX_614
    );
  U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG_618
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_194_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142
    );
  U0_gpcs_pma_inst_RECEIVER_R : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K23p7,
      Q => U0_gpcs_pma_inst_RECEIVER_R_621
    );
  U0_gpcs_pma_inst_RECEIVER_CGBAD : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_119_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_CGBAD_620
    );
  U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      Q => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637
    );
  U0_gpcs_pma_inst_RECEIVER_D0p0_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_D0p0_541,
      Q => U0_gpcs_pma_inst_RECEIVER_D0p0_REG_643
    );
  U0_gpcs_pma_inst_RECEIVER_K28p5_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K28p5,
      Q => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645
    );
  U0_gpcs_pma_inst_RECEIVER_I : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_184_o_579,
      Q => U0_gpcs_pma_inst_RECEIVER_I_647
    );
  U0_gpcs_pma_inst_RECEIVER_S : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_180_o,
      Q => U0_gpcs_pma_inst_RECEIVER_S_649
    );
  U0_gpcs_pma_inst_RECEIVER_T : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K29p7,
      Q => U0_gpcs_pma_inst_RECEIVER_T_648
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In1 : LUT4
    generic map(
      INIT => X"EA6A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_96,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_98,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_97,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_95,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In1 : LUT4
    generic map(
      INIT => X"EA6A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_89,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_91,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_90,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_88,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In1 : LUT4
    generic map(
      INIT => X"E666"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_90,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_91,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_88,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_89,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In1 : LUT4
    generic map(
      INIT => X"E666"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_97,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_98,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_95,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_96,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In
    );
  U0_gpcs_pma_inst_Mmux_TXCHARDISPVAL_INT_GND_15_o_MUX_368_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_171,
      O => U0_gpcs_pma_inst_TXCHARDISPVAL_INT_GND_15_o_MUX_368_o
    );
  U0_gpcs_pma_inst_Mmux_TXCHARDISPMODE_INT_TXEVEN_MUX_367_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE_172,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXCHARDISPMODE_INT_TXEVEN_MUX_367_o
    );
  U0_gpcs_pma_inst_Mmux_TXCHARISK_INT_TXEVEN_MUX_366_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_173,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXCHARISK_INT_TXEVEN_MUX_366_o
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_25_OUT11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_0_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_25_OUT21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(1),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_1_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_25_OUT31 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_2_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_25_OUT41 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(3),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_3_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_25_OUT51 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(4),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_4_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_25_OUT61 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(5),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_5_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_25_OUT71 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(6),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_6_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_25_OUT81 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(7),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_25_OUT_7_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_15_OUT11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxdata(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(0),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_0_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_15_OUT21 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxdata(1),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(1),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_1_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_15_OUT31 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxdata(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(2),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_2_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_15_OUT41 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxdata(3),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(3),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_3_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_15_OUT51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxdata(4),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(4),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_4_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_15_OUT61 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxdata(5),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(5),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_5_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_15_OUT71 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxdata(6),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(6),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_6_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_15_OUT81 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxdata(7),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(7),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_15_OUT_7_Q
    );
  U0_gpcs_pma_inst_Mmux_RXCHARISK_0_TXCHARISK_INT_MUX_359_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxcharisk(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_173,
      O => U0_gpcs_pma_inst_RXCHARISK_0_TXCHARISK_INT_MUX_359_o
    );
  U0_gpcs_pma_inst_Mmux_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_360_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxchariscomma(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_173,
      O => U0_gpcs_pma_inst_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_360_o
    );
  U0_gpcs_pma_inst_Mmux_SRESET_PIPE_PWR_15_o_MUX_1_o11 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_165,
      I1 => U0_gpcs_pma_inst_SRESET_PIPE_140,
      O => U0_gpcs_pma_inst_SRESET_PIPE_PWR_15_o_MUX_1_o
    );
  U0_gpcs_pma_inst_Mmux_RXDISPERR_0_GND_15_o_MUX_357_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxdisperr(0),
      O => U0_gpcs_pma_inst_RXDISPERR_0_GND_15_o_MUX_357_o
    );
  U0_gpcs_pma_inst_Mmux_RXNOTINTABLE_0_GND_15_o_MUX_356_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxnotintable(0),
      O => U0_gpcs_pma_inst_RXNOTINTABLE_0_GND_15_o_MUX_356_o
    );
  U0_gpcs_pma_inst_Mmux_RXCLKCORCNT_2_GND_15_o_mux_17_OUT11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxclkcorcnt(0),
      O => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_17_OUT_0_Q
    );
  U0_gpcs_pma_inst_Mmux_RXCLKCORCNT_2_GND_15_o_mux_17_OUT21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxclkcorcnt(1),
      O => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_17_OUT_1_Q
    );
  U0_gpcs_pma_inst_Mmux_RXCLKCORCNT_2_GND_15_o_mux_17_OUT31 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxclkcorcnt(2),
      O => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_17_OUT_2_Q
    );
  U0_gpcs_pma_inst_Mmux_RXBUFSTATUS_1_GND_15_o_mux_16_OUT21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I1 => rxbufstatus(1),
      O => U0_gpcs_pma_inst_RXBUFSTATUS_1_GND_15_o_mux_16_OUT_1_Q
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In1 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_91,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_90,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_89,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_88,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In
    );
  U0_gpcs_pma_inst_RX_RST_SM_RX_RST_SM_3_GND_15_o_Mux_12_o1 : LUT4
    generic map(
      INIT => X"DFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_90,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_91,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_88,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_89,
      O => U0_gpcs_pma_inst_RX_RST_SM_3_GND_15_o_Mux_12_o
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In1 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_98,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_97,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_96,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_95,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In
    );
  U0_gpcs_pma_inst_TX_RST_SM_TX_RST_SM_3_GND_15_o_Mux_8_o1 : LUT4
    generic map(
      INIT => X"DFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_97,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_98,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_95,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_96,
      O => U0_gpcs_pma_inst_TX_RST_SM_3_GND_15_o_Mux_8_o
    );
  U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_199_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_165,
      I1 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      O => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_199_o
    );
  U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_198_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_165,
      I1 => U0_gpcs_pma_inst_TXBUFERR_INT_120,
      O => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_198_o
    );
  U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => reset,
      I1 => dcm_locked,
      O => U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ACKNOWLEDGE_MATCH_3_GND_22_o_MUX_42_o111 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(14),
      I2 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ACKNOWLEDGE_MATCH_3_GND_22_o_MUX_42_o11_205
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0581_inv1 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342,
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0581_inv
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_MR_AN_ENABLE_OR_69_o1 : LUT4
    generic map(
      INIT => X"5557"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_MR_AN_ENABLE_OR_69_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER1211 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER121
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_STATE_2_1 : LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_STATE_1_1 : LUT3
    generic map(
      INIT => X"54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_STATE_0_1 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_22_o_Mux_70_o1 : LUT3
    generic map(
      INIT => X"51"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_22_o_Mux_70_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_PWR_18_o_OR_65_o1 : LUT3
    generic map(
      INIT => X"14"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_PWR_18_o_OR_65_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_n061681 : LUT4
    generic map(
      INIT => X"2202"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_0_Q,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0616(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG2_AND_17_o1 : LUT4
    generic map(
      INIT => X"4440"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2_382,
      I1 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_2_369,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG2_384,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG2_AND_17_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mxor_MR_AN_ENABLE_REG1_MR_AN_ENABLE_REG2_XOR_49_o_xo_0_1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_340,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG2_339,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_MR_AN_ENABLE_REG2_XOR_49_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_SGMII_SPEED_1_PWR_18_o_mux_90_OUT11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_139,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED_1_PWR_18_o_mux_90_OUT_0_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_SGMII_SPEED_1_PWR_18_o_mux_90_OUT21 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_139,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_SPEED_1_PWR_18_o_mux_90_OUT_1_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_GND_22_o_STATE_3_equal_54_o1 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_STATE_3_equal_54_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PWR_18_o_STATE_3_equal_58_o1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PWR_18_o_STATE_3_equal_58_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0607_inv
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0578_inv1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_139,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0571_322,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0578_inv
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_67_o_0_1 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I1 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_353,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_67_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_70_o_0_1 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I1 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_353,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_70_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_SYNC_STATUS_OR_86_o1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_139,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_SYNC_STATUS_OR_86_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG4_AND_15_o1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2_382,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG4_380,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG4_AND_15_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_139,
      I1 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_3_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT81 : LUT3
    generic map(
      INIT => X"15"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_479,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_7_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT5111 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_T_485,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_V_474,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_R_475,
      O => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT511
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_TX_PACKET_CODE_GRP_CNT_1_MUX_266_o11 : LUT4
    generic map(
      INIT => X"44E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_PWR_19_o_MUX_259_o,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_CODE_GRP_CNT_1_MUX_266_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISP3_K28p5_OR_110_o1 : LUT5
    generic map(
      INIT => X"BFFAEAAF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_K28p5_482,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(7),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(6),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(5),
      I4 => U0_gpcs_pma_inst_TRANSMITTER_DISP5,
      O => U0_gpcs_pma_inst_TRANSMITTER_DISP3_K28p5_OR_110_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISP51 : LUT5
    generic map(
      INIT => X"E881811F"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(3),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(4),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(1),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(2),
      I4 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_DISP5
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT41 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_24_o_Mux_5_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT51 : LUT4
    generic map(
      INIT => X"FE54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT511,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(4),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_7_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_4_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT61 : LUT4
    generic map(
      INIT => X"FE54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT511,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(5),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_7_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_5_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT81 : LUT4
    generic map(
      INIT => X"FE54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT511,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(7),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_7_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_7_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT11 : LUT4
    generic map(
      INIT => X"4602"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_479,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_0_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_0_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT21 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_479,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_1_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT71 : LUT4
    generic map(
      INIT => X"A280"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_14_Q,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_479,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_6_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_100_o1 : LUT6
    generic map(
      INIT => X"FFFF444044404440"
    )
    port map (
      I0 => gmii_tx_en,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_503,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_484,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_V_474,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_100_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_98_o11 : LUT6
    generic map(
      INIT => X"FFFFFFFF45455545"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S_486,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_503,
      I2 => gmii_tx_en,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_502,
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_98_o_0
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mcount_CODE_GRP_CNT_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_Result(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_TX_PACKET_PWR_19_o_MUX_259_o11 : LUT6
    generic map(
      INIT => X"FFFFFFFF00000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_V_474,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_T_485,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_475,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_PWR_19_o_MUX_259_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_77_o1 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => gmii_tx_en,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_502,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_503,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_77_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_111_o1 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_493,
      O => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_111_o
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_Mmux_GOOD_CGS_1_GND_26_o_mux_30_OUT21 : LUT6
    generic map(
      INIT => X"0000577757770000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1),
      O => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_26_o_mux_30_OUT_1_Q
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv1 : LUT5
    generic map(
      INIT => X"A888FFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_Mmux_GOOD_CGS_1_GND_26_o_mux_30_OUT11 : LUT5
    generic map(
      INIT => X"01115555"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_26_o_mux_30_OUT_0_Q
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In21 : LUT6
    generic map(
      INIT => X"F2A8F2AAAA28AA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_21_o_equal_19_o,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In2
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_01 : LUT3
    generic map(
      INIT => X"AB"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      I1 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_1_Q,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG_531,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_21_o_equal_19_o_1_1 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1),
      O => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_21_o_equal_19_o
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD_GND_26_o_AND_121_o1 : LUT5
    generic map(
      INIT => X"00000008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I3 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD_GND_26_o_AND_121_o
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD1 : LUT5
    generic map(
      INIT => X"FFFFFEFC"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_136,
      I1 => U0_gpcs_pma_inst_RXDISPERR_INT_126,
      I2 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_125,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161,
      I4 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      O => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_27_o_mux_9_OUT21 : LUT4
    generic map(
      INIT => X"5554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(1),
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_1_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_27_o_mux_9_OUT41 : LUT4
    generic map(
      INIT => X"5554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(3),
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_3_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_27_o_mux_9_OUT31 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(2),
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617,
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_2_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_27_o_mux_9_OUT61 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(5),
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      I2 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_5_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_27_o_mux_9_OUT81 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(7),
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      I2 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_7_Q
    );
  U0_gpcs_pma_inst_RECEIVER_K29p71 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I1 => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_180_o1_533,
      I2 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_K29p7
    );
  U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o1 : LUT6
    generic map(
      INIT => X"5555555500000040"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I1 => U0_gpcs_pma_inst_RECEIVER_C_REG2_535,
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I3 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I4 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      I5 => U0_gpcs_pma_inst_RECEIVER_C_646,
      O => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o
    );
  U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_180_o11 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I1 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(7),
      O => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_180_o1_533
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_27_o_mux_9_OUT11 : LUT4
    generic map(
      INIT => X"FF54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      I2 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(0),
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_0_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_27_o_mux_9_OUT51 : LUT5
    generic map(
      INIT => X"FFFF4540"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR_606,
      I2 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(4),
      I4 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_4_Q
    );
  U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_194_o21 : LUT4
    generic map(
      INIT => X"1110"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      O => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_194_o2
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_280_o1 : LUT4
    generic map(
      INIT => X"4100"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_125,
      I1 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p51_534,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_280_o
    );
  U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_213_o1 : LUT5
    generic map(
      INIT => X"08080800"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I1 => U0_gpcs_pma_inst_RECEIVER_S_649,
      I2 => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_592,
      I3 => U0_gpcs_pma_inst_RECEIVER_EXTEND_588,
      I4 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      O => U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_213_o
    );
  U0_gpcs_pma_inst_RECEIVER_LINK_OK_K28p5_REG2_AND_207_o1 : LUT4
    generic map(
      INIT => X"4440"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG2_644,
      I2 => U0_gpcs_pma_inst_RECEIVER_CGBAD_620,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      O => U0_gpcs_pma_inst_RECEIVER_LINK_OK_K28p5_REG2_AND_207_o
    );
  U0_gpcs_pma_inst_RECEIVER_K23p71 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_180_o1_533,
      I1 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_K23p7
    );
  U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_180_o1 : LUT5
    generic map(
      INIT => X"00200000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I3 => U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_119_o,
      I4 => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_180_o1_533,
      O => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_180_o
    );
  U0_gpcs_pma_inst_RECEIVER_K28p52 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p51_534,
      O => U0_gpcs_pma_inst_RECEIVER_K28p5
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_27_o_mux_9_OUT71 : LUT4
    generic map(
      INIT => X"FF10"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      I2 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(6),
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_27_o_mux_9_OUT_6_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_3_RXDATA_3_MUX_288_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_3_RXDATA_3_MUX_288_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_5_RXDATA_5_MUX_286_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(5),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_5_RXDATA_5_MUX_286_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_4_RXDATA_4_MUX_287_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(4),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_4_RXDATA_4_MUX_287_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_6_RXDATA_6_MUX_285_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(6),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_6_RXDATA_6_MUX_285_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_7_RXDATA_7_MUX_284_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(7),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_7_RXDATA_7_MUX_284_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_0_RXDATA_0_MUX_291_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(0),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_0_RXDATA_0_MUX_291_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_2_RXDATA_2_MUX_289_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_2_RXDATA_2_MUX_289_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_1_RXDATA_1_MUX_290_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_187_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_1_RXDATA_1_MUX_290_o
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_197_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(1),
      I1 => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(2),
      O => U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_197_o
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_196_o_0_1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(0),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(1),
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(2),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(3),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_196_o
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_166_o1 : LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_630,
      I1 => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_619,
      I2 => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2_603,
      O => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_166_o
    );
  U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_148_o1 : LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EXTEND_588,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      I2 => U0_gpcs_pma_inst_RECEIVER_EOP_612,
      O => U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_148_o
    );
  U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_236_o1 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I2 => U0_gpcs_pma_inst_RECEIVER_R_621,
      I3 => U0_gpcs_pma_inst_RECEIVER_T_648,
      O => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_236_o
    );
  U0_gpcs_pma_inst_RECEIVER_LINK_OK_WAIT_FOR_K_AND_205_o1 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I2 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I3 => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_592,
      O => U0_gpcs_pma_inst_RECEIVER_LINK_OK_WAIT_FOR_K_AND_205_o
    );
  U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_196_o1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161,
      O => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_196_o
    );
  U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_119_o1 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I1 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_125,
      I2 => U0_gpcs_pma_inst_RXDISPERR_INT_126,
      O => U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_119_o
    );
  U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      O => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_357,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_373,
      O => N2
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1 : LUT6
    generic map(
      INIT => X"0000002100000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(15),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342,
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I3 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I4 => N2,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_208
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0571_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(2),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(3),
      O => N4
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0571 : LUT6
    generic map(
      INIT => X"0000000080000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(1),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(0),
      I5 => N4,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0571_322
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB91 : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(7),
      I1 => link_timer_value(7),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(6),
      I3 => link_timer_value(6),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(5),
      I5 => link_timer_value(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB9
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB92 : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(2),
      I1 => link_timer_value(2),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(1),
      I3 => link_timer_value(1),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(8),
      I5 => link_timer_value(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB91_654
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB93 : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(0),
      I1 => link_timer_value(0),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(4),
      I3 => link_timer_value(4),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(3),
      I5 => link_timer_value(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB92_655
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB94 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB9,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB91_654,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB92_655,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In3 : LUT4
    generic map(
      INIT => X"22F0"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_355,
      I1 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In2_656,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In21 : LUT6
    generic map(
      INIT => X"FFFFDD000000F000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_370,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_407,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_372,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In21_657
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In22 : LUT4
    generic map(
      INIT => X"7530"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_367,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_372,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In21_657,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In2
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In21 : LUT6
    generic map(
      INIT => X"0055555500F3FFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_356,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_370,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_407,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_367,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_372,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In21_658
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In22 : LUT5
    generic map(
      INIT => X"CCCE00CE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In21_658,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In2
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_8_SW0 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(4),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(1),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(2),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(3),
      O => N6
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o1 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o1_660
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o2 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o2_661
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o3 : LUT6
    generic map(
      INIT => X"0001000000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o1_660,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o2_661,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT4_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_V_474,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_T_485,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      O => N10
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT4 : LUT6
    generic map(
      INIT => X"FFFFBABB55551011"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_R_475,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(3),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I4 => N10,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_3_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_3_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT7_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_V_474,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_T_485,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_R_475,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      O => N12
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT7 : LUT6
    generic map(
      INIT => X"DDDDDCCC11111000"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(6),
      I4 => N12,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_6_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_6_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT3_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_V_474,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_T_485,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_475,
      O => N14
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT3 : LUT6
    generic map(
      INIT => X"FFFFBABB55551011"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      I2 => N14,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I4 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_7_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_2_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_89_o1 : LUT6
    generic map(
      INIT => X"FFFFFFFDFFFFFFFF"
    )
    port map (
      I0 => gmii_txd(3),
      I1 => gmii_txd(7),
      I2 => gmii_txd(4),
      I3 => gmii_txd(5),
      I4 => gmii_txd(6),
      I5 => gmii_txd(2),
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_89_o1_665
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_89_o2 : LUT6
    generic map(
      INIT => X"A8AAAAAA20222222"
    )
    port map (
      I0 => gmii_tx_er,
      I1 => gmii_tx_en,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_89_o1_665,
      I3 => gmii_txd(0),
      I4 => gmii_txd(1),
      I5 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_89_o2_666
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT21 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF5540"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_T_485,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(1),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_475,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_V_474,
      O => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT2
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT22 : LUT4
    generic map(
      INIT => X"AE04"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT2,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_1_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_1_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT11 : LUT6
    generic map(
      INIT => X"FFFFFFFF55555540"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_V_474,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_T_485,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_R_475,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      O => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT1
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT12 : LUT4
    generic map(
      INIT => X"AE04"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_19_o_CONFIG_DATA_7_mux_21_OUT1,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_0_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_19_o_CONFIG_DATA_7_mux_21_OUT_0_Q
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In32 : LUT6
    generic map(
      INIT => X"7777555722220002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      I3 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In31_669,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In3
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In21 : LUT6
    generic map(
      INIT => X"91C49BE4DD80DFA0"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_21_o_equal_19_o,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In21_670
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In22 : LUT5
    generic map(
      INIT => X"4040FF40"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In21_670,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In2
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_251_o_SW0 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_610,
      I1 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_617,
      I2 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      O => N20
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_251_o : LUT6
    generic map(
      INIT => X"0002020200000200"
    )
    port map (
      I0 => U0_gpcs_pma_inst_XMIT_DATA,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(2),
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I4 => N20,
      I5 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_589,
      O => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_251_o_576
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG_LINK_OK_AND_200_o_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_S_649,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      O => N22
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG_LINK_OK_AND_200_o : LUT6
    generic map(
      INIT => X"0000010000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_K_601,
      I1 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_600,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_602,
      I3 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I4 => N22,
      I5 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      O => U0_gpcs_pma_inst_RECEIVER_I_REG_LINK_OK_AND_200_o_556
    );
  U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_184_o_SW0 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I1 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_602,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_600,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_K_601,
      O => N24
    );
  U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_184_o : LUT6
    generic map(
      INIT => X"00000000AA880808"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I2 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I3 => N24,
      I4 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I5 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_185_o_norst,
      O => U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_184_o_579
    );
  U0_gpcs_pma_inst_RECEIVER_K28p51_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      O => N26
    );
  U0_gpcs_pma_inst_RECEIVER_K28p51 : LUT6
    generic map(
      INIT => X"0000000000800000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I5 => N26,
      O => U0_gpcs_pma_inst_RECEIVER_K28p51_534
    );
  U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_121_o1 : LUT6
    generic map(
      INIT => X"0000000080000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(6),
      O => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_121_o
    );
  U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_121_o2 : LUT6
    generic map(
      INIT => X"0000000000000008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(2),
      O => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_121_o1_676
    );
  U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_121_o3 : LUT6
    generic map(
      INIT => X"0013001100030000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I4 => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_121_o,
      I5 => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_121_o1_676,
      O => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_185_o_norst
    );
  U0_gpcs_pma_inst_RECEIVER_D0p0_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I2 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I3 => U0_gpcs_pma_inst_RXDATA_INT(0),
      O => N28
    );
  U0_gpcs_pma_inst_RECEIVER_D0p0 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I5 => N28,
      O => U0_gpcs_pma_inst_RECEIVER_D0p0_541
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_142_o_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_C_REG2_535,
      I1 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      O => N30
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_142_o : LUT6
    generic map(
      INIT => X"FFFFAA2AFF2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_C_REG3_638,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I3 => U0_gpcs_pma_inst_RECEIVER_CGBAD_620,
      I4 => N30,
      I5 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      O => U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_142_o_539
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o1 : LUT5
    generic map(
      INIT => X"00200000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o1_679
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o2 : LUT4
    generic map(
      INIT => X"0254"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o2_680
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o3 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(6),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o3_681
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o4 : LUT6
    generic map(
      INIT => X"FF171717FF000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o3_681,
      I4 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o2_680,
      I5 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o1_679,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o4_682
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o5 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_125,
      I1 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o4_682,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_272_o
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o11 : LUT6
    generic map(
      INIT => X"E8FFFFFFFFFFFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I1 => U0_gpcs_pma_inst_RXDISPERR_INT_126,
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o1
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o13 : LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I2 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I3 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o13_685
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_147_o1 : LUT5
    generic map(
      INIT => X"88888000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_T_REG2_641,
      I1 => U0_gpcs_pma_inst_RECEIVER_R_REG1_640,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161,
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I4 => U0_gpcs_pma_inst_RECEIVER_R_621,
      O => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_147_o1_686
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_147_o2 : LUT6
    generic map(
      INIT => X"FFFFFF80FF80FF80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      I1 => U0_gpcs_pma_inst_RECEIVER_D0p0_REG_643,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161,
      I3 => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_147_o1_686,
      I4 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I5 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      O => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_147_o
    );
  U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_162_o2 : LUT5
    generic map(
      INIT => X"54545554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_R_REG1_640,
      I1 => U0_gpcs_pma_inst_RECEIVER_T_REG2_641,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I3 => U0_gpcs_pma_inst_RECEIVER_R_621,
      I4 => U0_gpcs_pma_inst_RECEIVER_T_REG1_642,
      O => U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_162_o2_687
    );
  U0_gpcs_pma_inst_RESTART_AN_SET : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RESTART_AN_EN_138,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_RESTART_AN_SET_117
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_8 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_8_glue_rst_688,
      S => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_7 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_7_glue_rst_689,
      S => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_6 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_6_glue_rst_690,
      S => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_5 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_5_glue_rst_691,
      S => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_4 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_4_glue_rst_692,
      S => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_3 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_3_glue_rst_693,
      S => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_2 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_2_glue_rst_694,
      S => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_1 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_1_glue_rst_695,
      S => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_0 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_0_glue_rst_696,
      S => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_glue_set_697,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_355
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_glue_set_698,
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_SYNC_STATUS_OR_86_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_341
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT_glue_set_699,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_glue_set_700,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_glue_set_701,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_glue_rst_702,
      S => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_353
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_glue_set_703,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_352
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_glue_set_704,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_356
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_glue_set_705,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_354
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_glue_set_706,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_357
    );
  U0_gpcs_pma_inst_TRANSMITTER_V : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_707,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_V_474
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set_708,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476
    );
  U0_gpcs_pma_inst_TRANSMITTER_R : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_R_glue_set_709,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_R_475
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISPARITY : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst_710,
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_473
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_glue_set_711,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD_GND_26_o_AND_121_o,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_EVEN : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set_712,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161
    );
  U0_gpcs_pma_inst_RECEIVER_RECEIVE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set_713,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RECEIVE_589
    );
  U0_gpcs_pma_inst_RECEIVER_RX_INVALID : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set_714,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_590
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DV : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set_715,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_716,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_588
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set_717,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_591
    );
  U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set_718,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      Q => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_592
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(10),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_rt_719
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(9),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_rt_720
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_rt_721
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_rt_722
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_rt_723
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_rt_724
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(4),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_rt_725
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_rt_726
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_rt_727
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_rt_728
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_rt_729
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_rt_730
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_rt_731
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(4),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_rt_732
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_rt_733
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_rt_734
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_rt_735
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(11),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_11_rt_736
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_8_rt_737
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_rstpot : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_367,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_RX_CONFIG_REG_15_equal_17_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_rstpot_738
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_rstpot_738,
      R => U0_gpcs_pma_inst_SRESET_139,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_367
    );
  U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot_739,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_479
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot_740,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_91
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot_741,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_98
    );
  U0_gpcs_pma_inst_RESTART_AN_EN : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RESTART_AN_EN_rstpot_742,
      Q => U0_gpcs_pma_inst_RESTART_AN_EN_138
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_rstpot_743,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_381
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_rstpot_744,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_389
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_rstpot_745,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_407
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_747,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_481
    );
  U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_rstpot : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_PWR_19_o_MUX_259_o,
      O => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_rstpot_748
    );
  U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_rstpot_748,
      Q => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483
    );
  U0_gpcs_pma_inst_TRANSMITTER_K28p5 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_K28p5_rstpot_749,
      Q => U0_gpcs_pma_inst_TRANSMITTER_K28p5_482
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot_750,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_171
    );
  U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot_751,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_484
    );
  U0_gpcs_pma_inst_TRANSMITTER_S_rstpot : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_98_o_0,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_478,
      O => U0_gpcs_pma_inst_TRANSMITTER_S_rstpot_752
    );
  U0_gpcs_pma_inst_TRANSMITTER_S : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_S_rstpot_752,
      Q => U0_gpcs_pma_inst_TRANSMITTER_S_487
    );
  U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot_753,
      Q => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635
    );
  U0_gpcs_pma_inst_RECEIVER_C : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_rstpot_754,
      Q => U0_gpcs_pma_inst_RECEIVER_C_646
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_755,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_600
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot_756,
      Q => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_605
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_757,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_610
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o11 : LUT5
    generic map(
      INIT => X"11110001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_341,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I3 => U0_gpcs_pma_inst_XMIT_DATA,
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_590,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA1 : LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_327,
      I1 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_0_Q,
      I2 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      O => U0_gpcs_pma_inst_XMIT_DATA
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o11_SW0 : LUT5
    generic map(
      INIT => X"FFFFBFBB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_352,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_355,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_353,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_392,
      O => N34
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o11_SW1 : LUT3
    generic map(
      INIT => X"FD"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_355,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_392,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_352,
      O => N35
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o2 : LUT6
    generic map(
      INIT => X"FF44FF45BB00BA00"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_341,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_590,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I3 => N35,
      I4 => U0_gpcs_pma_inst_XMIT_DATA,
      I5 => N34,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_glue_set : LUT6
    generic map(
      INIT => X"0000000000000054"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG2_399,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_356,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER21,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_glue_set_704
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv1 : LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(0),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(7),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(6),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(8),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(5),
      I5 => N6,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot_lut : LUT3
    generic map(
      INIT => X"41"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_139,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_Q,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot_lut_777
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot_cy : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot_lut_777,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ABILITY_MATCH_2_GND_22_o_MUX_34_o11_lut : LUT5
    generic map(
      INIT => X"01000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_357,
      I2 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(15),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ABILITY_MATCH_2_GND_22_o_MUX_34_o11_lut_778
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ABILITY_MATCH_2_GND_22_o_MUX_34_o11_cy : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      DI => NlwRenamedSig_OI_status_vector(8),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ABILITY_MATCH_2_GND_22_o_MUX_34_o11_lut_778,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_GND_22_o_MUX_34_o
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set : LUT6
    generic map(
      INIT => X"444444444444F444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EOP_REG1_SYNC_STATUS_OR_170_o,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV,
      I2 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_632,
      I4 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(2),
      O => U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set_715
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_dpot1_762
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_dpot1_763
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_dpot1_764
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_dpot1_765
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_dpot1_766
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_dpot1_767
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_dpot1_768
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_dpot1_769
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_dpot1_770
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_dpot1_771
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_dpot1_772
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_dpot1_773
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_dpot1_774
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_dpot1_775
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_dpot1_776
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o12 : LUT6
    generic map(
      INIT => X"FFFFFFFFA9999995"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I2 => U0_gpcs_pma_inst_RXDISPERR_INT_126,
      I3 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o12_684
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_rstpot : LUT6
    generic map(
      INIT => X"0000000000000400"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_139,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_STATE_3_equal_54_o,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In2_656,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In2,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In2,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_rstpot_744
    );
  U0_gpcs_pma_inst_RECEIVER_EOP_REG1_SYNC_STATUS_OR_170_o1 : LUT6
    generic map(
      INIT => X"FF51FF51FF51FFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_327,
      I1 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_0_Q,
      I2 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_EOP_REG1_611,
      I4 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_589,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      O => U0_gpcs_pma_inst_RECEIVER_EOP_REG1_SYNC_STATUS_OR_170_o
    );
  U0_gpcs_pma_inst_RECEIVER_LINK_OK1 : LUT4
    generic map(
      INIT => X"AE00"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_327,
      I1 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_0_Q,
      I2 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      O => U0_gpcs_pma_inst_RECEIVER_LINK_OK
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot : LUT5
    generic map(
      INIT => X"22022222"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_372,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv2_rstpot_758
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_0_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(0),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_1_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(1),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_2_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(2),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_3_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(3),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_4_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(4),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_8_glue_rst : LUT6
    generic map(
      INIT => X"FF3F0000AA2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(8),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_SRESET_139,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_8_1,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_8_glue_rst_688
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_7_glue_rst : LUT6
    generic map(
      INIT => X"FF3F0000AA2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(7),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_SRESET_139,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_7_1,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_7_glue_rst_689
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_6_glue_rst : LUT6
    generic map(
      INIT => X"FF3F0000AA2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(6),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_SRESET_139,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_6_1,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_6_glue_rst_690
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_5_glue_rst : LUT6
    generic map(
      INIT => X"FF3F0000AA2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(5),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_SRESET_139,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_5_1,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_5_glue_rst_691
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_4_glue_rst : LUT6
    generic map(
      INIT => X"FF3F0000AA2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(4),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_SRESET_139,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_4_1,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_4_glue_rst_692
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_5_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(5),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_6_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(6),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_7_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(7),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_3_glue_rst : LUT6
    generic map(
      INIT => X"FF3F0000AA2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(3),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_SRESET_139,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_3_1,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_3_glue_rst_693
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_2_glue_rst : LUT6
    generic map(
      INIT => X"FF3F0000AA2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(2),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_SRESET_139,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_2_1,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_2_glue_rst_694
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_1_glue_rst : LUT6
    generic map(
      INIT => X"FF3F0000AA2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(1),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_SRESET_139,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_1_1,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_1_glue_rst_695
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_glue_set : LUT4
    generic map(
      INIT => X"22F2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_352,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_22_o_MR_AN_ENABLE_OR_69_o,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG1_391,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG2_390,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_glue_set_703
    );
  U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot : LUT4
    generic map(
      INIT => X"6A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_479,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      O => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot_739
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set : LUT3
    generic map(
      INIT => X"2F"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_136,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set_712
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot : LUT6
    generic map(
      INIT => X"0001010101010101"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_165,
      I1 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_91,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_89,
      I4 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_90,
      I5 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_88,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot_740
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot : LUT6
    generic map(
      INIT => X"0001010101010101"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_165,
      I1 => U0_gpcs_pma_inst_TXBUFERR_INT_120,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_98,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_96,
      I4 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_97,
      I5 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_95,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot_741
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER22_SW0 : LUT6
    generic map(
      INIT => X"FF555555FF3FFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_356,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_407,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_370,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_367,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_372,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      O => N42
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER22 : LUT5
    generic map(
      INIT => X"0002CC02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I4 => N42,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER21
    );
  U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_502,
      O => N46
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_glue_set_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I1 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      O => N50
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_glue_set : LUT6
    generic map(
      INIT => X"FFFFFFFFAAAA222A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_341,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_REG_388,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I3 => U0_gpcs_pma_inst_XMIT_DATA,
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_590,
      I5 => N50,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_glue_set_698
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_glue_set_SW0 : LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(5),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(6),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(7),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(8),
      O => N52
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_glue_set : LUT6
    generic map(
      INIT => X"FFFF8AAA8AAA8AAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342,
      I1 => N52,
      I2 => N6,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(0),
      I4 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I5 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_glue_set_701
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_glue_set : LUT3
    generic map(
      INIT => X"F4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_142,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_357,
      I2 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_glue_set_706
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set : LUT3
    generic map(
      INIT => X"F4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_T_485,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set_708
    );
  U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set : LUT3
    generic map(
      INIT => X"F4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EOP_612,
      I1 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_589,
      I2 => U0_gpcs_pma_inst_RECEIVER_SOP_REG2_633,
      O => U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set_713
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG1 : LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_353,
      I1 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_0_Q,
      I2 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      O => U0_gpcs_pma_inst_XMIT_CONFIG
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT_glue_set : LUT3
    generic map(
      INIT => X"F4"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_16,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_389,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT_glue_set_699
    );
  U0_gpcs_pma_inst_RESTART_AN_EN_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => an_restart_config,
      I1 => U0_gpcs_pma_inst_RESTART_AN_EN_REG_137,
      I2 => U0_gpcs_pma_inst_SRESET_139,
      O => U0_gpcs_pma_inst_RESTART_AN_EN_rstpot_742
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2_382,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2_405,
      I2 => U0_gpcs_pma_inst_SRESET_139,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_rstpot_743
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_MSB_REG_402,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(11),
      I2 => U0_gpcs_pma_inst_SRESET_139,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_rstpot_745
    );
  U0_gpcs_pma_inst_TRANSMITTER_K28p5_rstpot : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_3_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_K28p5_rstpot_749
    );
  U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_503,
      I1 => gmii_tx_en,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      O => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot_751
    );
  U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I1 => U0_gpcs_pma_inst_RECEIVER_C_REG2_535,
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I3 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      O => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot_753
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot : LUT6
    generic map(
      INIT => X"2222222200020000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_589,
      I1 => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_134_o,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_196_o,
      I3 => U0_gpcs_pma_inst_RECEIVER_R_621,
      I4 => U0_gpcs_pma_inst_RECEIVER_T_REG2_641,
      I5 => N54,
      O => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_757
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_SW0 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_589,
      I1 => U0_gpcs_pma_inst_RECEIVER_R_REG1_640,
      O => N56
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set : LUT6
    generic map(
      INIT => X"FFFF022202220222"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EXTEND_588,
      I1 => U0_gpcs_pma_inst_RECEIVER_S_649,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161,
      I4 => N56,
      I5 => U0_gpcs_pma_inst_RECEIVER_R_621,
      O => U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_716
    );
  U0_gpcs_pma_inst_RECEIVER_C_rstpot : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_185_o_norst,
      O => U0_gpcs_pma_inst_RECEIVER_C_rstpot_754
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_0_glue_rst : LUT6
    generic map(
      INIT => X"FF3F0000AA2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(0),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_SRESET_139,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_0_1,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_0_glue_rst_696
    );
  U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set : LUT6
    generic map(
      INIT => X"FFFFFFFF54FF5454"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I1 => U0_gpcs_pma_inst_RECEIVER_FROM_IDLE_D_616,
      I2 => U0_gpcs_pma_inst_RECEIVER_FROM_RX_K_615,
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_590,
      I5 => U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX_614,
      O => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set_714
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_8_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(8),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_LINK_TIMER_SATURATED_OR_38_o_inv1 : LUT3
    generic map(
      INIT => X"15"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_400,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_LINK_TIMER_SATURATED_OR_38_o_inv
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_glue_set : LUT6
    generic map(
      INIT => X"FFFFFFFF88808085"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_glue_set_711
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot : LUT6
    generic map(
      INIT => X"0010000000000010"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342,
      I1 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_373,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_357,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(15),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0595_inv1_rstpot_761
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ACKNOWLEDGE_MATCH_3_GND_22_o_MUX_42_o11 : LUT5
    generic map(
      INIT => X"00200000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_2_371,
      I1 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(14),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_342,
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_GND_22_o_MUX_42_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRPISK_GND_24_o_MUX_272_o11 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_481,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_GND_24_o_MUX_272_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_24_o_mux_24_OUT11 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_473,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_0_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_24_o_mux_24_OUT21 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_1_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_24_o_mux_24_OUT31 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(2),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_473,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_2_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_24_o_mux_24_OUT41 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(3),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_3_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_24_o_mux_24_OUT51 : LUT4
    generic map(
      INIT => X"2AEA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(4),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_473,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_4_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_24_o_mux_24_OUT61 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(5),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_5_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_24_o_mux_24_OUT71 : LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(6),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_6_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_24_o_mux_24_OUT81 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(7),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_473,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_24_o_mux_24_OUT_7_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_11_RXDATA_3_MUX_296_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_11_RXDATA_3_MUX_296_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_12_RXDATA_4_MUX_295_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(4),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_12_RXDATA_4_MUX_295_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_13_RXDATA_5_MUX_294_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(5),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_13_RXDATA_5_MUX_294_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_14_RXDATA_6_MUX_293_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(6),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_14_RXDATA_6_MUX_293_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_8_RXDATA_0_MUX_299_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(0),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_8_RXDATA_0_MUX_299_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_15_RXDATA_7_MUX_292_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(7),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_15_RXDATA_7_MUX_292_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_9_RXDATA_1_MUX_298_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_9_RXDATA_1_MUX_298_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_10_RXDATA_2_MUX_297_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_637,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_635,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(2),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_10_RXDATA_2_MUX_297_o
    );
  U0_gpcs_pma_inst_RECEIVER_RX_RUDI_INVALID1 : LUT5
    generic map(
      INIT => X"FFFF1011"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_327,
      I2 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      I3 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_0_Q,
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_590,
      O => U0_gpcs_pma_inst_RX_RUDI_INVALID
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In31 : LUT6
    generic map(
      INIT => X"FFF00000FFFF0020"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1),
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In31_669
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set : LUT4
    generic map(
      INIT => X"FF2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_591,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161,
      I3 => U0_gpcs_pma_inst_RECEIVER_I_REG_LINK_OK_AND_200_o_556,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set_717
    );
  U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_194_o1 : LUT6
    generic map(
      INIT => X"0000000000000008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I1 => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_194_o2,
      I2 => U0_gpcs_pma_inst_RECEIVER_CGBAD_620,
      I3 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I4 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_125,
      I5 => U0_gpcs_pma_inst_RXDISPERR_INT_126,
      O => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_194_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_glue_rst : LUT6
    generic map(
      INIT => X"AAAA88AFAAAA88A8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_353,
      I1 => U0_gpcs_pma_inst_SRESET_139,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I5 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_glue_rst_702
    );
  U0_gpcs_pma_inst_TRANSMITTER_R_glue_set : LUT5
    generic map(
      INIT => X"FFFF4440"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_R_475,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_502,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_T_485,
      O => U0_gpcs_pma_inst_TRANSMITTER_R_glue_set_709
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_glue_set : LUT4
    generic map(
      INIT => X"C8CA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_glue_set_700
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst : LUT5
    generic map(
      INIT => X"5515AA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_473,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_483,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_DISP3_K28p5_OR_110_o,
      O => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst_710
    );
  U0_gpcs_pma_inst_TRANSMITTER_V_glue_set : LUT6
    generic map(
      INIT => X"FFFF88A888A888A8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_478,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_89_o2_666,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_503,
      I3 => N46,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_V_474,
      O => U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_707
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_SW0 : LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_143,
      I1 => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2_607,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_639,
      I3 => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_619,
      I4 => U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_162_o2_687,
      O => N54
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_SW1 : LUT4
    generic map(
      INIT => X"FFFB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_T_485,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_476,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_S_487,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_V_474,
      O => N58
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot : LUT6
    generic map(
      INIT => X"55545554FFFE5554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_477,
      I1 => N58,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG(3),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_475,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_747
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER23 : LUT6
    generic map(
      INIT => X"FFFFFFFF08081908"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I2 => N42,
      I3 => U0_gpcs_pma_inst_CONFIGURATION_VECTOR_REG_4_Q,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_glue_set : LUT4
    generic map(
      INIT => X"FF2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_354,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_glue_set_705
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_glue_set : LUT5
    generic map(
      INIT => X"FFEAFF2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_355,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_401,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_403,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_354,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_glue_set_697
    );
  U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set : LUT5
    generic map(
      INIT => X"2A2AFF2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_592,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_645,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_161,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I4 => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG_618,
      O => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set_718
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_493,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_473,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      O => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot_750
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot : LUT6
    generic map(
      INIT => X"0000000000000008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_196_o,
      I4 => U0_gpcs_pma_inst_RECEIVER_R_621,
      I5 => U0_gpcs_pma_inst_RECEIVER_S_649,
      O => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot_756
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_rstpot_786,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_rstpot_787,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_rstpot : LUT6
    generic map(
      INIT => X"0000000000750030"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_367,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_372,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I3 => U0_gpcs_pma_inst_SRESET_139,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In21_657,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_rstpot_786
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_rstpot : LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_139,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In2,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_51_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_rstpot_787
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_788,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2 : MUXF7
    port map (
      I0 => N60,
      I1 => N61,
      S => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_519
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_F : LUT6
    generic map(
      INIT => X"F0F4540400040404"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I1 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_136,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_21_o_equal_19_o,
      O => N60
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_G : LUT5
    generic map(
      INIT => X"DBDB8988"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I3 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_136,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      O => N61
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot : MUXF7
    port map (
      I0 => N62,
      I1 => N63,
      S => U0_gpcs_pma_inst_RXDATA_INT(5),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_755
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_F : LUT6
    generic map(
      INIT => X"0404040004000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o12_684,
      I1 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_125,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o13_685,
      I3 => U0_gpcs_pma_inst_RXDISPERR_INT_126,
      I4 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(7),
      O => N62
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_G : LUT5
    generic map(
      INIT => X"00200000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I1 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o12_684,
      I2 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_125,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_191_o1,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      O => N63
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In2 : MUXF7
    port map (
      I0 => N64,
      I1 => N65,
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_250,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In2_656
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In2_F : LUT6
    generic map(
      INIT => X"1191111111111111"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_407,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_367,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_370,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_372,
      O => N64
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In2_G : LUT6
    generic map(
      INIT => X"11559BFF9BFF9BFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_248,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_249,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_368,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_356,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_372,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_367,
      O => N65
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot : MUXF7
    port map (
      I0 => N66,
      I1 => N67,
      S => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_788
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_F : LUT6
    generic map(
      INIT => X"AAAAAAA8AAEAAAE8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I5 => U0_gpcs_pma_inst_RXCHARISK_INT_135,
      O => N66
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_G : LUT5
    generic map(
      INIT => X"222A22A8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_515,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_517,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_516,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_518,
      O => N67
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_lut_0_INV_0 : INV
    port map (
      I => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_lut(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_lut_0_INV_0 : INV
    port map (
      I => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_lut(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_PHY_MODE_RX_CONFIG_REG_15_AND_49_o1_INV_0 : INV
    port map (
      I => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_PHY_MODE_RX_CONFIG_REG_15_AND_49_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mcount_CODE_GRP_CNT_xor_0_11_INV_0 : INV
    port map (
      I => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_Result(0)
    );
  U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(8),
      A1 => NlwRenamedSig_OI_status_vector(8),
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      Q => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_797,
      Q15 => NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_STATUS_VECTOR_0 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_797,
      Q => U0_gpcs_pma_inst_STATUS_VECTOR_0_75
    );
  U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(8),
      A1 => NlwRenamedSig_OI_status_vector(8),
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_13_201,
      Q => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12_798,
      Q15 => NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_STATUS_VECTOR_12 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12_798,
      Q => U0_gpcs_pma_inst_STATUS_VECTOR_12_64
    );
  U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(8),
      A1 => NlwRenamedSig_OI_status_vector(8),
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_160,
      Q => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1_799,
      Q15 => NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_STATUS_VECTOR_1 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1_799,
      Q => U0_gpcs_pma_inst_STATUS_VECTOR_1_74
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(7),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_800,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_800,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(7)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(6),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_801,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_6 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_801,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(6)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(5),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_802,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_5 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_802,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(5)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(4),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_803,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_4 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_803,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(4)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(3),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_804,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_3 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_804,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(3)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(2),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_805,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_2 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_805,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(2)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(1),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_806,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_1 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_806,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(1)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(0),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_807,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_0 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_807,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(0)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(8),
      A1 => NlwRenamedSig_OI_status_vector(8),
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_631,
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_808,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_808,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_630
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_CGBAD_REG2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => NlwRenamedSig_OI_status_vector(8),
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_CGBAD_620,
      Q => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG2,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_CGBAD_REG2_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(8),
      A1 => NlwRenamedSig_OI_status_vector(8),
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_SOP_613,
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_809,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_SOP_REG2 : FDE
    port map (
      C => userclk2,
      CE => N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_809,
      Q => U0_gpcs_pma_inst_RECEIVER_SOP_REG2_633
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_FALSE_CARRIER_REG2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => NlwRenamedSig_OI_status_vector(8),
      A2 => NlwRenamedSig_OI_status_vector(8),
      A3 => NlwRenamedSig_OI_status_vector(8),
      CE => N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_591,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG2,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_FALSE_CARRIER_REG2_Q15_UNCONNECTED
    );

end STRUCTURE;

-- synthesis translate_on
