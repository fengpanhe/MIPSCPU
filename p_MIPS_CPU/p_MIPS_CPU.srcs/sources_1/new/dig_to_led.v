`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2017 11:51:59 PM
// Design Name: 
// Module Name: dig_to_led_o
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


module dig_to_led(
    input enable_i,
    input[3:0] dig_i,
    input point_i,
    output reg[7:0] led_o
    );

    always @(dig_i) begin
        if (enable_i == 0) begin
            led_o = 8'hff;
        end
        else begin
            case (dig_i)
                4'h0: led_o[6:0] = 7'hc0;
                4'h1: led_o[6:0] = 7'hf9;
                4'h2: led_o[6:0] = 7'ha4;
                4'h3: led_o[6:0] = 7'hb0;
                4'h4: led_o[6:0] = 7'h99;
                4'h5: led_o[6:0] = 7'h92;
                4'h6: led_o[6:0] = 7'h82;
                4'h7: led_o[6:0] = 7'hf8;
                4'h8: led_o[6:0] = 7'h80;
                4'h9: led_o[6:0] = 7'h90;
                4'ha: led_o[6:0] = 7'h88;
                4'hb: led_o[6:0] = 7'h83;
                4'hc: led_o[6:0] = 7'hc6;
                4'hd: led_o[6:0] = 7'ha1;
                4'he: led_o[6:0] = 7'h86;
                4'hf: led_o[6:0] = 7'h8e;
                default: led_o[6:0] = 7'hff;
            endcase
            led_o[7] = point_i;
        end    
    end
endmodule
