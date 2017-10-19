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
    initial
    begin
    led_o <= 8'hff;
    end
    
    always @(*) begin
        if (enable_i == 0) begin
            led_o = 8'hff;
        end
        else begin
            case (dig_i)
                4'h0: led_o[7:0] = 8'h03;
                4'h1: led_o[7:0] = 8'h9f;
                4'h2: led_o[7:0] = 8'h25;
                4'h3: led_o[7:0] = 8'h0d;
                4'h4: led_o[7:0] = 8'h99;
                4'h5: led_o[7:0] = 8'h49;
                4'h6: led_o[7:0] = 8'h41;
                4'h7: led_o[7:0] = 8'h1f;
                4'h8: led_o[7:0] = 8'h01;
                4'h9: led_o[7:0] = 8'h09;
                4'ha: led_o[7:0] = 8'h11;
                4'hb: led_o[7:0] = 8'hc1;
                4'hc: led_o[7:0] = 8'h63;
                4'hd: led_o[7:0] = 8'h85;
                4'he: led_o[7:0] = 8'h61;
                4'hf: led_o[7:0] = 8'h71;
                default: led_o[7:0] = 8'hff;
            endcase
            led_o[0] = ~point_i;
        end    
    end
endmodule
