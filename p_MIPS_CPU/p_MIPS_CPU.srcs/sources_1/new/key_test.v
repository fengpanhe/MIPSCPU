`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2017 08:24:40 AM
// Design Name: 
// Module Name: key_test
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


module key_test(
    input wire[3:0] col,
    output reg[3:0] line,
    output wire[7:0] led
    );

    initial begin
        line = 4'h0;
    end
    assign led[3:0] = col;
    assign led[7:4] = line;

endmodule
