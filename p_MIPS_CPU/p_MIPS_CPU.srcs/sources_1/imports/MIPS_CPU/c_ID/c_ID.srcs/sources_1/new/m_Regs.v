`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/24 16:19:12
// Design Name: 
// Module Name: m_Regs
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


module m_Regs(
    input clk,
    input RegWr,
    input[4:0] RsAddr,
    input[4:0] RtAddr,
    input[4:0] RegWrAddr,
    input[31:0] RegWrData,
    output reg[31:0] RsData,
    output reg[31:0] RtData
    );
    wire clk2;
    assign clk2 = ~clk;
    reg[31:0] Regs[31:0];
    wire ForwardA,ForwardB;
    assign ForwardA = RegWr && (|RegWrAddr) && (&(RegWrAddr~^RsAddr));
    assign ForwardB = RegWr && (|RegWrAddr) && (&(RegWrAddr~^RtAddr));
    //¼Ä´æÆ÷³õÊ¼»¯
    integer i;
    initial
    begin
    for(i = 0; i < 32; i=i+1)
        Regs[i] = 0;
    end
    
    always @(posedge clk2)
    begin
        if(ForwardA)
            RsData = RegWrData;
        else
            RsData = Regs[RsAddr];
    end
    
    always @(posedge clk2)
    begin
        if(ForwardB)
           RtData = RegWrData;
        else
           RtData <= Regs[RtAddr];
    end
    
    always @(posedge clk2)
    begin
    if(RegWr && (|RegWrAddr[4:0]))
        Regs[RegWrAddr] = RegWrData;
    end
endmodule
