`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/06 16:10:07
// Design Name: 
// Module Name: CPU_TEST3
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


module CPU_TEST3();

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
     wire[31:0] NextPC_if,NextPC_id;//,NextPC_ex,NextPC_mem;
     wire[4:0] ALUCode_id;
     //wire flush;
     wire[31:0] ALUResult_ex;
     wire[31:0] ALUResult_mem;
     wire RegWr_wb;
     wire[31:0] RegWrData_wb,RegWrData_mem;
     wire[31:0] ALUa_ex,ALUb_ex;
     wire J,JR,Z;
    // wire Stall,PC_IFWrite;
     wire MemWr_ex,MemWr_id,MemWr_mem;
     wire[31:0] MemWrData_mem;
     wire[31:0] tmpOut;
    // wire[1:0] MemReadSize_mem;
     wire[31:0] JmpAddr,JrAddr;
     wire[4:0] RegWrAddr_wb;
     wire[31:0] RsData_id,RtData_id;
     wire[4:0] RsAddr_id,RtAddr_id;
    //wire[31:0] HI,LO;
    m_MIPS_CPU MIPS_CPU(
    .clk(clk),
    .rst(reset),
    //.stall(Stall),
    .Instruction(Instruction_if),
    .ALUCode(ALUCode_id),
    .ALU_a(ALUa_ex),
    .ALU_b(ALUb_ex),
    .aluresult_ex(ALUResult_ex),
    .aluresult_mem(ALUResult_mem),
    .nextpc_if(NextPC_if),
    .nextpc_id(NextPC_id),
    .Instruction2(Instruction_id),
    .regwrdata_wb(RegWrData_wb),
    .regwrdata_mem(RegWrData_mem),
    .memwr_id(MemWr_id),
    .memwr_ex(MemWr_ex),
    .memwr_mem(MemWr_mem),
    .memwrdata_mem(MemWrData_mem),
    .flush(flush),
    .tmpout(tmpOut),
    .jmpAddr(JmpAddr),
    .jrAddr(JrAddr),
    .regwr_wb(RegWr_wb),
    .rsaddr_id(RsAddr_id),
    .rtaddr_id(RtAddr_id),
    .rsdata_id(RsData_id),
    .rtdata_id(RtData_id),
    .regwraddr_wb(RegWrAddr_wb),
    .j(J),
    .jr(JR),
    .z(Z)
    );
endmodule
