`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/26 21:07:55
// Design Name: 
// Module Name: MEM_TEST
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


module MEM_TEST();
     reg clk = 1;
     always #5 clk = ~clk;
     reg MemWr;
     reg[1:0] MemWrSize;
     wire MemExtType;
     wire[31:0] MemAddr;
     wire[31:0] MemWrData;
     assign MemExtType = 1;
     assign MemAddr = 32'h0000;
     assign MemWrData = 32'h12ff;
     wire[31:0] MemResult;
     //generate test wave
     initial
     begin
     MemWrSize = 2'b00;
     MemWr = 0;
     #100
     MemWr <= 1;
     MemWrSize <= 2'b11;
     #100
     MemWr = 0;
     end
    
    m_DataRam DataRam(
    .clock(clk),
    .MemWr(MemWr),
    .MemWrSize(MemWrSize),
    .MemExtType(MemExtType),
    .MemAddr(MemAddr),
    .MemWrData(MemWrData),
    .MemOutput(MemResult)
    );   
endmodule
