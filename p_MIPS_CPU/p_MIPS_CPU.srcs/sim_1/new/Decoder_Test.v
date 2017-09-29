`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/27 19:44:09
// Design Name: 
// Module Name: Decoder_Test
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


module Decoder_Test();
    reg[31:0] Instruction;
    wire MemToReg,MemWr,MemRead,MemExtType,RegWr,RegDst,ALUsrcA,ALUsrcB;
    wire[1:0] MemReadSize;
    wire[4:0] ALUCode;
    wire Jmp,Jr,Jal,Bal;
    initial
    begin
    Instruction = 32'b00100000010000010000000000001010;
    #10
    Instruction = 32'b00100000001000100000000000001010;
    #10
    Instruction = 32'b00001000000000000000000000000001;
    #10
    Instruction = 32'b00001000000000000000000000000010;  
    end
    
    
    m_Decoder decoder (
    .op(Instruction[31:26]),
    .func(Instruction[5:0]),
    .MemToReg(MemToReg),
    .MemWr(MemWr),
    .MemRead(MemRead),
    .MemReadSize(MemReadSize),
    .MemExtType(MemExtType),
    .RegWr(RegWr),
    .RegDst(RegDst),
    .ALUsrcA(ALUsrcA),
    .ALUsrcB(ALUsrcB),
    .ALUCode(ALUCode),
    .Jmp(Jmp),
    .Jr(Jr),
    .Jal(Jal),
    .Bal(Bal)
    );
    
endmodule
