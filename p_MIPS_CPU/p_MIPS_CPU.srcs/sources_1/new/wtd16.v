`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2017 10:38:24 PM
// Design Name: 
// Module Name: wtd16
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


module wtd16(
    input reset,            //系统复位信号
    input clk,              //系统时钟
    input cs,               //片�?��?�接wdtctrl
    input iow,              //写信�??
    input[15:0] data,       //cpu写的数据
    output reg rst          //输出的复位信�??
    );

    reg[15:0] count;        //计数�??
    reg[2:0] cnt;           //小计数器，计4个时�??

    parameter WTDVAL = 16'hffff;

    initial 
    begin
    rst <= 0;
    count <= WTDVAL;
    cnt <= 3'b000;
    end
    
    always @(negedge clk) begin
        if (reset == 1) begin
            // reset
            count = WTDVAL;
            cnt = 3'b000;
            rst = 0;
        end
        else begin
            if (count == 16'd0) begin   //已计数到0
                cnt = 3'b100;           //启动小计数器
                count = WTDVAL;
                rst = 1;                //输出复位信号
            end
            else begin
                count = count - 1'b1;       //计数没到0，则计数器减1
                if (cnt == 3'b000) begin     //小计数器�??0，说明复位信号已经满4时钟周期
                    rst = 0;
                end
                else begin
                    cnt = cnt - 1'b1;       //小计数器不为0，减1
                end

                if ((cs == 1) && (iow == 1)) begin  //得到写信号后，看门狗全部复位
                    count = WTDVAL;
                    cnt = 3'b000;
                    rst = 0;
                end
            end
        end
    end
endmodule
