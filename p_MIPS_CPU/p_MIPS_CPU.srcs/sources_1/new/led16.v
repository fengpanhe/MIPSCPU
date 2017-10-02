`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2017 11:22:59 PM
// Design Name: 
// Module Name: led16
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


module led16(
    input wire reset,           //系统复位信号
    input wire[15:0] data,      //系统总线中的数据线
    input wire cs,              //片信号，接LEDCtrl
    input wire iow,             //i/0写信号
    output reg[6:0] led0,      //led0输出信号
    output reg[6:0] led1,      //led1输出信号
    output reg[6:0] led2,      //led2输出信号
    output reg[6:0] led3      //led3输出信号
    );
    parameter L0 = 7'b1000000;
    parameter L1 = 7'b1111001;
    parameter L2 = 7'b0100100;
    parameter L3 = 7'b0110000;
    parameter L4 = 7'b0011001;
    parameter L5 = 7'b0010010;
    parameter L6 = 7'b0000010;
    parameter L7 = 7'b1111000;
    parameter L8 = 7'b0000000;
    parameter L9 = 7'b0010000;
    parameter La = 7'b0001000;
    parameter Lb = 7'b0000011;
    parameter Lc = 7'b1000110;
    parameter Ld = 7'b0100001;
    parameter Le = 7'b0000110;
    parameter Lf = 7'b0001110;
    reg[15:0] rdata; //数据锁存器

    always @(posedge cs or posedge reset) begin
        if (reset == 1) begin
            // reset
            rdata = 16'h0000;
        end
        else if (cs == 1 && iow == 1) begin
            rdata = data;       //锁存数据
        end
    end

    always @(rdata) begin
        case(rdata[3:0])
            4'h0: led0 = L0;
            4'h1: led0 = L1;
            4'h2: led0 = L2;
            4'h3: led0 = L3;
            4'h4: led0 = L4;
            4'h5: led0 = L5;
            4'h6: led0 = L6;
            4'h7: led0 = L7;
            4'h8: led0 = L8;
            4'h9: led0 = L9;
            4'ha: led0 = La;
            4'hb: led0 = Lb;
            4'hc: led0 = Lc;
            4'hd: led0 = Ld;
            4'he: led0 = Le;
            4'hf: led0 = Lf;
            default: led0 = 7'b1111111;
        endcase
        case(rdata[7:4])
            4'h0: led1 = L0;
            4'h1: led1 = L1;
            4'h2: led1 = L2;
            4'h3: led1 = L3;
            4'h4: led1 = L4;
            4'h5: led1 = L5;
            4'h6: led1 = L6;
            4'h7: led1 = L7;
            4'h8: led1 = L8;
            4'h9: led1 = L9;
            4'ha: led1 = La;
            4'hb: led1 = Lb;
            4'hc: led1 = Lc;
            4'hd: led1 = Ld;
            4'he: led1 = Le;
            4'hf: led1 = Lf;
            default: led0 = 7'b1111111;
        endcase
        case(rdata[11:8])
            4'h0: led2 = L0;
            4'h1: led2 = L1;
            4'h2: led2 = L2;
            4'h3: led2 = L3;
            4'h4: led2 = L4;
            4'h5: led2 = L5;
            4'h6: led2 = L6;
            4'h7: led2 = L7;
            4'h8: led2 = L8;
            4'h9: led2 = L9;
            4'ha: led2 = La;
            4'hb: led2 = Lb;
            4'hc: led2 = Lc;
            4'hd: led2 = Ld;
            4'he: led2 = Le;
            4'hf: led2 = Lf;
            default: led0 = 7'b1111111;
        endcase
        case(rdata[15:12])
            4'h0: led3 = L0;
            4'h1: led3 = L1;
            4'h2: led3 = L2;
            4'h3: led3 = L3;
            4'h4: led3 = L4;
            4'h5: led3 = L5;
            4'h6: led3 = L6;
            4'h7: led3 = L7;
            4'h8: led3 = L8;
            4'h9: led3 = L9;
            4'ha: led3 = La;
            4'hb: led3 = Lb;
            4'hc: led3 = Lc;
            4'hd: led3 = Ld;
            4'he: led3 = Le;
            4'hf: led3 = Lf;
            default: led0 = 7'b1111111;
        endcase
    end
endmodule
