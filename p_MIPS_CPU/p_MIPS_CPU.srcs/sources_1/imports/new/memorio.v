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
    input wire[31:0] caddress,      //��ִ�е�Ԫ����alu_result[31:0]
    input wire memread,             //�洢���������ź�
    input wire memwrite,            //�洢��д�����ź�
    input wire ioread,              //io�������ź�             
    input wire iowrite,             //ioд�����ź�?

    input wire[31:0] mread_data,    //�Ӵ洢����ȡ������
    input wire[31:0] ioread_data,    //��io��ȡ������

    input wire[31:0] wdata,         //Ҫ������洢����io�е�����

    

    //�����Ƭѡ�ź�
    output wire DISPCtrl,           //�����           0xFFFFFC00
    output wire KEYCtrl,            //4*4����          0xFFFFFC10
    output wire CTCCtrl,            //��ʱ/������      0xFFFFFC20
    output wire PWMCtrl,            // �����ȵ�����  0xFFFFFC30
    output wire WDTCtrl,            //���Ź�?         0xFFFFFC50
    output wire LEDCtrl,            //LED��            0xFFFFFC60
    output wire SWCtrl,             //���뿪��         0xFFFFFC70
    
    output wire[3:0] portAddress,      //PortNum
    output wire[31:0] rdata,        //�洢��/io�е��������
    output reg[31:0] write_data   //׼��д��mem/io������

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
