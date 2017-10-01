`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/27 19:10:15
// Design Name: 
// Module Name: CPU_TEST2
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


module CPU_TEST2();
     reg clk = 1;
     reg reset;
     always #5 clk = ~clk;
     initial
     begin
     reset = 1;
     #5 reset = 0;
     end
     wire[31:0] Instruction_if,Instruction_id;
    // wire Stall,pc_ifwrite;
     wire[31:0] NextPC_if,NextPC_id,NextPC_ex,NextPC_mem;
     wire[4:0] ALUCode_id;
     wire flush;
     wire[31:0] ALUResult_ex;
     wire[31:0] HI;
     wire[31:0] LO;
     wire[31:0] RegWrData_wb;
     wire[31:0] ALUa_ex,ALUb_ex;
     wire[31:0] MemResult;
     wire[31:0] MemAddr;
     wire MemToReg_wb;
     wire J,JR,Z;
     wire Stall,PC_IFWrite;
     wire MemWr_ex,MemWr_id,MemWr_mem;
     wire[31:0] MemWrData_mem;
     wire[31:0] tmpOut;
     wire[1:0] MemReadSize_mem;
    /*m_MIPS_CPU MIPS_CPU(
     .clk(clk),
     .reset(reset),
     .pc_ifwrite(PC_IFWrite),
     .Instruction(Instruction_if),
     .ALUCode(ALUCode_id),
     .ALU_a(ALUa_ex),
     .ALU_b(ALUb_ex),
     .aluresult_ex(ALUResult_ex),
     .HI(HI),
     .LO(LO),
     .Instruction2(Instruction_id)
     );*/
    m_MIPS_CPU MIPS_CPU(
    .clk(clk),
    .reset(reset),
    .stall(Stall),
    .pc_ifwrite(PC_IFWrite),
    .Instruction(Instruction_if),
    .ALUCode(ALUCode_id),
    .ALU_a(ALUa_ex),
    .ALU_b(ALUb_ex),
    .aluresult_ex(ALUResult_ex),
    .HI(HI),
    .LO(LO),
    .nextpc_if(NextPC_if),
    .nextpc_id(NextPC_id),
    .nextpc_ex(NextPC_ex),
    .nextpc_mem(NextPC_mem),
    .Instruction2(Instruction_id),
    .regwrdata_wb(RegWrData_wb),
    .memtoreg_wb(MemToReg_wb),
    .flush(flush),
    .memresult(MemResult),
    .memaddr(MemAddr),
    .memwr_id(MemWr_id),
    .memwr_ex(MemWr_ex),
    .memwr_mem(MemWr_mem),
    .memwrdata_mem(MemWrData_mem),
    .memtmpout(tmpOut),
    .memreadsize_mem(MemReadSize_mem),
    .j(J),
    .jr(JR),
    .z(Z)
    );
endmodule
