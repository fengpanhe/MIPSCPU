`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/26 15:51:21
// Design Name: 
// Module Name: m_dff
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


module m_dff(
    clk,
    din,
    dout
    );
    parameter Width = 32;
    input clk;
    input wire[Width-1:0] din;
    output reg[Width-1:0] dout;
    reg start = 1;
    
    always @(posedge clk)
    begin
    if(start)
        begin
        dout<=0;
        start<=0;
        end
    else
        dout <= din;
    end
    
endmodule
