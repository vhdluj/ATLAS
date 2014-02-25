
set_property PACKAGE_PIN K27 [get_ports GCK2_IN_P]
set_property IOSTANDARD LVDS [get_ports GCK2_IN_P]
set_property PACKAGE_PIN J27 [get_ports GCK2_IN_N]
set_property IOSTANDARD LVDS [get_ports GCK2_IN_N]


create_clock -period 24.950 -name GCK2_IN_P [get_ports GCK2_IN_P]

set_property PACKAGE_PIN A28 [get_ports LED_OUT]
set_property IOSTANDARD LVCMOS18 [get_ports LED_OUT]

##U1#############################################################################################
## IPBUS LVDS PAIRS:
##line 1 - line refers to the line on L1Topo schematics. Line connects the kintex pins with virtex pins.
#set_property PACKAGE_PIN BB30 [get_ports {CTRLIPBUS_P_IN[0]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[0]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[0]}]
#set_property PACKAGE_PIN BC30 [get_ports {CTRLIPBUS_N_IN[0]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_IN[0]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_IN[0]}]
##line 3
#set_property PACKAGE_PIN BA29 [get_ports {CTRLIPBUS_P_IN[1]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[1]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[1]}]
#set_property PACKAGE_PIN BA30 [get_ports {CTRLIPBUS_N_IN[1]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_IN[1]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_IN[1]}]
##line 4
#set_property PACKAGE_PIN AW29 [get_ports {CTRLIPBUS_P_IN[2]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[2]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[2]}]
#set_property PACKAGE_PIN AY29 [get_ports {CTRLIPBUS_N_IN[2]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_IN[2]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_IN[2]}]
##line 6
#set_property PACKAGE_PIN AY31 [get_ports {CTRLIPBUS_P_IN[3]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[3]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[3]}]
#set_property PACKAGE_PIN BA31 [get_ports {CTRLIPBUS_N_IN[3]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_IN[3]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_IN[3]}]
##line 8
#set_property PACKAGE_PIN AW30 [get_ports {CTRLIPBUS_P_IN[4]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[4]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[4]}]
#set_property PACKAGE_PIN AW31 [get_ports {CTRLIPBUS_N_IN[4]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_IN[4]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_IN[4]}]
##line 10\\
#set_property PACKAGE_PIN AU30 [get_ports {CTRLIPBUS_P_OUT[0]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_OUT[0]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_OUT[0]}]
#set_property PACKAGE_PIN AV30 [get_ports {CTRLIPBUS_N_OUT[0]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_OUT[0]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_OUT[0]}]
##line 11
#set_property PACKAGE_PIN AU28 [get_ports {CTRLIPBUS_P_OUT[1]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_OUT[1]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_OUT[1]}]
#set_property PACKAGE_PIN AV29 [get_ports {CTRLIPBUS_N_OUT[1]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_OUT[1]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_OUT[1]}]
##line 12
#set_property PACKAGE_PIN AT28 [get_ports {CTRLIPBUS_P_OUT[2]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_OUT[2]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_OUT[2]}]
#set_property PACKAGE_PIN AT29 [get_ports {CTRLIPBUS_N_OUT[2]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_OUT[2]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_OUT[2]}]
###line 13 TTC
##set_property PACKAGE_PIN AP29 [get_ports {CTRLBUS_IN_P[8]}]
##set_property IOSTANDARD LVDS [get_ports {CTRLBUS_IN_P[8]}]
##set_property DIFF_TERM TRUE [get_ports {CTRLBUS_IN_P[8]}]
##set_property PACKAGE_PIN AP30 [get_ports {CTRLBUS_IN_N[8]}]
##set_property IOSTANDARD LVDS [get_ports {CTRLBUS_IN_N[8]}]
##set_property DIFF_TERM TRUE [get_ports {CTRLBUS_IN_N[8]}]
###LVDS_PAIRS===============================================
##line 0
#set_property PACKAGE_PIN BD29 [get_ports {CTRLBUS_P[0]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[0]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[0]}]
#set_property PACKAGE_PIN BD30 [get_ports {CTRLBUS_N[0]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[0]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[0]}]
##line2
#set_property PACKAGE_PIN BC28 [get_ports {CTRLBUS_P[1]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[1]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[1]}]
#set_property PACKAGE_PIN BC29 [get_ports {CTRLBUS_N[1]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[1]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[1]}]
##line 5
#set_property PACKAGE_PIN AW27 [get_ports {CTRLBUS_P[2]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[2]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[2]}]
#set_property PACKAGE_PIN AY27 [get_ports {CTRLBUS_N[2]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[2]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[2]}]
##line 7
#set_property PACKAGE_PIN AY28 [get_ports {CTRLBUS_P[3]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[3]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[3]}]
#set_property PACKAGE_PIN BA28 [get_ports {CTRLBUS_N[3]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[3]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[3]}]
## line 9
#set_property PACKAGE_PIN AV27 [get_ports {CTRLBUS_P[4]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[4]}]
#set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[4]}]
#set_property PACKAGE_PIN AV28 [get_ports {CTRLBUS_N[4]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[4]}]
#set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[4]}]
##line 14
#set_property PACKAGE_PIN AR28 [get_ports {CTRLBUS_P[5]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[5]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[5]}]
#set_property PACKAGE_PIN AR29 [get_ports {CTRLBUS_N[5]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[5]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[5]}]
##line15
#set_property PACKAGE_PIN AN28 [get_ports {CTRLBUS_P[6]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[6]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[6]}]
#set_property PACKAGE_PIN AN29 [get_ports {CTRLBUS_N[6]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[6]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[6]}]
##line 16
#set_property PACKAGE_PIN AM30 [get_ports {CTRLBUS_P[7]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[7]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[7]}]
#set_property PACKAGE_PIN AN30 [get_ports {CTRLBUS_N[7]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[7]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[7]}]
##line 17
#set_property PACKAGE_PIN AK27 [get_ports {CTRLBUS_P[8]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[8]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[8]}]
#set_property PACKAGE_PIN AK28 [get_ports {CTRLBUS_N[8]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[8]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[8]}]
##line 18
#set_property PACKAGE_PIN AM27 [get_ports {CTRLBUS_P[9]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[9]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[9]}]
#set_property PACKAGE_PIN AM28 [get_ports {CTRLBUS_N[9]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[9]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[9]}]
###control line 19
#set_property PACKAGE_PIN AJ29 [get_ports {CTRLBUS_P_IN}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_IN}]
#set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P_IN}]
#set_property PACKAGE_PIN AK29 [get_ports {CTRLBUS_N_IN}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_IN}]
#set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N_IN}]
##line 20
#set_property PACKAGE_PIN AL28 [get_ports {CTRLBUS_P[10]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[10]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[10]}]
#set_property PACKAGE_PIN AL29 [get_ports {CTRLBUS_N[10]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[10]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[10]}]

#U2#############################################################################################
# IPBUS LVDS PAIRS:
#line 21
set_property PACKAGE_PIN BD29 [get_ports {CTRLIPBUS_P_IN[0]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[0]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[0]}]
set_property PACKAGE_PIN BD30 [get_ports {CTRLIPBUS_N_IN[0]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_IN[0]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_IN[0]}]
#line 22
set_property PACKAGE_PIN BB30 [get_ports {CTRLIPBUS_P_IN[1]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[1]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[1]}]
set_property PACKAGE_PIN BC30 [get_ports {CTRLIPBUS_N_IN[1]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_IN[1]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_IN[1]}]
#line 23
set_property PACKAGE_PIN BC28 [get_ports {CTRLIPBUS_P_IN[2]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[2]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[2]}]
set_property PACKAGE_PIN BC29 [get_ports {CTRLIPBUS_N_IN[2]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_IN[2]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_IN[2]}]
#line 24
set_property PACKAGE_PIN BA29 [get_ports {CTRLIPBUS_P_IN[3]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[3]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[3]}]
set_property PACKAGE_PIN BA30 [get_ports {CTRLIPBUS_N_IN[3]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_IN[3]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_IN[3]}]
#line 25
set_property PACKAGE_PIN AW29 [get_ports {CTRLIPBUS_P_IN[4]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[4]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[4]}]
set_property PACKAGE_PIN AY29 [get_ports {CTRLIPBUS_N_IN[4]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_IN[4]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_IN[4]}]
#line 26
set_property PACKAGE_PIN AW27 [get_ports {CTRLIPBUS_P_OUT[0]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_OUT[0]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_OUT[0]}]
set_property PACKAGE_PIN AY27 [get_ports {CTRLIPBUS_N_OUT[0]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_OUT[0]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_OUT[0]}]
#line 28
set_property PACKAGE_PIN AY28 [get_ports {CTRLIPBUS_P_OUT[1]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_OUT[1]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_OUT[1]}]
set_property PACKAGE_PIN BA28 [get_ports {CTRLIPBUS_N_OUT[1]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_OUT[1]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_OUT[1]}]
#line 34 TTC
#set_property PACKAGE_PIN AP29 [get_ports {CTRLIPBUS_P_IN[7]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_IN[7]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_IN[7]}]
#set_property PACKAGE_PIN AP30 [get_ports {CTRLBUS_IN_N[7]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_IN_N[7]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_IN_N[7]}]
#line 40 
set_property PACKAGE_PIN AJ29 [get_ports {CTRLIPBUS_P_OUT[2]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_P_OUT[2]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_P_OUT[2]}]
set_property PACKAGE_PIN AK29 [get_ports {CTRLIPBUS_N_OUT[2]}]
set_property IOSTANDARD LVDS [get_ports {CTRLIPBUS_N_OUT[2]}]
set_property DIFF_TERM TRUE [get_ports {CTRLIPBUS_N_OUT[2]}]
#LVDS_PAIRS===============================================
#line 30
set_property PACKAGE_PIN AV27 [get_ports {CTRLBUS_P[0]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[0]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[0]}]
set_property PACKAGE_PIN AV28 [get_ports {CTRLBUS_N[0]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[0]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[0]}]
#line 33
set_property PACKAGE_PIN AT28 [get_ports {CTRLBUS_P[1]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[1]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[1]}]
set_property PACKAGE_PIN AT29 [get_ports {CTRLBUS_N[1]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[1]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[1]}]
#line 35
set_property PACKAGE_PIN AR28 [get_ports {CTRLBUS_P[2]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[2]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[2]}]
set_property PACKAGE_PIN AR29 [get_ports {CTRLBUS_N[2]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[2]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[2]}]
#line 36
set_property PACKAGE_PIN AN28 [get_ports {CTRLBUS_P[3]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[3]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[3]}]
set_property PACKAGE_PIN AN29 [get_ports {CTRLBUS_N[3]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[3]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[3]}]
##control line 39
set_property PACKAGE_PIN AM27 [get_ports {CTRLBUS_P_IN}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_IN}]
set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P_IN}]
set_property PACKAGE_PIN AM28 [get_ports {CTRLBUS_N_IN}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_IN}]
set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N_IN}]
#line 27
set_property PACKAGE_PIN AY31 [get_ports {CTRLBUS_P[4]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[4]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[4]}]
set_property PACKAGE_PIN BA31 [get_ports {CTRLBUS_N[4]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[4]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[4]}]
#line 29
set_property PACKAGE_PIN AW30 [get_ports {CTRLBUS_P[5]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[5]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[5]}]
set_property PACKAGE_PIN AW31 [get_ports {CTRLBUS_N[5]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[5]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[5]}]
#line 31
set_property PACKAGE_PIN AU30 [get_ports {CTRLBUS_P[6]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[6]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[6]}]
set_property PACKAGE_PIN AV30 [get_ports {CTRLBUS_N[6]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[6]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[6]}]
#line 32
set_property PACKAGE_PIN AU28 [get_ports {CTRLBUS_P[7]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[7]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[7]}]
set_property PACKAGE_PIN AV29 [get_ports {CTRLBUS_N[7]}]
set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[7]}]
set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[7]}]
##line 37
#set_property PACKAGE_PIN AM30 [get_ports {CTRLBUS_P[8]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[8]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[8]}]
#set_property PACKAGE_PIN AN30 [get_ports {CTRLBUS_N[8]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[8]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[8]}]
##line 38
#set_property PACKAGE_PIN AK27 [get_ports {CTRLBUS_P[9]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[9]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[9]}]
#set_property PACKAGE_PIN AK28 [get_ports {CTRLBUS_N[9]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[9]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[9]}]
##line 41
#set_property PACKAGE_PIN AL28 [get_ports {CTRLBUS_P[10]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[10]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_P[10]}]
#set_property PACKAGE_PIN AL29 [get_ports {CTRLBUS_N[10]}]
#set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[10]}]
#set_property DIFF_TERM TRUE [get_ports {CTRLBUS_N[10]}]






                    #OLD SET
                    #set_property PACKAGE_PIN BD29 [get_ports {CTRLBUS_P[0]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[0]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[0]}]
                    #set_property PACKAGE_PIN BD30 [get_ports {CTRLBUS_N[0]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[0]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[0]}]
                    
                    #set_property PACKAGE_PIN BC28 [get_ports {CTRLBUS_P[1]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[1]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[1]}]
                    #set_property PACKAGE_PIN BC29 [get_ports {CTRLBUS_N[1]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[1]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[1]}]
                    
                    #set_property PACKAGE_PIN AW27 [get_ports {CTRLBUS_P[2]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[2]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[2]}]
                    #set_property PACKAGE_PIN AY27 [get_ports {CTRLBUS_N[2]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[2]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[2]}]
                    
                    #set_property PACKAGE_PIN AY28 [get_ports {CTRLBUS_P[3]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[3]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[3]}]
                    #set_property PACKAGE_PIN BA28 [get_ports {CTRLBUS_N[3]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[3]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[3]}]
                    
                    #set_property PACKAGE_PIN AV27 [get_ports {CTRLBUS_P[4]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[4]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[4]}]
                    #set_property PACKAGE_PIN AV28 [get_ports {CTRLBUS_N[4]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[4]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[4]}]
                    
                    #set_property PACKAGE_PIN AP29 [get_ports {CTRLBUS_P[5]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[5]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[5]}]
                    #set_property PACKAGE_PIN AP30 [get_ports {CTRLBUS_N[5]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[5]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[5]}]
                    
                    #set_property PACKAGE_PIN AR28 [get_ports {CTRLBUS_P[6]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[6]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[6]}]
                    #set_property PACKAGE_PIN AR29 [get_ports {CTRLBUS_N[6]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[6]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[6]}]
                    
                    #set_property PACKAGE_PIN AN28 [get_ports {CTRLBUS_P[7]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[7]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[7]}]
                    #set_property PACKAGE_PIN AN29 [get_ports {CTRLBUS_N[7]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[7]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[7]}]
                    ##control
                    #set_property PACKAGE_PIN AM30 [get_ports {CTRLBUS_P_IN}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_IN}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P_IN}]
                    #set_property PACKAGE_PIN AN30 [get_ports {CTRLBUS_N_IN}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_IN}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N_IN}]
                    ##########################
                    #set_property PACKAGE_PIN AK27 [get_ports {CTRLBUS_P[9]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[9]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[9]}]
                    #set_property PACKAGE_PIN AK28 [get_ports {CTRLBUS_N[9]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[9]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[9]}]
                    
                    #set_property PACKAGE_PIN AM27 [get_ports {CTRLBUS_P[10]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[10]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[10]}]
                    #set_property PACKAGE_PIN AM28 [get_ports {CTRLBUS_N[10]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[10]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[10]}]
                    
                    #set_property PACKAGE_PIN AJ29 [get_ports {CTRLBUS_P[11]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P[11]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P[11]}]
                    #set_property PACKAGE_PIN AK29 [get_ports {CTRLBUS_N[11]}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N[11]}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N[11]}]
                    
                    #set_property PACKAGE_PIN AL28 [get_ports {CTRLBUS_P_IN}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_P_IN}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_P_IN}]
                    #set_property PACKAGE_PIN AL29 [get_ports {CTRLBUS_N_IN}]
                    #set_property IOSTANDARD LVDS [get_ports {CTRLBUS_N_IN}]
                    #set_property DIFF_TERM FALSE [get_ports {CTRLBUS_N_IN}]

##################################################################


#make_diff_pair_ports CTRLBUS_P_IN CTRLBUS_N_IN
#set_property PACKAGE_PIN AJ29 [get_ports CTRLBUS_P_IN]