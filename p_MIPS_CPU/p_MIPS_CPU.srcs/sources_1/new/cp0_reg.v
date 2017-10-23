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
    input we_i,                //CP0的写使能端
    input[4:0] waddr_i,        //CP0写入地址选择
    input[31:0] data_i,     //CP0写入数据
    input[4:0] raddr_i,        //CP0读取地址
    output reg[31:0] data_o,     //CP0读取数据    
    input[2:0] ForwardCP,
    input[2:0] ForwardEPC,
    input[31:0] CPWrData_ex,
    input[31:0] CPWrData_mem,
    //异常相关输入接口
    input[4:0] excepttype_i,                  //异常类型编号
    input[5:0] int_i,                          //6个外部硬件中断输入
    input[31:0] current_inst_addr_i,   //发生异常的指令地址

    output reg[31:0] status_o,   //Status Reg的值
    output reg[31:0] cause_o,    //Cause Reg的值
    output reg[31:0] epc_o,      //EPC Reg的值，用于保存中断返回地址
    output reg[31:0] eretAddr,
    output  int_en,              //中断使能位
    output[5:0] int_mask

    );
    reg[31:0] CPResult;
    //assign eretAddr = epc_o;
    assign int_en = status_o[0];
    assign int_mask = status_o[15:10];
//******************************************************************************
//                     对CP0中寄存器的写操作：时序逻辑
//  Cause Reg中只有其中IP[5:0]、ExcCode[4:0]字段可写
//******************************************************************************
    always @ ( posedge clk ) begin
        if(rst == `RstEnable) begin
            //Status寄存器的初始值
            status_o <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
            //Cause寄存器的初始值
            cause_o <= `ZeroWord;
            //EPC寄存器的初始值
            epc_o <= `ZeroWord;
        end else begin
            //Cause寄存器的[13:8]位保存外部中断类型
            if(we_i == `WriteEnable) begin
                case(waddr_i)
                    `CP0_REG_STATUS:begin           //写Status寄存器
                        status_o <= data_i;
                    end
                    `CP0_REG_EPC:begin              //写EPC寄存器
                        epc_o <= data_i;
                    end
                    `CP0_REG_CAUSE:begin            //写Cause寄存器
                        cause_o[13:8] <= data_i[13:8];    //IP[5:0]
                        cause_o[6:2] <= 5'b00000;
                    end
                endcase
            end
            
           
            //处理异常       
            case(excepttype_i)
                //外部硬件中断
                5'b00000:begin                
                    epc_o <= current_inst_addr_i;  //保存返回地址
                    cause_o[6:2] <= 5'b00000;      //设置ExcCode
                    cause_o[13:8] <= int_i;        //设置中断编码
                    //status_o[0] <= 0;              //关中断
                    //status_o[15:10] <= 6'b000000;  //设置中断屏蔽
                end
                //系统调用syscall
                5'b01000:begin                 
                    epc_o <= current_inst_addr_i;
                    cause_o[6:2] <= 5'b01000;
                end
                //break异常
                5'b01001:begin
                    epc_o <= current_inst_addr_i;
                    cause_o[6:2] <= 5'b01010;
                end
                //无效、保留指令异常
                5'b01010:begin                
                    epc_o <= current_inst_addr_i;
                    cause_o[6:2] <= 5'b01010;
                end
                //加减溢出异常
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
//                      对CP0中寄存器的读操作：组合逻辑
//******************************************************************************
    always @ ( * ) begin
        if(rst == `RstEnable) begin
            CPResult <= `ZeroWord;
        end else begin
            case(raddr_i)
                `CP0_REG_STATUS:begin               //读Status寄存器
                    CPResult <= status_o;
                end
                `CP0_REG_CAUSE:begin                //读Cause寄存器
                    CPResult <= cause_o;
                end
                `CP0_REG_EPC:begin                  //读EPC寄存器
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
