// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
// Date        : Mon Sep 25 22:12:21 2017
// Host        : TR running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode synth_stub
//               /home/he/Xilinx/projects/MIPS_CPU/c_EX/c_EX.srcs/sources_1/ip/mult_adder/mult_adder_stub.v
// Design      : mult_adder
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_8,Vivado 2015.4" *)
module mult_adder(A, C_IN, S)
/* synthesis syn_black_box black_box_pad_pin="A[31:0],C_IN,S[31:0]" */;
  input [31:0]A;
  input C_IN;
  output [31:0]S;
endmodule
