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
    clk,
    clk_sys_1HZ
    );
    input clk;
    output clk_sys_1HZ;
    
    reg clk_sys_1HZ = 0;
    reg [19:0] div_counter = 20'h186A0; //10^5d
    always @(posedge clk)
    begin
        if(div_counter == 0) begin
            clk_sys_1HZ <= ~clk_sys_1HZ;
            div_counter = 20'h186A0;
        end 
        else begin
            div_counter <= div_counter - 1;
        end
    end
endmodule
