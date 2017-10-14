`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2017 10:20:14 PM
// Design Name: 
// Module Name: pwm16
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


module pwm16(
    input reset,                    //系统复位
    input[2:0] address,             //端口号
    input[15:0] data,               //cpu写到pwm控制器的数据
    input cs,                       //片选，接PWMCtrl
    input clk,                      //系统时钟
    input iow,                      //写信号
    output reg pwm                 //输出方波信号
    );

    reg[15:0] maxcount;             //最大值寄存器
    reg[15:0] midcount;             //对比寄存器
    reg[15:0] flag;                 //使能寄存器
    reg[15:0] rubbish;              //错误端口号的data处理
    reg[15:0] counter;              //计数器


    always @(negedge clk) begin
        if (reset == 1) begin
            // reset
            maxcount = 16'hffff;
            midcount = 16'h0000;
            flag = 16'h0000;
            pwm = 1;
            counter = 16'h0001;
        end
        else if (cs == 1 && iow == 1) begin      //cpu写pwm寄存器
            case (address[2:0])
                3'b000: maxcount = data;
                3'b010: midcount = data;
                3'b100: flag[0] = data[0];      //写使能寄存器
                default: rubbish = data;
            endcase
        end
        else if (flag[0]) begin
            if (counter == maxcount) begin      //计数到最大值
                counter = 16'b0001;
                pwm = 1;
            end
            else begin
                counter = counter + 1'b1;
                if (counter > midcount) begin       //计数值大于对比值
                    pwm = 0;
                end
                else begin                          //计数值小于对比值
                    pwm = 1;
                end
            end
        end
        else begin
             pwm = 1;
        end 
    end
endmodule
