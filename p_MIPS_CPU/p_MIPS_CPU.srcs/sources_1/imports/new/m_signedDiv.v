`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2017 11:08:00 AM
// Design Name: 
// Module Name: m_signedDiv
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


module m_signedDiv(
    input[31:0] A, //divedend
    input[31:0] B, //divisor
    output[63:0] P
    );
    wire A_op,B_op,res_op;
    wire[31:0] A_unsigned,B_unsigned,A_reverse,B_reverse;
    wire[63:0] res;
    wire[31:0] remainder_op;
    wire[31:0] quotient,remainder;
    assign A_op = A[31];
    assign B_op = B[31];  
    assign res_op = A_op^B_op; 
    assign remainder_op = ({32{A_op}} & B_unsigned) & {32{|res[31:0]}};
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
    m_divider Divider (
         .s_axis_divisor_tdata(B_unsigned),      // input wire [31 : 0] s_axis_divisor_tdata
         .s_axis_dividend_tdata(A_unsigned),    // input wire [31 : 0] s_axis_dividend_tdata
         .m_axis_dout_tdata(res)            // output wire [63 : 0] m_axis_dout_tdata
    );
    c_addsub remainder_adder (
        .A(remainder_op),
        .B(res[31:0]),
        .ADD(~(|remainder_op)),
        .S(remainder)
    );
    assign P[31:0] = remainder;
    mult_adder quotient_addr (
        .A(res[63:32]),
        .C_IN(|remainder_op),
        .S(quotient)
    );

    wire[31:0] Quot_tmp;
    assign Quot_tmp = quotient^{32{res_op}};
    mult_adder Quot_adder2 (
           .A(Quot_tmp),  // input wire [31 : 0] A
           .C_IN(res_op),  // input wire C_IN
           .S(P[63:32])  // output wire [31 : 0] S
    );
endmodule
