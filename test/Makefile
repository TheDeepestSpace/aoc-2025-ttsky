# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= verilator
FST ?= -fst # Use more efficient FST format
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
PROJECT_SOURCES = \
	tt_um_aoc_2025.sv day10_wrapper.sv aoc-2025/src/axi_read_vector.sv aoc-2025/src/axi_stream_if.svh \
	aoc-2025/src/axi_write_vector.sv aoc-2025/src/configure_machine.sv aoc-2025/src/day10.sv \
	aoc-2025/src/day10_input.sv aoc-2025/src/day10_input_reader.sv aoc-2025/src/day10_output.sv \
	aoc-2025/src/day10_output_writer.sv aoc-2025/src/enumerate_solutions.sv aoc-2025/src/gf2_rref.sv \
	aoc-2025/src/popcount.sv aoc-2025/src/popcount_chain.sv

ifneq ($(GATES),yes)

# RTL simulation:
SIM_BUILD				= sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))

else

# Gate level simulation:
SIM_BUILD				= sim_build/gl
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/gate_level_netlist.v

endif

# Allow sharing configuration between design and testbench via `include`:
COMPILE_ARGS 		+= -I$(SRC_DIR) -I$(SRC_DIR)/aoc-2025

# Verilator warning flags (common suppressions for TinyTapeout projects):
COMPILE_ARGS 		+= -Wno-WIDTHEXPAND -Wno-WIDTHTRUNC -Wno-PINCONNECTEMPTY
COMPILE_ARGS 		+= -Wno-UNUSEDSIGNAL -Wno-UNUSEDPARAM -Wno-LITENDIAN

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/tb.v
TOPLEVEL = tb

# List test modules to run, separated by commas and without the .py suffix:
COCOTB_TEST_MODULES = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
