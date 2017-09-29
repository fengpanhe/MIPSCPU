onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib data_ram2_opt

do {wave.do}

view wave
view structure
view signals

do {data_ram2.udo}

run -all

quit -force
