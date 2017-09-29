`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/25 16:21:30
// Design Name: 
// Module Name: IF_TEST
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


module IF_TEST();
   reg clk,reset,PC_IFWrite;
   reg Z,J,JR;
   always #5 clk <= ~clk;
   initial 
   begin 
   clk = 1;
   reset = 0;
   PC_IFWrite = 1;
   Z = 0;
   J = 0;
   JR = 0;
   #1
   reset = 1;
   #4
   reset = 0;
   #20
   J = 1;
   end
   wire[31:0] j_addr = 32'h0001;
   wire[31:0] b_addr = 32'h0010;
   wire[31:0] jr_addr = 32'h0030;
   wire[31:0] next_pc,cur_pc;
   wire[31:0] instruction;
   c_IF IF(
    .clk(clk),
    .reset(reset),
    .PC_IFWrite(PC_IFWrite),
    .Jr(JR),
    .J(J),
    .Z(Z),
    .JrAddr(jr_addr),
    .JmpAddr(j_addr),
    .BranchAddr(b_addr),
    .Instruction_if(instruction),
    .NextPC_if(next_pc),
    .curPC_if(cur_pc)
   );


endmodule
