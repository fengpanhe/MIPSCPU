// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Sun Oct 15 20:03:43 2017
// Host        : DESKTOP-HAEL08M running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/zyc99/Documents/GitHub/MIPSCPU/p_MIPS_CPU/p_MIPS_CPU.srcs/sources_1/ip/Branch_adder/Branch_adder_stub.v
// Design      : Branch_adder
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_8,Vivado 2015.4" *)
module Branch_adder(A, B, S)
/* synthesis syn_black_box black_box_pad_pin="A[31:0],B[31:0],S[31:0]" */;
  input [31:0]A;
  input [31:0]B;
  output [31:0]S;
endmodule
