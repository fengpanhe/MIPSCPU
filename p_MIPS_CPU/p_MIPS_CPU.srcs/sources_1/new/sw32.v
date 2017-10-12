`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2017 09:14:49 AM
// Design Name: 
// Module Name: sw32
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


module sw32(
    input reset,    //复位
    input clk,      //系统时钟
    input cs,      //片�??
    input ior,      //读信�?
    input address, //端口�?
    input[31:0] swi,      //sw的引脚输入信�?
    output reg[31:0] ioread_data   //读出的数�?
    );

    always @(negedge clk) begin
        if (reset == 1) begin
            // reset
            ioread_data = 16'h0000;
        end
        if ((cs == 1) && (ior == 1) && (address == 1)) begin
            ioread_data = swi;
        end
    end
endmodule
