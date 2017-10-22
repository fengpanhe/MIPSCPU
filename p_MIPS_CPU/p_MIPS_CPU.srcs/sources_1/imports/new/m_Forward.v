`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/24 20:32:36
// Design Name: 
// Module Name: m_Forward
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


module m_Forward(
    input[4:0] RegWrAddr_mem,
    input[4:0] RegWrAddr_wb,
    input[4:0] RegWrAddr_ex,
    input[4:0] CPWrAddr_mem,
    input[4:0] CPWrAddr_wb,
    input[4:0] CPWrAddr_ex,
    input CPWr_mem,
    input CPWr_wb,
    input CPWr_ex,
    input RegWr_mem,
    input RegWr_wb,
    input RegWr_ex,
    input[4:0] RsAddr_id,
    input[4:0] RtAddr_id,
    input[4:0] RdAddr_id,
    output[2:0] ForwardA,
    output[2:0] ForwardB,
    output[2:0] ForwardCP
    );
    /*ForwardA/B[2:0] 
      000:RsData/RtData--无数据冲突
      001:ALUResult_ex--一阶数据冲突
      010:RegWrData_mem--二阶数据冲突
      100:RegWrData_wb--三阶数据冲突
      */
    assign ForwardA[0] = RegWr_ex && (RegWrAddr_ex != 0) && (RegWrAddr_ex == RsAddr_id);
    assign ForwardA[1] = RegWr_mem && (RegWrAddr_mem != 0) && (~ForwardA[0])
                         && (RegWrAddr_mem == RsAddr_id);
    assign ForwardA[2] = RegWr_wb && (RegWrAddr_wb != 0) && (~ForwardA[0]) 
                         && (~ForwardA[1]) && (RegWrAddr_wb == RsAddr_id); 
    assign ForwardB[0] = RegWr_ex && (RegWrAddr_ex != 0) && (RegWrAddr_ex == RtAddr_id);
    assign ForwardB[1] = RegWr_mem && (RegWrAddr_mem != 0) && (~ForwardB[0])
                         && (RegWrAddr_mem == RtAddr_id);
    assign ForwardB[2] = RegWr_wb && (RegWrAddr_wb != 0) && (~ForwardB[0]) 
                         && (~ForwardB[1]) && (RegWrAddr_wb == RtAddr_id); 
    /*ForwardCP[1:0]
      000:CPData
      001:CPWrData_ex
      010:CPWrData_mem
      100:CPWrData_wb
      */
    assign ForwardCP[0] = CPWr_ex && (CPWrAddr_ex == RdAddr_id);
    assign ForwardCP[1] = CPWr_mem && (CPWrAddr_ex != RdAddr_id) && (CPWrAddr_mem == RdAddr_id);
    assign ForwardCP[2] = CPWr_wb && (CPWrAddr_ex != RdAddr_id) && (CPWrAddr_mem != RdAddr_id) && (CPWrAddr_wb == RdAddr_id);
    
    
    
    /*assign ForwardA[0] = RegWr_wb && (RegWrAddr_wb != 0)
                                &&(RegWrAddr_mem != RsAddr_ex)
                                &&(RegWrAddr_wb == RsAddr_ex);
    assign ForwardA[1] = RegWr_mem && (RegWrAddr_mem != 0)
                        &&(RegWrAddr_mem == RsAddr_ex);
    assign ForwardB[0] = RegWr_wb && (RegWrAddr_wb != 0)
                        &&(RegWrAddr_mem != RtAddr_ex)
                        &&(RegWrAddr_wb == RtAddr_ex);
    assign ForwardB[1] = RegWr_mem && (RegWrAddr_mem != 0)
                        &&(RegWrAddr_mem == RtAddr_ex);   
                        
    assign ForwardCP[0] = CPWr_wb && (CPWrAddr_mem != RdAddr_ex) && (CPWrAddr_wb == RdAddr_ex);
    
    assign ForwardCP[1] = CPWr_mem && (CPWrAddr_mem == RdAddr_ex);*/
endmodule
