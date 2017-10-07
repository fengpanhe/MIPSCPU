`timescale 1ns / 1ps 
////////////////////////////////////////////////////////////////////////////////// 
// Company:  
// Engineer:  
//  
// Create Date: 10/06/2017 10:39:26 AM 
// Design Name:  
// Module Name: key_test 
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
 
 
module key_test( 
 
    ); 
reg[3:0] col; 
    reg clk = 1; 
    reg reset; 
    always #5 clk = ~clk; 
    initial 
    begin 
    col = 4'b1111; 
    reset = 1; 
    #10 reset = 0; 
    col[0] = line[0]; 
    #30 col[0] = 1; 
    end 
 
 
    wire cs = 1; 
    wire iow = 1; 
    wire[2:0] address = 2'b10; 
     
    wire[3:0] line; 
    wire[15:0] ioread_data; 
    key16 key( 
        .clk(clk), 
        .reset(reset), 
        .address(address), 
        .cs(cs), 
        .ior(1), 
        .col(col), 
        .line(line), 
        .ioread_data(ioread_data) 
    ); 
 
endmodule
