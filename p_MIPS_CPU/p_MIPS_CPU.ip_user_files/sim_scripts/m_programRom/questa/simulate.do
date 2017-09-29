onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib m_programRom_opt

do {wave.do}

view wave
view structure
view signals

do {m_programRom.udo}

run -all

quit -force
