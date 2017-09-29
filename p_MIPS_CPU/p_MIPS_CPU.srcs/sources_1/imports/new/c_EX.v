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
    input RegDst_ex,
    input[4:0] ALUCode_ex,
    input ALUsrcA_ex,
    input ALUsrcB_ex,
    input[31:0] Imme_ex,
    input[31:0] Sa_ex,
    input[4:0] RsAddr_ex,
    input[4:0] RtAddr_ex,
    input[4:0] RdAddr_ex,
    input[31:0] RsData_ex,
    input[31:0] RtData_ex,
    input[31:0] RegWrData_wb,
    input[31:0] ALUResult_mem,
    input[4:0] RegWrAddr_wb,
    input[4:0] RegWrAddr_mem,
    input RegWr_wb,
    input RegWr_mem,
    input AL_ex,
    output reg[4:0] RegWrAddr_ex,
    output[31:0] ALUResult_ex,
    output[31:0] MemWrData_ex,
    output Overflow,
    output reg[31:0] ALU_A,
    output reg[31:0] ALU_B,
    output[1:0] forwardA,
    output[1:0] forwardB
    );
    wire[1:0] ForwardA,ForwardB;
    assign forwardA = ForwardA;
    assign forwardB = ForwardB;
    reg[31:0] MuxA,MuxB;//ALU_A,ALU_B;
    assign MemWrData_ex = MuxB;
    //处理冲突的转发部件
    m_Forward forward(
    .RegWrAddr_mem(RegWrAddr_mem),
    .RegWrAddr_wb(RegWrAddr_wb),
    .RegWr_mem(RegWr_mem),
    .RegWr_wb(RegWr_wb),
    .RsAddr_ex(RsAddr_ex),
    .RtAddr_ex(RtAddr_ex),
    .ForwardA(ForwardA),
    .ForwardB(ForwardB)
    );
    //ALU的A,B数据源的多路选择器
    always @(*) begin
        case(ForwardA)
            2'b00: MuxA <= RsData_ex;
            2'b01: MuxA <= RegWrData_wb;
            2'b10: MuxA <= ALUResult_mem;
            default: MuxA <= 32'bx;
        endcase
    end

    always @(*) begin
        case(ForwardB)
            2'b00: MuxB <= RtData_ex;
            2'b01: MuxB <= RegWrData_wb;
            2'b10: MuxB <= ALUResult_mem;
            default: MuxB <= 32'bx;
        endcase
    end

    always @(*) begin
        case(ALUsrcA_ex)
            1'b0: ALU_A <= MuxA;
            1'b1: ALU_A <= Sa_ex;
            default: ALU_A <= 32'bx;
        endcase
    end

    always @(*) begin
        case(ALUsrcB_ex)
            1'b0: ALU_B <= MuxB;
            1'b1: ALU_B <= Imme_ex;
            default: ALU_B <= 32'bx;
        endcase
    end

    //选择RegWrAddr的多路选择器
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
    .ALUCode(ALUCode_ex),
    .ALU_A(ALU_A),
    .ALU_B(ALU_B),
    .ALU_Result(ALUResult_ex),
    .Overflow(Overflow)
    );
endmodule
