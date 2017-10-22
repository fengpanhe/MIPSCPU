`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/22 20:42:16
// Design Name: 
// Module Name: m_DivProccess
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


module m_DivProccess(
    input clk,
    input reset,
    input DivOn,
    output[4:0] DivCnt,
    output reg DivFinished
    );
    reg[4:0] cnt;
    assign DivCnt = cnt;
    initial begin
    cnt <= 0;
    DivFinished <= 1;
    end
    
    always @(DivOn or cnt or reset) begin
        if(reset == 1) begin
            DivFinished <= 1;
        end
        else if(DivOn == 1) begin
            if(cnt == 0) begin
                DivFinished <= 0;
            end
            else if(cnt == 5'b00001) begin
                DivFinished <= 1;
            end
            else begin
                DivFinished <= 0;
            end
            
        end
        else begin
            DivFinished <= 1;
        end
    end
    
    always @(posedge clk) begin
        if(reset == 1) begin
            cnt <= 0;
        end
        else if(DivOn && ~DivFinished) begin
            if(cnt == 0) begin
                cnt <= 5'b11111;
            end
            else begin
                cnt <= cnt - 1;
            end
        end
        else begin
            cnt <= 0;
        end
    end
endmodule
