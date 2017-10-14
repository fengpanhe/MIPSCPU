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
    input reset,    //å¤ä½
    input clk,      //ç³»ç»Ÿæ—¶é’Ÿ
    input cs,      //ç‰‡é??
    input ior,      //è¯»ä¿¡å?
    input address, //ç«¯å£å?
    input[31:0] swi,      //swçš„å¼•è„šè¾“å…¥ä¿¡å?
    output reg[31:0] ioread_data,   //è¯»å‡ºçš„æ•°æ?
    output reg[5:0] int_sw
    );
    
    reg int_flag; //ÓÃÓÚÅĞ¶ÏÊÇ·ñÇå³şint_iĞÅºÅ
    
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
