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


module disp32(
    input wire reset,           //系统复位信号
    input wire clk,
    input wire cs,              //片信号，接LEDCtrl
    input wire iow,             //i/0写信号
    input wire[15:0] data,      //系统总线中的数据线
    input wire[2:0] address,    //端口地址
    output wire[7:0] led_o,      //led输出信号
    output reg[7:0] led_enable_o,      //led使能信号
    output clk2,
    output[2:0] cnt
    );
    reg[31:0] rdata; //数码管数据锁存器
    reg[15:0] tdata; //特殊显示数据锁存器 低八位对应8个小数点，高八位表示某个数码管是否显示
    reg[2:0] count; //8计数器
    initial
    begin
    rdata <= 32'h00000000;
    tdata <= 16'h0000;
    count <= 0;
    end

    reg[3:0] dig;
    reg point;

    wire clk_sys;
    assign clk2 = clk_sys;
    assign cnt = count;
    
    
    always @(negedge clk) begin
        if (reset == 1) begin
            // reset
            rdata = 32'h00000000;
            tdata = 16'h0000;
        end
        else if (cs == 1 && iow == 1) begin
            case (address[2:0])
                3'b000: rdata[15:0] <= data;
                3'b010: rdata[31:16] <= data;
                3'b100: tdata[15:0] <= data;
                default: begin
                    rdata = 32'h00000000;
                    tdata = 16'h0000;
                end
            endcase
        end
    end

    clock_div U0(
        .clk(clk),
        .clk_sys_1HZ(clk_sys)
    );
    
    //8计数器
    always @(posedge clk_sys)  begin
        if(reset == 1) begin
            count = 0;
        end 
        else begin
            if(count == 7)
                count = 0;
            else begin
                count = count + 1;
            end
        end
    end

    dig_to_led digtoled(
        .enable_i(1'b1),
        .dig_i(dig),
        .point_i(point),
        .led_o(led_o)
        );

    always @(count) begin
        case(count[2:0])
            3'b000: begin
                if (tdata[8] == 1) begin
                    dig = rdata[3:0];
                    point = tdata[0];
                    led_enable_o <= 8'b11111110;
                end
            end
            3'h1: begin
                if (tdata[9] == 1) begin
                    dig = rdata[7:4];
                    point = tdata[1];
                    led_enable_o <= 8'b11111101;
                end
            end
            3'h2: begin
                if (tdata[10] == 1) begin
                    dig = rdata[11:8];
                    point = tdata[2];
                    led_enable_o <= 8'b11111011;
                end
            end
            3'h3: begin
                if (tdata[11] == 1) begin
                    dig = rdata[15:12];
                    point = tdata[3];
                    led_enable_o <= 8'b11110111;
                end
            end
            3'h4: begin
                if (tdata[12] == 1) begin
                    dig = rdata[19:16];
                    point = tdata[4];
                    led_enable_o <= 8'b11101111;
                end
            end
            3'h5: begin
                if (tdata[13] == 1) begin
                    dig = rdata[23:20];
                    point = tdata[5];
                    led_enable_o <= 8'b11011111;
                end
            end
            3'h6: begin
                if (tdata[14] == 1) begin
                    dig = rdata[27:24];
                    point = tdata[6];
                    led_enable_o <= 8'b10111111;
                end
            end
            3'h7: begin
                if (tdata[15] == 1) begin
                    dig = rdata[31:28];
                    point = tdata[7];
                    led_enable_o <= 8'b01111111;
                end
            end
            default: begin
                led_enable_o <= 8'b11111111;
                point = 0;
            end
        endcase
    end
endmodule


    // parameter L0 = 7'hc0;
    // parameter L1 = 7'hf9;
    // parameter L2 = 7'ha4;
    // parameter L3 = 7'hb0;
    // parameter L4 = 7'h99;
    // parameter L5 = 7'h92;
    // parameter L6 = 7'h82;
    // parameter L7 = 7'hf8;
    // parameter L8 = 7'h80;
    // parameter L9 = 7'h90;
    // parameter La = 7'h88;
    // parameter Lb = 7'h83;
    // parameter Lc = 7'hc6;
    // parameter Ld = 7'ha1;
    // parameter Le = 7'h86;
    // parameter Lf = 7'h8e;