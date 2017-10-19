`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/19 10:57:32
// Design Name: 
// Module Name: ClkDiv
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


module ClkDiv(
    input initClk,
    output reg clk 
    );
    reg[2:0] cnt = 0;
    initial begin
        cnt <= 0;
        clk <= 0;
    end
    always @(posedge initClk)
        begin
            if(cnt == 2)
            begin
                clk <= ~clk;
                cnt <= 0;
            end else
            begin
                cnt <= cnt + 1;
            end
        end
endmodule
