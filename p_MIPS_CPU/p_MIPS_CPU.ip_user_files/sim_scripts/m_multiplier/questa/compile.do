vlib work
vlib msim

vlib msim/xbip_utils_v3_0_5
vlib msim/xbip_pipe_v3_0_1
vlib msim/xbip_bram18k_v3_0_1
vlib msim/mult_gen_v12_0_10
vlib msim/xil_defaultlib

vmap xbip_utils_v3_0_5 msim/xbip_utils_v3_0_5
vmap xbip_pipe_v3_0_1 msim/xbip_pipe_v3_0_1
vmap xbip_bram18k_v3_0_1 msim/xbip_bram18k_v3_0_1
vmap mult_gen_v12_0_10 msim/mult_gen_v12_0_10
vmap xil_defaultlib msim/xil_defaultlib

vcom -work xbip_utils_v3_0_5 -64 \
"../../../ipstatic/xbip_utils_v3_0_5/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_1 -64 \
"../../../ipstatic/xbip_pipe_v3_0_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_pipe_v3_0_1/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_bram18k_v3_0_1 -64 \
"../../../ipstatic/xbip_bram18k_v3_0_1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_bram18k_v3_0_1/hdl/xbip_bram18k_v3_0.vhd" \

vcom -work mult_gen_v12_0_10 -64 \
"../../../ipstatic/mult_gen_v12_0_10/hdl/mult_gen_v12_0_vh_rfs.vhd" \
"../../../ipstatic/mult_gen_v12_0_10/hdl/mult_gen_v12_0.vhd" \

vcom -work xil_defaultlib -64 \
"../../../../p_MIPS_CPU.srcs/sources_1/ip/m_multiplier/sim/m_multiplier.vhd" \

