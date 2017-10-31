`timescale 1ns / 1ps 
////////////////////////////////////////////////////////////////////////////////// 
// Company:  
// Engineer:  
//  
// Create Date: 10/06/2017 10:39:26 AM 
// Design Name:  
// Module Name: key_test 
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
 
 
module key_test( 
 
    ); 
    reg clk = 1; 
    reg reset; 
    wire clk2;
    wire clk3;
    wire[31:0] Instruction_if,Instruction_id;
    wire[31:0] NextPC_if,NextPC_id;
   // wire[4:0] ALUCode;
    wire[31:0] ALUa_ex;
    wire[31:0] ALUb_ex;
    wire[31:0] ALUResult_ex;
   /* wire[31:0] RetAddr;
    wire saveFlag;
    wire flush;
    //wire[31:0] HI,LO;*/
  
    //wire[4:0] ExcCode;
    /*wire[3:0] line; 
    reg[3:0] col; 
    reg[23:0] SWInput;
    wire[23:0] LEDOutput;
    wire[7:0] DISPOutput;
    wire[7:0] DISPEn;
   // wire[31:0] MemWrData_mem;
   // wire[31:0] WrData;
   // wire[31:0] RegWrData_mem;
    //wire[31:0] rData;
    //wire IOWr,IORead;
   // wire[31:0] IOReadData;
    //wire[31:0] IOReadData_sw;
   // wire SWctrl;*/
    always #5 clk = ~clk;
    

    /*initial
    begin
    SWInput = 24'h0000ff;
    /*#500
    SWInput = 24'h123456;
    #450
    SWInput = 24'h001111;*/
    //end
    
     
    initial 
    begin 
    //col = 4'b1111; 
    reset = 1; 
    #55 reset = 0; 
    /*#8100 col[0] = line[0]; 
    #200 col[0] = 1; */
    end 
  
    m_MIPS_CPU MIPS_CPU(
    .clk0(clk),
    .rst(reset),
    .Instruction(Instruction_if),
    .Instruction2(Instruction_id),
    .nextpc_if(NextPC_if),
    .nextpc_id(NextPC_id),
    /*.rAddr(RetAddr),
    .sFlag(saveFlag),
    .flush(flush),*/
    //.memwrdata_mem(MemWrData_mem),
    //.regwrdata_mem(RegWrData_mem),
    //.wd(WrData),
    //.rd(rData),
    //.IORead(IORead),
    //.IOWr(IOWr),
   // .IOReadData(IOReadData),
   // .IOReadData_sw(IOReadData_sw),
   // .SWctrl(SWctrl),
    .ALU_a(ALUa_ex),
    .ALU_b(ALUb_ex),
   // .alucode(ALUCode),
    .aluresult_ex(ALUResult_ex),
    /*.HI(HI),
    .LO(LO),*/
    .clk2(clk2),
    .clk3(clk3),
    //.aluresult_mem(ALUResult_mem),
  //.excCode(ExcCode),
   /* .col(col), 
    .line(line),
    .SWInput(SWInput),*/
    .LEDOutput(LEDOutput),
    .DISPOutput(DISPOutput),
    .DISPEn(DISPEn)
     );
endmodule
