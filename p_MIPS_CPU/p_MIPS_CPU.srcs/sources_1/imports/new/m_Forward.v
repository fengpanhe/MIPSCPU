`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/24 20:32:36
// Design Name: 
// Module Name: m_Forward
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


module m_Forward(
    input[4:0] RegWrAddr_mem,
    input[4:0] RegWrAddr_wb,
    input RegWr_mem,
    input RegWr_wb,
    input[4:0] RsAddr_ex,
    input[4:0] RtAddr_ex,
    output[1:0] ForwardA,
    output[1:0] ForwardB
    );
    assign ForwardA[0] = RegWr_wb && (RegWrAddr_wb != 0)
                                &&(RegWrAddr_mem != RsAddr_ex)
                                &&(RegWrAddr_wb == RsAddr_ex);
    assign ForwardA[1] = RegWr_mem && (RegWrAddr_mem != 0)
                        &&(RegWrAddr_mem == RsAddr_ex);
    assign ForwardB[0] = RegWr_wb && (RegWrAddr_wb != 0)
                        &&(RegWrAddr_mem != RtAddr_ex)
                        &&(RegWrAddr_wb == RtAddr_ex);
    assign ForwardB[1] = RegWr_mem && (RegWrAddr_mem != 0)
                        &&(RegWrAddr_mem == RtAddr_ex);   
endmodule
