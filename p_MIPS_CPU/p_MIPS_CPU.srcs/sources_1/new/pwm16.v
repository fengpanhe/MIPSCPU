`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2017 10:20:14 PM
// Design Name: 
// Module Name: pwm16
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


module pwm16(
    input reset,                    //ϵͳ��λ
    input[2:0] address,             //�˿ں�
    input[15:0] data,               //cpuд��pwm������������
    input cs,                       //Ƭѡ����PWMCtrl
    input clk,                      //ϵͳʱ��
    input iow,                      //д�ź�
    output reg pwm                 //��������ź�
    );

    reg[15:0] maxcount;             //���ֵ�Ĵ���
    reg[15:0] midcount;             //�ԱȼĴ���
    reg[15:0] flag;                 //ʹ�ܼĴ���
    reg[15:0] rubbish;              //����˿ںŵ�data����
    reg[15:0] counter;              //������


    always @(negedge clk) begin
        if (reset == 1) begin
            // reset
            maxcount = 16'hffff;
            midcount = 16'h0000;
            flag = 16'h0000;
            pwm = 1;
            counter = 16'h0001;
        end
        else if (cs == 1 && iow == 1) begin      //cpuдpwm�Ĵ���
            case (address[2:0])
                3'b000: maxcount = data;
                3'b010: midcount = data;
                3'b100: flag[0] = data[0];      //дʹ�ܼĴ���
                default: rubbish = data;
            endcase
        end
        else if (flag[0]) begin
            if (counter == maxcount) begin      //���������ֵ
                counter = 16'b0001;
                pwm = 1;
            end
            else begin
                counter = counter + 1'b1;
                if (counter > midcount) begin       //����ֵ���ڶԱ�ֵ
                    pwm = 0;
                end
                else begin                          //����ֵС�ڶԱ�ֵ
                    pwm = 1;
                end
            end
        end
        else begin
             pwm = 1;
        end 
    end
endmodule
