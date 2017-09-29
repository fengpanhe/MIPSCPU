`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/25 08:56:19
// Design Name: 
// Module Name: m_dffre
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


module m_dffre (
    input clk,
    input reset,
    input en,
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
    if(en == 1)
    begin
        if(reset == 1)
            dout<=0;
        else
            dout<=din;
    end
    end
endmodule
