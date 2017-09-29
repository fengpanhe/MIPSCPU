`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/24 16:20:00
// Design Name: 
// Module Name: m_HazardDetector
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


module m_HazardDetector(
    input MemRead_ex,
    input[4:0] RegWrAddr_ex,
    input[4:0] RsAddr_id,
    input[4:0] RtAddr_id,
    output PC_IFWrite,
    output Stall
    );
    assign PC_IFWrite = ~Stall;
    assign Stall = MemRead_ex && (&(RegWrAddr_ex~^RsAddr_id) || &(RegWrAddr_ex~^RtAddr_id));
endmodule
