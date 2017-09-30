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
    input reset,
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
    //output regwr_id,
    //output regwr_wb,
    //output alusrcA_id,
    //output alusrcB_id,
    output[31:0] aluresult_ex,
    output wire[31:0] HI,
    output wire[31:0] LO,
    //output[31:0] aluresult_mem,
    //output regdst_id,
    //output regdst_ex,
    //output[31:0] rsdata_ex,
    //output[31:0] rtdata_ex,
    //output[4:0] regwraddr_ex,
    //output[4:0] regwraddr_wb,
    //output[1:0] forwardA,
    //output[1:0] forwardB,
    //output[4:0] rsaddr_ex,
    //output[4:0] rtaddr_ex,
    //output[4:0] rdaddr_ex,
    output[31:0] regwrdata_wb,
    output[31:0] memresult,
    output[31:0] memaddr,
    output[31:0] memwrdata_mem,
    output memtoreg_wb,
    output memwr_id,
    output memwr_ex,
    output memwr_mem,
    output[31:0] memtmpout,
    output[1:0] memreadsize_mem,
    output j,
    output jr,
    output z
    );       
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
    //Reg for NextPC
    m_dffre #(32) dffre1(
    .clk(clk),
    .reset(reset||IF_flush),
    .en(PC_IFWrite),
    .din(NextPC_if),
    .dout(NextPC_id)
    );
    //Reg for Instruction
    m_dffre #(32) dffre2(
    .clk(clk),
    .reset(reset||IF_flush),
    .en(PC_IFWrite),
    .din(Instruction_if),
    .dout(Instruction_id)
    );
    /*ID Module*/
    wire[4:0] RsAddr_id,RdAddr_id,RtAddr_id,RsAddr_ex,RdAddr_ex,RtAddr_ex;
    wire RegWr_id,RegWr_mem,RegWr_wb;
    wire MemRead_id,MemRead_ex;
    wire MemToReg_id,MemToReg_ex,MemToReg_mem,MemToReg_wb;
    wire CPToReg_id,CPToReg_ex,CPToReg_mem,CPToReg_wb;////////////////////////////////
    wire MemWr_id,MemWr_ex,MemWr_mem;
    wire CPWr_id,CPWr_ex,CPWr_mem,CPWr_wb;///////////////////////////////////////////
    wire CPData_id,CPData_ex;///////////////////////////////////
    wire ALUsrcA_id,ALUsrcA_ex,ALUsrcB_id,ALUsrcB_ex;
    wire[4:0] ALUCode_id,ALUCode_ex;
    wire RegDst_id,RegDst_ex;
    wire JAL,BAL,AL_id,AL_ex,AL_mem,AL_wb;
    wire[31:0] Sa_id,Sa_ex,Imme_id,Imme_ex;
    wire[4:0] RegWrAddr_ex,RegWrAddr_mem,RegWrAddr_wb;
    wire[4:0] CPWrAddr_ex,CPWrAddr_mem,CPWrAddr_wb;//////////////////////////////
    wire[1:0] MemReadSize_id,MemReadSize_ex,MemReadSize_mem;
    wire MemExtType_id,MemExtType_ex,MemExtType_mem;
    wire[31:0] RegWrData_wb;
    wire[31:0] CPWrData_ex,CPWrData_mem,CPWrData_wb;///////////////////////
    wire[31:0] RsData_id,RtData_id,RsData_ex,RtData_ex;
    wire Stall;
    c_ID ID(
    .clk(clk),
    .Instruction_id(Instruction_id),
    .NextPC_id(NextPC_id),
    .RegWr_wb(RegWr_wb),
    .CPWr_wb(CPWr_wb),
    .RegWrAddr_wb(RegWrAddr_wb),
    .CPWrAddr_wb(CPWrAddr_wb),
    .RegWrData_wb(RegWrData_wb),
    .CPWrData_wb(CPWrData_wb),
    .MemRead_ex(MemRead_ex),
    .RegWrAddr_ex(RegWrAddr_ex),
    .MemToReg_id(MemToReg_id),
    .CPToReg_id(CPToReg_id),
    .RegWr_id(RegWr_id),
    .CPWr_id(CPWr_id),
    .MemWr_id(MemWr_id),
    .MemRead_id(MemRead_id),
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
    .BranchAddr(BranchAddr),
    .JmpAddr(JmpAddr),
    .JrAddr(JrAddr),
    .RsData_id(RsData_id),
    .RtData_id(RtData_id),
    .CPData_id(CPData_id),
    .RsAddr_id(RsAddr_id),
    .RtAddr_id(RtAddr_id),
    .RdAddr_id(RdAddr_id),
    .Sa_id(Sa_id),
    .Imme_id(Imme_id)
    );
    assign AL_id = JAL || (BAL && Z);
    /*ID/EX Regs*/
    //reg for MemToReg
     m_dffr #(1) dffr1(
     .clk(clk),
     .reset(reset||Stall),
     .din(MemToReg_id),
     .dout(MemToReg_ex)
     );
     //reg for RegWr
     m_dffr #(1) dffr2(
     .clk(clk),
     .reset(reset||Stall),
     .din(RegWr_id),
     .dout(RegWr_ex)
     );
     //reg for MemWr
     m_dffr #(1) dffr3(
    .clk(clk),
    .reset(reset||Stall),
    .din(MemWr_id),
    .dout(MemWr_ex)
    );
    //reg for MemRead
    m_dffr #(1) dffr4(        
    .clk(clk),                
    .reset(reset||Stall),  
    .din(MemRead_id),           
    .dout(MemRead_ex)           
    );                     
    //reg for ALUCode
    m_dffr #(5) dffr5(
    .clk(clk),
    .reset(reset||Stall),
    .din(ALUCode_id),
    .dout(ALUCode_ex)
    );
    //reg for ALUsrc
    m_dffr #(2) dffr6(
    .clk(clk),
    .reset(reset||Stall),
    .din({ALUsrcA_id,ALUsrcB_id}),
    .dout({ALUsrcA_ex,ALUsrcB_ex})
    );
    //reg for RegDst
    m_dffr #(1) dffr7(
    .clk(clk),
    .reset(reset||Stall),
    .din(RegDst_id),
    .dout(RegDst_ex)
    );
    //reg for NextPC
    m_dffr #(32) dffr8(
    .clk(clk),
    .reset(reset||Stall),
    .din(NextPC_id),
    .dout(NextPC_ex)
    );    
    //reg for Sa
    m_dffr #(32) dffr9(
    .clk(clk),
    .reset(reset||Stall),
    .din(Sa_id),
    .dout(Sa_ex)
    );
    //reg for Imme
    m_dffr #(32) dffr10(
    .clk(clk),
    .reset(reset||Stall),
    .din(Imme_id),
    .dout(Imme_ex)
    );
    //reg for RsData
    m_dffr #(32) dffr11(
    .clk(clk),
    .reset(reset||Stall),
    .din(RsData_id),
    .dout(RsData_ex)
    ); 
    //reg for RtData
    m_dffr #(32) dffr12(
    .clk(clk),
    .reset(reset||Stall),
    .din(RtData_id),
    .dout(RtData_ex)
    );
    //reg for RsAddr
    m_dffr #(5) dffr13(
    .clk(clk),
    .reset(reset||Stall),
    .din(RsAddr_id),
    .dout(RsAddr_ex)
    );
    //reg for RtAddr
    m_dffr #(5) dffr14(
    .clk(clk),
    .reset(reset||Stall),
    .din(RtAddr_id),
    .dout(RtAddr_ex)
    );
    //reg for RdAddt
    m_dffr #(5) dffr15(
    .clk(clk),
    .reset(reset||Stall),
    .din(RdAddr_id),
    .dout(RdAddr_ex)
    );
    //reg for {Z,JAL,BAL}
    m_dffr #(1) dffr16(
    .clk(clk),
    .reset(reset||Stall),
    .din(AL_id),
    .dout(AL_ex)
    );
    //reg for MemExtType 
    m_dffr #(1) dffr17(
    .clk(clk),
    .reset(reset||Stall),
    .din(MemExtType_id),
    .dout(MemExtType_ex)
    );
    //reg for MemReadSize
    m_dffr #(2) dffr18(
    .clk(clk),
    .reset(reset||Stall),
    .din(MemReadSize_id),
    .dout(MemReadSize_ex)
    );  
    m_dffr #(1) dffr19(
    .clk(clk),
    .reset(reset||Stall),
    .din(CPToReg_id),
    .dout(CPToReg_ex)
    );
    m_dffr #(1) dffr20(
    .clk(clk),
    .reset(reset||Stall),
    .din(CPWr_id),
    .dout(CPWr_ex)
    );
    m_dffr #(32) dffr21(
    .clk(clk),
    .reset(reset||Stall),
    .din(CPData_id),
    .dout(CPData_ex)
    );
    
    /*EX Module*/
    wire[31:0] ALUResult_ex,ALUResult_mem,ALUResult_wb;
    wire[31:0] MemWrData_ex,MemWrData_mem,MemWrData_wb;
    wire[31:0] CPResult_ex,CPResult_mem,CPResult_wb;
    wire[31:0] ALU_A,ALU_B;
    wire Overflow;
    c_EX EX(
    .RegDst_ex(RegDst_ex),
    .ALUCode_ex(ALUCode_ex),
    .ALUsrcA_ex(ALUsrcA_ex),
    .ALUsrcB_ex(ALUsrcB_ex),
    .Imme_ex(Imme_ex),
    .Sa_ex(Sa_ex),
    .RsAddr_ex(RsAddr_ex),
    .RtAddr_ex(RtAddr_ex),
    .RdAddr_ex(RdAddr_ex),
    .RsData_ex(RsData_ex),
    .RtData_ex(RtData_ex),
    .CPData_ex(CPData_ex),
    .RegWrData_wb(RegWrData_wb),
    .CPWrData_wb(CPWrData_wb),
    .CPWrData_mem(CPWrData_mem),
    .ALUResult_mem(ALUResult_mem),
    .RegWrAddr_wb(RegWrAddr_wb),
    .RegWrAddr_mem(RegWrAddr_mem),
    .CPWrAddr_wb(CPWrAddr_wb),
    .CPWrAddr_mem(CPWrAddr_mem),
    .CPWr_wb(CPWr_wb),
    .CPWr_mem(CPWr_mem),
    .RegWr_wb(RegWr_wb),
    .RegWr_mem(RegWr_mem),
    .AL_ex(AL_ex),
    .RegWrAddr_ex(RegWrAddr_ex),
    .CPWrAddr_ex(CPWrAddr_ex),
    .ALUResult_ex(ALUResult_ex),
    .HI(HI),
    .LO(LO),
    .MemWrData_ex(MemWrData_ex),
    .CPWrData_ex(CPWrData_ex),
    .CPResult_ex(CPResult_ex),
    .Overflow(Overflow),
    .ALU_A(ALU_A),
    .ALU_B(ALU_B)
    );
    /*EX/MEM Regs*/
    //reg for NextPC
    m_dff #(32) dff1 (
    .clk(clk),
    .din(NextPC_ex),
    .dout(NextPC_mem)
    );
    //reg for ALUResult
    m_dff #(32) dff2 (
    .clk(clk),
    .din(ALUResult_ex),
    .dout(ALUResult_mem)
    );
    //reg for MemToReg
     m_dff #(1) dff3 (
     .clk(clk),
     .din(MemToReg_ex),
     .dout(MemToReg_mem)
     );
     //reg for MemWr
     m_dff #(1) dff4 (
     .clk(clk),
     .din(MemWr_ex),
     .dout(MemWr_mem)
     );
     //reg for MemExtType
     m_dff #(1) dff5 (
     .clk(clk),
     .din(MemExtType_ex),
     .dout(MemExtType_mem)
     );
     //reg for MemReadSize
    m_dff #(2) dff6 (
    .clk(clk),
    .din(MemReadSize_ex),
    .dout(MemReadSize_mem)
    );
    //reg for RegWr
    m_dff #(1) dff7 (
    .clk(clk),
    .din(RegWr_ex),
    .dout(RegWr_mem)
    );
    //reg for RegWrAddr
    m_dff #(5) dff8 (
    .clk(clk),
    .din(RegWrAddr_ex),
    .dout(RegWrAddr_mem)
    );
    //reg for MemWrData
    m_dff #(32) dff9 (
    .clk(clk),
    .din(MemWrData_ex),
    .dout(MemWrData_mem)
    );
    //reg for AL
    m_dff #(1) dff10 (
    .clk(clk),
    .din(AL_ex),
    .dout(AL_mem)
    );
    m_dff #(1) dffCP0(
    .clk(clk),
    .din(CPToReg_ex),
    .dout(CPToReg_mem)
    );
    
    m_dff #(1) dffCP1(
    .clk(clk),
    .din(CPWr_ex),
    .dout(CPWr_mem)
    );
    
    m_dff #(32) dffCP2(
    .clk(clk),
    .din(CPWrData_ex),
    .dout(CPWrData_mem)
    );
    
    m_dff #(32) dffCP3(
    .clk(clk),
    .din(CPResult_ex),
    .dout(CPResult_mem)
    );
    
    m_dff #(5) dffCP4(
    .clk(clk),
    .din(CPWrAddr_ex),
    .dout(CPWrAddr_mem)
    );
    /*MEM Module*/
    wire[31:0] MemResult_mem,MemResult_wb;
    m_DataRam DataRam(
    .clock(clk),
    .MemWr(MemWr_mem),
    .MemWrSize(MemReadSize_mem),
    .MemExtType(MemExtType_mem),
    .MemAddr(ALUResult_mem),
    .MemWrData(MemWrData_mem),
    .MemOutput(MemResult_mem),
    .tmpOut(memtmpout)
    );
    /*MEM/WB Regs*/  
    //reg for ALUResult
    m_dff #(32) dff11 (
    .clk(clk),
    .din(ALUResult_mem),
    .dout(ALUResult_wb)
    );
    //reg for RegWr
    m_dff #(1) dff12 (
    .clk(clk),
    .din(RegWr_mem),
    .dout(RegWr_wb)
    );
    //reg for MemToReg
    m_dff #(1) dff13 (
    .clk(clk),
    .din(MemToReg_mem),
    .dout(MemToReg_wb)
    );
    //reg for AL
    m_dff #(1) dff14 (
    .clk(clk),
    .din(AL_mem),
    .dout(AL_wb)
    );
    //reg for NextPC
    m_dff #(32) dff15 (
    .clk(clk),
    .din(NextPC_mem),
    .dout(NextPC_wb)
    );
    
    m_dff #(5) dff16 (
    .clk(clk),
    .din(RegWrAddr_mem),
    .dout(RegWrAddr_wb)
    );
    
    m_dff #(32) dff17 (
    .clk(clk),
    .din(MemResult_mem),
    .dout(MemResult_wb)
    );
    
    m_dff #(1) dff18 (
    .clk(clk),
    .din(CPToReg_mem),
    .dout(CPToReg_wb)
    );
    
    m_dff #(1) dff19 (
    .clk(clk),
    .din(CPWr_mem),
    .dout(CPWr_wb)
    );
    
    m_dff #(32) dff20(
    .clk(clk),
    .din(CPWrData_mem),
    .dout(CPWrData_wb)
    );
    
    m_dff #(32) dff21(
    .clk(clk),
    .din(CPResult_mem),
    .dout(CPResult_wb)
    );
    m_dff #(5) dff22(
    .clk(clk),
    .din(CPWrAddr_mem),
    .dout(CPWrAddr_wb)
    );
    
    reg[31:0] RegWrData;
    always @(*)
    begin
    if(AL_wb == 1)
        RegWrData <= NextPC_wb;
    else if(MemToReg_wb == 1)
        RegWrData <= MemResult_wb;
    else if(CPToReg_wb == 1)
        RegWrData <= CPResult_wb;
    else
        RegWrData <= ALUResult_wb;
    end
    assign RegWrData_wb = RegWrData;
    
    
    assign Instruction = Instruction_if;
    assign Instruction2 = Instruction_id;
    assign ALUCode = ALUCode_id;
    assign nextpc_if = NextPC_if;
    assign nextpc_id = NextPC_id;
    assign nextpc_ex = NextPC_ex;
    assign nextpc_mem = NextPC_mem;
    assign aluresult_ex = ALUResult_ex;
    assign stall = Stall;
    assign pc_ifwrite = PC_IFWrite;
    //assign aluresult_mem = ALUResult_mem;
    assign ALU_a = ALU_A;
    assign ALU_b = ALU_B;
    assign flush = IF_flush;
    //assign regwr_id = RegWr_id;
    //assign regwr_wb = RegWr_wb;
    //assign alusrcA_id = ALUsrcA_id;
    //assign alusrcB_id = ALUsrcB_id;
    //assign regdst_id = RegDst_id;
    //assign regdst_ex = RegDst_ex;
    //assign rsdata_ex = RsData_ex;
    //assign rtdata_ex = RtData_ex;
    //assign regwraddr_ex = RegWrAddr_ex;
    //assign regwraddr_wb = RegWrAddr_wb;
    //assign rsaddr_ex = RsAddr_ex;
    //assign rtaddr_ex = RtAddr_ex;
    //assign rdaddr_ex = RdAddr_ex;
    assign regwrdata_wb = RegWrData_wb;
    assign memtoreg_wb = MemToReg_wb;
    assign memresult = MemResult_mem;
    assign memaddr = ALUResult_mem;
    assign memwr_id = MemWr_id;
    assign memwr_ex = MemWr_ex;
    assign memwr_mem = MemWr_mem;
    assign memwrdata_mem = MemWrData_mem;
    assign memreadsize_mem = MemReadSize_mem;
    assign j = J;
    assign jr = JR;
    assign z = Z;
    
endmodule
