`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/02 19:48:48
// Design Name: 
// Module Name: c_MEM_WB
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


module c_MEM_WB(
    input clk,
    input reset,
    input en,
    input RegWr_mem,
    input CPWr_mem,
    input[4:0] RegWrAddr_mem,
    input[4:0] CPWrAddr_mem,
    input[31:0] RegWrData_mem,
    input[31:0] CPWrData_mem,
    output RegWr_wb,
    output CPWr_wb,
    output[4:0] RegWrAddr_wb,
    output[4:0] CPWrAddr_wb,
    output[31:0] RegWrData_wb,
    output[31:0] CPWrData_wb
    );
    
    //reg for RegWr
    m_dffre #(1) dffre1 (
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(RegWr_mem),
    .dout(RegWr_wb)
    );
    //reg for RegWrAddr
    m_dffre #(5) dffre2 (
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(RegWrAddr_mem),
    .dout(RegWrAddr_wb)
    );
    //reg for CPWr
    m_dffre #(1) dffre3 (
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(CPWr_mem),
    .dout(CPWr_wb)
    );
    //reg for CPWrData
    m_dffre #(32) dffre4(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(CPWrData_mem),
    .dout(CPWrData_wb)
    );
    //reg for CPWrAddr
    m_dffre #(5) dffre5(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(CPWrAddr_mem),
    .dout(CPWrAddr_wb)
    );
    //reg for RegWrData
    m_dffre #(32) dffre6(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(RegWrData_mem),
    .dout(RegWrData_wb)
    );
endmodule
