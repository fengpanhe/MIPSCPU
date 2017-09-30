`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2017 02:22:42 PM
// Design Name: 
// Module Name: cp0_reg
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

`include "defines.v"

module cp0_reg(
    input wire rst,
    input wire clk,

    input wire we_i,                //CP0��дʹ�ܶ�
    input wire[4:0] waddr_i,        //CP0д���ַѡ��
    input wire[`RegBus] data_i,     //CP0д������

    input wire[4:0] raddr_i,        //CP0��ȡ��ַ
    output reg[`RegBus] data_o,     //CP0��ȡ����

    //�쳣�������ӿ�
    input wire[4:0] excepttype_i,                  //�쳣���ͱ��
    input wire[5:0] int_i,                          //6���ⲿӲ���ж�����
    input wire[`InstAddrBus] current_inst_addr_i,   //�����쳣��ָ���ַ

    output reg[`RegBus] status_o,   //Status Reg��ֵ
    output reg[`RegBus] cause_o,    //Cause Reg��ֵ
    output reg[`RegBus] epc_o      //EPC Reg��ֵ�����ڱ����жϷ��ص�ַ

    );

//******************************************************************************
//                     ��CP0�мĴ�����д������ʱ���߼�
//  Cause Reg��ֻ������IP[5:0]��ExcCode[4:0]�ֶο�д
//******************************************************************************
    always @ ( posedge clk ) begin
        if(rst == `RstEnable) begin
            //Status�Ĵ����ĳ�ʼֵ
            status_o <= 32'b0001_0000_0000_0000_0000_0000_0000_0000;
            //Cause�Ĵ����ĳ�ʼֵ
            cause_o <= `ZeroWord;
            //EPC�Ĵ����ĳ�ʼֵ
            epc_o <= `ZeroWord;
        end else begin
            //Cause�Ĵ�����[13:8]λ�����ⲿ�ж�����
            if(we_i == `WriteEnable) begin
                case(waddr_i)
                    `CP0_REG_STATUS:begin           //дStatus�Ĵ���
                        status_o <= data_i;
                    end
                    `CP0_REG_EPC:begin              //дEPC�Ĵ���
                        epc_o <= data_i;
                    end
                    `CP0_REG_CAUSE:begin            //дCause�Ĵ���
                        cause_o[13:8] <= data_i[13:8];    //IP[5:0]
                    end
                endcase
            end
            
            //�����쳣       
            case(excepttype_i)
                //�ⲿӲ���ж�
                5'b00000:begin                
                    epc_o <= current_inst_addr_i;  //���淵�ص�ַ
                    cause_o[6:2] <= 5'b00000;      //����ExcCode
                end
                //ϵͳ����syscall
                5'b01000:begin                 
                    epc_o <= current_inst_addr_i;
                    cause_o[6:2] <= 5'b01000;
                end
                //break�쳣
                5'b01001:begin
                    epc_o <= current_inst_addr_i;
                    cause_o[6:2] <= 5'b01010;
                end
                //��Ч������ָ���쳣
                5'b01010:begin                
                    epc_o <= current_inst_addr_i;
                    cause_o[6:2] <= 5'b01010;
                end
                //�Ӽ�����쳣
                5'b01100:begin 
                    epc_o <= current_inst_addr_i;
                    cause_o[6:2] <= 5'b01100;
                end
                default:begin
                end
            endcase
        end
    end


//******************************************************************************
//                      ��CP0�мĴ����Ķ�����������߼�
//******************************************************************************
    always @ ( * ) begin
        if(rst == `RstEnable) begin
            data_o <= `ZeroWord;
        end else begin
            case(raddr_i)
                `CP0_REG_STATUS:begin               //��Status�Ĵ���
                    data_o <= status_o;
                end
                `CP0_REG_CAUSE:begin                //��Cause�Ĵ���
                    data_o <= cause_o;
                end
                `CP0_REG_EPC:begin                  //��EPC�Ĵ���
                    data_o <= epc_o;
                end
                default:begin
                end
            endcase
        end
    end

endmodule
