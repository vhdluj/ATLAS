#-------------------------------------------------------------
# Generated Example Tcl script for IP 'DCM' (xilinx.com:ip:clk_wiz:5.0)
#-------------------------------------------------------------

# Create project
create_project -name DCM_example -force
set_property part xc7vx485tffg1927-2 [current_project]
set_property target_language vhdl [current_project]

# Import the original IP
import_ip -files {/home/edma/V7_INPUT_BRAM/GODVERDOMME.srcs/sources_1/ip/DCM/DCM.xci} -name DCM

# Generate the IP
reset_target {all} [get_ips DCM]
proc _filter_supported_targets {targets ip} { set all [get_property SUPPORTED_TARGETS $ip]; set res {}; foreach a_target $targets { lappend res {*}[lsearch -all -inline -nocase $all $a_target] }; return $res }
generate_target [_filter_supported_targets {instantiation_template synthesis simulation} [get_ips DCM]] [get_ips DCM]

# Add example synthesis HDL files
add_files -scan_for_includes -fileset [current_fileset] { {/home/edma/V7_INPUT_BRAM/GODVERDOMME.srcs/sources_1/ip/DCM/DCM/example_design/DCM_exdes.vhd} }

# Add example XDC files
add_files -fileset [current_fileset -constrset] { {/home/edma/V7_INPUT_BRAM/GODVERDOMME.srcs/sources_1/ip/DCM/DCM/example_design/DCM_exdes.xdc} }

# Add example simulation files
if { [catch {current_fileset -simset} exc] } {
  # Create default simset
  create_fileset -simset sim_1
}
add_files -scan_for_includes -fileset [current_fileset -simset] { {/home/edma/V7_INPUT_BRAM/GODVERDOMME.srcs/sources_1/ip/DCM/DCM/simulation/DCM_tb.vhd} }

# Import all files while preserving hierarchy
import_files

# Set top
set_property TOP [lindex [find_top] 0] [current_fileset]

