`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2017 10:36:02 AM
// Design Name: 
// Module Name: MiniSysBus
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


module MiniSysBus(
    input wire clk,
    input wire reset,

    //  cpu侧
    input wire[15:0] caddress,      //从执行单元来的alu_result[15:0]
    input wire memread,             //存储器读控制信号
    input wire memwrite,            //存储器写控制信号
    input wire ioread,              //io读控制信号             
    input wire iowrite,             //io写控制信号
    input wire[31:0] wdata,         //要输出到存储器或io中的数据

    output wire[31:0] rdata,          //存储器/io中的数据输出

    // 外设侧
    output wire LEDCtrl,
    output wire KEYCtrl,
    output wire CTCCtrl,
    output wire PWMCtrl,             
    output wire UARTCtrl,           
    output wire WDTCtrl,            //看门狗

    output wire[11:0] address,      //总线上的地址（去寄存器，低四位做访存端口的端口号）
    output wire[31:0] write_data,   //准备写入mem/io的数据

    input wire[31:0] mread_data,
    input wire[15:0] ioread_data_key,
    input wire[15:0] ioread_data_ctc,
    input wire[15:0] ioread_data_uart
    );

endmodule
