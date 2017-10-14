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
    output reg[31:0] ioread_data,   //读出的数�?
    output reg[5:0] int_sw
    );
    
    reg int_flag; //�����ж��Ƿ����int_i�ź�
    
    initial
    begin
    int_sw <= 0;
    int_flag <= 0;
    end
    
    always @(negedge clk) begin
        if (reset == 1) begin
            ioread_data <= 16'h0000;
            int_sw <= 6'b000000;
            int_flag <= 0;
        end
        if ((cs == 1) && (ior == 1) && (address == 1)) begin
            ioread_data <= swi;
        end
        if(int_flag) begin
            int_sw <= 6'b000000;
            int_flag <= 0;
        end
        if(|int_sw)begin
            int_flag = 1;
        end
    end
    
    always @(swi)begin
        int_sw <= 6'b000001;
    end
endmodule
