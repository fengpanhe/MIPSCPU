`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/24 16:17:42
// Design Name: 
// Module Name: c_ID
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


module c_ID(
    input clk,                          //机器时钟
    input reset,
    input[31:0] Instruction_id,         //待执行指令
    input[31:0] NextPC_id,              //PC+4地址
    input RegWr_wb,                     //Regs的写使能信号
    input RegWr_mem,
    input RegWr_ex,
    input CPWr_wb,
    input CPWr_mem,
    input CPWr_ex,
    input[4:0] RegWrAddr_wb,            //Regs的写寄存器地址
    input[4:0] RegWrAddr_mem,
    input[4:0] RegWrAddr_ex,            //上一条指令写回Regs的地址，用于判断冒险发生的条件
    input[4:0] CPWrAddr_wb,
    input[4:0] CPWrAddr_mem,
    input[4:0] CPWrAddr_ex,
    input[31:0] RegWrData_wb,           //Regs的写入数据
    input[31:0] RegWrData_mem,
    input[31:0] ALUResult_ex,
    input[31:0] CPWrData_wb,
    input[31:0] CPWrData_mem,
    input[31:0] CPWrData_ex,
    input MemOrIORead_ex,                   //上一条指令是读MEM指令的信号，用于判断冒险发生的条件         
    input overFlow,
    input signedOp_ex,
    input[5:0] int_i,
    output MemOrIOToReg_id,
    output CPToReg_id,                  
    output RegWr_id,                    //译码生成的用于回写Regs的使能信号
    output CPWr_id,                     //译码生成用于回写CP0寄存器的使能信号
    output MemOrIOWr_id,                    //译码生成的用于写MEM的使能信号
    output MemOrIORead_id,                  //译码生成的指示当前指令是读MEM的信号
    output[1:0] MemReadSize_id,         //译码生成的用于判断读MEM指令读取位数的控制信号
    output MemExtType_id,               //译码生成的用于控制读MEM指令输出结果扩展方式的控制信号
    output[4:0] ALUCode_id,             //译码生成的用于选择ALU运算功能的信号
    output ALUsrcA_id,                  //译码生成的用于选择ALU操作数A的数据源的控制信号
    output ALUsrcB_id,                  //译码生成的用于选择ALU操作数A的数据源的控制信号
    output RegDst_id,                   //译码生成的用于选择回写Regs地址的控制信号
    output Stall,                       //发生冒险时用于清空ID/EX级Reg的控制信号
    output PC_IFWrite,                  //发生冒险时用于暂停IF/ID级Reg的控制信号
    output IF_flush,                    //处理跳转分支冲突的控制信号
    output Z,                        //分支指令条件成立的信号
    output J,                           //跳转指令
    output JR,                          //寄存器跳转指令
    output JAL,                      //需保存PC地址的指令
    output BAL,                      //分支跳转且需保存PC地址的指令
    output signedOp_id,
    output int_pro,
    output[31:0] BranchAddr,            //分支跳转目标地址
    output[31:0] JmpAddr,               //无条件跳转目标地址
    output[31:0] JrAddr,                //寄存器跳转目标地址
    output[31:0] RsData_id,             
    output[31:0] RtData_id,
    output[31:0] CPData_id,             
    output[4:0] RsAddr_id,             
    output[4:0] RtAddr_id,             
    output[4:0] RdAddr_id,            
    output[31:0] Sa_id,                 //零扩展成32bit的移位立即数
    output[31:0] Imme_id                //符号扩展成32bit的立即数
    );
    wire OF;                            //有符号加减溢出标志
    wire[31:0] JAddr;
    wire Je,Jmp;
    assign RsAddr_id = Instruction_id[25:21];
    assign RtAddr_id = Instruction_id[20:16];
    assign RdAddr_id = Instruction_id[15:11];
    assign Sa_id = {27'b0,Instruction_id[10:6]};
    assign Imme_id = {{16{Instruction_id[15]}},Instruction_id[15:0]};
    assign JrAddr = RsData_id;
    assign J = Jmp|| Je;
    assign IF_flush = Z || J || JR;
    assign JAddr = {NextPC_id[31:28],Instruction_id[25:0],2'b00};
    assign OF = overFlow&&signedOp_ex;
    
    wire[31:0] Imme_shift;
    assign Imme_shift = Imme_id << 2;
    //此处未做边界检测，当NextPC+offset < 0 时，相当于跳转到尾部对应位置
    Branch_adder branchAdder (
      .A(NextPC_id),  // input wire [31 : 0] A
      .B(Imme_shift),  // input wire [31 : 0] B
      .S(BranchAddr)  // output wire [31 : 0] S
    );
    //译码器
    m_Decoder Decoder(
    .op(Instruction_id[31:26]),
    .func(Instruction_id[5:0]),
    .rs(Instruction_id[25:21]),
    .rt(Instruction_id[20:16]),
    .MemOrIOToReg(MemOrIOToReg_id),
    .CPToReg(CPToReg_id),
    .MemOrIOWr(MemOrIOWr_id),
    .MemOrIORead(MemOrIORead_id),
    .MemReadSize(MemReadSize_id),
    .MemExtType(MemExtType_id),
    .RegWr(RegWr_id),
    .CPWr(CPWr_id),
    .RegDst(RegDst_id),
    .ALUsrcA(ALUsrcA_id),
    .ALUsrcB(ALUsrcB_id),
    .ALUCode(ALUCode_id),
    .Jmp(Jmp),
    .Jr(JR),
    .Jal(JAL),
    .Bal(BAL),
    .signedOp(signedOp_id)
    );
    //Forward
    wire[2:0] ForwardA,ForwardB,ForwardCP;
    m_Forward Forward(
    .RegWrAddr_mem(RegWrAddr_mem),
    .RegWrAddr_wb(RegWrAddr_wb),
    .RegWrAddr_ex(RegWrAddr_ex),
    .CPWrAddr_mem(CPWrAddr_mem),
    .CPWrAddr_wb(CPWrAddr_wb),
    .CPWrAddr_ex(CPWrAddr_ex),
    .CPWr_mem(CPWr_mem),
    .CPWr_wb(CPWr_wb),
    .CPWr_ex(CPWr_ex),
    .RegWr_mem(RegWr_mem),
    .RegWr_wb(RegWr_wb),
    .RegWr_ex(RegWr_ex),
    .RsAddr_id(RsAddr_id),
    .RtAddr_id(RtAddr_id),
    .RdAddr_id(RdAddr_id),
    .ForwardA(ForwardA),
    .ForwardB(ForwardB),
    .ForwardCP(ForwardCP)
    );
     
    //Regs
    m_Regs Regs(
    .clk(clk),
    .reset(reset),
    .RegWr(RegWr_wb),
    .RsAddr(RsAddr_id),
    .RtAddr(RtAddr_id),
    .RegWrAddr(RegWrAddr_wb),
    .RegWrData_wb(RegWrData_wb),
    .RegWrData_mem(RegWrData_mem),
    .ALUResult_ex(ALUResult_ex),
    .ForwardA(ForwardA),
    .ForwardB(ForwardB),
    .RsResult(RsData_id),
    .RtResult(RtData_id)
    );
    //ZeroTest
    m_ZeroTest ZeroTest(
    .ALUCode_id(ALUCode_id),
    .RsData_id(RsData_id),
    .RtData_id(RtData_id),
    .Z(Z)
    );
    //HazardDectector
    m_HazardDetector HazardDetector(
    .MemRead_ex(MemOrIORead_ex),
    .RegWrAddr_ex(RegWrAddr_ex),
    .RsAddr_id(RsAddr_id),
    .RtAddr_id(RtAddr_id),
    .PC_IFWrite(PC_IFWrite),
    .Stall(Stall)
    );
    wire[4:0] excCode;              //异常类型编号
    wire[31:0] eretAddr;
    wire int_en;                    //中断使能位
    wire[5:0] int_mask;             //中断屏蔽位
    //assign int_i = 0;
    m_ExceptionProc EP(
    .ALUCode(ALUCode_id),
    .Func(Instruction_id[5:0]),
    .Overflow(OF),
    .int_i(int_i),
    .int_en(int_en),
    .int_mask(int_mask),
    .JAddr(JAddr),
    .eretAddr(eretAddr),
    .exceptType(excCode),
    .JmpAddr(JmpAddr),
    .Je(Je),
    .int_pro(int_pro)
    );
    
    //CP0
    cp0_reg CP0Regs(
    .rst(reset),
    .clk(clk),
    .we_i(CPWr_wb),
    .waddr_i(CPWrAddr_wb),
    .data_i(CPWrData_wb),
    .raddr_i(RdAddr_id),
    .ForwardCP(ForwardCP),
    .CPWrData_ex(CPWrData_ex),
    .CPWrData_mem(CPWrData_mem),
    .excepttype_i(excCode),
    .int_i(int_i),
    .current_inst_addr_i(NextPC_id),
    .data_o(CPData_id),
    .eretAddr(eretAddr),
    .int_en(int_en),
    .int_mask(int_mask)
    );
endmodule
