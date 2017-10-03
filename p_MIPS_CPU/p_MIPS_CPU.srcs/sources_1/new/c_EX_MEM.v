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
     m_dff #(32) dff1 (
     .clk(clk),
     .din(NextPC_ex),
     .dout(NextPC_mem)
     );
     //reg for ALUResult
     m_dff #(32) dff2 (
     .clk(clk),
     .din(ALUResult_ex),
     .dout(ALUResult_mem)
     );
     //reg for MemToReg
      m_dff #(1) dff3 (
      .clk(clk),
      .din(MemOrIOToReg_ex),
      .dout(MemOrIOToReg_mem)
      );
      //reg for MemWr
      m_dff #(1) dff4 (
      .clk(clk),
      .din(MemOrIOWr_ex),
      .dout(MemOrIOWr_mem)
      );
      //reg for MemExtType
      m_dff #(1) dff5 (
      .clk(clk),
      .din(MemExtType_ex),
      .dout(MemExtType_mem)
      );
      //reg for MemReadSize
     m_dff #(2) dff6 (
     .clk(clk),
     .din(MemReadSize_ex),
     .dout(MemReadSize_mem)
     );
     //reg for RegWr
     m_dff #(1) dff7 (
     .clk(clk),
     .din(RegWr_ex),
     .dout(RegWr_mem)
     );
     //reg for RegWrAddr
     m_dff #(5) dff8 (
     .clk(clk),
     .din(RegWrAddr_ex),
     .dout(RegWrAddr_mem)
     );
     //reg for MemWrData
     m_dff #(32) dff9 (
     .clk(clk),
     .din(MemWrData_ex),
     .dout(MemWrData_mem)
     );
     //reg for AL
     m_dff #(1) dff10 (
     .clk(clk),
     .din(AL_ex),
     .dout(AL_mem)
     );
     //reg for CPToReg
     m_dff #(1) dff11(
     .clk(clk),
     .din(CPToReg_ex),
     .dout(CPToReg_mem)
     );
     //reg for CPWr
     m_dff #(1) dff12(
     .clk(clk),
     .din(CPWr_ex),
     .dout(CPWr_mem)
     );
     //reg for CPWrData
     m_dff #(32) dff13(
     .clk(clk),
     .din(CPWrData_ex),
     .dout(CPWrData_mem)
     );
     //reg for CPResult
     m_dff #(32) dff14(
     .clk(clk),
     .din(CPResult_ex),
     .dout(CPResult_mem)
     );
     //reg for CPWrAddr
     m_dff #(5) dff15(
     .clk(clk),
     .din(CPWrAddr_ex),
     .dout(CPWrAddr_mem)
     );
     //reg for MemRead
     m_dff #(1) dff16(
     .clk(clk),
     .din(MemOrIORead_ex),
     .dout(MemOrIORead_mem)
     );
endmodule
