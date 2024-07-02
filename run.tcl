#=============================================================================
# run.tcl 
#=============================================================================

#------------------------------------------------------
# Set result filename and clean old data
#------------------------------------------------------
set filename "float_result.csv"
file delete -force "./result/${filename}"

# Project name
set hls_prj "fp4_fma.prj"

# Open/reset the project
open_project ${hls_prj} -reset
# Top function of the design is "fma"
set_top fma

# Add design and testbench files
add_files fp4.cpp
add_files -tb fp4_test.cpp

open_solution "solution1"
# Use Zynq device
set_part {xc7z020clg484-1}

# Target clock period is 10ns
create_clock -period 10

# Simulate the C++ design
csim_design
# Synthesis the design
csynth_design

#cosim_design

exit
