`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2017 12:33:30 AM
// Design Name: 
// Module Name: clock_div
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


module clock_div(
    input clk,
    output clk_sys
    );
    
    parameter count = 1;
    reg clk_sys = 0;
    reg [31:0] div_counter = 0; //10^5d  h01388
    always @(posedge clk)
    begin
        if(div_counter == 0) begin
            clk_sys <= ~clk_sys;
            div_counter = count;
        end 
        else begin
            div_counter <= div_counter - 1;
        end
    end
endmodule
