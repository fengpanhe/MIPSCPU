onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib mult_adder_opt

do {wave.do}

view wave
view structure
view signals

do {mult_adder.udo}

run -all

quit -force
