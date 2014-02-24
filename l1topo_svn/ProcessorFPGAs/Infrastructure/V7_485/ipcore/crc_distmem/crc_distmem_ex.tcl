#-------------------------------------------------------------
# Generated Example Tcl script for IP 'crc_distmem' (xilinx.com:ip:dist_mem_gen:8.0)
#-------------------------------------------------------------

# Create project
create_project -name crc_distmem_example -force
set_property part xc7vx485tffg1927-2 [current_project]
set_property target_language vhdl [current_project]

# Import the original IP
import_ip -files {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/crc_distmem/crc_distmem.xci} -name crc_distmem

# Generate the IP
reset_target {all} [get_ips crc_distmem]
proc _filter_supported_targets {targets ip} { set all [get_property SUPPORTED_TARGETS $ip]; set res {}; foreach a_target $targets { lappend res {*}[lsearch -all -inline -nocase $all $a_target] }; return $res }
generate_target [_filter_supported_targets {instantiation_template synthesis simulation} [get_ips crc_distmem]] [get_ips crc_distmem]

# Add example synthesis HDL files
add_files -scan_for_includes -fileset [current_fileset] { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/crc_distmem/crc_distmem/example_design/crc_distmem_exdes.vhd} }

# Add example XDC files
add_files -fileset [current_fileset -constrset] { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/crc_distmem/crc_distmem/example_design/crc_distmem_exdes.xdc} }

# Add example simulation files
if { [catch {current_fileset -simset} exc] } {
  # Create default simset
  create_fileset -simset sim_1
}
add_files -scan_for_includes -fileset [current_fileset -simset] { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/crc_distmem/crc_distmem/simulation/crc_distmem_tb_pkg.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/crc_distmem/crc_distmem/simulation/crc_distmem_tb_agen.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/crc_distmem/crc_distmem/simulation/crc_distmem_tb_stim_gen.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/crc_distmem/crc_distmem/simulation/crc_distmem_tb_synth.vhd} } { {e:/Vivado_Kiese_2013_2/July/L1TopoV7_485/L1TopoV7_485.srcs/sources_1/ip/crc_distmem/crc_distmem/simulation/crc_distmem_tb.vhd} }

# Import all files while preserving hierarchy
import_files

# Set top
set_property TOP [lindex [find_top] 0] [current_fileset]

