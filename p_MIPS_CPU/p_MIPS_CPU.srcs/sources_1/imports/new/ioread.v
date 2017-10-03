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
    input wire ioread,
    input wire KEYCtrl,
    input wire CTCCtrl,
    input wire UARTCtrl,
    input wire SWCtrl,

    input wire[31:0] ioread_data_key,
    input wire[15:0] ioread_data_ctc,
    input wire[31:0] ioread_data_uart,
    input wire[31:0] ioread_data_sw,

    output reg[31:0] ioread_data
    );

    always @(posedge clk)
    begin
        if (reset == 1) begin
            ioread_data = 32'h00000000;
        end
        else if (ioread == 1) begin
            if (KEYCtrl == 1) begin
                ioread_data = ioread_data_key;
            end
            else if (CTCCtrl == 1) begin
                ioread_data = ioread_data_ctc;
            end
            else if (UARTCtrl == 1) begin
                ioread_data = ioread_data_uart;
            end
            else if (SWCtrl == 1) begin
                ioread_data = ioread_data_sw;
            end
        end
    end
endmodule
