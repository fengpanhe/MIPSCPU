`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2017 02:10:18 PM
// Design Name: 
// Module Name: ctc16
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


// 方式寄存器 CNT0:off20H  CNT1:off22H  
//             第0位 0：定时 1：计数
//             第1位 0：非重复 1：重复
// 初始

module ctc16(
    input reset,    //复位
    input clk,      //系统时钟
    input cs,      //片选
    input iow,      //写信号
    input ior,      //读信号
    input pulse0,   //接CT0的外部脉冲
    input pulse1,   //接CT1的外部脉冲
    input[3:0] address, //端口号
    input[15:0] iowrite_data,   //写到CTC模块的数据
    output reg[15:0] ioread_data,   //读出的数据
    output reg cout0,               //CNT0的输出引脚
    output reg cout1                //CNT1的输出引脚
    );

    reg[15:0] status1, status2;     //CNT0和CNT1的状态寄存器
    reg[15:0] stat11, stat12;
    reg[15:0] stat21, stat22;
    reg[15:0] mode1, mode2;         //CNT0和CNT1的方式寄存器
    reg[15:0] count1, count2;        //CNT0和CNT0的减1计数器
    reg[15:0] cnt11, cnt12;
    reg[15:0] cnt21, cnt22;
    reg[15:0] initcnt1, initcnt2;
    reg[15:0] rubbish;

    always @(negedge clk) begin
        if (reset == 1) begin
            // reset
            cout0 = 1;
            cout1 = 1;
            initcnt1 = 16'h0000;
            initcnt2 = 16'h0000;
            cnt11 = 16'h0000;
            cnt21 = 16'h0000;
            stat11 = 16'h0000;
            stat21 = 16'h0000;
        end
        else begin
            if (cs == 1) begin
                if (iow == 1) begin         //cpu向定时器/计数器写
                    case(address)           //根据端口号进行相应的操作
                        4'b0000: begin
                            mode1 = iowrite_data;
                            stat11 = status1 & 16'h7ffc;
                        end
                        4'b0010: begin
                            mode2 = iowrite_data;
                            stat21 = status2 & 16'h7ffc;
                        end
                        4'b0100: begin
                            initcnt1 = iowrite_data;
                            cnt11 = iowrite_data;
                            stat11 = status1 | 16'h8000;
                        end
                        4'b0110: begin
                            initcnt2 = iowrite_data;
                            cnt21 = iowrite_data;
                            stat21 = status2 | 16'h8000;
                        end
                        default: rubbish = iowrite_data;
                    endcase
                end
                else if (ior == 1) begin    //cpu向定时器/计数器读
                    case(address)           //根据端口号进行相应的操作
                        4'b0000: begin
                            ioread_data = status1;
                            stat11 = status1 & 16'hfffc;
                        end
                        4'b0010: begin
                            ioread_data = status2;
                            stat21 = status2 & 16'hfffc;
                        end
                        4'b0100: begin
                            ioread_data = count1;
                        end
                        4'b0110: begin
                            ioread_data = count2;
                        end
                        default: ioread_data = 16'hzzzz;
                    endcase
                end  
            end     //cs==1结束
            else begin      //cs == 0;
                if (status1[15] == 1'b0) begin  //计数值无效，保持输出为高电平
                    cout0 = 1;
                end
                if ((status1[15] == 1) && (mode1[0] == 0)) begin
                    if (count1 == 1) begin      //定时计数到1，输出低电平
                        cout0 = 0;
                        stat11 = status1 | 16'h0001;    //置状态寄存器为定时到
                        if (mode1[1] == 1) begin        //如果重复定时，重装初始值
                            cnt11 = initcnt1;
                        end
                        else begin                      //非重复定时，设置状态寄存器为计数值无效
                            stat11 = stat11 & 16'h7fff;
                            cnt11 = 0;
                        end
                    end
                    else begin              //count!=1
                        cout0 = 1;          //保持输出为高电平
                        cnt11 = count1 - 1'b1;  //计数值减1
                        stat11 = status1 | 16'h8000;
                    end
                end

                if (status2[15] == 1'b0) begin
                    cout1 = 1;
                end
                if ((status2[15] == 1) && (mode2[0] == 0)) begin
                    if (count2 == 1) begin      //定时计数到1，输出低电平
                        cout1 = 0;
                        stat21 = status2 | 16'h0001;    //置状态寄存器为定时到
                        if (mode2[1] == 1) begin        //如果重复定时，重装初始值
                            cnt21 = initcnt2;
                        end
                        else begin                      //非重复定时，设置状态寄存器为计数值无效
                            stat21 = stat21 & 16'h7fff;
                            cnt21 = 0;
                        end
                    end
                    else begin              //count!=1
                        cout1 = 1;          //保持输出为高电平
                        cnt21 = count2 - 1'b1;  //计数值减1
                        stat21 = status2 | 16'h8000;
                    end
                end
            end         //cs == 0
        end     //reset == 0
    end

    always @(negedge pulse0) begin  //脉冲０计数（CNT0计数脉冲）
        if ((status1[15] == 1) && (mode1[0] == 1)) begin
            if (count1 == 0) begin      //定时计数到0
                stat12 = status1 | 16'h0001;    //置状态寄存器为计数到
                if (mode1[1] == 1) begin        //如果重复计数，重装初始值
                    cnt12 = initcnt1;
                end
                else begin                      //非重复计数，设置状态寄存器为计数值无效
                    stat12 = stat12 & 16'h7fff;
                    cnt12 = 0;
                end
            end
            else begin              //count!=1
                cnt12 = count1 - 1'b1;  //计数值减1
                stat12 = status1 | 16'h8000;
            end  
        end
    end

    always @(negedge pulse1) begin  //脉冲1计数（CNT1计数脉冲）
        if ((status2[15] == 1) && (mode2[0] == 1)) begin
            if (count2 == 0) begin      //定时计数到0
                stat22 = status2 | 16'h0001;    //置状态寄存器为计数到
                if (mode2[1] == 1) begin        //如果重复计数，重装初始值
                    cnt22 = initcnt2;
                end
                else begin                      //非重复计数，设置状态寄存器为计数值无效
                    stat22 = stat22 & 16'h7fff;
                    cnt22 = 0;
                end
            end
            else begin              //count!=1
                cnt22 = count2 - 1'b1;  //计数值减1
                stat22 = status2 | 16'h8000;
            end  
        end
    end

    always @(stat11, stat12) begin    //将定时和计数两个进程对状态寄存器的赋值真正赋给该寄存器
        if (reset == 0) begin
            // reset
            if ((cs == 1) && (((iow == 1) && ((address == 4'b0100) || (address == 4'b0000))) || ((ior == 1) && (address == 4'b0000)))) begin
                status1 = stat11;   //对定时/计数器读写时候对状态寄存器的赋值赋给该寄存器
            end
            else begin
                if (mode1[0] == 1) begin
                    status1 = stat12;       //计数时对状态寄存器的赋值赋给该寄存器
                end
                else begin
                    status1 = stat11;       //定时时对状态寄存器的赋值赋给该寄存器
                end
            end
        end
    end

    always @(stat21, stat22) begin    //将定时和计数两个进程对状态寄存器的赋值真正赋给该寄存器
        if (reset == 0) begin
            // reset
            if ((cs == 1) && (((iow == 1) && ((address == 4'b0100) || (address == 4'b0000))) || ((ior == 1) && (address == 4'b0000)))) begin
                status2 = stat21;   //对定时/计数器读写时候对状态寄存器的赋值赋给该寄存器
            end
            else begin
                if (mode2[0] == 1) begin
                    status2 = stat22;       //计数时对状态寄存器的赋值赋给该寄存器
                end
                else begin
                    status2 = stat21;       //定时时对状态寄存器的赋值赋给该寄存器
                end
            end
        end
    end

    always @(cnt11, cnt12) begin //将定时和计数两个进程对减1寄存器的赋值真正赋给该寄存器
        if (reset == 0) begin
            // reset
            if ((cs == 1) && (iow == 1) && (address == 4'b0100)) begin
                count1 = cnt11;         //将定时/计数写时候对减1寄存器的赋值赋给该寄存器
            end
            else begin
                if (mode1[0] == 1) begin
                    count1 = cnt12;     //将计数时候对减1寄存器的赋值赋给该寄存器
                end
                else begin
                    count1 = cnt11;     //将定时时候对减1寄存器的赋值赋给该寄存器
                end
            end
        end
    end

    always @(cnt21, cnt22) begin //将定时和计数两个进程对减1寄存器的赋值真正赋给该寄存器
        if (reset == 0) begin
            // reset
            if ((cs == 1) && (iow == 1) && (address == 4'b0100)) begin
                count2 = cnt21;         //将定时/计数写时候对减1寄存器的赋值赋给该寄存器
            end
            else begin
                if (mode2[0] == 1) begin
                    count2 = cnt22;     //将计数时候对减1寄存器的赋值赋给该寄存器
                end
                else begin
                    count2 = cnt21;     //将定时时候对减1寄存器的赋值赋给该寄存器
                end
            end
        end
    end
endmodule
