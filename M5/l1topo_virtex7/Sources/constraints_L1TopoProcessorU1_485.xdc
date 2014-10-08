#TTC Clock Pins
set_property PACKAGE_PIN H28 [get_ports GCK1_P]
set_property IOSTANDARD LVDS [get_ports GCK1_P]
set_property IOSTANDARD LVDS [get_ports GCK1_N]
create_clock -period 24.98 -name GCK1_CLK -waveform {0.000 12.475} [get_ports GCK1_P]

#Crystal Clock Pins
set_property PACKAGE_PIN K27 [get_ports GCK2_P]
set_property IOSTANDARD LVDS [get_ports GCK2_P]
set_property IOSTANDARD LVDS [get_ports GCK2_N]
create_clock -period 24.98 -name GCK2_CLK -waveform {0.000 12.475} [get_ports GCK2_P]

#LED20 of ExtBoard (Rev2)
set_property PACKAGE_PIN U28 [get_ports EXT_V7_N_21]
set_property IOSTANDARD LVCMOS18 [get_ports EXT_V7_N_21]


#CTRLBUS line for incoming TTC signals
set_property PACKAGE_PIN BB30 [get_ports CTRLBUS_P_01]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_01]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_01]

set_property PACKAGE_PIN BC30 [get_ports CTRLBUS_N_01]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_01]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_01]

#CTRLBUS lines for idelay
set_property PACKAGE_PIN BA29 [get_ports CTRLBUS_P_03]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_03]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_03]

set_property PACKAGE_PIN BA30 [get_ports CTRLBUS_N_03]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_03]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_03]


set_property PACKAGE_PIN AW29 [get_ports CTRLBUS_P_04]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_04]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_04]

set_property PACKAGE_PIN AY29 [get_ports CTRLBUS_N_04]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_04]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_04]


set_property PACKAGE_PIN AY31 [get_ports CTRLBUS_P_06]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_06]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_06]

set_property PACKAGE_PIN BA31 [get_ports CTRLBUS_N_06]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_06]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_06]


set_property PACKAGE_PIN AW30 [get_ports CTRLBUS_P_08]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_08]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_08]

set_property PACKAGE_PIN AW31 [get_ports CTRLBUS_N_08]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_08]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_08]


set_property PACKAGE_PIN AJ29 [get_ports CTRLBUS_P_19]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_19]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_19]

set_property PACKAGE_PIN AK29 [get_ports CTRLBUS_N_19]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_19]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_19]



#CTRLBUS lines for IPbus
#
#the 3 outgoing line pairs 
set_property PACKAGE_PIN AU30 [get_ports CTRLBUS_P_10]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_10]
set_property DIFF_TERM FALSE [get_ports CTRLBUS_P_10]

set_property PACKAGE_PIN AV30 [get_ports CTRLBUS_N_10]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_10]
set_property DIFF_TERM FALSE [get_ports CTRLBUS_N_10]

set_property PACKAGE_PIN AU28 [get_ports CTRLBUS_P_11]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_11]
set_property DIFF_TERM FALSE [get_ports CTRLBUS_P_11]

set_property PACKAGE_PIN AV29 [get_ports CTRLBUS_N_11]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_11]
set_property DIFF_TERM FALSE [get_ports CTRLBUS_N_11]

set_property PACKAGE_PIN AT28 [get_ports CTRLBUS_P_12]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_12]
set_property DIFF_TERM FALSE [get_ports CTRLBUS_P_12]

set_property PACKAGE_PIN AT29 [get_ports CTRLBUS_N_12]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_12]
set_property DIFF_TERM FALSE [get_ports CTRLBUS_N_12]

#the 5 incoming line pairs
set_property PACKAGE_PIN AP29 [get_ports CTRLBUS_P_13]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_13]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_13]

set_property PACKAGE_PIN AP30 [get_ports CTRLBUS_N_13]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_13]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_13]

set_property PACKAGE_PIN AR28 [get_ports CTRLBUS_P_14]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_14]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_14]

set_property PACKAGE_PIN AR29 [get_ports CTRLBUS_N_14]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_14]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_14]

set_property PACKAGE_PIN AN28 [get_ports CTRLBUS_P_15]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_15]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_15]

set_property PACKAGE_PIN AN29 [get_ports CTRLBUS_N_15]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_15]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_15]

set_property PACKAGE_PIN AM30 [get_ports CTRLBUS_P_16]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_16]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_16]

set_property PACKAGE_PIN AN30 [get_ports CTRLBUS_N_16]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_16]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_16]

set_property PACKAGE_PIN AK27 [get_ports CTRLBUS_P_17]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_P_17]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_P_17]

set_property PACKAGE_PIN AK28 [get_ports CTRLBUS_N_17]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N_17]
set_property DIFF_TERM TRUE [get_ports CTRLBUS_N_17]



#Result output lines to CTP 
set_property PACKAGE_PIN C27 [get_ports {EXT_V7_P_02}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_02}]
set_property PACKAGE_PIN B27 [get_ports {EXT_V7_N_02}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_02}]

set_property PACKAGE_PIN C28 [get_ports {EXT_V7_P_03}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_03}]
set_property PACKAGE_PIN B28 [get_ports {EXT_V7_N_03}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_03}]

set_property PACKAGE_PIN B26 [get_ports {EXT_V7_P_04}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_04}]
set_property PACKAGE_PIN A26 [get_ports {EXT_V7_N_04}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_04}]

set_property PACKAGE_PIN D26 [get_ports {EXT_V7_P_05}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_05}]
set_property PACKAGE_PIN D27 [get_ports {EXT_V7_N_05}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_05}]

set_property PACKAGE_PIN G28 [get_ports {EXT_V7_P_06}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_06}]
set_property PACKAGE_PIN F28 [get_ports {EXT_V7_N_06}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_06}]

set_property PACKAGE_PIN F26 [get_ports {EXT_V7_P_07}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_07}]
set_property PACKAGE_PIN E26 [get_ports {EXT_V7_N_07}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_07}]

set_property PACKAGE_PIN F29 [get_ports {EXT_V7_P_08}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_08}]
set_property PACKAGE_PIN E29 [get_ports {EXT_V7_N_08}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_08}]

set_property PACKAGE_PIN E27 [get_ports {EXT_V7_P_09}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_09}]
set_property PACKAGE_PIN E28 [get_ports {EXT_V7_N_09}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_09}]

set_property PACKAGE_PIN H27 [get_ports {EXT_V7_P_10}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_10}]
set_property PACKAGE_PIN G27 [get_ports {EXT_V7_N_10}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_10}]

set_property PACKAGE_PIN K28 [get_ports {EXT_V7_P_11}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_11}]
set_property PACKAGE_PIN J29 [get_ports {EXT_V7_N_11}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_11}]

set_property PACKAGE_PIN N30 [get_ports {EXT_V7_P_12}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_12}]
set_property PACKAGE_PIN M30 [get_ports {EXT_V7_N_12}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_12}]

set_property PACKAGE_PIN L28 [get_ports {EXT_V7_P_13}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_13}]
set_property PACKAGE_PIN K29 [get_ports {EXT_V7_N_13}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_13}]

set_property PACKAGE_PIN N28 [get_ports {EXT_V7_P_14}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_14}]
set_property PACKAGE_PIN N29 [get_ports {EXT_V7_N_14}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_14}]

set_property PACKAGE_PIN M28 [get_ports {EXT_V7_P_15}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_15}]
set_property PACKAGE_PIN L29 [get_ports {EXT_V7_N_15}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_15}]

set_property PACKAGE_PIN P29 [get_ports {EXT_V7_P_16}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_16}]
set_property PACKAGE_PIN P30 [get_ports {EXT_V7_N_16}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_16}]

set_property PACKAGE_PIN T28 [get_ports {EXT_V7_P_17}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_P_17}]
set_property PACKAGE_PIN T29 [get_ports {EXT_V7_N_17}]
set_property IOSTANDARD LVDS [get_ports {EXT_V7_N_17}]