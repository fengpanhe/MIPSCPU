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
    input pulse0,
    input pulse1,
    input[31:0] SWInput,
    input[3:0] col,
    output[3:0] line,
    output[7:0] DISPOutput,
    output[7:0] DISPEn,
    output[31:0] LEDOutput,
    output cnt0,
    output cnt1,
    output pwmWave,
    output rst,
    output reg[31:0] RegWrData_mem,
    output[31:0] tmpOut
    );
    wire[31:0] WrData;      //写到MEM或IO中的数据
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
    .MemWrData(WrData),
    .MemOutput(MemResult),
    .tmpOut(tmpOut)
    );
    
    wire[3:0] portAddr;
    wire DISPCtrl,KEYCtrl,CTCCtrl,PWMCtrl,UARTCtrl,WDTCtrl,LEDCtrl,SWCtrl;
    wire[31:0] rData;
     memorio MemOrIO(
     .caddress(ALUResult_mem),
     .memread(MemRead),
     .memwrite(MemWr),
     .ioread(IORead),
     .iowrite(IOWr),
     .mread_data(MemResult),
     .ioread_data(IOResult),
     .wdata(MemWrData_mem),
     .DISPCtrl(DISPCtrl),
     .KEYCtrl(KEYCtrl),
     .CTCCtrl(CTCCtrl),
     .PWMCtrl(PWMCtrl),
     .UARTCtrl(UARTCtrl),
     .WDTCtrl(WDTCtrl),
     .LEDCtrl(LEDCtrl),
     .SWCtrl(SWCtrl),
     .portAddress(portAddr),
     .rdata(rData),
     .write_data(WrData)
     );
    
    wire[31:0] UARTReadData,SWReadData;
    wire[15:0] KEYReadData,CTCReadData;
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
   
   /*在该段内声明外设接口的实现
   输入包括：IOAddr(ALUResult_mem[9:0]),PortAddr,WrData,IOWr,clk，en(LEDCtrl/PWMCtrl/...)
   输出包括：KEYReadData/SWReadData
   */
   /*temp signal*/
   //wire[7:0] LEDOutput;
   //wire LEDEn;
   disp32 DISP(
   .clk(clk),
   .reset(reset),
   .data(WrData[15:0]),
   .cs(DISPCtrl),
   .address(portAddr[2:0]),
   .iow(IOWr),
   .led_o(DISPOutput),
   .led_enable_o(DISPEn)
   );
   //wire[3:0] col,line;
   key16 KEY(
   .clk(clk),
   .reset(reset),
   .cs(KEYCtrl),
   .ior(IORead),
   .address(portAddr[1:0]),
   .col(col),
   .line(line),
   .ioread_data(KEYReadData)
   );
   //wire pulse0,pulse1;
   //wire cnt0,cnt1;
   ctc16 CTC(
   .clk(clk),
   .reset(reset),
   .cs(CTCCtrl),
   .iow(IOWr),
   .ior(IORead),
   .pulse0(pulse0),
   .pulse1(pulse1),
   .address(portAddr),
   .iowrite_data(WrData[15:0]),
   .ioread_data(CTCReadData),
   .cout0(cnt0),
   .cout1(cnt1)
   );
  
   //wire pwmWave;
   pwm16 PWM(
   .clk(clk),
   .reset(reset),
   .cs(PWMCtrl),
   .address(portAddr[2:0]),
   .iow(IOWr),
   .data(WrData[15:0]),
   .pwm(pwmWave)
   );
   
   //wire rst;
   wtd16 WTD(
   .clk(clk),
   .reset(reset),
   .cs(WDTCtrl),
   .iow(IOWr),
   .data(WrData[15:0]),
   .rst(rst)
   );
    
   led32 LED(
   .clk(clk),
   .reset(reset),
   .cs(LEDCtrl),
   .iow(IOWr),
   .address(portAddr[0]),
   .data(WrData),
   .ledo(LEDOutput)
   );  
   
   sw32 SW(
   .clk(clk),
   .reset(reset),
   .cs(SWCtrl),
   .ior(IORead),
   .address(portAddr[0]),
   .swi(SWInput),
   .ioread_data(SWReadData)
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
