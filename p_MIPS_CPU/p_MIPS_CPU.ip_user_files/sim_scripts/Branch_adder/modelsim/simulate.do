onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L xbip_utils_v3_0_5 -L c_reg_fd_v12_0_1 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_1 -L xbip_dsp48_addsub_v3_0_1 -L xbip_addsub_v3_0_1 -L c_addsub_v12_0_8 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.Branch_adder

do {wave.do}

view wave
view structure
view signals

do {Branch_adder.udo}

run -all

quit -force
