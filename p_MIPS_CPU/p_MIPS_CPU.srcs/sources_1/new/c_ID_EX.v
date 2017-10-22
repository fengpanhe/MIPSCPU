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
    input en,
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
     m_dffre #(1) dffre1(
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(MemOrIOToReg_id),
     .dout(MemOrIOToReg_ex)
     );
     //reg for CPToReg  
     m_dffre #(1) dffre2(
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(CPToReg_id),
     .dout(CPToReg_ex)
     );
     //reg for RegWr
     m_dffre #(1) dffre3(
     .clk(clk),
     .reset(reset),
     .en(en),
     .din(RegWr_id),
     .dout(RegWr_ex)
     );
     //reg for MemWr
     m_dffre #(1) dffre4(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(MemOrIOWr_id),
    .dout(MemOrIOWr_ex)
    );
    //reg for CPWr
    m_dffre #(1) dffre5(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(CPWr_id),
    .dout(CPWr_ex)
     );
    //reg for MemRead
    m_dffre #(1) dffre6(        
    .clk(clk),                
    .reset(reset),
    .en(en),  
    .din(MemOrIORead_id),           
    .dout(MemOrIORead_ex)           
    );                     
    //reg for ALUCode
    m_dffre #(5) dffre7(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(ALUCode_id),
    .dout(ALUCode_ex)
    );
    //reg for ALUsrc
    m_dffre #(2) dffre8(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din({ALUsrcA_id,ALUsrcB_id}),
    .dout({ALUsrcA_ex,ALUsrcB_ex})
    );
    //reg for RegDst
    m_dffre #(1) dffre9(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(RegDst_id),
    .dout(RegDst_ex)
    );
    //reg for AL
    m_dffre #(1) dffre10(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(AL_id),
    .dout(AL_ex)
    );
    //reg for NextPC
    m_dffre #(32) dffre11(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(NextPC_id),
    .dout(NextPC_ex)
    );    
    //reg for Sa
    m_dffre #(32) dffre12(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(Sa_id),
    .dout(Sa_ex)
    );
    //reg for Imme
    m_dffre #(32) dffre13(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(Imme_id),
    .dout(Imme_ex)
    );
    //reg for RsData
    m_dffre #(32) dffre14(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(RsData_id),
    .dout(RsData_ex)
    ); 
    //reg for RtData
    m_dffre #(32) dffre15(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(RtData_id),
    .dout(RtData_ex)
    );
    //reg for CPResult
    m_dffre #(32) dffre16(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(CPResult_id),
    .dout(CPResult_ex)
    );
    //reg for RtAddr
    m_dffre #(5) dffre17(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(RtAddr_id),
    .dout(RtAddr_ex)
    );
    //reg for RdAddt
    m_dffre #(5) dffre18(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(RdAddr_id),
    .dout(RdAddr_ex)
    );
    
    //reg for MemExtType 
    m_dffre #(1) dffre19(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(MemExtType_id),
    .dout(MemExtType_ex)
    );
    //reg for MemReadSize
    m_dffre #(2) dffre20(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(MemReadSize_id),
    .dout(MemReadSize_ex)
    );    
    //reg for signedOp
    m_dffre #1 dffre21(
    .clk(clk),
    .reset(reset),
    .en(en),
    .din(signedOp_id),
    .dout(signedOp_ex)
    );
endmodule
