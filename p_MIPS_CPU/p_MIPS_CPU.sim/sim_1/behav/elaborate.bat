@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 934dcbaca86a4af1b40efb6b405cce7a -m64 --debug typical --relax --mt 2 -L xbip_utils_v3_0_5 -L c_reg_fd_v12_0_1 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_1 -L xbip_dsp48_addsub_v3_0_1 -L xbip_addsub_v3_0_1 -L c_addsub_v12_0_8 -L xil_defaultlib -L xbip_bram18k_v3_0_1 -L mult_gen_v12_0_10 -L axi_utils_v2_0_1 -L floating_point_v7_0_11 -L xbip_dsp48_mult_v3_0_1 -L xbip_dsp48_multadd_v3_0_1 -L div_gen_v5_1_9 -L blk_mem_gen_v8_3_1 -L unisims_ver -L unimacro_ver -L secureip --snapshot CPU_TEST2_behav xil_defaultlib.CPU_TEST2 xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
