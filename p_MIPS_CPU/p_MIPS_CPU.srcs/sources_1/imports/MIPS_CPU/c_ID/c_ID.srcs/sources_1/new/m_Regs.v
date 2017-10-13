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
    input reset,
    input RegWr,
    input[4:0] RsAddr,
    input[4:0] RtAddr,
    input[4:0] RegWrAddr,
    input[31:0] RegWrData_wb,
    input[31:0] RegWrData_mem,
    input[31:0] ALUResult_ex,
    input[2:0] ForwardA,
    input[2:0] ForwardB,
    output reg[31:0] RsResult,
    output reg[31:0] RtResult
    );
    wire clk2;
    assign clk2 = ~clk;
    reg[31:0] Regs[31:0];
    reg[31:0] RsData,RtData;
    //¼Ä´æÆ÷³õÊ¼»¯
    integer i;
    initial
    begin
    RsData <= 0;
    RsResult <= 0;
    RtData <= 0;
    RtResult <= 0;
    for(i = 0; i < 32; i=i+1)
        Regs[i] = 0;
    end

    always @(posedge clk2)
    begin
    if(reset == 1)
        begin
        RsData <= 0;
        //RsResult <= 0;
        RtData <= 0;
        //RtResult <= 0;
        for(i = 0; i < 32; i=i+1)
            Regs[i] = 0; 
        end
    else
        begin
        RsData <= Regs[RsAddr];
        RtData <= Regs[RtAddr];
        if(RegWr && (|RegWrAddr[4:0]))
            Regs[RegWrAddr] = RegWrData_wb;
        end
    end
    always @(*)
    begin
        case(ForwardA)
        3'b000: RsResult <= RsData;
        3'b001: RsResult <= ALUResult_ex;
        3'b010: RsResult <= RegWrData_mem;
        3'b100: RsResult <= RegWrData_wb;
        default: RsResult <= 32'bx;
        endcase
    end
    
    always @(*)
    begin
        case(ForwardB)
        3'b000: RtResult <= RtData;
        3'b001: RtResult <= ALUResult_ex;
        3'b010: RtResult <= RegWrData_mem;
        3'b100: RtResult <= RegWrData_wb;
        default: RtResult <= 32'bx;
        endcase
    end
endmodule
