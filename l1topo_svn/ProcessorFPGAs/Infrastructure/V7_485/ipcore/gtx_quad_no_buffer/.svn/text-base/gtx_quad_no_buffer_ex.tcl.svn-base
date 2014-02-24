#-------------------------------------------------------------
# Generated Example Tcl script for IP 'gtx_quad_no_buffer' (xilinx.com:ip:gtwizard:2.6)
#-------------------------------------------------------------

# Create project
create_project -name gtx_quad_no_buffer_example -force
set_property part xc7vx485tffg1927-2 [current_project]
set_property target_language vhdl [current_project]

# Import the original IP
import_ip -files {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer.xci} -name gtx_quad_no_buffer

# Generate the IP
reset_target {all} [get_ips gtx_quad_no_buffer]
proc _filter_supported_targets {targets ip} { set all [get_property SUPPORTED_TARGETS $ip]; set res {}; foreach a_target $targets { lappend res {*}[lsearch -all -inline -nocase $all $a_target] }; return $res }
generate_target [_filter_supported_targets {instantiation_template synthesis simulation} [get_ips gtx_quad_no_buffer]] [get_ips gtx_quad_no_buffer]

# Add example synthesis HDL files
add_files -scan_for_includes -fileset [current_fileset] { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_auto_phase_align.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_clock_module.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_exdes.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_gt_frame_check.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_gt_frame_gen.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_gt_usrclk_source.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_init.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_recclk_monitor.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_rx_manual_phase_align.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_rx_startup_fsm.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_tx_manual_phase_align.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_sync_pulse.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_tx_startup_fsm.vhd} }

# Add example miscellaneous synthesis files
add_files -fileset [current_fileset] { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gt_rom_init_rx.dat} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gt_rom_init_tx.dat} }

# Add example XDC files
add_files -fileset [current_fileset -constrset] { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/example_design/gtx_quad_no_buffer_exdes.xdc} }

# Add example simulation files
if { [catch {current_fileset -simset} exc] } {
  # Create default simset
  create_fileset -simset sim_1
}
add_files -scan_for_includes -fileset [current_fileset -simset] { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/simulation/gtx_quad_no_buffer_tb.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/simulation/gtx_quad_no_buffer_config_gtmodel.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/simulation/sim_reset_gt_model.vhd} }

# Add example miscellaneous simulation files
if { [catch {current_fileset -simset} exc] } {
  # Create default simset
  create_fileset -simset sim_1
}
add_files -fileset [current_fileset -simset] { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/simulation/functional/gt_rom_init_rx.dat} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/gtx_quad_no_buffer/simulation/functional/gt_rom_init_tx.dat} }

# Import all files while preserving hierarchy
import_files

# Set top
set_property TOP [lindex [find_top] 0] [current_fileset]

# Source script extension file(s)
source {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/gtx_quad_no_buffer/tcl/set_top.tcl}

