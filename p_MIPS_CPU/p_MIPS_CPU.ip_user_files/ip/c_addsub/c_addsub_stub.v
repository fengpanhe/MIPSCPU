// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Tue Sep 26 15:01:43 2017
// Host        : ThinkPad-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               E:/MIPS_CPU/p_MIPS_CPU/p_MIPS_CPU.srcs/sources_1/ip/c_addsub/c_addsub_stub.v
// Design      : c_addsub
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_8,Vivado 2015.4" *)
module c_addsub(A, B, ADD, S)
/* synthesis syn_black_box black_box_pad_pin="A[31:0],B[31:0],ADD,S[31:0]" */;
  input [31:0]A;
  input [31:0]B;
  input ADD;
  output [31:0]S;
endmodule
