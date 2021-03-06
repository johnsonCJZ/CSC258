# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all verilog modules in mux.v to working dir;
# could also have multiple verilog files.
vlog -timescale 1ns/1ns Shifter_demo.v

# Load simulation using mux as the top level simulation module.
vsim Shifter_demo

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

#initialing using reset.
force {SW[7:0]} 00000000
force {SW[9]} 0
force {KEY[3:1]} 000
force {KEY[0]} 1 0, 0 10 
run 20ns

#Parallel loading the values 
force {SW[7:0]} 10000000
force {SW[9]} 1
force {KEY[3:1]} 000
force {KEY[0]} 1 0, 0 10 -r 20
run 20 ns

#Changing the values and seeing it not being loaded and only shifting
force {SW[7:0]} 10110101
force {SW[9]} 1
force {KEY[3:1]} 111
force {KEY[0]} 1 0, 0 10 -r 20
run 200

#Parallel loading the values 
force {SW[7:0]} 10110101
force {SW[9]} 1
force {KEY[3:1]} 000
force {KEY[0]} 1 0, 0 10 -r 20
run 40 ns

