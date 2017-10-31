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
    input reset,
    input MemWr,
    input[1:0] MemWrSize,
    input MemExtType,
    input[31:0] MemAddr,
    input[31:0] MemWrData,
    output reg[31:0] MemOutput
    );
    wire clk;
    assign clk = ~clock;
    reg MemWr0,MemWr1,MemWr2,MemWr3;
    wire WrEn0,WrEn1,WrEn2,WrEn3;
    reg[7:0] MemWrData0,MemWrData1,MemWrData2,MemWrData3;
    wire[7:0] WrData0,WrData1,WrData2,WrData3;
    wire[31:0] tmpOut2,MemResult; 
    reg ExtElem;
    assign WrEn0 = MemWr0;
    assign WrEn1 = MemWr1;
    assign WrEn2 = MemWr2;
    assign WrEn3 = MemWr3;
    assign WrData0 = MemWrData0;
    assign WrData1 = MemWrData1;
    assign WrData2 = MemWrData2;
    assign WrData3 = MemWrData3;
    
    initial begin
     MemWr0 <= 0;
     MemWr1 <= 0;
     MemWr2 <= 0;
     MemWr3 <= 0;
    end
   
    //对store指令的信号控制
    always @(*)
    begin
    if(reset == 1) begin
     MemWr0 <= 0;
     MemWr1 <= 0;
     MemWr2 <= 0;
     MemWr3 <= 0;
    end
    else begin
    case(MemWrSize)
    2'b00:begin
          MemWrData0 <= MemWrData[7:0];
          MemWrData1 <= MemWrData[7:0];
          MemWrData2 <= MemWrData[7:0];
          MemWrData3 <= MemWrData[7:0];
          MemWr0 <= MemWr && (~MemAddr[1]) && (~MemAddr[0]);
          MemWr1 <= MemWr && (~MemAddr[1]) && MemAddr[0];
          MemWr2 <= MemWr && (MemAddr[1]) && (~MemAddr[0]);
          MemWr3 <= MemWr && (MemAddr[1]) && MemAddr[0];
          end
    2'b01:begin
          case(MemAddr[1:0])
          2'b00:begin
                MemWrData0 <= MemWrData[7:0];
                MemWrData1 <= MemWrData[15:8];
                MemWrData2 <= 8'b0;
                MemWrData3 <= 8'b0;
                MemWr0 <= MemWr;
                MemWr1 <= MemWr;
                MemWr2 <= 0;
                MemWr3 <= 0;
                end
          2'b01:begin
                MemWrData0 <= 8'b0;
                MemWrData1 <= MemWrData[7:0];
                MemWrData2 <= MemWrData[15:8];
                MemWrData3 <= 8'b0;
                MemWr0 <= 0;
                MemWr1 <= MemWr;
                MemWr2 <= MemWr;
                MemWr3 <= 0;
                end
          2'b10:begin
                MemWrData0 <= 8'b0;
                MemWrData1 <= 8'b0;
                MemWrData2 <= MemWrData[7:0];
                MemWrData3 <= MemWrData[15:8];
                MemWr0 <= 0;
                MemWr1 <= 0;
                MemWr2 <= MemWr;
                MemWr3 <= MemWr;
                end
          2'b11:begin
                {MemWrData3,MemWrData2,MemWrData1,MemWrData0} <= 32'b0;
                {MemWr3,MemWr2,MemWr1,MemWr0} <= 4'b0000;
                end
          endcase
          end
    2'b11:begin
          if(MemAddr[1:0] == 2'b00)
            begin
            {MemWrData3,MemWrData2,MemWrData1,MemWrData0} <= MemWrData;
            MemWr0 <= MemWr;
            MemWr1 <= MemWr;
            MemWr2 <= MemWr;
            MemWr3 <= MemWr;
            end
          else
            begin
            {MemWrData3,MemWrData2,MemWrData1,MemWrData0} <= 32'b0;
            {MemWr3,MemWr2,MemWr1,MemWr0} <= 4'b0000;
            end
          end
    endcase
    end
    end            
   
    data_ram0 ram0 (
      .clka(clk),    // input wire clka
      .wea(WrEn0),      // input wire [0 : 0] wea
      .addra(MemAddr[15:2]),  // input wire [13 : 0] addra
      .dina(WrData0),    // input wire [7 : 0] dina
      .douta(tmpOut2[7:0])  // output wire [7 : 0] douta
    );
    data_ram1 ram1 (
      .clka(clk),    // input wire clka
      .wea(WrEn1),      // input wire [0 : 0] wea
      .addra(MemAddr[15:2]),  // input wire [13 : 0] addra
      .dina(WrData1),    // input wire [7 : 0] dina
      .douta(tmpOut2[15:8])  // output wire [7 : 0] douta
    );
    data_ram2 ram2 (
      .clka(clk),    // input wire clka
      .wea(WrEn2),      // input wire [0 : 0] wea
      .addra(MemAddr[15:2]),  // input wire [13 : 0] addra
      .dina(WrData2),    // input wire [7 : 0] dina
      .douta(tmpOut2[23:16])  // output wire [7 : 0] douta
    );
    data_ram3 ram3 (
      .clka(clk),    // input wire clka
      .wea(WrEn3),      // input wire [0 : 0] wea
      .addra(MemAddr[15:2]),  // input wire [13 : 0] addra
      .dina(WrData3),    // input wire [7 : 0] dina
      .douta(tmpOut2[31:24])  // output wire [7 : 0] douta
    );
    
    /*对load指令的信号控制*/
    always @(*)
    begin
    case(MemWrSize)
    2'b00:begin
          case(MemAddr[1:0])
          2'b00:begin
                ExtElem = MemExtType && tmpOut2[7];
                MemOutput = {{24{ExtElem}},tmpOut2[7:0]};
                end
          2'b01:begin
                ExtElem = MemExtType && tmpOut2[15];
                MemOutput = {{24{ExtElem}},tmpOut2[15:8]};
                end
          2'b10:begin
                ExtElem = MemExtType && tmpOut2[23];
                MemOutput = {{24{ExtElem}},tmpOut2[23:16]};
                end
          2'b11:begin
                ExtElem = MemExtType && tmpOut2[31];
                MemOutput = {{24{ExtElem}},tmpOut2[31:24]};
                end
          endcase   
          end
    2'b01:begin
          case(MemAddr[1:0])
          2'b00:begin
                ExtElem = MemExtType && tmpOut2[15];
                MemOutput = {{16{ExtElem}},tmpOut2[15:0]};
                end
          2'b01:begin
                ExtElem = MemExtType && tmpOut2[23];
                MemOutput = {{16{ExtElem}},tmpOut2[23:8]};
                end
          2'b10:begin
                ExtElem = MemExtType && tmpOut2[31];
                MemOutput = {{16{ExtElem}},tmpOut2[31:16]};
                end
          2'b11:begin
                ExtElem = MemExtType && tmpOut2[31];
                MemOutput = {{16{ExtElem}},tmpOut2[31:16]};
                end
          endcase
          end
    2'b11:begin
          MemOutput = tmpOut2;
          end
    endcase
    end
       
endmodule
