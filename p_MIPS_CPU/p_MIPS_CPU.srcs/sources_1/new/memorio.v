`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2017 11:14:00 AM
// Design Name: 
// Module Name: memorio
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


module memorio(
    input wire[15:0] caddress,      //从执行单元来的alu_result[15:0]
    input wire memread,             //存储器读控制信号
    input wire memwrite,            //存储器写控制信号
    input wire ioread,              //io读控制信号             
    input wire iowrite,             //io写控制信号

    input wire[31:0] mread_data,
    input reg[15:0] ioread_data,

    input wire[31:0] wdata,         //要输出到存储器或io中的数据

    output wire[31:0] rdata,          //存储器/io中的数据输出

    output wire LEDCtrl,
    output wire KEYCtrl,
    output wire CTCCtrl,
    output wire PWMCtrl,             
    output wire UARTCtrl,           
    output wire WDTCtrl,            //看门狗

    output wire[11:0] address,      //总线上的地址（去寄存器，低四位做访存端口的端口号）
    output reg[31:0] write_data   //准备写入mem/io的数据

    );

    wire iorw;

    assign address = caddress[11:0];
    assign rdata = (memread == 1) ? mread_data : {16'h0000, ioread_data[15:0]};
    assign iorw = (iowrite || ioread);

    assign LEDCtrl = ((iorw == 1) && (caddress[15:4] == 12'hff0)) ? 1'b1 : 1'b0;
    assign KEYCtrl = ((iorw == 1) && (caddress[15:4] == 12'hff1)) ? 1'b1 : 1'b0;
    assign CTCCtrl = ((iorw == 1) && (caddress[15:4] == 12'hff2)) ? 1'b1 : 1'b0;
    assign PWMCtrl = ((iorw == 1) && (caddress[15:4] == 12'hff3)) ? 1'b1 : 1'b0;
    assign UARTCtrl = ((iorw == 1) && (caddress[15:4] == 12'hff4)) ? 1'b1 : 1'b0;
    assign WDTCtrl = ((iorw == 1) && (caddress[15:4] == 12'hff5)) ? 1'b1 : 1'b0;

    always begin
        if ((memwrite == 1) || (iowrite == 1)) begin
            write_data = wdata;
        end
        else begin
            write_data = 32'hZZZZZZZZ;
        end
    end
endmodule
