`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/02 19:47:50
// Design Name: 
// Module Name: c_IF_ID
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


module c_IF_ID(
    input clk,
    input reset,
    input en,
    input[31:0] NextPC_if,
    input[31:0] Instruction_if,
    output[31:0] NextPC_id,
    output[31:0] Instruction_id
    );
    
    //Reg for NextPC
    m_dffre #(32) dffre1(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(NextPC_if),
    .dout(NextPC_id)
    );
    //Reg for Instruction
    m_dffre #(32) dffre2(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(Instruction_if),
    .dout(Instruction_id)
    );
    
endmodule
