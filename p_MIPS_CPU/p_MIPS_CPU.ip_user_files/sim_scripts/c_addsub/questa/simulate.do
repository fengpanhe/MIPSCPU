onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib c_addsub_opt

do {wave.do}

view wave
view structure
view signals

do {c_addsub.udo}

run -all

quit -force
