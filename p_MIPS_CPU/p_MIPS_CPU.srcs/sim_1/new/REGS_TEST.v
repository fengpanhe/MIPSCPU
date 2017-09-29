`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/27 09:45:15
// Design Name: 
// Module Name: REGS_TEST
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


module REGS_TEST();
    reg clk = 1;
    always #5 clk = ~clk;
    wire RegWr;
    assign RegWr = 1;
    reg[4:0] RsAddr,RtAddr,RegWrAddr;
    reg[31:0] RegWrData;
    wire[31:0] RsData,RtData;
    initial
    begin
    RegWrData = 32'h000a;
    RsAddr = 5'd2;
    RtAddr = 5'd1;
    RegWrAddr = 5'd3;
    #10
    RegWrData = 32'h0014;
    RsAddr = 5'd3;
    RtAddr = 5'd2;
    RegWrAddr = 5'd3;
    end
    m_Regs Regs(
    .clk(clk),
    .RegWr(RegWr),
    .RsAddr(RsAddr),
    .RtAddr(RtAddr),
    .RegWrAddr(RegWrAddr),
    .RegWrData(RegWrData),
    .RsData(RsData),
    .RtData(RtData)
    );
  
endmodule
