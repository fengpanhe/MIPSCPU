`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/02 19:48:30
// Design Name: 
// Module Name: c_EX_MEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module c_EX_MEM(
    input clk,
    input reset,
    input en,
    input[31:0] NextPC_ex,
    output[31:0] NextPC_mem,
    input[31:0] ALUResult_ex,
    output[31:0] ALUResult_mem,
    input[31:0] CPResult_ex,
    output[31:0] CPResult_mem,
    input MemOrIOToReg_ex,
    output MemOrIOToReg_mem,
    input CPToReg_ex,
    output CPToReg_mem,
    input MemOrIOWr_ex,
    output MemOrIOWr_mem,
    input MemOrIORead_ex,
    output MemOrIORead_mem,
    input RegWr_ex,
    output RegWr_mem,
    input CPWr_ex,
    output CPWr_mem,
    input MemExtType_ex,
    output MemExtType_mem,
    input[1:0] MemReadSize_ex,
    output[1:0] MemReadSize_mem,
    input[4:0] RegWrAddr_ex,
    output[4:0] RegWrAddr_mem,
    input[4:0] CPWrAddr_ex,
    output[4:0] CPWrAddr_mem,
    input[31:0] MemWrData_ex,
    output[31:0] MemWrData_mem,
    input[31:0] CPWrData_ex,
    output[31:0] CPWrData_mem,
    input AL_ex,
    output AL_mem
    );
    
     //reg for NextPC
     m_dffre #(32) dffre1 (
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(NextPC_ex),
     .dout(NextPC_mem)
     );
     //reg for ALUResult
     m_dffre #(32) dffre2 (
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(ALUResult_ex),
     .dout(ALUResult_mem)
     );
     //reg for MemToReg
      m_dffre #(1) dffre3 (
      .clk(clk),
      .reset(reset),
      .en(en),
      .din(MemOrIOToReg_ex),
      .dout(MemOrIOToReg_mem)
      );
      //reg for MemWr
      m_dffre #(1) dffre4 (
      .clk(clk),
      .reset(reset),
      .en(en),
      .din(MemOrIOWr_ex),
      .dout(MemOrIOWr_mem)
      );
      //reg for MemExtType
      m_dffre #(1) dffre5 (
      .clk(clk),
      .reset(reset),
      .en(en),
      .din(MemExtType_ex),
      .dout(MemExtType_mem)
      );
      //reg for MemReadSize
     m_dffre #(2) dffre6 (
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(MemReadSize_ex),
     .dout(MemReadSize_mem)
     );
     //reg for RegWr
     m_dffre #(1) dffre7 (
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(RegWr_ex),
     .dout(RegWr_mem)
     );
     //reg for RegWrAddr
     m_dffre #(5) dffre8 (
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(RegWrAddr_ex),
     .dout(RegWrAddr_mem)
     );
     //reg for MemWrData
     m_dffre #(32) dffre9 (
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(MemWrData_ex),
     .dout(MemWrData_mem)
     );
     //reg for AL
     m_dffre #(1) dffre10 (
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(AL_ex),
     .dout(AL_mem)
     );
     //reg for CPToReg
     m_dffre #(1) dffre11(
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(CPToReg_ex),
     .dout(CPToReg_mem)
     );
     //reg for CPWr
     m_dffre #(1) dffre12(
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(CPWr_ex),
     .dout(CPWr_mem)
     );
     //reg for CPWrData
     m_dffre #(32) dffre13(
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(CPWrData_ex),
     .dout(CPWrData_mem)
     );
     //reg for CPResult
     m_dffre #(32) dffre14(
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(CPResult_ex),
     .dout(CPResult_mem)
     );
     //reg for CPWrAddr
     m_dffre #(5) dffre15(
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(CPWrAddr_ex),
     .dout(CPWrAddr_mem)
     );
     //reg for MemRead
     m_dffre #(1) dffre16(
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(MemOrIORead_ex),
     .dout(MemOrIORead_mem)
     );
endmodule
