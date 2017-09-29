`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2017 10:17:38 AM
// Design Name: 
// Module Name: m_signedMult
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


module m_signedMult(
    input[31:0] A,
    input[31:0] B,
    output[63:0] P
    );
    wire A_op,B_op,res_op;
    wire[31:0] A_unsigned,B_unsigned,A_reverse,B_reverse;
    wire[63:0] res;
    assign A_op = A[31];
    assign B_op = B[31];  
    assign res_op = A_op^B_op; 
    assign A_reverse = A^{32{A_op}};
    assign B_reverse = B^{32{B_op}};
    mult_adder A_adder (
      .A(A_reverse),  // input wire [31 : 0] A
      .C_IN(A_op),  // input wire C_IN
      .S(A_unsigned)  // output wire [31 : 0] S
    );
    mult_adder B_adder (
      .A(B_reverse),  // input wire [31 : 0] A
      .C_IN(B_op),  // input wire C_IN
      .S(B_unsigned)  // output wire [31 : 0] S
    );
     m_multiplier Multiplier (
         .A(A_unsigned),      // input wire [31 : 0] A
         .B(B_unsigned),      // input wire [31 : 0] B
         .P(res)      // output wire [63 : 0] P
       );
    wire[63:0] P_tmp;
    assign P_tmp = res^{64{res_op}};
    mult_adder64bit res_adder (
      .A(P_tmp),        // input wire [63 : 0] A
      .C_IN(res_op),  // input wire C_IN
      .S(P)        // output wire [63 : 0] S
    );
endmodule
