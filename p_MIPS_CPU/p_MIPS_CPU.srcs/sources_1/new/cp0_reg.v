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
    input rst,
    input clk,
    input en,
    input we_i,                //CP0��дʹ�ܶ�
    input[4:0] waddr_i,        //CP0д���ַѡ��
    input[31:0] data_i,     //CP0д������
    input[4:0] raddr_i,        //CP0��ȡ��ַ
    output reg[31:0] data_o,     //CP0��ȡ����    
    input[2:0] ForwardCP,
    input[2:0] ForwardEPC,
    input[31:0] CPWrData_ex,
    input[31:0] CPWrData_mem,
    //�쳣�������ӿ�
    input[4:0] excepttype_i,                  //�쳣���ͱ��
    input[5:0] int_i,                          //6���ⲿӲ���ж�����
    input[31:0] current_inst_addr_i,   //�����쳣��ָ���ַ

    output reg[31:0] status_o,   //Status Reg��ֵ
    output reg[31:0] cause_o,    //Cause Reg��ֵ
    output reg[31:0] epc_o,      //EPC Reg��ֵ�����ڱ����жϷ��ص�ַ
    output reg[31:0] eretAddr,
    output  int_en,              //�ж�ʹ��λ
    output[5:0] int_mask

    );
    reg[31:0] CPResult;
    //assign eretAddr = epc_o;
    assign int_en = status_o[0];
    assign int_mask = status_o[15:10];
//******************************************************************************
//                     ��CP0�мĴ�����д������ʱ���߼�
//  Cause Reg��ֻ������IP[5:0]��ExcCode[4:0]�ֶο�д
//******************************************************************************
    always @ ( posedge clk ) begin
        if(rst == `RstEnable) begin
            //Status�Ĵ����ĳ�ʼֵ
            status_o <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
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
                        cause_o[6:2] <= 5'b00000;
                    end
                endcase
            end
            
           
            //�����쳣       
            case(excepttype_i)
                //�ⲿӲ���ж�
                5'b00000:begin                
                    epc_o <= current_inst_addr_i;  //���淵�ص�ַ
                    cause_o[6:2] <= 5'b00000;      //����ExcCode
                    cause_o[13:8] <= int_i;        //�����жϱ���
                    //status_o[0] <= 0;              //���ж�
                    //status_o[15:10] <= 6'b000000;  //�����ж�����
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
            CPResult <= `ZeroWord;
        end else begin
            case(raddr_i)
                `CP0_REG_STATUS:begin               //��Status�Ĵ���
                    CPResult <= status_o;
                end
                `CP0_REG_CAUSE:begin                //��Cause�Ĵ���
                    CPResult <= cause_o;
                end
                `CP0_REG_EPC:begin                  //��EPC�Ĵ���
                    CPResult <= epc_o;
                end
                default:begin
                end
            endcase
        end
    end
    
    always @(*)
    begin
        case(ForwardCP)
        3'b000: data_o <= CPResult;
        3'b001: data_o <= CPWrData_ex;
        3'b010: data_o <= CPWrData_mem;
        3'b100: data_o <= data_i;
        endcase
    end
    
    always @(*)
    begin
        case(ForwardEPC)
        3'b000: eretAddr <= epc_o;
        3'b001: eretAddr <= CPWrData_ex;
        3'b010: eretAddr <= CPWrData_mem;
        3'b100: eretAddr <= data_i;
        endcase
    end
endmodule
