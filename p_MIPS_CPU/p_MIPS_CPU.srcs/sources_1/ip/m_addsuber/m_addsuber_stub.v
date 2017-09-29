// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Fri Sep 22 19:31:15 2017
// Host        : ThinkPad-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               E:/XilinxPro/m_EX/m_EX.srcs/sources_1/ip/m_addsuber/m_addsuber_stub.v
// Design      : m_addsuber
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_8,Vivado 2015.4" *)
module m_addsuber(A, B, C_IN, C_OUT, S)
/* synthesis syn_black_box black_box_pad_pin="A[31:0],B[31:0],C_IN,C_OUT,S[31:0]" */;
  input [31:0]A;
  input [31:0]B;
  input C_IN;
  output C_OUT;
  output [31:0]S;
endmodule
