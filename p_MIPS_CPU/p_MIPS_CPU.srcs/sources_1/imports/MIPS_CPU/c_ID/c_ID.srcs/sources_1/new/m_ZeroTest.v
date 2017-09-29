`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/24 16:20:16
// Design Name: 
// Module Name: m_ZeroTest
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


module m_ZeroTest(
    input[4:0] ALUCode_id,
    input[31:0] RsData_id,
    input[31:0] RtData_id,
    output reg Z  
    );  
    parameter ALU_BEQ = 5'd23;
    parameter ALU_BNE = 5'd24;
    parameter ALU_BGEZ = 5'd25;
    parameter ALU_BGTZ = 5'd26;
    parameter ALU_BLEZ = 5'd27;
    parameter ALU_BLTZ = 5'd28;
    
    always @(*)
    begin
    case(ALUCode_id)
    ALU_BEQ : Z = &(RsData_id~^RtData_id);
    ALU_BNE : Z = |(RsData_id^RtData_id);
    ALU_BGEZ : Z = ~RsData_id[31];
    ALU_BGTZ : Z = ~RsData_id[31] && (|RsData_id);
    ALU_BLEZ : Z = RsData_id[31] || ~(|RsData_id);
    ALU_BLTZ : Z = RsData_id[31];
    default : Z = 0;
    endcase
    end
endmodule
