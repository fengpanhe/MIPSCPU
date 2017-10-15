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
    input clk,                  //ϵͳʱ��
    input reset,                //��λ�źţ��ߵ�ƽ��Ч
    input PC_IFWrite,           //������ˮ���źţ��͵�ƽ��Ч�����ڴ���ð��
    input Jr,                   //JRָ���ź�
    input J,                    //Jָ���ź�
    input Z,                    //Branchָ�����������źţ���ZeroTest��������
    input[31:0] JrAddr,         //JRָ��Ŀ���ַ
    input[31:0] JmpAddr,        //Jmpָ��Ŀ���ַ
    input[31:0] BranchAddr,     //Branchָ��Ŀ���ַ
    output[31:0] Instruction_if,//ȡ���Ļ���ָ��
    output[31:0] NextPC_if      //˳��ִ�е���һ��PC��ַ 
    //output[31:0] curPC_if
    );
   
    reg[31:0] PC_in;
    reg[31:0] PC_out;
    reg[31:0] NextPC;
    wire[2:0] PCSource = {Jr,J,Z};
    //assign curPC_if = PC_out;
    assign NextPC_if = NextPC;//��ΪROMȡָ����һ��ʱ�ӵ��ӳ٣��������NextPC��curPC����
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
