`timescale 1ns / 1ps 
////////////////////////////////////////////////////////////////////////////////// 
// Company:  
// Engineer:  
//  
// Create Date: 10/06/2017 10:39:26 AM 
// Design Name:  
// Module Name: key_test 
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
 
 
module key_test( 
 
    ); 
    reg clk = 1; 
    reg reset; 
    wire[31:0] Instruction_if,Instruction_id;
    wire[31:0] NextPC_if,NextPC_id;
    wire[4:0] ALUCode_id;
    wire[31:0] ALUa_ex;
    wire[31:0] ALUb_ex;
    wire[31:0] ALUResult_ex;
    wire cs = 1; 
    wire iow = 1; 
    wire[2:0] address = 2'b10; 
        
    wire[3:0] line; 
    reg[3:0] col; 
    reg[23:0] SWInput;
    wire[23:0] LEDOutput;
    wire[7:0] DISPOutput;
    always #5 clk = ~clk;
    
    initial
    begin
    SWInput = 24'h000000;
    //#150
    //SWInput = 24'h123456;
    end
    
     
    initial 
    begin 
    col = 4'b1111; 
    reset = 1; 
    #10 reset = 0; 
    #300 col[0] = line[0]; 
    #50 col[0] = 1; 
    end 
  
    m_MIPS_CPU MIPS_CPU(
    .clk(clk),
    .rst(reset),
    .Instruction(Instruction_if),
    .Instruction2(Instruction_id),
    .nextpc_if(NextPC_if),
    .nextpc_id(NextPC_id),
    .ALUCode(ALUCode_id),
    .ALU_a(ALUa_ex),
    .ALU_b(ALUb_ex),
    .aluresult_ex(ALUResult_ex),
    .col(col), 
    .line(line),
    .SWInput(SWInput),
    .LEDOutput(LEDOutput),
    .DISPOutput(DISPOutput)
     );
endmodule
