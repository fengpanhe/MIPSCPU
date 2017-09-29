// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Fri Sep 22 23:11:40 2017
// Host        : ThinkPad-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               e:/XilinxPro/m_EX/m_EX.srcs/sources_1/ip/mult_adder64bit/mult_adder64bit_stub.v
// Design      : mult_adder64bit
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_8,Vivado 2015.4" *)
module mult_adder64bit(A, C_IN, S)
/* synthesis syn_black_box black_box_pad_pin="A[63:0],C_IN,S[63:0]" */;
  input [63:0]A;
  input C_IN;
  output [63:0]S;
endmodule
