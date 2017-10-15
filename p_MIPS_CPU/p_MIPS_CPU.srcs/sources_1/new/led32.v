`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2017 09:29:20 AM
// Design Name: 
// Module Name: led32
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


module led32(
    input reset,    //复位
    input clk,      //系统时钟
    input cs,      //片�??
    input iow,      //写信�?
    input address, //端口�?
    input[31:0] data,      //系统总线中的数据
    output reg[23:0] ledo  //LED引脚
    );

    always @(posedge clk or posedge reset) begin
        if (reset == 1) begin
            // reset
            ledo <= 24'h000000;
        end
        else if (cs == 1 && iow == 1) begin
            ledo = data[23:0];       //锁存数据
        end
    end
endmodule
