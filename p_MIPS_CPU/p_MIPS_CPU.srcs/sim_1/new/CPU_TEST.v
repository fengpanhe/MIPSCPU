`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/25 10:25:23
// Design Name: 
// Module Name: CPU_TEST
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


module CPU_TEST();
    reg clk = 1;
    reg reset;
    always #5 clk = ~clk;
    initial
    begin
    reset = 1;
    #5 reset = 0;
    end
    wire[31:0] Instruction,Instruction2;
   // wire Stall,pc_ifwrite;
    wire[4:0] ALUCode;
    wire[31:0] NextPC;
    //wire flush;
    wire[31:0] ALUResult_ex,ALUResult_mem,ALU_a,ALU_b;
    wire RegWr_id,RegWr_wb,ALUSrcA_id,ALUSrcB_id,RegDst_id,RegDst_ex;
    wire[31:0] RsData_ex,RtData_ex;
    wire[4:0] RegWrAddr_ex,RegWrAddr_wb,RsAddr_ex,RtAddr_ex,RdAddr_ex;
    wire[1:0] forwardA,forwardB;
    wire[31:0] RegWrData_wb;
    wire J,JR,Z;
    //wire[4:0] testout;
    m_MIPS_CPU MIPS_CPU(
    .clk(clk),
    .reset(reset),
    .Instruction(Instruction),
    //.stall(Stall),
   //.pc_ifwrite(pc_ifwrite),
   // .flush(flush),
    .ALUCode(ALUCode),
    .NextPC(NextPC),
    .Instruction2(Instruction2),
    .ALU_a(ALU_a),
    .ALU_b(ALU_b),
    .regwr_id(RegWr_id),
    .regwr_wb(RegWr_wb),
    .alusrcA_id(ALUSrcA_id),
    .alusrcB_id(ALUSrcB_id),
    .aluresult_ex(ALUResult_ex),
    .aluresult_mem(ALUResult_mem),
    .regdst_id(RegDst_id),
    .regdst_ex(RegDst_ex),
    .rsdata_ex(RsData_ex),
    .rtdata_ex(RtData_ex),
    .regwraddr_ex(RegWrAddr_ex),
    .regwraddr_wb(RegWrAddr_wb),
    .forwardA(forwardA),
    .forwardB(forwardB),
    .rsaddr_ex(RsAddr_ex),
    .rtaddr_ex(RtAddr_ex),
    .rdaddr_ex(RdAddr_ex),
    .regwrdata_wb(RegWrData_wb),
    .j(J),
    .jr(JR),
    .z(Z)
    );
endmodule
