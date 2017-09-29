`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/25 09:42:05
// Design Name: 
// Module Name: m_dffr
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


module m_dffr(
    input clk,
    input reset, //高电平有效
    input din,
    output dout
    );
    parameter Width = 32;
    wire[Width-1:0] din;
    reg[Width-1:0] dout;
    initial 
    begin
    dout <= 0;
    end
    
    always @(posedge clk)
    begin
        if(reset == 1)
            dout<=0;
        else
            dout<=din;
    end
endmodule
