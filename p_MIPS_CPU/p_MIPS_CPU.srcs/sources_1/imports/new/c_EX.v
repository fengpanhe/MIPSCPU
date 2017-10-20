`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/24 20:31:50
// Design Name: 
// Module Name: c_EX
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


module c_EX(
    input clk,
    input reset,
    input RegDst_ex,            //用于选择写回Reg的Address 0:RtAddt 1:RdAddr
    input[4:0] ALUCode_ex,      //用于选择ALU进行的运算类型
    input ALUsrcA_ex,           //用于选择ALUsrcA的源操作数 0:RsData 1:Sa
    input ALUsrcB_ex,           //用于选择ALUsrcB的源操作数 0:RtData 1:Imme
    input[31:0] Imme_ex,        //符号扩展场32位的立即数
    input[31:0] Sa_ex,          //零扩展成32位的移位立即数
    input[4:0] RtAddr_ex,
    input[4:0] RdAddr_ex,
    input[31:0] RsData_ex,
    input[31:0] RtData_ex,
    input[31:0] CPData_ex,
    input CPToReg_ex,
    input AL_ex,                        //用于选择写回Reg的Address 0:RsAddr/RtAddr 1:31号Reg
    output reg[4:0] RegWrAddr_ex,      //最终确定的写回Reg的Address
    output[4:0] CPWrAddr_ex,           //最终确定的写回CP0的Address
    output reg[31:0] ALUResult_ex,         //ALU的输出结果
    output[31:0] MemWrData_ex,         //对于SW类型的指令，需要写入MEM中的数据
    output[31:0] CPWrData_ex,          //最终确定写回CP0的数据
    output Overflow,                   //有符号加减运算的溢出标志位
    output reg[31:0] ALU_A,           //ALU的源操作数A(用于测试)
    output reg[31:0] ALU_B,          //ALU的源操作数B(用于测试)
    output[31:0] HI,                  //HI寄存器中的值(用于测试)
    output[31:0] LO                   //LO寄存器中的值(用于测试)
    );
    
    wire[31:0] ALUResult;
    initial
    begin
    RegWrAddr_ex <= 5'b00000;
    ALU_A <= 32'h00000000;
    ALU_B <= 32'h00000000;
    end
    
    assign MemWrData_ex = RtData_ex;
    assign CPWrAddr_ex = RdAddr_ex;
    assign CPWrData_ex = RtData_ex;

    //Mux for ALUsrcA
    always @(*) begin
        case(ALUsrcA_ex)
            1'b0: ALU_A <= RsData_ex;
            1'b1: ALU_A <= Sa_ex;
        endcase
    end
    //Mux for ALUsrcB
    always @(*) begin
        case(ALUsrcB_ex)
            1'b0: ALU_B <= RtData_ex;
            1'b1: ALU_B <= Imme_ex;
        endcase
    end
    
    //Mux for RegWrAddr
    wire[1:0] sel;
    assign sel[0] = RegDst_ex;
    assign sel[1] = AL_ex;
    parameter retAddr = 5'd31;
    always @(*) 
    begin
        case(sel)
            2'b00: RegWrAddr_ex <= RtAddr_ex;
            2'b01: RegWrAddr_ex <= RdAddr_ex;
            2'b10: RegWrAddr_ex <= retAddr;
            2'b11: RegWrAddr_ex <= retAddr;
        endcase
    end
    //ALU 
    m_ALU ALU(
    .clk(clk),
    .reset(reset),
    .ALUCode(ALUCode_ex),
    .ALU_A(ALU_A),
    .ALU_B(ALU_B),
    .ALU_Result(ALUResult),
    .HI(HI),
    .LO(LO),
    .Overflow(Overflow)
    );
    
    always @(*)
    begin
    if(CPToReg_ex == 1)
        ALUResult_ex <= CPData_ex;
    else
        ALUResult_ex <= ALUResult;
    end
endmodule
