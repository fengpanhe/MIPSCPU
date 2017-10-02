`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2017 11:34:53 AM
// Design Name: 
// Module Name: ioread
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


module ioread(
    input wire clk,
    input wire reset,
    input wire ior,
    input wire keyctrl,
    input wire ctcctrl,
    input wire uartctrl,

    input wire[15:0] ioread_data_key,
    input wire[15:0] ioread_data_ctc,
    input wire[15:0] ioread_data_uart,

    input reg[15:0] ioread_data
    );

    always begin
        if (reset == 1) begin
            ioread_data = 16'h0000;
        end
        else if (ior == 1) begin
            if (keyctrl == 1) begin
                ioread_data = ioread_data_key;
            end
            else if (ctcctrl == 1) begin
                ioread_data = ioread_data_ctc;
            end
            else if (uartctrl == 1) begin
                ioread_data = ioread_data_uart;
            end
        end
    end
endmodule
