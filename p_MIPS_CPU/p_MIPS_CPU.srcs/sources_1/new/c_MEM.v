`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/02 16:40:32
// Design Name: 
// Module Name: c_MEM
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


module c_MEM(
    input clk,
    input MemWr_mem,
    input[1:0] MemReadSize_mem,
    input MemExtType_mem,
    input[31:0] ALUResult_mem,
    input[31:0] CPResult_mem,
    input[31:0] NextPC_mem,
    input MemToReg_mem,
    input CPToReg_mem,
    input AL_mem,
    input[31:0] MemWrData_mem,
    output reg[31:0] RegWrData_mem
    );
    
    wire[31:0] MemResult_mem;
    m_DataRam DataRam(
    .clock(clk),
    .MemWr(MemWr_mem),
    .MemWrSize(MemReadSize_mem),
    .MemExtType(MemExtType_mem),
    .MemAddr(ALUResult_mem),
    .MemWrData(MemWrData_mem),
    .MemOutput(MemResult_mem)
    );
    
    always @(*)
    begin
    if(AL_mem == 1)
        RegWrData_mem <= NextPC_mem;
    else if(MemToReg_mem == 1)
        RegWrData_mem <= MemResult_mem;
    else if(CPToReg_mem == 1)
        RegWrData_mem <= CPResult_mem;
    else
        RegWrData_mem <= ALUResult_mem;
    end
    
endmodule
