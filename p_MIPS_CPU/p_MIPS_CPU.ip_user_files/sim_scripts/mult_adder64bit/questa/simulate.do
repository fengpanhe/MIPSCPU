onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib mult_adder64bit_opt

do {wave.do}

view wave
view structure
view signals

do {mult_adder64bit.udo}

run -all

quit -force
