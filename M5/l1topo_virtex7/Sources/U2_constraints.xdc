set_property PACKAGE_PIN H28 [get_ports GCK1_CLK_P]
set_property IOSTANDARD LVDS [get_ports GCK1_CLK_P]
set_property PACKAGE_PIN H29 [get_ports GCK1_CLK_N]
set_property IOSTANDARD LVDS [get_ports GCK1_CLK_N]
create_clock -period 24.95 -name GCK1_CLK -waveform {0.000 12.475} [get_ports GCK1_CLK_P]

set_property PACKAGE_PIN K27 [get_ports GCK2_CLK_P]
set_property IOSTANDARD LVDS [get_ports GCK2_CLK_P]
set_property PACKAGE_PIN J27 [get_ports GCK2_CLK_N]
set_property IOSTANDARD LVDS [get_ports GCK2_CLK_N]
create_clock -period 24.95 -name GCK2_CLK -waveform {0.000 12.475} [get_ports GCK2_CLK_P]

set_property PACKAGE_PIN AF8 [get_ports {MGT3_CLK_P[10]}]
set_property PACKAGE_PIN AF7 [get_ports {MGT3_CLK_N[10]}]
set_property PACKAGE_PIN AH8 [get_ports {MGT4_CLK_P[10]}]
set_property PACKAGE_PIN AH7 [get_ports {MGT4_CLK_N[10]}]
create_clock -period 6.2375 -name MGT3_CLK -waveform {0.000 3.11876} [get_ports {MGT3_CLK_P[10]}]
create_clock -period 6.2375 -name MGT4_CLK -waveform {0.000 3.11876} [get_ports {MGT4_CLK_P[10]}]

set_property PACKAGE_PIN AE6 [get_ports OPTO9_P[8]]
set_property PACKAGE_PIN AE5 [get_ports OPTO9_N[8]]
set_property PACKAGE_PIN AG6 [get_ports OPTO9_P[9]]
set_property PACKAGE_PIN AG5 [get_ports OPTO9_N[9]]
set_property PACKAGE_PIN AJ6 [get_ports OPTO9_P[10]]
set_property PACKAGE_PIN AJ5 [get_ports OPTO9_N[10]]
set_property PACKAGE_PIN AK8 [get_ports OPTO9_P[11]]
set_property PACKAGE_PIN AK7 [get_ports OPTO9_N[11]]

set_property PACKAGE_PIN AG2 [get_ports OPTO_T2_P[8]]
set_property PACKAGE_PIN AG1 [get_ports OPTO_T2_N[8]]
set_property PACKAGE_PIN AH4 [get_ports OPTO_T2_P[9]]
set_property PACKAGE_PIN AH3 [get_ports OPTO_T2_N[9]]
set_property PACKAGE_PIN AJ2 [get_ports OPTO_T2_P[10]]
set_property PACKAGE_PIN AJ1 [get_ports OPTO_T2_N[10]]
set_property PACKAGE_PIN AK4 [get_ports OPTO_T2_P[11]]
set_property PACKAGE_PIN AK3 [get_ports OPTO_T2_N[11]]

set_property PACKAGE_PIN BD29 [get_ports {CTRLBUS_P_21}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_21}]
set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P_21}]
set_property PACKAGE_PIN BD30 [get_ports {CTRLBUS_N_21}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_21}]
set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N_21}]

set_property PACKAGE_PIN BB30 [get_ports {CTRLBUS_P_22}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_22}]
set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P_22}]
set_property PACKAGE_PIN BC30 [get_ports {CTRLBUS_N_22}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_22}]
set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N_22}]

set_property PACKAGE_PIN BC28 [get_ports {CTRLBUS_P_23}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_23}]
set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P_23}]
set_property PACKAGE_PIN BC29 [get_ports {CTRLBUS_N_23}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_23}]
set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N_23}]

set_property PACKAGE_PIN BA29 [get_ports {CTRLBUS_P_24}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_24}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_24}]
set_property PACKAGE_PIN BA30 [get_ports {CTRLBUS_N_24}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_24}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_24}]

set_property PACKAGE_PIN AW29 [get_ports {CTRLBUS_P_25}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_25}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_25}]
set_property PACKAGE_PIN AY29 [get_ports {CTRLBUS_N_25}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_25}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_25}]

set_property PACKAGE_PIN AW27 [get_ports {CTRLBUS_P_26}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_26}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_26}]
set_property PACKAGE_PIN AY27 [get_ports {CTRLBUS_N_26}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_26}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_26}]

set_property PACKAGE_PIN AY31 [get_ports {CTRLBUS_P_27}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_27}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_27}]
set_property PACKAGE_PIN BA31 [get_ports {CTRLBUS_N_27}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_27}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_27}]

set_property PACKAGE_PIN AY28 [get_ports {CTRLBUS_P_28}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_28}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_28}]
set_property PACKAGE_PIN BA28 [get_ports {CTRLBUS_N_28}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_28}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_28}]


set_property PACKAGE_PIN AV27 [get_ports {CTRLBUS_P_30}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_30}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_30}]
set_property PACKAGE_PIN AV28 [get_ports {CTRLBUS_N_30}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_30}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_30}]

set_property PACKAGE_PIN AU30 [get_ports {CTRLBUS_P_31}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_31}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_31}]
set_property PACKAGE_PIN AV30 [get_ports {CTRLBUS_N_31}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_31}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_31}]

set_property PACKAGE_PIN AU28 [get_ports {CTRLBUS_P_32}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_32}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_32}]
set_property PACKAGE_PIN AV29 [get_ports {CTRLBUS_N_32}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_32}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_32}]

set_property PACKAGE_PIN AT28 [get_ports {CTRLBUS_P_33}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_33}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_33}]
set_property PACKAGE_PIN AT29 [get_ports {CTRLBUS_N_33}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_33}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_33}]

#set_property PACKAGE_PIN AP29 [get_ports {CTRLBUS_P_34}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_34}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_34}]
#set_property PACKAGE_PIN AP30 [get_ports {CTRLBUS_N_34}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_34}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_34}]
set_property PACKAGE_PIN AM27 [get_ports {CTRLBUS_P_39}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_39}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_39}]
set_property PACKAGE_PIN AM28 [get_ports {CTRLBUS_N_39}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_39}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_39}]




set_property PACKAGE_PIN AJ29 [get_ports {CTRLBUS_P_40}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_40}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P_40}]
set_property PACKAGE_PIN AK29 [get_ports {CTRLBUS_N_40}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_40}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N_40}]


###################################
### ROD BUS marek.palka@cern.ch, g.korcyl@uj.edu.pl
###################################

set_property IOSTANDARD LVDS [get_ports CTRLBUS_P*]
set_property IOSTANDARD LVDS [get_ports CTRLBUS_N*]

#set_property IOSTANDARD LVDS [get_ports ROD_CONTROL_P_IN]
#set_property IOSTANDARD LVDS [get_ports ROD_CONTROL_N_IN]
set_property IOSTANDARD LVDS [get_ports KINTEX_READY_P_IN]
set_property IOSTANDARD LVDS [get_ports KINTEX_READY_N_IN]


set_property IOSTANDARD LVDS [get_ports BUSY_TO_KINTEX_P]
set_property IOSTANDARD LVDS [get_ports BUSY_TO_KINTEX_N]

set_property IOSTANDARD LVDS [get_ports L1_ACCEPTED_IN_P]
set_property IOSTANDARD LVDS [get_ports L1_ACCEPTED_IN_N]

set_input_delay -clock [get_clocks clk_40_virtex_clocks] -add_delay 12.000 [get_ports L1_ACCEPTED_IN_P]

set_property PACKAGE_PIN AY31 [get_ports {CTRLBUS_P[0]}]
set_property PACKAGE_PIN AW30 [get_ports {CTRLBUS_P[1]}]
set_property PACKAGE_PIN AV27 [get_ports {CTRLBUS_P[2]}]
set_property PACKAGE_PIN AU30 [get_ports {CTRLBUS_P[3]}]
set_property PACKAGE_PIN AU28 [get_ports {CTRLBUS_P[4]}]
set_property PACKAGE_PIN AT28 [get_ports {CTRLBUS_P[5]}]
set_property PACKAGE_PIN AR28 [get_ports {CTRLBUS_P[6]}]
set_property PACKAGE_PIN AN28 [get_ports {CTRLBUS_P[7]}]
set_property PACKAGE_PIN AK27 [get_ports BUSY_TO_KINTEX_P]
set_property PACKAGE_PIN AL28 [get_ports L1_ACCEPTED_IN_P]
#set_property PACKAGE_PIN AM30 [get_ports ROD_CONTROL_P_IN]
set_property PACKAGE_PIN AM30 [get_ports KINTEX_READY_P_IN]

set_property OFFCHIP_TERM NONE [get_ports {BUSY_TO_KINTEX_P}]
set_property OFFCHIP_TERM NONE [get_ports {CTRLBUS_P[0]}]
set_property OFFCHIP_TERM NONE [get_ports {CTRLBUS_P[1]}]
set_property OFFCHIP_TERM NONE [get_ports {CTRLBUS_P[2]}]
set_property OFFCHIP_TERM NONE [get_ports {CTRLBUS_P[3]}]
set_property OFFCHIP_TERM NONE [get_ports {CTRLBUS_P[4]}]
set_property OFFCHIP_TERM NONE [get_ports {CTRLBUS_P[5]}]
set_property OFFCHIP_TERM NONE [get_ports {CTRLBUS_P[6]}]
set_property OFFCHIP_TERM NONE [get_ports {CTRLBUS_P[7]}]

