`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/01 15:14:40
// Design Name: 
// Module Name: m_ExceptionProc
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


module m_ExceptionProc(
    input clk,
    input[4:0] ALUCode,
    input[5:0] Func,
    input Overflow,
    input[5:0] int_i,
    input int_en,
    input[5:0] int_mask,
    input[31:0] eretAddr,
    input[31:0] JAddr,
    input[31:0] NextPC,
    input[31:0] JrAddr,
    input[31:0] BranchAddr,
    input Jr,
    input Jmp,
    input Z, 
    input SaveFlag,
    output reg[4:0] exceptType,
    output reg[31:0] JmpAddr,
    output reg[31:0] RetAddr,
    output reg Je
    );
    parameter BREAK_func = 6'b001101;
    parameter SYSCALL_func = 6'b001100;
    parameter ERET_func = 6'b011000;
    
    parameter ALU_EXCEPT = 5'd30;
    parameter ALU_NONE = 5'd31;
    
    parameter EXC_HARD = 5'b00000;
    parameter EXC_SYSCALL = 5'b01000;
    parameter EXC_BREAK = 5'b01001;
    parameter EXC_RESERVED = 5'b01010;
    parameter EXC_OVERFLOW = 5'b01100;
    
    parameter EXC_ADDR = 32'h00001000;  //异常处理程序入口地址
    //parameter EXC_ADDR = 32'h00000030;
    initial 
    begin
        Je <= 0;
    end

    wire[2:0] RetAddrSrc = {Jr,Jmp,Z};
    always @(posedge clk)
    begin
        if(SaveFlag) begin
              case(RetAddrSrc)
              3'b000: RetAddr <= NextPC; 
              3'b001: RetAddr <= BranchAddr;
              3'b010: RetAddr <= JAddr;
              3'b100: RetAddr <= JrAddr;
              default:begin
                        if(ALUCode == ALU_EXCEPT && Func == ERET_func) begin
                            RetAddr <= eretAddr;
                        end
                        else begin
                            RetAddr <= NextPC;
                        end
                      end
              endcase
        end  
    end
    
    always @(*)
    begin
    if((|(int_i & int_mask)) && int_en)
        begin
        exceptType <= EXC_HARD;
        JmpAddr <= EXC_ADDR;
        Je <= 1;
        end
    else if(Overflow)
        begin
        exceptType <= EXC_OVERFLOW;
        JmpAddr <= EXC_ADDR;
        Je <= 1;
        end
    else if(ALUCode == ALU_EXCEPT)
        begin
        case(Func)
        BREAK_func: begin
                    exceptType <= EXC_BREAK;
                    JmpAddr <= EXC_ADDR;
                    Je <= 1;
                    end
        SYSCALL_func: begin
                    exceptType <= EXC_SYSCALL;
                    JmpAddr <= EXC_ADDR;
                    Je <= 1;
                    end
        ERET_func:begin
                  exceptType <= 5'bx;
                  JmpAddr <= eretAddr;
                  Je <= 1;
                  end
        endcase
        end
    else if(ALUCode == ALU_NONE)
        begin
        exceptType <= EXC_RESERVED; 
        JmpAddr <= EXC_ADDR;
        Je <= 1;
        end
    else
        begin
        exceptType <= 5'b11111;
        JmpAddr <= JAddr;
        Je <= 0;
        end
    end
endmodule
