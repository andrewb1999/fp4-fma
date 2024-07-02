#==========================================================================
# Makefile
#==========================================================================

# Extract Vivado HLS include path
XILINX_VIVADO?=/opt/xilinx/Xilinx_Vivado_vitis_2019.2/Vivado/2019.2
XIL_HLS=source $(XILINX_VIVADO)/settings64.sh; vivado_hls
VHLS_INC=$(XILINX_VIVADO)/include
CXXFLAGS=-g -I${VHLS_INC}

.PHONY: all fp4 fixed clean fp4-sw fp4-hw

all: fp4

# Floating-point targets
fp4: fp4-sw fp4-hw

fp4-sw: fp4.hpp fp4.cpp fp4_test.cpp
	@echo "Compiling & executing SW fp4-fma implementation ..."
	g++ $(CXXFLAGS) fp4.cpp fp4_test.cpp -o $@
	./$@
 
# Make hw. Compile sw version to catch syntax errors quicker
fp4-hw: run.tcl fp4.cpp fp4.hpp fp4_test.cpp
	mkdir -p result
	$(XIL_HLS) -f run.tcl

# Clean up the directory before submission
clean:
	@echo "Clean up output files"
	rm -rf result *.prj *.log *.dat fp4-sw
