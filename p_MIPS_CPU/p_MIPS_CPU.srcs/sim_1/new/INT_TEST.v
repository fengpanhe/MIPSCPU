`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/14 10:17:29
// Design Name: 
// Module Name: INT_TEST
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


module INT_TEST();
    reg clk = 1;
    reg reset;
    always #5 clk = ~clk;
    initial
    begin
    reset = 0;
    #1 reset = 1;
    #5 reset = 0;
    end
    wire[31:0] Instruction_if,Instruction_id;
    wire[4:0] ALUCode_id;
    wire[31:0] ALUa_ex;
    wire[31:0] ALUb_ex;
    wire[31:0] ALUResult_ex;
    reg[31:0] SWInput;
    
    initial 
    begin
    SWInput = 32'h00000000;
    #100
    SWInput = 32'h00123450;
    end 
    m_MIPS_CPU MIPS_CPU(
     .clk(clk),
     .rst(reset),
     .Instruction(Instruction_if),
     .Instruction2(Instruction_id),
     .ALUCode(ALUCode_id),
     .ALU_a(ALUa_ex),
     .ALU_b(ALUb_ex),
     .aluresult_ex(ALUResult_ex),
     .SWInput(SWInput)
     );
endmodule
