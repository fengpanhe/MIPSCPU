onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib data_ram1_opt

do {wave.do}

view wave
view structure
view signals

do {data_ram1.udo}

run -all

quit -force
