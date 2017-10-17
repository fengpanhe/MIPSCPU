`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2017 11:20:58 PM
// Design Name: 
// Module Name: disp_test
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


module disp_test(
    input clk,
    output wire[7:0] led_o,      //led输出信号
    output reg[7:0] led_enable_o      //led使能信号
    );
    reg reset;
    initial
    begin
    reset = 1;
    #5 reset = 0;
    end


    // wire[31:0] Instruction_if,Instruction_id;
    // wire[4:0] ALUCode_id;
    // wire[31:0] ALUResult_ex;
    // wire[31:0] ALUa_ex,ALUb_ex;
    // wire[31:0] HI,LO;
    // wire[7:0] DISPOutput;
    // wire[7:0] DISPEn;
    // m_MIPS_CPU MIPS_CPU(
    //  .clk(clk),
    //  .rst(reset),
    //  //.pc_ifwrite(PC_IFWrite),
    //  .Instruction(Instruction_if),
    //  .ALUCode(ALUCode_id),
    //  .ALU_a(ALUa_ex),
    //  .ALU_b(ALUb_ex),
    //  .aluresult_ex(ALUResult_ex),
    //  .HI(HI),
    //  .LO(LO),
    //  .Instruction2(Instruction_id),
    //  .DISPOutput(DISPOutput),
    //  .DISPEn(DISPEn)
    //  );
    wire[31:0] data = 16'h87654321;
    wire cs = 1;
    wire iow = 1;
    wire[2:0] address;
    wire[7:0] led_o;
    wire[7:0] led_enable_o;
    disp32 disp(
        .clk(clk),
        .reset(reset),
        .data(data),
        .cs(cs),
        .iow(iow),
        .led_o(led_o),
        .led_enable_o(led_enable_o),
    );
endmodule
