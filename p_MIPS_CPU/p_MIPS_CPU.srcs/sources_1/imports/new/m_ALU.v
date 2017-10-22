`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2017 10:20:24 AM
// Design Name: 
// Module Name: m_ALU
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


module m_ALU(
    input clk,
    input reset,
    input[4:0] ALUCode,             //ALU要执行的运算类型
    input[31:0] ALU_A,              //ALU源操作数A
    input[31:0] ALU_B,              //ALU源操作数B
    output reg[31:0] ALU_Result,   //ALU运算结果
    output[31:0] HI,                
    output[31:0] LO,
    output reg Overflow            //有符号加减运算溢出标志
    );
    
    /*ALU_OP Parameters*/
   parameter ALU_ADD = 5'd0;
   parameter ALU_SUB = 5'd1;
   parameter ALU_MULT = 5'd2;
   parameter ALU_MULTU = 5'd3; 
   parameter ALU_DIV = 5'd4;
   parameter ALU_DIVU = 5'd5;
   parameter ALU_MFHI = 5'd6;
   parameter ALU_MFLO = 5'd7;
   parameter ALU_MTHI = 5'd8;
   parameter ALU_MTLO = 5'd9;
    
   parameter ALU_AND = 5'd10;
   parameter ALU_OR = 5'd11;
   parameter ALU_XOR = 5'd12;
   parameter ALU_NOR = 5'd13;
   parameter ALU_ANDI = 5'd14;
   parameter ALU_ORI = 5'd15;
   parameter ALU_XORI = 5'd16;    
   parameter ALU_LUI = 5'd17;
    
   parameter ALU_SLL = 5'd18;
   parameter ALU_SRL = 5'd19;
   parameter ALU_SRA = 5'd20;
   parameter ALU_SLT = 5'd21;
   parameter ALU_SLTU = 5'd22;
    
    reg[31:0] HI;
    reg[31:0] LO;
    initial
    begin
    HI <= 32'b0;
    LO <= 32'b0;
    end
    
    reg signed[31:0] B_signed;
    reg[31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
    always @(ALU_B) B_signed = ALU_B;    //将B转换为有符号数便于进行移位运算
    wire[31:0] sum;                     //加、减法运算结果
    wire[63:0] multRes,multRes_signed;  //乘法运算结果
    wire[63:0] divRes, divRes_signed;   //除法运算结果
    wire CF,Cout,isAdd;              //标志位 
    //assign OF = &(ALU_A[31:0]~^ALU_B[31:0]);    //判断A、B是否相等的标志位
    assign CF = Cout^isAdd;                     //判断是否有进位/借位的标志位
    assign isAdd = ~(ALUCode == ALU_ADD);       //判断是否是加法运算 0-add 1-others
    wire[31:0] B2;                      //操作数B的反码
    assign B2 = ALU_B^{32{isAdd}};
    //有/无符号加减法运算
    m_addsuber aluAdder (
      .A(ALU_A),          // input wire [31 : 0] A
      .B(B2),          // input wire [31 : 0] B
      .C_IN(isAdd),    // input wire C_IN
      .C_OUT(Cout),  // output wire C_OUT
      .S(sum)          // output wire [31 : 0] S
    );
    //无符号乘法运算
    m_multiplier aluMultiplier (
         .A(ALU_A),      // input wire [31 : 0] A
         .B(ALU_B),      // input wire [31 : 0] B
         .P(multRes)      // output wire [63 : 0] P
    );
    //有符号乘法运算
    m_signedMult aluMultiplier2(
         .A(ALU_A),
         .B(ALU_B),
         .P(multRes_signed)
    );
    
    m_signedDiv aluSignedDiv(
        .A(ALU_A),
        .B(ALU_B),
        .P(divRes_signed)
    );
    m_divider divider (
        .s_axis_divisor_tvalid(1'b1),
        .s_axis_divisor_tdata(ALU_B),      // input wire [31 : 0] s_axis_divisor_tdata
        .s_axis_dividend_tvalid(1'b1), 
        .s_axis_dividend_tdata(ALU_A),    // input wire [31 : 0] s_axis_dividend_tdata
        .m_axis_dout_tdata(divRes)            // output wire [63 : 0] m_axis_dout_tdata
    );
    
    //判断有符号加减法是否溢出
    always @(*)
    begin
        if((ALU_A[31]^sum[31]) && (B2[31]^sum[31]) && ((ALUCode == ALU_ADD) || (ALUCode == ALU_SUB)))
            Overflow = 1;
        else
            Overflow = 0;
    end
    always @(*)
    begin
        r0 = sum;                           //add|addi|sub|subi
        r1 <= ALU_A & ALU_B;                //and
        r2 <= ALU_A | ALU_B;                //or
        r3 <= ALU_A ^ ALU_B;                //xor
        r4 <= ~(ALU_A | ALU_B);             //nor
        r5 <= ALU_A & {16'b0,ALU_B[15:0]};  //andi
        r6 <= ALU_A | {16'b0,ALU_B[15:0]};  //ori
        r7 <= ALU_A ^ {16'b0,ALU_B[15:0]};  //xori
        r8 <= {ALU_B[15:0],16'b0};          //lui
        r9 <= ALU_B << ALU_A;               //sll|sllv
        r10 <= ALU_B >> ALU_A;              //srl|srlv
        r11 <= B_signed >> ALU_A;           //sra|srav
        r12 = (ALU_A[31]&&(~ALU_B[31])) || ((ALU_A[31]~^ALU_B[31])&&sum[31]);//slt
        r13 = CF;                           //sltu
        r14 = HI;                           //mfhi
        r15 = LO;                           //mflo
    end
    
    always @(*) begin
        if(reset == 1) begin
            HI <= 32'h00000000;
            LO <= 32'h00000000;
        end
        else begin    
            case(ALUCode)
            ALU_MULT: {HI,LO} <= multRes_signed;
            ALU_MULTU: {HI,LO} <= multRes;
            ALU_DIV: {HI,LO} <= divRes_signed;
            ALU_DIVU: {HI,LO} <= divRes;
            ALU_MTHI: HI = ALU_A;
            ALU_MTLO: LO = ALU_A;
            endcase
        end
    end
    /*always @ (negedge clk) begin
        if(ALUCode == ALU_MULT || ALUCode == ALU_MULTU || ALUCode == ALU_DIV || ALUCode == ALU_DIVU)
        begin
            HI <= HI_tmp;
            LO <= LO_tmp;
        end
    
    end*/
    always @(*) begin
        case(ALUCode)
            ALU_ADD: ALU_Result = r0; 
            ALU_SUB: ALU_Result = r0;
           /* ALU_MULT: {HI_tmp,LO_tmp} = multRes_signed;
            ALU_MULTU: {HI_tmp,LO_tmp} = multRes;
            ALU_DIV: {HI_tmp,LO_tmp} = divRes_signed;
            ALU_DIVU: {HI_tmp,LO_tmp} = divRes;*/
            ALU_AND: ALU_Result = r1;
            ALU_OR:  ALU_Result = r2;
            ALU_XOR: ALU_Result = r3;
            ALU_NOR: ALU_Result = r4;
            ALU_SLT: ALU_Result = r12;
            ALU_SLTU: ALU_Result = r13;
            ALU_SLL: ALU_Result = r9;
            ALU_SRL: ALU_Result = r10;
            ALU_SRA: ALU_Result = r11;
            ALU_MFHI: ALU_Result = r14;
            ALU_MFLO: ALU_Result = r15;
            //ALU_MTHI: HI = ALU_A;
            //ALU_MTLO: LO = ALU_A;
            ALU_ANDI: ALU_Result = r5;
            ALU_ORI: ALU_Result = r6;
            ALU_XORI: ALU_Result = r7;
            ALU_LUI: ALU_Result = r8;
            default:ALU_Result = 32'b0;
        endcase
    end 
endmodule