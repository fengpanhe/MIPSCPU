`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2017 08:08:03 PM
// Design Name: 
// Module Name: ctc_test
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


module ctc_test(

    );
    reg clk = 1;
    reg reset;
    reg pulse1 = 1;
    always #5 clk = ~clk;
//    always #10 pulse1 = ~pulse1;
    initial
    begin
    reset = 0;
    #1 reset = 1;
    #10 reset = 0;
    end
    wire[31:0] Instruction_if,Instruction_id;
    wire[4:0] ALUCode_id;
    wire[31:0] ALUa_ex;
    wire[31:0] ALUb_ex;
    wire[31:0] ALUResult_ex;
    wire cnt0,cnt1;
    m_MIPS_CPU MIPS_CPU(
     .clk(clk),
     .rst(reset),
     .Instruction(Instruction_if),
     .Instruction2(Instruction_id),
     .ALUCode(ALUCode_id),
     .ALU_a(ALUa_ex),
     .ALU_b(ALUb_ex),
     .aluresult_ex(ALUResult_ex),
//     .pulse1(pulse1),
     .cnt0(cnt0),
     .cnt1(cnt1)
     );
endmodule
