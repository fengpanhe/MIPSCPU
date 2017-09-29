`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/23 20:12:26
// Design Name: 
// Module Name: m_DataRam
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


module m_DataRam(
    input clock,
    input MemWr,
    input[1:0] MemWrSize,
    input MemExtType,
    input[31:0] MemAddr,
    input[31:0] MemWrData,
    output reg[31:0] MemOutput,
    output reg[31:0] tmpOut
    );
    wire clk;
    assign clk = ~clock;
    reg MemWr0,MemWr1,MemWr2,MemWr3;
    reg[7:0] MemWrData0,MemWrData1,MemWrData2,MemWrData3;
    wire[31:0] tmpOut2;
    
    always @(*)
    begin
    case(MemAddr[1:0])
    2'b00:begin
        MemWr0 <=     
    
    
    always @(*)
    begin
    case(MemWrSize)
    2'b00:begin
          MemWrData0 <= MemWrData[7:0];
          MemWrData1 <= MemWrData[7:0];
          MemWrData2 <= MemWrData[7:0];
          MemWrData3 <= MemWrData[7:0];
          end
    2'b01:begin
          
     
    
    
    assign MemWr0 = MemWr;
    assign MemWr1 = MemWrSize[0] & MemWr;
    assign MemWr2 = MemWrSize[1] & MemWr;
    assign MemWr3 = MemWrSize[1] & MemWr;
    data_ram0 ram0 (
      .clka(clk),    // input wire clka
      .wea(MemWr0),      // input wire [0 : 0] wea
      .addra(MemAddr[15:2]),  // input wire [13 : 0] addra
      .dina(MemWrData[7:0]),    // input wire [7 : 0] dina
      .douta(tmpOut2[7:0])  // output wire [7 : 0] douta
    );
    data_ram1 ram1 (
      .clka(clk),    // input wire clka
      .wea(MemWr1),      // input wire [0 : 0] wea
      .addra(MemAddr[15:2]),  // input wire [13 : 0] addra
      .dina(MemWrData[15:8]),    // input wire [7 : 0] dina
      .douta(tmpOut2[15:8])  // output wire [7 : 0] douta
    );
    data_ram2 ram2 (
      .clka(clk),    // input wire clka
      .wea(MemWr2),      // input wire [0 : 0] wea
      .addra(MemAddr[15:2]),  // input wire [13 : 0] addra
      .dina(MemWrData[23:16]),    // input wire [7 : 0] dina
      .douta(tmpOut2[23:16])  // output wire [7 : 0] douta
    );
    data_ram3 ram3 (
      .clka(clk),    // input wire clka
      .wea(MemWr3),      // input wire [0 : 0] wea
      .addra(MemAddr[15:2]),  // input wire [13 : 0] addra
      .dina(MemWrData[31:24]),    // input wire [7 : 0] dina
      .douta(tmpOut2[31:24])  // output wire [7 : 0] douta
    );
    wire ExtElem1,ExtElem2;
    assign ExtElem1 = MemExtType && tmpOut2[7];//Byte operate
    assign ExtElem2 = MemExtType && tmpOut2[15];//HalfWord operate
    always @(*)
    begin
    case(MemWrSize)
    2'b00: MemOutput = {{24{ExtElem1}},tmpOut2[7:0]};//{24{ExtElem1},tmpOut[7:0]};
    2'b01: MemOutput = {{16{ExtElem2}},tmpOut2[15:0]};
    2'b11: MemOutput = tmpOut2;
    endcase
    tmpOut <= tmpOut2;
    end
endmodule
