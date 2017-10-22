`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2017 09:24:05 AM
// Design Name: 
// Module Name: sw_led_pwm_test
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


module sw_led_pwm_test(

    );
    reg clk = 1;
    reg reset;
    always #5 clk = ~clk;
    initial
    begin
    reset = 1;
    #10 reset = 0;
    end
    wire[31:0] Instruction_if,Instruction_id;
    wire[4:0] ALUCode_id;
    wire[31:0] ALUa_ex;
    wire[31:0] ALUb_ex;
    wire[31:0] ALUResult_ex;
    wire pwmWave;
    wire[31:0] SWInput;
    wire[31:0] LEDOutput;
    wire[31:0] RegWrData_mem;
    wire[31:0] RegWrData_wb;

    assign SWInput = 32'h12345678;
    m_MIPS_CPU MIPS_CPU(
     .clk(clk),
     .rst(reset),
     .Instruction(Instruction_if),
     .Instruction2(Instruction_id),
     .ALUCode(ALUCode_id),
     .ALU_a(ALUa_ex),
     .ALU_b(ALUb_ex),
     .aluresult_ex(ALUResult_ex),
     .pwmWave(pwmWave),
     .SWInput(SWInput),
     .LEDOutput(LEDOutput),
     .regwrdata_mem(RegWrData_mem),
     .regwrdata_wb(RegWrData_wb)
     );
endmodule
