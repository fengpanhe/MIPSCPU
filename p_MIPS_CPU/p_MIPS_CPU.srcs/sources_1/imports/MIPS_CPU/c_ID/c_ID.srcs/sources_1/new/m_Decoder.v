`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/24 16:18:56
// Design Name: 
// Module Name: m_Decoder
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


module m_Decoder(
    input[5:0] op,
    input[5:0] func,
    input[4:0] rs,
    output MemToReg,                //决定写回到Regs的数据源 0:ALU 1:MEM
    output CPToReg,                 //决定写回Regs的数据源 0：其他 1:CP0
    output MemWr,                   //MEM写使能信号
    output MemRead,                 //MEM读指令信号，用于进行冒险检测
    output[1:0] MemReadSize,        //MEM读指令选择读取的数据字长 00:1B 01:2B 11:4B
    output MemExtType,              //MEM读指令输出数据的扩展方式 0:零扩展(ZE) 1:符号扩展(SE)
    output RegWr,                   //Regs写使能信号
    output CPWr,                    //CP0写使能信号
    output RegDst,                  //决定写回Regs的地址 0:RtAddr 1:RdAddr
    output ALUsrcA,                 //决定ALU操作数A的数据源 0:RsData 1:(ZE)Sa
    output ALUsrcB,                 //决定ALU操作数B的数据源 0:RtData 1:(SE)Imme
    output reg[4:0] ALUCode,        //决定ALU采取何种运算以及ZeroTest采取何种分支条件
    output Jmp,                       //跳转指令
    output Jr,                      //寄存器跳转指令
    output Jal,                     //需保存PC的无条件跳转指令
    output Bal                      //需保存PC的有条件跳转指令
    );
    /*R_type_instructions*/
    parameter R_type_op = 6'b000000;
    parameter Interrupt_op = 6'b010000;
    parameter ADD_func = 6'b100000;
    parameter ADDU_func = 6'b100001;
    parameter SUB_func = 6'b100010;
    parameter SUBU_func = 6'b100011;
    parameter AND_func = 6'b100100;
    parameter MULT_func = 6'b011000;
    parameter MULTU_func = 6'b011001;
    parameter DIV_func = 6'b011010;
    parameter DIVU_func = 6'b011011;
    parameter MFHI_func = 6'b010000;
    parameter MFLO_func = 6'b010010;
    parameter MTHI_func = 6'b010001;
    parameter MTLO_func = 6'b010011;
    parameter OR_func = 6'b100101;
    parameter XOR_func = 6'b100110;
    parameter NOR_func = 6'b100111;
    parameter SLT_func = 6'b101010;
    parameter SLTU_func = 6'b101011;
    parameter SLL_func = 6'b000000;
    parameter SRL_func = 6'b000010;
    parameter SRA_func = 6'b000011;
    parameter SLLV_func = 6'b000100;
    parameter SRLV_func = 6'b000110;
    parameter SRAV_func = 6'b000111;
    parameter JR_func = 6'b001000;
    parameter JALR_func = 6'b001001;
    parameter BREAK_func = 6'b001101;
    parameter SYSCALL_func = 6'b001100;
    parameter ERET_func = 6'b011000;
    /*I_type_instruction*/
    parameter ADDI_op = 6'b001000;
    parameter ADDIU_op = 6'b001001;
    parameter ANDI_op = 6'b001100;
    parameter ORI_op = 6'b001101;
    parameter XORI_op = 6'b001110;
    parameter LUI_op = 6'b001111;
    parameter LB_op = 6'b100000;
    parameter LBU_op = 6'b100100;
    parameter LH_op = 6'b100001;
    parameter LHU_op = 6'b100101;
    parameter SB_op = 6'b101000;
    parameter SH_op = 6'b101001;
    parameter LW_op = 6'b100011;
    parameter SW_op = 6'b101011;
    parameter BEQ_op = 6'b000100;
    parameter BNE_op = 6'b000101;
    parameter BGEZ_op = 6'b000001;
    parameter BGTZ_op = 6'b000111;
    parameter BLEZ_op = 6'b000110;
    parameter BLTZ_op = 6'b000001;
    parameter BGEZAL_op = 6'b000001;
    parameter BLTZAL_op = 6'b000001;
    parameter SLTI_op = 6'b001010;
    parameter SLTIU_op = 6'b001011;
    /*J_type_instruction*/
    parameter J_op = 6'b000010;
    parameter JAL_op = 6'b000011;
    
    //指令类型信号 1表示对应指令成立
     wire ADD,ADDU,SUB,SUBU,AND,MULT,MULTU,DIV,DIVU,MFHI,MFLO,MTHI,MTLO,OR,XOR,NOR,SLT,SLTU,SLL,
                SRL,SRA,SLLV,SRLV,SRAV,JR,JALR,BREAK,SYSCALL,ERET;
     wire ADDI,ANDI,ORI,XORI,LUI,LB,LBU,LH,LHU,SB,SH,LW,SW,BEQ,BNE,BGEZ,BGTZ,BLEZ,BLTZ,BGEZAL,BLTZAL,SLTI,SLTIU;
     wire J,JAL;
     wire MFC0,MTC0;
     //R型指令
     assign ADD = (op == R_type_op) && (func == ADD_func);
     assign ADDU = (op == R_type_op) && (func == ADDU_func);
     assign SUB = (op == R_type_op) && (func == SUB_func);
     assign SUBU = (op == R_type_op) && (func == SUBU_func);
     assign AND = (op == R_type_op) && (func == AND_func);
     assign MULT = (op == R_type_op) && (func == MULT_func);
     assign MULTU = (op == R_type_op) && (func == MULTU_func);
     assign DIV = (op == R_type_op) && (func == DIV_func);
     assign DIVU = (op == R_type_op) && (func == DIV_func);
     assign MFHI = (op == R_type_op) && (func == MFHI_func);
     assign MFLO = (op == R_type_op) && (func == MFLO_func);
     assign MTHI = (op == R_type_op) && (func == MTHI_func);
     assign MTLO = (op == R_type_op) && (func == MTLO_func);
     assign OR = (op == R_type_op) && (func == OR_func);
     assign XOR = (op == R_type_op) && (func == XOR_func);
     assign NOR = (op == R_type_op) && (func == NOR_func);
     assign SLT = (op == R_type_op) && (func == SLT_func);
     assign SLTU = (op == R_type_op) && (func == SLTU_func);
     assign SLL = (op == R_type_op) && (func == SLL_func);
     assign SRL = (op == R_type_op) && (func == SRL_func);
     assign SRA = (op == R_type_op) && (func == SRA_func);
     assign SLLV = (op == R_type_op) && (func == SLLV_func);
     assign SRLV = (op == R_type_op) && (func == SRLV_func);
     assign SRAV = (op == R_type_op) && (func == SRAV_func);
     assign JR = (op == R_type_op) && (func == JR_func);
     assign JALR = (op == R_type_op) && (func == JALR_func);
     
     assign BREAK = (op == R_type_op) && (func == BREAK_func);
     assign SYSCALL = (op == R_type_op) && (func == SYSCALL_func);
     
     //CP0相关指令
     assign MFC0 = (op == Interrupt_op) && (rs == 5'b00000);
     assign MTC0 = (op == Interrupt_op) && (rs == 5'b00100);  
     assign ERET = (op == Interrupt_op) && (func == ERET_func);   
     //I型指令
     assign ADDI = (op == ADDI_op);
     assign ADDIU = (op == ADDIU_op);
     assign ANDI = (op == ANDI_op);
     assign ORI = (op == ORI_op);
     assign XORI = (op == XORI_op);
     assign LUI = (op == LUI_op);
     assign LB = (op == LB_op);
     assign LBU = (op == LBU_op);
     assign LH = (op == LH_op);
     assign LHU = (op == LHU_op);
     assign SB = (op == SB_op);
     assign SH = (op == SH_op);
     assign LW = (op == LW_op);
     assign SW = (op == SW_op);
     assign BEQ = (op == BEQ_op);
     assign BNE = (op == BNE_op);
     assign BGEZ = (op == BGEZ_op);
     assign BGTZ = (op == BGTZ_op);
     assign BLEZ = (op == BLEZ_op);
     assign BLTZ = (op == BLTZ_op);
     assign BGEZAL = (op == BGEZAL_op);
     assign BLTZAL = (op == BLTZAL_op);
     assign SLTI = (op == SLTI_op);
     assign SLTIU = (op == SLTIU_op);
     //J型指令
     assign J = (op == J_op);
     assign JAL = (op == JAL_op);
     
     //辅助判断信号
     wire R_type1;//需要写回Regs且两个操作数都来自Regs的指令
     wire R_type2;//不需要写回Regs且两个操作数都来自Regs的指令
     wire R_type3;//需要写回且其中操作数A来自Sa
     wire I_type1;//需要写回Regs的ALU运算指令
     wire I_type2;//MEM读指令,需写回Regs
     wire I_type3;//MEM写指令
     wire Int_type;
     
      assign R_type1 = ADD | ADDU | SUB | SUBU | AND | OR | XOR | NOR | SLT | SLTU | SLLV | SRLV | SRAV | JALR | MFHI | MFLO;
      assign R_type2 = MULT| MULTU | DIV | DIVU | MTHI | MTLO;
      assign R_type3 = SLL | SRL | SRA;
      assign I_type1 = ADDI | ADDIU | ANDI | ORI | XORI | LUI | SLTI | SLTIU;
      assign I_type2 = LB | LBU | LH | LHU | LW;
      assign I_type3 = SB | SH | SW;
     //设计输出信号逻辑
     assign MemToReg = I_type2;
     assign CPToReg = MFC0;
     assign MemWr = I_type3;
     assign MemRead = I_type2;
     assign MemExtType = LB | LH ;
     assign MemReadSize[0] = LH | LHU | LW | SH | SW ;
     assign MemReadSize[1] = LW | SW;
     assign RegWr = R_type1 | R_type3 | I_type1 | I_type2 | BGEZAL | BLTZAL | JAL | MFC0;
     assign CPWr = MTC0;
     assign RegDst = R_type1 | R_type3 | BGEZAL | BLTZAL | JAL;
     assign ALUsrcA = R_type3;
     assign ALUsrcB = I_type1 | I_type2 | I_type3;
     assign Jmp = J | JAL;
     assign Jr = JR | JALR;
     assign Jal = JALR | JAL;
     assign Bal = BGEZAL | BLTZAL;
     
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
          
     parameter ALU_BEQ = 5'd23;
     parameter ALU_BNE = 5'd24;
     parameter ALU_BGEZ = 5'd25;
     parameter ALU_BGTZ = 5'd26;
     parameter ALU_BLEZ = 5'd27;
     parameter ALU_BLTZ = 5'd28;
     
     parameter ALU_MCP0 = 5'd29;
     parameter ALU_EXCEPT = 5'd30;
     parameter ALU_NONE = 5'd31;
      
     /*assignment for ALUCode*/
     always @(*)
     begin
     if(op == R_type_op)
        case(func)
        ADD_func: ALUCode <= ALU_ADD;
        ADDU_func: ALUCode <= ALU_ADD;
        SUB_func: ALUCode <= ALU_SUB;
        SUBU_func: ALUCode <= ALU_SUB;
        AND_func: ALUCode <= ALU_AND;
        MULT_func: ALUCode <= ALU_MULT;
        MULTU_func: ALUCode <= ALU_MULTU;
        DIV_func: ALUCode <= ALU_DIV;
        DIVU_func: ALUCode <= ALU_DIVU;
        MFHI_func: ALUCode <= ALU_MFHI;
        MFLO_func: ALUCode <= ALU_MFLO;
        MTHI_func: ALUCode <= ALU_MTHI;
        MTLO_func: ALUCode <= ALU_MTLO;
        OR_func: ALUCode <= ALU_OR;
        XOR_func: ALUCode <= ALU_XOR;
        NOR_func: ALUCode <= ALU_NOR;
        SLT_func: ALUCode <= ALU_SLT;
        SLTU_func: ALUCode <= ALU_SLTU;
        SLL_func: ALUCode <= ALU_SLL;
        SRL_func: ALUCode <= ALU_SRL;
        SRA_func: ALUCode <= ALU_SRA;
        SLLV_func: ALUCode <= ALU_SLL;
        SRLV_func: ALUCode <= ALU_SRL;
        SRAV_func: ALUCode <= ALU_SRA;
        JR_func: ALUCode <= ALU_ADD;
        JALR_func: ALUCode <= ALU_ADD;
        SYSCALL_func: ALUCode <= ALU_EXCEPT;
        BREAK_func: ALUCode <= ALU_EXCEPT;
        default : ALUCode <= ALU_NONE;
        endcase
    else
        case(op)
        ADDI_op: ALUCode <= ALU_ADD;
        ADDIU_op: ALUCode <= ALU_ADD;
        ANDI_op: ALUCode <= ALU_ANDI;
        ORI_op: ALUCode <= ALU_ORI;
        XORI_op: ALUCode <= ALU_XORI;
        LUI_op: ALUCode <= ALU_LUI;
        LB_op: ALUCode <= ALU_ADD;
        LBU_op: ALUCode <= ALU_ADD;
        LH_op: ALUCode <= ALU_ADD;
        LHU_op: ALUCode <= ALU_ADD;
        SB_op: ALUCode <= ALU_ADD;
        SH_op: ALUCode <= ALU_ADD;
        LW_op: ALUCode <= ALU_ADD;
        SW_op: ALUCode <= ALU_ADD;
        BEQ_op: ALUCode <= ALU_BEQ;
        BNE_op: ALUCode <= ALU_BNE;
        BGEZ_op: ALUCode <= ALU_BGEZ;
        BGTZ_op: ALUCode <= ALU_BGTZ;
        BLEZ_op: ALUCode <= ALU_BLEZ;
        BLTZ_op: ALUCode <= ALU_BLTZ;
        BGEZAL_op: ALUCode <= ALU_BGEZ;
        BLTZAL_op: ALUCode <= ALU_BLTZ;
        SLTI_op: ALUCode <= ALU_SLT;
        SLTIU_op: ALUCode <= ALU_SLTU;
        J_op: ALUCode <= ALU_ADD;
        JAL_op: ALUCode <= ALU_ADD;
        Interrupt_op:begin
                    if(func == ERET_func)
                    ALUCode <= ALU_EXCEPT;
                    else
                    ALUCode <= ALU_MCP0;
                    end
        default: ALUCode <= ALU_NONE; 
        endcase
    end     
endmodule
