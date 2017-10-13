`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/25 08:38:12
// Design Name: 
// Module Name: m_MIPS_CPU
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


module m_MIPS_CPU(
    input clk,
    input rst,
    output[31:0] Instruction,
    output stall,
    output pc_ifwrite,
    output flush,
    output[4:0] ALUCode,
    output[31:0] nextpc_if,
    output[31:0] nextpc_id,
    output[31:0] nextpc_ex,
    output[31:0] nextpc_mem,
    output[31:0] Instruction2,
    output[31:0] ALU_a,
    output[31:0] ALU_b,
    output[31:0] aluresult_ex,
    output[31:0] aluresult_mem,
    output[31:0] HI,
    output[31:0] LO,
    output[31:0] regwrdata_wb,
    output[31:0] regwrdata_mem,
    output[31:0] memaddr,
    output[31:0] memwrdata_mem,
    output memtoreg_wb,
    output memwr_id,
    output memwr_ex,
    output memwr_mem,
    output[31:0] memtmpout,
    output[1:0] memreadsize_mem,
    output[31:0] tmpout,
    output[31:0] jmpAddr,
    output[31:0] jrAddr,
    output[4:0] rsaddr_id,
    output[4:0] rtaddr_id,
    output[4:0] regwraddr_wb,
    output[31:0] rsdata_id,
    output[31:0] rtdata_id,
    output regwr_wb,
    output j,
    output jr,
    output z,
    output[7:0] DISPOutput,
    output[7:0] DISPEn,
    input[31:0] SWInput,
    output[31:0] LEDOutput,
    input[3:0] col,
    output[3:0] line,
    input pulse0,
    input pulse1,
    output cnt0,
    output cnt1,
    output pwmWave,
    output dispClk,
    output[2:0] dispCnt
    );
    wire WDTRst;       
    wire reset;
    assign reset = rst|| WDTRst;  
    /*IF Module*/
    wire[31:0] Instruction_if,Instruction_id;
    wire[31:0] NextPC_id,NextPC_if,NextPC_ex,NextPC_mem,NextPC_wb;
    wire[31:0] JmpAddr,JrAddr,BranchAddr;
    wire PC_IFWrite,J,JR,Z,IF_flush;
    c_IF IF(
    .clk(clk),
    .reset(reset),
    .PC_IFWrite(PC_IFWrite),
    .Jr(JR),
    .J(J),
    .Z(Z),
    .JrAddr(JrAddr),
    .JmpAddr(JmpAddr),
    .BranchAddr(BranchAddr),
    .Instruction_if(Instruction_if),
    .NextPC_if(NextPC_if)
    );
    /*IF/ID Regs*/
    c_IF_ID IFToIDRegs(
    .clk(clk),   
    .reset(reset||IF_flush),
    .en(PC_IFWrite),
    .NextPC_if(NextPC_if),
    .Instruction_if(Instruction_if),
    .NextPC_id(NextPC_id),
    .Instruction_id(Instruction_id)
    );
    /*ID Module*/
    wire[4:0] RsAddr_id,RdAddr_id,RtAddr_id,RdAddr_ex,RtAddr_ex;
    wire RegWr_id,RegWr_mem,RegWr_wb;
    wire MemOrIORead_id,MemOrIORead_ex,MemOrIORead_mem;
    wire MemOrIOToReg_id,MemOrIOToReg_ex,MemOrIOToReg_mem;//,MemOrIOToReg_wb;
    wire CPToReg_id,CPToReg_ex,CPToReg_mem,CPToReg_wb;////////////////////////////////
    wire MemOrIOWr_id,MemOrIOWr_ex,MemOrIOWr_mem;
    wire CPWr_id,CPWr_ex,CPWr_mem,CPWr_wb;///////////////////////////////////////////
    wire ALUsrcA_id,ALUsrcA_ex,ALUsrcB_id,ALUsrcB_ex;
    wire[4:0] ALUCode_id,ALUCode_ex;
    wire RegDst_id,RegDst_ex;
    wire JAL,BAL,AL_id,AL_ex,AL_mem,AL_wb;
    wire[31:0] Sa_id,Sa_ex,Imme_id,Imme_ex;
    wire[4:0] RegWrAddr_ex,RegWrAddr_mem,RegWrAddr_wb;
    wire[4:0] CPWrAddr_ex,CPWrAddr_mem,CPWrAddr_wb;//////////////////////////////
    wire[1:0] MemReadSize_id,MemReadSize_ex,MemReadSize_mem;
    wire MemExtType_id,MemExtType_ex,MemExtType_mem;
    wire[31:0] RegWrData_mem,RegWrData_wb;
    wire[31:0] CPWrData_ex,CPWrData_mem,CPWrData_wb;///////////////////////
    wire[31:0] RsData_id,RtData_id,RsData_ex,RtData_ex;
    wire[31:0] ALUResult_ex,ALUResult_mem,ALUResult_wb;
    wire[31:0] CPResult_id,CPResult_ex,CPResult_mem,CPResult_wb;
    wire signedOp_id,signedOp_ex;
    wire Stall;
    wire Overflow;
    c_ID ID(
    .clk(clk),
    .reset(reset),
    .Instruction_id(Instruction_id),
    .NextPC_id(NextPC_id),
    .RegWr_wb(RegWr_wb),
    .RegWr_mem(RegWr_mem),
    .RegWr_ex(RegWr_ex),
    .CPWr_wb(CPWr_wb),
    .CPWr_mem(CPWr_mem),
    .CPWr_ex(CPWr_ex),
    .RegWrAddr_wb(RegWrAddr_wb),
    .RegWrAddr_mem(RegWrAddr_mem),
    .RegWrAddr_ex(RegWrAddr_ex),
    .CPWrAddr_wb(CPWrAddr_wb),
    .CPWrAddr_mem(CPWrAddr_mem),
    .CPWrAddr_ex(CPWrAddr_ex),
    .RegWrData_wb(RegWrData_wb),
    .RegWrData_mem(RegWrData_mem),
    .ALUResult_ex(ALUResult_ex),
    .CPWrData_wb(CPWrData_wb),
    .CPWrData_mem(CPWrData_mem),
    .CPWrData_ex(CPWrData_ex),
    .MemOrIORead_ex(MemOrIORead_ex),
    .overFlow(Overflow),
    .signedOp_ex(signedOp_ex),
    .MemOrIOToReg_id(MemOrIOToReg_id),
    .CPToReg_id(CPToReg_id),
    .RegWr_id(RegWr_id),
    .CPWr_id(CPWr_id),
    .MemOrIOWr_id(MemOrIOWr_id),
    .MemOrIORead_id(MemOrIORead_id),
    .MemReadSize_id(MemReadSize_id),
    .MemExtType_id(MemExtType_id),
    .ALUCode_id(ALUCode_id),
    .ALUsrcA_id(ALUsrcA_id),
    .ALUsrcB_id(ALUsrcB_id),
    .RegDst_id(RegDst_id),
    .Stall(Stall),
    .PC_IFWrite(PC_IFWrite),
    .IF_flush(IF_flush),
    .Z(Z),
    .J(J),
    .JR(JR),
    .JAL(JAL),
    .BAL(BAL),
    .signedOp_id(signedOp_id),
    .BranchAddr(BranchAddr),
    .JmpAddr(JmpAddr),
    .JrAddr(JrAddr),
    .RsData_id(RsData_id),
    .RtData_id(RtData_id),
    .CPData_id(CPResult_id),
    .RsAddr_id(RsAddr_id),
    .RtAddr_id(RtAddr_id),
    .RdAddr_id(RdAddr_id),
    .Sa_id(Sa_id),
    .Imme_id(Imme_id)
    );
    assign AL_id = JAL || (BAL && Z);
    /*ID/EX Regs*/
    c_ID_EX IDToEXRegs(
    .clk(clk),
    .reset(reset||Stall),
    .MemOrIOToReg_id(MemOrIOToReg_id),
    .CPToReg_id(CPToReg_id),
    .RegWr_id(RegWr_id),
    .MemOrIOWr_id(MemOrIOWr_id),
    .CPWr_id(CPWr_id),
    .MemOrIORead_id(MemOrIORead_id),
    .ALUCode_id(ALUCode_id),
    .ALUsrcA_id(ALUsrcA_id),
    .ALUsrcB_id(ALUsrcB_id),
    .RegDst_id(RegDst_id),
    .AL_id(AL_id),
    .signedOp_id(signedOp_id),
    .NextPC_id(NextPC_id),
    .Sa_id(Sa_id),
    .Imme_id(Imme_id),
    .RsData_id(RsData_id),
    .RtData_id(RtData_id),
    .CPResult_id(CPResult_id),
    .RtAddr_id(RtAddr_id),
    .RdAddr_id(RdAddr_id),
    .MemExtType_id(MemExtType_id),
    .MemReadSize_id(MemReadSize_id),
    .MemOrIOToReg_ex(MemOrIOToReg_ex),
    .CPToReg_ex(CPToReg_ex),
    .RegWr_ex(RegWr_ex),
    .MemOrIOWr_ex(MemOrIOWr_ex),
    .CPWr_ex(CPWr_ex),
    .MemOrIORead_ex(MemOrIORead_ex),
    .ALUCode_ex(ALUCode_ex),
    .ALUsrcA_ex(ALUsrcA_ex),
    .ALUsrcB_ex(ALUsrcB_ex),
    .RegDst_ex(RegDst_ex),
    .AL_ex(AL_ex),
    .signedOp_ex(signedOp_ex),
    .NextPC_ex(NextPC_ex),
    .Sa_ex(Sa_ex),
    .Imme_ex(Imme_ex),
    .RsData_ex(RsData_ex),
    .RtData_ex(RtData_ex),
    .CPResult_ex(CPResult_ex),
    .RtAddr_ex(RtAddr_ex),
    .RdAddr_ex(RdAddr_ex),
    .MemExtType_ex(MemExtType_ex),
    .MemReadSize_ex(MemReadSize_ex)
    );
    /*EX Module*/
    
    wire[31:0] MemWrData_ex,MemWrData_mem,MemWrData_wb;

    wire[31:0] ALU_A,ALU_B;
 
    c_EX EX(
    .RegDst_ex(RegDst_ex),
    .ALUCode_ex(ALUCode_ex),
    .ALUsrcA_ex(ALUsrcA_ex),
    .ALUsrcB_ex(ALUsrcB_ex),
    .Imme_ex(Imme_ex),
    .Sa_ex(Sa_ex),
    .RtAddr_ex(RtAddr_ex),
    .RdAddr_ex(RdAddr_ex),
    .RsData_ex(RsData_ex),
    .RtData_ex(RtData_ex),
    .CPData_ex(CPResult_ex),
    .AL_ex(AL_ex),
    .RegWrAddr_ex(RegWrAddr_ex),
    .CPWrAddr_ex(CPWrAddr_ex),
    .ALUResult_ex(ALUResult_ex),
    .HI(HI),
    .LO(LO),
    .MemWrData_ex(MemWrData_ex),
    .CPWrData_ex(CPWrData_ex),
    .Overflow(Overflow),
    .ALU_A(ALU_A),
    .ALU_B(ALU_B)
    );
    /*EX/MEM Regs*/
    c_EX_MEM EXToMEMRegs(
    .clk(clk),
    .reset(reset),
    .NextPC_ex(NextPC_ex),
    .NextPC_mem(NextPC_mem),
    .ALUResult_ex(ALUResult_ex),
    .ALUResult_mem(ALUResult_mem),
    .CPResult_ex(CPResult_ex),
    .CPResult_mem(CPResult_mem),
    .MemOrIOToReg_ex(MemOrIOToReg_ex),
    .MemOrIOToReg_mem(MemOrIOToReg_mem),
    .CPToReg_ex(CPToReg_ex),
    .CPToReg_mem(CPToReg_mem),
    .MemOrIOWr_ex(MemOrIOWr_ex),
    .MemOrIOWr_mem(MemOrIOWr_mem),
    .MemOrIORead_ex(MemOrIORead_ex),
    .MemOrIORead_mem(MemOrIORead_mem),
    .RegWr_ex(RegWr_ex),
    .RegWr_mem(RegWr_mem),
    .CPWr_ex(CPWr_ex),
    .CPWr_mem(CPWr_mem),
    .MemExtType_ex(MemExtType_ex),
    .MemExtType_mem(MemExtType_mem),
    .MemReadSize_ex(MemReadSize_ex),
    .MemReadSize_mem(MemReadSize_mem),
    .RegWrAddr_ex(RegWrAddr_ex),
    .RegWrAddr_mem(RegWrAddr_mem),
    .CPWrAddr_ex(CPWrAddr_ex),
    .CPWrAddr_mem(CPWrAddr_mem),
    .MemWrData_ex(MemWrData_ex),
    .MemWrData_mem(MemWrData_mem),
    .CPWrData_ex(CPWrData_ex),
    .CPWrData_mem(CPWrData_mem),
    .AL_ex(AL_ex),
    .AL_mem(AL_mem)
    );
    /*MEM Module*/
    c_MEM MEM(
    .clk(clk),
    .reset(reset),
    .MemOrIOWr_mem(MemOrIOWr_mem),
    .MemOrIORead_mem(MemOrIORead_mem),
    .MemReadSize_mem(MemReadSize_mem),
    .MemExtType_mem(MemExtType_mem),
    .ALUResult_mem(ALUResult_mem),
    .CPResult_mem(CPResult_mem),
    .NextPC_mem(NextPC_mem),
    .MemOrIOToReg_mem(MemOrIOToReg_mem),
    .CPToReg_mem(CPToReg_mem),
    .AL_mem(AL_mem),
    .MemWrData_mem(MemWrData_mem),
    .pulse0(pulse0),
    .pulse1(pulse1),
    .col(col),
    .line(line),
    .SWInput(SWInput),
    .DISPOutput(DISPOutput),
    .DISPEn(DISPEn),
    .LEDOutput(LEDOutput),
    .cnt0(cnt0),
    .cnt1(cnt1),
    .pwmWave(pwmWave),
    .rst(WDTRst),
    .RegWrData_mem(RegWrData_mem),
    .tmpOut(tmpout),
    .dispClk(dispClk),
    .dispCnt(dispCnt)
    );

    /*MEM/WB Regs*/  
    c_MEM_WB MEMToWBRegs(
    .clk(clk),
    .reset(reset),
    .RegWr_mem(RegWr_mem),
    .CPWr_mem(CPWr_mem),
    .RegWrAddr_mem(RegWrAddr_mem),
    .CPWrAddr_mem(CPWrAddr_mem),
    .RegWrData_mem(RegWrData_mem),
    .CPWrData_mem(CPWrData_mem),
    .RegWr_wb(RegWr_wb),
    .CPWr_wb(CPWr_wb),
    .RegWrAddr_wb(RegWrAddr_wb),
    .CPWrAddr_wb(CPWrAddr_wb),
    .RegWrData_wb(RegWrData_wb),
    .CPWrData_wb(CPWrData_wb)
    );
    assign Instruction = Instruction_if;
    assign Instruction2 = Instruction_id;
    assign ALUCode = ALUCode_id;
    assign nextpc_if = NextPC_if;
    assign nextpc_id = NextPC_id;
    //assign nextpc_ex = NextPC_ex;
    assign nextpc_mem = NextPC_mem;
    assign aluresult_ex = ALUResult_ex;
    assign aluresult_mem = ALUResult_mem;
    assign stall = Stall;
    assign pc_ifwrite = PC_IFWrite;
    //assign aluresult_mem = ALUResult_mem;
    assign ALU_a = ALU_A;
    assign ALU_b = ALU_B;
    assign flush = IF_flush;
    //assign regwr_id = RegWr_id;
    assign regwr_wb = RegWr_wb;
    //assign alusrcA_id = ALUsrcA_id;
    //assign alusrcB_id = ALUsrcB_id;
    //assign regdst_id = RegDst_id;
    //assign regdst_ex = RegDst_ex;
    //assign rsdata_ex = RsData_ex;
    //assign rtdata_ex = RtData_ex;
    //assign regwraddr_ex = RegWrAddr_ex;
    assign regwraddr_wb = RegWrAddr_wb;
    assign regwrdata_mem = RegWrData_mem;
    //assign rsaddr_ex = RsAddr_ex;
    //assign rtaddr_ex = RtAddr_ex;
    //assign rdaddr_ex = RdAddr_ex;
    assign rsaddr_id = RsAddr_id;
    assign rtaddr_id = RtAddr_id;
    assign rsdata_id = RsData_id;
    assign rtdata_id = RtData_id;
    assign regwrdata_wb = RegWrData_wb;
    //assign memtoreg_wb = MemToReg_wb;
    assign memaddr = ALUResult_mem;
    assign memwr_id = MemOrIOWr_id;
    assign memwr_ex = MemOrIOWr_ex;
    assign memwr_mem = MemOrIOWr_mem;
    assign memwrdata_mem = MemWrData_mem;
    assign memreadsize_mem = MemReadSize_mem;
    assign jmpAddr = JmpAddr;
    assign jrAddr = JrAddr;
    assign j = J;
    assign jr = JR;
    assign z = Z;
    
endmodule
