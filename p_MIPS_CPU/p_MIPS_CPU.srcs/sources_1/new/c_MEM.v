`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/02 16:40:32
// Design Name: 
// Module Name: c_MEM
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


module c_MEM(
    input clk,
    input reset,
    input MemOrIOWr_mem,
    input MemOrIORead_mem,
    input[1:0] MemReadSize_mem,
    input MemExtType_mem,
    input[31:0] ALUResult_mem,
    input[31:0] CPResult_mem,
    input[31:0] NextPC_mem,
    input MemOrIOToReg_mem,
    input CPToReg_mem,
    input AL_mem,
    input[31:0] MemWrData_mem,
    output reg[31:0] RegWrData_mem
    );
    
    wire MemWr;
    wire MemRead;
    wire IOWr;
    wire IORead;
    assign MemWr = MemOrIOWr_mem && (ALUResult_mem[31:10] != 22'b1111111111111111111111);
    assign IOWr = MemOrIOWr_mem && (ALUResult_mem[31:10] == 22'b1111111111111111111111);
    assign MemRead = MemOrIORead_mem && (ALUResult_mem[31:10] != 22'b1111111111111111111111);
    assign IORead = MemOrIORead_mem && (ALUResult_mem[31:10] == 22'b1111111111111111111111);
    
    wire[31:0] MemResult;
    wire[31:0] IOResult;
    m_DataRam DataRam(
    .clock(clk),
    .MemWr(MemWr),
    .MemWrSize(MemReadSize_mem),
    .MemExtType(MemExtType_mem),
    .MemAddr(ALUResult_mem),
    .MemWrData(MemWrData_mem),
    .MemOutput(MemResult)
    );
    
    wire[3:0] portAddr;
    wire DISPCtrl,KEYCtrl,CTCCtrl,PWMCtrl,UARTCtrl,WDTCtrl,LEDCtrl,SWCtrl;
    wire[31:0] rData;
     memorio MemOrIO(
     .caddress(ALUResult_mem),
     .memread(MemRead),
     .memwrite(MemWrite),
     .ioread(IORead),
     .iowrite(IOWrite),
     .mread_data(MemResult),
     .ioread_data(IOResult),
     .DISPCtrl(DISPCtrl),
     .KEYCtrl(KEYCtrl),
     .CTCCtrl(CTCCtrl),
     .PWMCtrl(PWMCtrl),
     .UARTCtrl(UARTCtrl),
     .WDTCtrl(WDTCtrl),
     .LEDCtrl(LEDCtrl),
     .SWCtrl(SWCtrl),
     .portAddress(portAddr),
     .rdata(rData)
     );
    
    wire[31:0] KEYReadData,UARTReadData,SWReadData;
    wire[15:0] CTCReadData;
    ioread IOReadUnit(
    .clk(clk),
    .reset(reset),
    .ioread(IORead),
    .KEYCtrl(KEYCtrl),
    .CTCCtrl(CTCCtrl),
    .UARTCtrl(UARTCtrl),
    .SWCtrl(SWCtrl),
    .ioread_data_key(KEYReadData),
    .ioread_data_ctc(CTCReadData),
    .ioread_data_uart(UARTReadData),
    .ioread_data_sw(SWReadData),
    .ioread_data(IOResult)
    );
    
           
    always @(*)
    begin
    if(AL_mem == 1)
        RegWrData_mem <= NextPC_mem;
    else if(MemOrIOToReg_mem == 1)
        RegWrData_mem <= rData;
    else if(CPToReg_mem == 1)
        RegWrData_mem <= CPResult_mem;
    else
        RegWrData_mem <= ALUResult_mem;
    end
    
endmodule
