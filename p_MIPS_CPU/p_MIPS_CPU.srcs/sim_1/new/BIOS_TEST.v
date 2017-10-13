`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/13 08:53:46
// Design Name: 
// Module Name: BIOS_TEST
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


module BIOS_TEST();
     reg clk = 1;
     reg reset;
     always #5 clk = ~clk;
     initial
     begin
     reset = 0;
     #1 reset = 1;
     #5 reset = 0;
     end
     wire[31:0] Instruction_if,Instruction_id;
     wire[31:0] NextPC_if,NextPC_id;//,NextPC_ex,NextPC_mem;
     wire[4:0] ALUCode_id;
     wire[31:0] ALUResult_ex;
     wire[31:0] ALUResult_mem;
     //wire RegWr_wb;
     wire[31:0] RegWrData_wb,RegWrData_mem;
     wire[31:0] ALUa_ex,ALUb_ex;
     wire J,JR,Z;
     //wire PC_IFWrite;
     //wire MemWr_ex,MemWr_id,MemWr_mem;
     //wire[31:0] MemWrData_mem;
     //wire[31:0] tmpOut;
     //wire[31:0] JmpAddr,JrAddr;
     wire[4:0] RegWrAddr_wb;
     wire[31:0] RsData_id,RtData_id;
     wire[4:0] RsAddr_id,RtAddr_id;
     wire[7:0] DISPOutput;
     wire dispclk;
     wire[2:0] dispcnt;
     wire[31:0] ledOut;
    //wire[31:0] HI,LO;
    m_MIPS_CPU MIPS_CPU(
    .clk(clk),
    .rst(reset),
    .pc_ifwrite(PC_IFWrite),
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
    .DISPOutput(DISPOutput),
    .rsaddr_id(RsAddr_id),
    .rtaddr_id(RtAddr_id),
    .rsdata_id(RsData_id),
    .rtdata_id(RtData_id),
    .regwraddr_wb(RegWrAddr_wb),
    .j(J),
    .jr(JR),
    .z(Z),
    .dispClk(dispclk),
    .dispCnt(dispcnt),
    .LEDOutput(ledOut)
    );




endmodule
