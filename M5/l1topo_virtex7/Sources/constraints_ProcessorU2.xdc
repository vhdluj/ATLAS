# Constraints file for the L1Topo Processor-FPGA U2

# generated on 23th Jul 2014 by the makeProcessorU2Constraints.awk script (author: Christian Kahra, ckahra@uni-mainz.de)
# the constraints in this file are derived from L1Topo_Signal-Pins.txt and ctrlbusSettings.txt



#TTC clock
set_property PACKAGE_PIN H28	[get_ports GCK1_CLK_P]
set_property IOSTANDARD LVDS [get_ports GCK1_CLK_P]
set_property PACKAGE_PIN H29	[get_ports GCK1_CLK_N]
set_property IOSTANDARD LVDS [get_ports GCK1_CLK_N]
create_clock -period 24.95 -name GCK1_CLK_40MHz -waveform {0.000 12.475} [get_ports{GCK1_CLK_P}]

#Crystal clock
set_property PACKAGE_PIN K27	[get_ports GCK2_CLK_P]
set_property IOSTANDARD LVDS [get_ports GCK2_CLK_P]
set_property PACKAGE_PIN J27	[get_ports GCK2_CLK_N]
set_property IOSTANDARD LVDS [get_ports GCK2_CLK_N]
create_clock -period 24.95 -name GCK2_CLK_40MHz -waveform {0.000 12.475} [get_ports{GCK2_CLK_P}]

#MGT reference clocks
set_property PACKAGE_PIN AR10	[get_ports MGT1_CLK_P_9]
set_property PACKAGE_PIN AR9	[get_ports MGT1_CLK_N_9]
set_property PACKAGE_PIN AA10	[get_ports MGT1_CLK_P_10]
set_property PACKAGE_PIN AA9	[get_ports MGT1_CLK_N_10]
set_property PACKAGE_PIN J10	[get_ports MGT1_CLK_P_11]
set_property PACKAGE_PIN J9	[get_ports MGT1_CLK_N_11]
set_property PACKAGE_PIN A10	[get_ports MGT1_CLK_P_12]
set_property PACKAGE_PIN A9	[get_ports MGT1_CLK_N_12]
set_property PACKAGE_PIN AR35	[get_ports MGT1_CLK_P_13]
set_property PACKAGE_PIN AR36	[get_ports MGT1_CLK_N_13]
set_property PACKAGE_PIN AA35	[get_ports MGT1_CLK_P_14]
set_property PACKAGE_PIN AA36	[get_ports MGT1_CLK_N_14]
set_property PACKAGE_PIN J35	[get_ports MGT1_CLK_P_15]
set_property PACKAGE_PIN J36	[get_ports MGT1_CLK_N_15]
set_property PACKAGE_PIN A35	[get_ports MGT1_CLK_P_16]
set_property PACKAGE_PIN A36	[get_ports MGT1_CLK_N_16]
create_clock -period 6.2375 -name MGT1_CLK_160MHz -waveform {0.000 3.1188} [get_ports{ MGT1_CLK_P_9 MGT1_CLK_P_10 MGT1_CLK_P_11 MGT1_CLK_P_12 MGT1_CLK_P_13 MGT1_CLK_P_14 MGT1_CLK_P_15 MGT1_CLK_P_16}]

set_property PACKAGE_PIN AT8	[get_ports MGT2_CLK_P_9]
set_property PACKAGE_PIN AT7	[get_ports MGT2_CLK_N_9]
set_property PACKAGE_PIN AB8	[get_ports MGT2_CLK_P_10]
set_property PACKAGE_PIN AB7	[get_ports MGT2_CLK_N_10]
set_property PACKAGE_PIN L10	[get_ports MGT2_CLK_P_11]
set_property PACKAGE_PIN L9	[get_ports MGT2_CLK_N_11]
set_property PACKAGE_PIN C10	[get_ports MGT2_CLK_P_12]
set_property PACKAGE_PIN C9	[get_ports MGT2_CLK_N_12]
set_property PACKAGE_PIN AT37	[get_ports MGT2_CLK_P_13]
set_property PACKAGE_PIN AT38	[get_ports MGT2_CLK_N_13]
set_property PACKAGE_PIN AB37	[get_ports MGT2_CLK_P_14]
set_property PACKAGE_PIN AB38	[get_ports MGT2_CLK_N_14]
set_property PACKAGE_PIN L35	[get_ports MGT2_CLK_P_15]
set_property PACKAGE_PIN L36	[get_ports MGT2_CLK_N_15]
set_property PACKAGE_PIN C35	[get_ports MGT2_CLK_P_16]
set_property PACKAGE_PIN C36	[get_ports MGT2_CLK_N_16]
create_clock -period 6.2375 -name MGT2_CLK_160MHz -waveform {0.000 3.1188} [get_ports{ MGT2_CLK_P_9 MGT2_CLK_P_10 MGT2_CLK_P_11 MGT2_CLK_P_12 MGT2_CLK_P_13 MGT2_CLK_P_14 MGT2_CLK_P_15 MGT2_CLK_P_16}]

set_property PACKAGE_PIN AY8	[get_ports MGT3_CLK_P_9]
set_property PACKAGE_PIN AY7	[get_ports MGT3_CLK_N_9]
set_property PACKAGE_PIN AF8	[get_ports MGT3_CLK_P_10]
set_property PACKAGE_PIN AF7	[get_ports MGT3_CLK_N_10]
set_property PACKAGE_PIN N10	[get_ports MGT3_CLK_P_11]
set_property PACKAGE_PIN N9	[get_ports MGT3_CLK_N_11]
set_property PACKAGE_PIN E10	[get_ports MGT3_CLK_P_12]
set_property PACKAGE_PIN E9	[get_ports MGT3_CLK_N_12]
set_property PACKAGE_PIN AY37	[get_ports MGT3_CLK_P_13]
set_property PACKAGE_PIN AY38	[get_ports MGT3_CLK_N_13]
set_property PACKAGE_PIN AF37	[get_ports MGT3_CLK_P_14]
set_property PACKAGE_PIN AF38	[get_ports MGT3_CLK_N_14]
set_property PACKAGE_PIN N35	[get_ports MGT3_CLK_P_15]
set_property PACKAGE_PIN N36	[get_ports MGT3_CLK_N_15]
set_property PACKAGE_PIN E35	[get_ports MGT3_CLK_P_16]
set_property PACKAGE_PIN E36	[get_ports MGT3_CLK_N_16]
create_clock -period 6.2375 -name MGT3_CLK_160MHz -waveform {0.000 3.1188} [get_ports{ MGT3_CLK_P_9 MGT3_CLK_P_10 MGT3_CLK_P_11 MGT3_CLK_P_12 MGT3_CLK_P_13 MGT3_CLK_P_14 MGT3_CLK_P_15 MGT3_CLK_P_16}]

set_property PACKAGE_PIN BB8	[get_ports MGT4_CLK_P_9]
set_property PACKAGE_PIN BB7	[get_ports MGT4_CLK_N_9]
set_property PACKAGE_PIN AH8	[get_ports MGT4_CLK_P_10]
set_property PACKAGE_PIN AH7	[get_ports MGT4_CLK_N_10]
set_property PACKAGE_PIN R10	[get_ports MGT4_CLK_P_11]
set_property PACKAGE_PIN R9	[get_ports MGT4_CLK_N_11]
set_property PACKAGE_PIN G10	[get_ports MGT4_CLK_P_12]
set_property PACKAGE_PIN G9	[get_ports MGT4_CLK_N_12]
set_property PACKAGE_PIN BB37	[get_ports MGT4_CLK_P_13]
set_property PACKAGE_PIN BB38	[get_ports MGT4_CLK_N_13]
set_property PACKAGE_PIN AH37	[get_ports MGT4_CLK_P_14]
set_property PACKAGE_PIN AH38	[get_ports MGT4_CLK_N_14]
set_property PACKAGE_PIN R35	[get_ports MGT4_CLK_P_15]
set_property PACKAGE_PIN R36	[get_ports MGT4_CLK_N_15]
set_property PACKAGE_PIN G35	[get_ports MGT4_CLK_P_16]
set_property PACKAGE_PIN G36	[get_ports MGT4_CLK_N_16]
create_clock -period 6.2375 -name MGT4_CLK_160MHz -waveform {0.000 3.1188} [get_ports{ MGT4_CLK_P_9 MGT4_CLK_P_10 MGT4_CLK_P_11 MGT4_CLK_P_12 MGT4_CLK_P_13 MGT4_CLK_P_14 MGT4_CLK_P_15 MGT4_CLK_P_16}]



#MGT data lines
set_property PACKAGE_PIN AL6	[get_ports OPTO8_P_0]
set_property PACKAGE_PIN AL5	[get_ports OPTO8_N_0]
set_property PACKAGE_PIN AM8	[get_ports OPTO8_P_1]
set_property PACKAGE_PIN AM7	[get_ports OPTO8_N_1]
set_property PACKAGE_PIN AM4	[get_ports OPTO8_P_2]
set_property PACKAGE_PIN AM3	[get_ports OPTO8_N_2]
set_property PACKAGE_PIN AN6	[get_ports OPTO8_P_3]
set_property PACKAGE_PIN AN5	[get_ports OPTO8_N_3]
set_property PACKAGE_PIN AP8	[get_ports OPTO8_P_4]
set_property PACKAGE_PIN AP7	[get_ports OPTO8_N_4]
set_property PACKAGE_PIN AR6	[get_ports OPTO8_P_5]
set_property PACKAGE_PIN AR5	[get_ports OPTO8_N_5]
set_property PACKAGE_PIN AU6	[get_ports OPTO8_P_6]
set_property PACKAGE_PIN AU5	[get_ports OPTO8_N_6]
set_property PACKAGE_PIN AV8	[get_ports OPTO8_P_7]
set_property PACKAGE_PIN AV7	[get_ports OPTO8_N_7]
set_property PACKAGE_PIN AW6	[get_ports OPTO8_P_8]
set_property PACKAGE_PIN AW5	[get_ports OPTO8_N_8]
set_property PACKAGE_PIN BA6	[get_ports OPTO8_P_9]
set_property PACKAGE_PIN BA5	[get_ports OPTO8_N_9]
set_property PACKAGE_PIN BC6	[get_ports OPTO8_P_10]
set_property PACKAGE_PIN BC5	[get_ports OPTO8_N_10]
set_property PACKAGE_PIN BD8	[get_ports OPTO8_P_11]
set_property PACKAGE_PIN BD7	[get_ports OPTO8_N_11]
set_property PACKAGE_PIN T8	[get_ports OPTO9_P_0]
set_property PACKAGE_PIN T7	[get_ports OPTO9_N_0]
set_property PACKAGE_PIN U6	[get_ports OPTO9_P_1]
set_property PACKAGE_PIN U5	[get_ports OPTO9_N_1]
set_property PACKAGE_PIN V8	[get_ports OPTO9_P_2]
set_property PACKAGE_PIN V7	[get_ports OPTO9_N_2]
set_property PACKAGE_PIN W6	[get_ports OPTO9_P_3]
set_property PACKAGE_PIN W5	[get_ports OPTO9_N_3]
set_property PACKAGE_PIN Y8	[get_ports OPTO9_P_4]
set_property PACKAGE_PIN Y7	[get_ports OPTO9_N_4]
set_property PACKAGE_PIN AA6	[get_ports OPTO9_P_5]
set_property PACKAGE_PIN AA5	[get_ports OPTO9_N_5]
set_property PACKAGE_PIN AC6	[get_ports OPTO9_P_6]
set_property PACKAGE_PIN AC5	[get_ports OPTO9_N_6]
set_property PACKAGE_PIN AD8	[get_ports OPTO9_P_7]
set_property PACKAGE_PIN AD7	[get_ports OPTO9_N_7]
set_property PACKAGE_PIN AE6	[get_ports OPTO9_P_8]
set_property PACKAGE_PIN AE5	[get_ports OPTO9_N_8]
set_property PACKAGE_PIN AG6	[get_ports OPTO9_P_9]
set_property PACKAGE_PIN AG5	[get_ports OPTO9_N_9]
set_property PACKAGE_PIN AJ6	[get_ports OPTO9_P_10]
set_property PACKAGE_PIN AJ5	[get_ports OPTO9_N_10]
set_property PACKAGE_PIN AK8	[get_ports OPTO9_P_11]
set_property PACKAGE_PIN AK7	[get_ports OPTO9_N_11]
set_property PACKAGE_PIN D8	[get_ports OPTO10_P_0]
set_property PACKAGE_PIN D7	[get_ports OPTO10_N_0]
set_property PACKAGE_PIN E6	[get_ports OPTO10_P_1]
set_property PACKAGE_PIN E5	[get_ports OPTO10_N_1]
set_property PACKAGE_PIN F8	[get_ports OPTO10_P_2]
set_property PACKAGE_PIN F7	[get_ports OPTO10_N_2]
set_property PACKAGE_PIN G6	[get_ports OPTO10_P_3]
set_property PACKAGE_PIN G5	[get_ports OPTO10_N_3]
set_property PACKAGE_PIN H8	[get_ports OPTO10_P_4]
set_property PACKAGE_PIN H7	[get_ports OPTO10_N_4]
set_property PACKAGE_PIN J6	[get_ports OPTO10_P_5]
set_property PACKAGE_PIN J5	[get_ports OPTO10_N_5]
set_property PACKAGE_PIN K8	[get_ports OPTO10_P_6]
set_property PACKAGE_PIN K7	[get_ports OPTO10_N_6]
set_property PACKAGE_PIN L6	[get_ports OPTO10_P_7]
set_property PACKAGE_PIN L5	[get_ports OPTO10_N_7]
set_property PACKAGE_PIN M8	[get_ports OPTO10_P_8]
set_property PACKAGE_PIN M7	[get_ports OPTO10_N_8]
set_property PACKAGE_PIN N6	[get_ports OPTO10_P_9]
set_property PACKAGE_PIN N5	[get_ports OPTO10_N_9]
set_property PACKAGE_PIN P8	[get_ports OPTO10_P_10]
set_property PACKAGE_PIN P7	[get_ports OPTO10_N_10]
set_property PACKAGE_PIN R6	[get_ports OPTO10_P_11]
set_property PACKAGE_PIN R5	[get_ports OPTO10_N_11]
set_property PACKAGE_PIN A39	[get_ports OPTO11_P_0]
set_property PACKAGE_PIN A40	[get_ports OPTO11_N_0]
set_property PACKAGE_PIN D41	[get_ports OPTO11_P_1]
set_property PACKAGE_PIN D42	[get_ports OPTO11_N_1]
set_property PACKAGE_PIN C39	[get_ports OPTO11_P_2]
set_property PACKAGE_PIN C40	[get_ports OPTO11_N_2]
set_property PACKAGE_PIN B37	[get_ports OPTO11_P_4]
set_property PACKAGE_PIN B38	[get_ports OPTO11_N_4]
set_property PACKAGE_PIN B8	[get_ports OPTO11_P_6]
set_property PACKAGE_PIN B7	[get_ports OPTO11_N_6]
set_property PACKAGE_PIN A6	[get_ports OPTO11_P_8]
set_property PACKAGE_PIN A5	[get_ports OPTO11_N_8]
set_property PACKAGE_PIN C6	[get_ports OPTO11_P_10]
set_property PACKAGE_PIN C5	[get_ports OPTO11_N_10]
set_property PACKAGE_PIN D4	[get_ports OPTO11_P_11]
set_property PACKAGE_PIN D3	[get_ports OPTO11_N_11]
set_property PACKAGE_PIN AL39	[get_ports OPTO12_P_0]
set_property PACKAGE_PIN AL40	[get_ports OPTO12_N_0]
set_property PACKAGE_PIN AM37	[get_ports OPTO12_P_1]
set_property PACKAGE_PIN AM38	[get_ports OPTO12_N_1]
set_property PACKAGE_PIN AM41	[get_ports OPTO12_P_2]
set_property PACKAGE_PIN AM42	[get_ports OPTO12_N_2]
set_property PACKAGE_PIN AN39	[get_ports OPTO12_P_3]
set_property PACKAGE_PIN AN40	[get_ports OPTO12_N_3]
set_property PACKAGE_PIN AP37	[get_ports OPTO12_P_4]
set_property PACKAGE_PIN AP38	[get_ports OPTO12_N_4]
set_property PACKAGE_PIN AR39	[get_ports OPTO12_P_5]
set_property PACKAGE_PIN AR40	[get_ports OPTO12_N_5]
set_property PACKAGE_PIN AU39	[get_ports OPTO12_P_6]
set_property PACKAGE_PIN AU40	[get_ports OPTO12_N_6]
set_property PACKAGE_PIN AV37	[get_ports OPTO12_P_7]
set_property PACKAGE_PIN AV38	[get_ports OPTO12_N_7]
set_property PACKAGE_PIN AW39	[get_ports OPTO12_P_8]
set_property PACKAGE_PIN AW40	[get_ports OPTO12_N_8]
set_property PACKAGE_PIN BA39	[get_ports OPTO12_P_9]
set_property PACKAGE_PIN BA40	[get_ports OPTO12_N_9]
set_property PACKAGE_PIN BC39	[get_ports OPTO12_P_10]
set_property PACKAGE_PIN BC40	[get_ports OPTO12_N_10]
set_property PACKAGE_PIN BD37	[get_ports OPTO12_P_11]
set_property PACKAGE_PIN BD38	[get_ports OPTO12_N_11]
set_property PACKAGE_PIN T37	[get_ports OPTO13_P_0]
set_property PACKAGE_PIN T38	[get_ports OPTO13_N_0]
set_property PACKAGE_PIN U39	[get_ports OPTO13_P_1]
set_property PACKAGE_PIN U40	[get_ports OPTO13_N_1]
set_property PACKAGE_PIN V37	[get_ports OPTO13_P_2]
set_property PACKAGE_PIN V38	[get_ports OPTO13_N_2]
set_property PACKAGE_PIN W39	[get_ports OPTO13_P_3]
set_property PACKAGE_PIN W40	[get_ports OPTO13_N_3]
set_property PACKAGE_PIN Y37	[get_ports OPTO13_P_4]
set_property PACKAGE_PIN Y38	[get_ports OPTO13_N_4]
set_property PACKAGE_PIN AA39	[get_ports OPTO13_P_5]
set_property PACKAGE_PIN AA40	[get_ports OPTO13_N_5]
set_property PACKAGE_PIN AC39	[get_ports OPTO13_P_6]
set_property PACKAGE_PIN AC40	[get_ports OPTO13_N_6]
set_property PACKAGE_PIN AD37	[get_ports OPTO13_P_7]
set_property PACKAGE_PIN AD38	[get_ports OPTO13_N_7]
set_property PACKAGE_PIN AE39	[get_ports OPTO13_P_8]
set_property PACKAGE_PIN AE40	[get_ports OPTO13_N_8]
set_property PACKAGE_PIN AG39	[get_ports OPTO13_P_9]
set_property PACKAGE_PIN AG40	[get_ports OPTO13_N_9]
set_property PACKAGE_PIN AJ39	[get_ports OPTO13_P_10]
set_property PACKAGE_PIN AJ40	[get_ports OPTO13_N_10]
set_property PACKAGE_PIN AK37	[get_ports OPTO13_P_11]
set_property PACKAGE_PIN AK38	[get_ports OPTO13_N_11]
set_property PACKAGE_PIN D37	[get_ports OPTO14_P_0]
set_property PACKAGE_PIN D38	[get_ports OPTO14_N_0]
set_property PACKAGE_PIN E39	[get_ports OPTO14_P_1]
set_property PACKAGE_PIN E40	[get_ports OPTO14_N_1]
set_property PACKAGE_PIN F37	[get_ports OPTO14_P_2]
set_property PACKAGE_PIN F38	[get_ports OPTO14_N_2]
set_property PACKAGE_PIN G39	[get_ports OPTO14_P_3]
set_property PACKAGE_PIN G40	[get_ports OPTO14_N_3]
set_property PACKAGE_PIN H37	[get_ports OPTO14_P_4]
set_property PACKAGE_PIN H38	[get_ports OPTO14_N_4]
set_property PACKAGE_PIN J39	[get_ports OPTO14_P_5]
set_property PACKAGE_PIN J40	[get_ports OPTO14_N_5]
set_property PACKAGE_PIN K37	[get_ports OPTO14_P_6]
set_property PACKAGE_PIN K38	[get_ports OPTO14_N_6]
set_property PACKAGE_PIN L39	[get_ports OPTO14_P_7]
set_property PACKAGE_PIN L40	[get_ports OPTO14_N_7]
set_property PACKAGE_PIN M37	[get_ports OPTO14_P_8]
set_property PACKAGE_PIN M38	[get_ports OPTO14_N_8]
set_property PACKAGE_PIN N39	[get_ports OPTO14_P_9]
set_property PACKAGE_PIN N40	[get_ports OPTO14_N_9]
set_property PACKAGE_PIN P37	[get_ports OPTO14_P_10]
set_property PACKAGE_PIN P38	[get_ports OPTO14_N_10]
set_property PACKAGE_PIN R39	[get_ports OPTO14_P_11]
set_property PACKAGE_PIN R40	[get_ports OPTO14_N_11]


#CTRLBUS lines (IPbus, ROD, TTC signals)
set_property PACKAGE_PIN BD29	[get_ports CTRLBUS_P_21]
set_property PACKAGE_PIN BD30	[get_ports CTRLBUS_N_21]
set_property IOSTANDARD LVDS	[get_ports CTRLBUS_P_21]
set_property DIFF_TERM FALSE	[get_ports CTRLBUS_P_21]

set_property PACKAGE_PIN BB30	[get_ports CTRLBUS_P_22]
set_property PACKAGE_PIN BC30	[get_ports CTRLBUS_N_22]
set_property IOSTANDARD LVDS	[get_ports CTRLBUS_P_22]
set_property DIFF_TERM FALSE	[get_ports CTRLBUS_P_22]

set_property PACKAGE_PIN BC28	[get_ports CTRLBUS_P_23]
set_property PACKAGE_PIN BC29	[get_ports CTRLBUS_N_23]
set_property IOSTANDARD LVDS	[get_ports CTRLBUS_P_23]
set_property DIFF_TERM FALSE	[get_ports CTRLBUS_P_23]

set_property PACKAGE_PIN BA29	[get_ports CTRLBUS_P_24]
set_property PACKAGE_PIN BA30	[get_ports CTRLBUS_N_24]
set_property IOSTANDARD LVDS	[get_ports CTRLBUS_P_24]
set_property DIFF_TERM TRUE	[get_ports CTRLBUS_P_24]

set_property PACKAGE_PIN AW29	[get_ports CTRLBUS_P_25]
set_property PACKAGE_PIN AY29	[get_ports CTRLBUS_N_25]
set_property IOSTANDARD LVDS	[get_ports CTRLBUS_P_25]
set_property DIFF_TERM TRUE	[get_ports CTRLBUS_P_25]

set_property PACKAGE_PIN AW27	[get_ports CTRLBUS_P_26]
set_property PACKAGE_PIN AY27	[get_ports CTRLBUS_N_26]
set_property IOSTANDARD LVDS	[get_ports CTRLBUS_P_26]
set_property DIFF_TERM TRUE	[get_ports CTRLBUS_P_26]

set_property PACKAGE_PIN AY28	[get_ports CTRLBUS_P_28]
set_property PACKAGE_PIN BA28	[get_ports CTRLBUS_N_28]
set_property IOSTANDARD LVDS	[get_ports CTRLBUS_P_28]
set_property DIFF_TERM TRUE	[get_ports CTRLBUS_P_28]

set_property PACKAGE_PIN AJ29	[get_ports CTRLBUS_P_40]
set_property PACKAGE_PIN AK29	[get_ports CTRLBUS_N_40]
set_property IOSTANDARD LVDS	[get_ports CTRLBUS_P_40]
set_property DIFF_TERM TRUE	[get_ports CTRLBUS_P_40]



#EXT_V7 lines to CTP over extension module (U5 is the FMC connector)
set_property PACKAGE_PIN A28	[get_ports EXT_V7_P_22]		# U5(E2)
set_property PACKAGE_PIN A29	[get_ports EXT_V7_N_22]		# U5(E3)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_22]

set_property PACKAGE_PIN D29	[get_ports EXT_V7_P_23]		# U5(D8)
set_property PACKAGE_PIN C29	[get_ports EXT_V7_N_23]		# U5(D9)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_23]

set_property PACKAGE_PIN C27	[get_ports EXT_V7_P_24]		# U5(F4)
set_property PACKAGE_PIN B27	[get_ports EXT_V7_N_24]		# U5(F5)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_24]

set_property PACKAGE_PIN C28	[get_ports EXT_V7_P_25]		# U5(D4)
set_property PACKAGE_PIN B28	[get_ports EXT_V7_N_25]		# U5(D5)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_25]

set_property PACKAGE_PIN B26	[get_ports EXT_V7_P_26]		# U5(E6)
set_property PACKAGE_PIN A26	[get_ports EXT_V7_N_26]		# U5(E7)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_26]

set_property PACKAGE_PIN D26	[get_ports EXT_V7_P_27]		# U5(C10)
set_property PACKAGE_PIN D27	[get_ports EXT_V7_N_27]		# U5(C11)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_27]

set_property PACKAGE_PIN G28	[get_ports EXT_V7_P_28]		# U5(D12)
set_property PACKAGE_PIN F28	[get_ports EXT_V7_N_28]		# U5(D13)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_28]

set_property PACKAGE_PIN F26	[get_ports EXT_V7_P_29]		# U5(E10)
set_property PACKAGE_PIN E26	[get_ports EXT_V7_N_29]		# U5(E11)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_29]

set_property PACKAGE_PIN F29	[get_ports EXT_V7_P_30]		# U5(E34)
set_property PACKAGE_PIN E29	[get_ports EXT_V7_N_30]		# U5(E35)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_30]

set_property PACKAGE_PIN E27	[get_ports EXT_V7_P_31]		# U5(E38)
set_property PACKAGE_PIN E28	[get_ports EXT_V7_N_31]		# U5(E39)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_31]

set_property PACKAGE_PIN H27	[get_ports EXT_V7_P_32]		# U5(C14)
set_property PACKAGE_PIN G27	[get_ports EXT_V7_N_32]		# U5(C15)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_32]

set_property PACKAGE_PIN K28	[get_ports EXT_V7_P_33]		# U5(D17)
set_property PACKAGE_PIN J29	[get_ports EXT_V7_N_33]		# U5(D16)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_33]

set_property PACKAGE_PIN N30	[get_ports EXT_V7_P_34]		# U5(E26)
set_property PACKAGE_PIN M30	[get_ports EXT_V7_N_34]		# U5(E27)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_34]

set_property PACKAGE_PIN L28	[get_ports EXT_V7_P_35]		# U5(E30)
set_property PACKAGE_PIN K29	[get_ports EXT_V7_N_35]		# U5(E31)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_35]

set_property PACKAGE_PIN N28	[get_ports EXT_V7_P_36]		# U5(C18)
set_property PACKAGE_PIN N29	[get_ports EXT_V7_N_36]		# U5(C19)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_36]

set_property PACKAGE_PIN M28	[get_ports EXT_V7_P_37]		# U5(E14)
set_property PACKAGE_PIN L29	[get_ports EXT_V7_N_37]		# U5(E15)
set_property IOSTANDARD LVDS 	[get_ports EXT_V7_P_37]

