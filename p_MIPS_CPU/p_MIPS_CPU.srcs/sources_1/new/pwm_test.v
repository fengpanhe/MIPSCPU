`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2017 11:27:46 PM
// Design Name: 
// Module Name: pwm_test
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


module pwm_test(

    );
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
