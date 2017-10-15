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
    input wire reset,       //閿熸枻鎷蜂綅閿熻剼鐚存嫹
    input wire cs,          //鐗囬€夐敓鑴氬彿锝忔嫹閿熸枻鎷穔eyctrl
    input wire clk,         //绯荤粺鏃堕敓鏂ゆ�?
    input wire ior,         //閿熸枻鎷烽敓鑴氱尨鎷�?
    input wire[1:0] address,//閿熷壙鍙ｇ尨鎷�
    input wire[3:0] col,    //閿熸枻鎷烽敓鏂ゆ�?
    output reg[3:0] line,   //閿熸枻鎷烽敓鏂ゆ�?
    output reg[15:0] ioread_data,//閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓锟�?
    output reg int_key
    );

    reg[15:0] keyvalue;
    reg[15:0] keystat;
    initial begin
        int_key <= 1'b0;
    end
    
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
                4'b1110: //0閿熸枻鎷�?
                    if(col != 4'b1111) begin
                        case(col)
                            4'b1110: keyvalue = 16'h0001;
                            4'b1101: keyvalue = 16'h0002;
                            4'b1011: keyvalue = 16'h0003;
                            4'b0111: keyvalue = 16'h000a;
                        endcase
                        keystat = keystat | 16'h0001;
                        line <= 4'b0000;
                    end 
                    else begin
                        line <= 4'b1101;
                    end
                4'b1101: //1閿熸枻鎷�?
                    if(col != 4'b1111) begin
                        case(col)
                            4'b1110: keyvalue = 16'h0004;
                            4'b1101: keyvalue = 16'h0005;
                            4'b1011: keyvalue = 16'h0006;
                            4'b0111: keyvalue = 16'h000b;
                        endcase
                        keystat = keystat | 16'h0001;
                        line <= 4'b0000;
                    end 
                    else begin
                        line <= 4'b1011;
                    end
                4'b1011: //2閿熸枻鎷�?
                    if(col != 4'b1111) begin
                        case(col)
                            4'b1110: keyvalue = 16'h0007;
                            4'b1101: keyvalue = 16'h0008;
                            4'b1011: keyvalue = 16'h0009;
                            4'b0111: keyvalue = 16'h000c;
                        endcase
                        keystat = keystat | 16'h0001;
                        line <= 4'b0000;
                    end 
                    else begin
                        line <= 4'b0111;
                    end
                4'b0111: //3閿熸枻鎷�?
                    if(col != 4'b1111) begin
                        case(col)
                            4'b1110: keyvalue = 16'h0000;
                            4'b1101: keyvalue = 16'h000f;
                            4'b1011: keyvalue = 16'h000e;
                            4'b0111: keyvalue = 16'h000d;
                        endcase
                        keystat = keystat | 16'h0001;
                        line <= 4'b0000;
                    end 
                    else begin
                        line <= 4'b0000;
                        keystat = keystat & 16'hfffe;
                    end
            endcase

            if ((cs == 1) && (ior == 1)) begin // 閿熸枻鎷烽敓鑴氱尨鎷�?
                if (address == 2'b00) begin    //閿熸枻鎷烽敓鏂ゆ嫹鍊�?
                    ioread_data = keyvalue;
                end
                else if(address == 2'b10) begin //閿熸枻鎷风姸鎬佸悓鏃堕敓鏂ゆ嫹鐘舵€�?
                    ioread_data = keystat;
                    keystat = keystat & 16'hfffe;
                end
            end
        end
    end
endmodule
