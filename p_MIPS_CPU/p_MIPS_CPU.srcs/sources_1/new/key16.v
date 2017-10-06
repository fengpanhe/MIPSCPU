`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2017 11:58:29 PM
// Design Name: 
// Module Name: key16
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


module key16(
    input wire reset,       //锟斤拷位锟脚猴拷
    input wire cs,          //片选锟脚号ｏ拷锟斤拷keyctrl
    input wire clk,         //系统时锟斤拷
    input wire ior,         //锟斤拷锟脚猴拷
    input wire[1:0] address,//锟剿口猴拷
    input wire[3:0] col,    //锟斤拷锟斤拷
    output reg[3:0] line,   //锟斤拷锟斤拷
    output reg[15:0] ioread_data//锟斤拷锟斤拷锟斤拷锟�
    );

    reg[15:0] keyvalue;
    reg[15:0] keystat;

    always @(negedge clk) begin
        if (reset == 1) begin
            // reset
            ioread_data = 16'h0000;
            keyvalue = 16'h0000;
            keystat = 16'h0000;
            line = 4'h0;
        end
        else begin
            case(line)
                4'b0000: if(col != 4'b1111) line <= 4'b1110;
                4'b1110: //0锟斤拷
                    if(col != 4'b1111) begin
                        keyvalue[3:0] = col;
                        keyvalue[7:4] = line;
                        keystat = keystat | 16'h0001;
                        line <= 4'b0000;
                    end 
                    else begin
                        line <= 4'b1101;
                    end
                4'b1101: //1锟斤拷
                    if(col != 4'b1111) begin
                        keyvalue[3:0] = col;
                        keyvalue[7:4] = line;
                        keystat = keystat | 16'h0001;
                        line <= 4'b0000;
                    end 
                    else begin
                        line <= 4'b1011;
                    end
                4'b1011: //2锟斤拷
                    if(col != 4'b1111) begin
                        keyvalue[3:0] = col;
                        keyvalue[7:4] = line;
                        keystat = keystat | 16'h0001;
                        line <= 4'b0000;
                    end 
                    else begin
                        line <= 4'b0111;
                    end
                4'b0111: //3锟斤拷
                    if(col != 4'b1111) begin
                        keyvalue[3:0] = col;
                        keyvalue[7:4] = line;
                        keystat = keystat | 16'h0001;
                        line <= 4'b0000;
                    end 
                    else begin
                        line <= 4'b0000;
                        keystat = keystat & 16'hfffe;
                    end
            endcase

            if ((cs == 1) && (ior == 1)) begin // 锟斤拷锟脚猴拷
                if (address == 2'b00) begin    //锟斤拷锟斤拷值
                    ioread_data = keyvalue;
                end
                else if(address == 2'b10) begin //锟斤拷状态同时锟斤拷状态
                    ioread_data = keystat;
                    keystat = keystat & 16'hfffe;
                end
            end
        end
    end
endmodule
