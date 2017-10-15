`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/24 10:37:00
// Design Name: 
// Module Name: c_IF
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


module c_IF(
    input clk,                  //系统时钟
    input reset,                //复位信号，高电平有效
    input PC_IFWrite,           //阻塞流水线信号，低电平有效，用于处理冒险
    input Jr,                   //JR指令信号
    input J,                    //J指令信号
    input Z,                    //Branch指令条件成立信号，由ZeroTest部件生成
    input[31:0] JrAddr,         //JR指令目标地址
    input[31:0] JmpAddr,        //Jmp指令目标地址
    input[31:0] BranchAddr,     //Branch指令目标地址
    output[31:0] Instruction_if,//取出的机器指令
    output[31:0] NextPC_if      //顺序执行的下一条PC地址 
    //output[31:0] curPC_if
    );
   
    reg[31:0] PC_in;
    reg[31:0] PC_out;
    reg[31:0] NextPC;
    wire[2:0] PCSource = {Jr,J,Z};
    //assign curPC_if = PC_out;
    assign NextPC_if = NextPC;//因为ROM取指令有一个时钟的延迟，故输出的NextPC用curPC代替
    initial 
    begin
    PC_in = 0;
    PC_out = 0;
    NextPC = 4;
    end
     
    //Mux for PC
    always @(*)
    begin
    case(PCSource)
    3'b000:PC_in = NextPC;
    3'b001:PC_in = BranchAddr;
    3'b010:PC_in = JmpAddr;
    3'b100:PC_in = JrAddr;
    default:PC_in = NextPC;
    endcase
    end
    //PC_reg
    always @(posedge clk)
    begin
    if(PC_IFWrite)
        begin
        if(reset == 1)
            begin
            PC_out<=0;
            NextPC<=4;
            end
        else
            begin
            PC_out = PC_in;
            NextPC = PC_out + 32'h4;
            end
        end
    end

    //Program Rom
    m_programRom programRom (
      .clka(~clk),    // input wire clka
      .addra(PC_out[15:2]),  // input wire [13 : 0] addra
      .douta(Instruction_if)  // output wire [31 : 0] douta
    );
endmodule
