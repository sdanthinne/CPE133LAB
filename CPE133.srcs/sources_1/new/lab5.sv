`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2019 04:55:41 PM
// Design Name: 
// Module Name: lab5
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


module RCA_4_bit(
     IN1,
     IN2,
     OUT
    );
    //combinational
    parameter bits = 4;
    input [bits-1:0] IN1;
    input [bits-1:0] IN2;
    output [bits-1:0] OUT;
    logic [bits-1:0] c;
    logic a=0;
    
//    logic clk;
//    always_ff @(posedge clk) begin
//        logic [31:0] ram [255:0];
//    end
    
    full_add FA0 (.IN1(IN1[0]), .IN2(IN2[0]), .CIN(a), .SUM(OUT[0]), .COUT(c[0]));
    full_add FA1 (.IN1(IN1[1]), .IN2(IN2[1]), .CIN(c[0]), .SUM(OUT[1]), .COUT(c[1]));
    full_add FA2 (.IN1(IN1[2]), .IN2(IN2[2]), .CIN(c[1]), .SUM(OUT[2]), .COUT(c[2]));
    full_add FA3 (.IN1(IN1[3]), .IN2(IN2[3]), .CIN(c[2]), .SUM(OUT[3]), .COUT(c[3]));

endmodule

module full_add(
     
    input  IN1, IN2,CIN,//input 0 is bit 1, 1 is bit 2, 2 is carry in
    output SUM, COUT //output 0 is sum, 1 is carry out
    );
    //assign LED[0] = ~IN[0]&~IN[1]&IN[2] | ~IN[0]&IN[1]&~IN[2] | IN[0]&~IN[1]&~IN[2] | IN[0]&IN[1]&IN[2];
    assign SUM = IN1 ^ IN2 ^ CIN;
    assign COUT = IN2&CIN | IN1&CIN | IN1&IN2;
    //assign SUM = OUT[0];
    //assign CARRY = OUT[1];
     
endmodule
