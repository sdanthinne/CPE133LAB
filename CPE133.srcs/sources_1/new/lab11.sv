`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2019 10:31:20 PM
// Design Name: 
// Module Name: lab11
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


module cntr_new(clk,cnt);
    input clk;
    output cnt;
    reg cnt;
    parameter N=24;//factor which slows down the clock so 1/2^N
    logic [N:0] s;
    initial begin s=0;end
    always_ff @ (posedge clk)
    begin
        ++s;
        $display("the value of s is %b",s);// string format %b formats to binary
        cnt <= s[N];// this statement is non blocking(used for sequential)
    end
endmodule
