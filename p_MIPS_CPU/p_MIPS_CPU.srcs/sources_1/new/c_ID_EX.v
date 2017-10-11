`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/02 19:48:11
// Design Name: 
// Module Name: c_ID_EX
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


module c_ID_EX(
    input clk,
    input reset,
    input MemOrIOToReg_id,
    input CPToReg_id,
    input MemOrIOWr_id,
    input CPWr_id,
    input RegWr_id,
    input MemOrIORead_id,
    input[4:0] ALUCode_id,
    input ALUsrcA_id,
    input ALUsrcB_id,
    input RegDst_id,
    input AL_id,
    input signedOp_id,
    input[31:0] NextPC_id,
    input[31:0] Sa_id,
    input[31:0] Imme_id,
    input[31:0] RsData_id,
    input[31:0] RtData_id,
    input[31:0] CPResult_id,
    input[4:0] RtAddr_id,
    input[4:0] RdAddr_id,
    input MemExtType_id,
    input[1:0] MemReadSize_id,
    output MemOrIOToReg_ex,
    output CPToReg_ex,
    output MemOrIOWr_ex,
    output CPWr_ex,
    output RegWr_ex,
    output MemOrIORead_ex,
    output[4:0] ALUCode_ex,
    output ALUsrcA_ex,
    output ALUsrcB_ex,
    output RegDst_ex,
    output AL_ex,
    output signedOp_ex,
    output[31:0] NextPC_ex,
    output[31:0] Sa_ex,
    output[31:0] Imme_ex,
    output[31:0] RsData_ex,
    output[31:0] RtData_ex,
    output[31:0] CPResult_ex,
    output[4:0] RtAddr_ex,
    output[4:0] RdAddr_ex,
    output MemExtType_ex,
    output[1:0] MemReadSize_ex 
    );
    
    //reg for MemToReg
     m_dffr #(1) dffr1(
     .clk(clk),
     .reset(reset),
     .din(MemOrIOToReg_id),
     .dout(MemOrIOToReg_ex)
     );
     //reg for CPToReg  
     m_dffr #(1) dffr2(
     .clk(clk),
     .reset(reset),
     .din(CPToReg_id),
     .dout(CPToReg_ex)
     );
     //reg for RegWr
     m_dffr #(1) dffr3(
     .clk(clk),
     .reset(reset),
     .din(RegWr_id),
     .dout(RegWr_ex)
     );
     //reg for MemWr
     m_dffr #(1) dffr4(
    .clk(clk),
    .reset(reset),
    .din(MemOrIOWr_id),
    .dout(MemOrIOWr_ex)
    );
    //reg for CPWr
    m_dffr #(1) dffr5(
    .clk(clk),
    .reset(reset),
    .din(CPWr_id),
    .dout(CPWr_ex)
     );
    //reg for MemRead
    m_dffr #(1) dffr6(        
    .clk(clk),                
    .reset(reset),  
    .din(MemOrIORead_id),           
    .dout(MemOrIORead_ex)           
    );                     
    //reg for ALUCode
    m_dffr #(5) dffr7(
    .clk(clk),
    .reset(reset),
    .din(ALUCode_id),
    .dout(ALUCode_ex)
    );
    //reg for ALUsrc
    m_dffr #(2) dffr8(
    .clk(clk),
    .reset(reset),
    .din({ALUsrcA_id,ALUsrcB_id}),
    .dout({ALUsrcA_ex,ALUsrcB_ex})
    );
    //reg for RegDst
    m_dffr #(1) dffr9(
    .clk(clk),
    .reset(reset),
    .din(RegDst_id),
    .dout(RegDst_ex)
    );
    //reg for AL
    m_dffr #(1) dffr10(
    .clk(clk),
    .reset(reset),
    .din(AL_id),
    .dout(AL_ex)
    );
    //reg for NextPC
    m_dffr #(32) dffr11(
    .clk(clk),
    .reset(reset),
    .din(NextPC_id),
    .dout(NextPC_ex)
    );    
    //reg for Sa
    m_dffr #(32) dffr12(
    .clk(clk),
    .reset(reset),
    .din(Sa_id),
    .dout(Sa_ex)
    );
    //reg for Imme
    m_dffr #(32) dffr13(
    .clk(clk),
    .reset(reset),
    .din(Imme_id),
    .dout(Imme_ex)
    );
    //reg for RsData
    m_dffr #(32) dffr14(
    .clk(clk),
    .reset(reset),
    .din(RsData_id),
    .dout(RsData_ex)
    ); 
    //reg for RtData
    m_dffr #(32) dffr15(
    .clk(clk),
    .reset(reset),
    .din(RtData_id),
    .dout(RtData_ex)
    );
    //reg for CPResult
    m_dffr #(32) dffr16(
    .clk(clk),
    .reset(reset),
    .din(CPResult_id),
    .dout(CPResult_ex)
    );
    //reg for RtAddr
    m_dffr #(5) dffr17(
    .clk(clk),
    .reset(reset),
    .din(RtAddr_id),
    .dout(RtAddr_ex)
    );
    //reg for RdAddt
    m_dffr #(5) dffr18(
    .clk(clk),
    .reset(reset),
    .din(RdAddr_id),
    .dout(RdAddr_ex)
    );
    
    //reg for MemExtType 
    m_dffr #(1) dffr19(
    .clk(clk),
    .reset(reset),
    .din(MemExtType_id),
    .dout(MemExtType_ex)
    );
    //reg for MemReadSize
    m_dffr #(2) dffr20(
    .clk(clk),
    .reset(reset),
    .din(MemReadSize_id),
    .dout(MemReadSize_ex)
    );    
    //reg for signedOp
    m_dffr #1 dffr21(
    .clk(clk),
    .reset(reset),
    .din(signedOp_id),
    .dout(signedOp_ex)
    );
endmodule
