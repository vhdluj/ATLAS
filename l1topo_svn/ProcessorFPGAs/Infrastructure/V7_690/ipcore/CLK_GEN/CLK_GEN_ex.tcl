#-------------------------------------------------------------
# Generated Example Tcl script for IP 'CLK_GEN' (xilinx.com:ip:clk_wiz:5.0)
#-------------------------------------------------------------

# Create project
create_project -name CLK_GEN_example -force
set_property part xc7vx485tffg1927-2 [current_project]
set_property target_language vhdl [current_project]

# Import the original IP
import_ip -files {e:/Vivado_Kiese_2013_2/Final/V7_485tffg1927_infrastructure/V7_485tffg1927_infrastructure.srcs/sources_1/ip/CLK_GEN/CLK_GEN.xci} -name CLK_GEN

# Generate the IP
reset_target {all} [get_ips CLK_GEN]
proc _filter_supported_targets {targets ip} { set all [get_property SUPPORTED_TARGETS $ip]; set res {}; foreach a_target $targets { lappend res {*}[lsearch -all -inline -nocase $all $a_target] }; return $res }
generate_target [_filter_supported_targets {instantiation_template synthesis simulation} [get_ips CLK_GEN]] [get_ips CLK_GEN]

# Add example synthesis HDL files
add_files -scan_for_includes -fileset [current_fileset] { {e:/Vivado_Kiese_2013_2/Final/V7_485tffg1927_infrastructure/V7_485tffg1927_infrastructure.srcs/sources_1/ip/CLK_GEN/CLK_GEN/example_design/CLK_GEN_exdes.vhd} }

# Add example XDC files
add_files -fileset [current_fileset -constrset] { {e:/Vivado_Kiese_2013_2/Final/V7_485tffg1927_infrastructure/V7_485tffg1927_infrastructure.srcs/sources_1/ip/CLK_GEN/CLK_GEN/example_design/CLK_GEN_exdes.xdc} }

# Add example simulation files
if { [catch {current_fileset -simset} exc] } {
  # Create default simset
  create_fileset -simset sim_1
}
add_files -scan_for_includes -fileset [current_fileset -simset] { {e:/Vivado_Kiese_2013_2/Final/V7_485tffg1927_infrastructure/V7_485tffg1927_infrastructure.srcs/sources_1/ip/CLK_GEN/CLK_GEN/simulation/CLK_GEN_tb.vhd} }

# Import all files while preserving hierarchy
import_files

# Set top
set_property TOP [lindex [find_top] 0] [current_fileset]

