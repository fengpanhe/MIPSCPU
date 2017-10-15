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
    input wire[31:0] caddress,      //从执行单元来的alu_result[31:0]
    input wire memread,             //存储器读控制信号
    input wire memwrite,            //存储器写控制信号
    input wire ioread,              //io读控制信号             
    input wire iowrite,             //io写控制信号?

    input wire[31:0] mread_data,    //从存储器读取的数据
    input wire[31:0] ioread_data,    //从io读取的数据

    input wire[31:0] wdata,         //要输出到存储器或io中的数据

    

    //外设的片选信号
    output wire DISPCtrl,           //数码管           0xFFFFFC00
    output wire KEYCtrl,            //4*4键盘          0xFFFFFC10
    output wire CTCCtrl,            //定时/计数器      0xFFFFFC20
    output wire PWMCtrl,            // 脉冲宽度调制器  0xFFFFFC30
    output wire WDTCtrl,            //看门狗?         0xFFFFFC50
    output wire LEDCtrl,            //LED灯            0xFFFFFC60
    output wire SWCtrl,             //拨码开关         0xFFFFFC70
    
    output wire[3:0] portAddress,      //PortNum
    output wire[31:0] rdata,        //存储器/io中的数据输出
    output reg[31:0] write_data   //准备写入mem/io的数据

    );

    wire iorw;

    assign portAddress = caddress[3:0];
    assign rdata = (memread == 1) ? mread_data : ioread_data;
    assign iorw = (iowrite || ioread);

    assign DISPCtrl = ((iorw == 1) && (caddress[9:4] == 6'b000000)) ? 1'b1 : 1'b0;
    assign KEYCtrl = ((iorw == 1) && (caddress[9:4] == 6'b000001)) ? 1'b1 : 1'b0;
    assign CTCCtrl = ((iorw == 1) && (caddress[9:4] == 6'b000010)) ? 1'b1 : 1'b0;
    assign PWMCtrl = ((iorw == 1) && (caddress[9:4] == 6'b000011)) ? 1'b1 : 1'b0;
    assign WDTCtrl = ((iorw == 1) && (caddress[9:4] == 6'b000101)) ? 1'b1 : 1'b0;
    assign LEDCtrl = ((iorw == 1) && (caddress[9:4] == 6'b000110)) ? 1'b1 : 1'b0;
    assign SWCtrl = ((iorw == 1) && (caddress[9:4] == 6'b000111)) ? 1'b1 : 1'b0;
    
    always @(*)
    begin
        if ((memwrite == 1) || (iowrite == 1)) begin
            write_data = wdata;
        end
        else begin
            write_data = 32'h0;
        end
    end
endmodule
