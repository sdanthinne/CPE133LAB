`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2019 03:13:51 PM
// Design Name: 
// Module Name: lab4
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


module lab4_datastream(
    output [1:0] LED, //output 0 is sum, 1 is carry.
    input [2:0] IN
    );
    //assign LED[0] = ~IN[0]&~IN[1]&IN[2] | ~IN[0]&IN[1]&~IN[2] | IN[0]&~IN[1]&~IN[2] | IN[0]&IN[1]&IN[2];
    assign LED[0] = IN[0] ^ IN[1] ^ IN[2];
    assign LED[1] = IN[1]&IN[2] | IN[0]&IN[2] | IN[0]&IN[1];
    //assign SUM = OUT[0];
    //assign CARRY = OUT[1];
     
endmodule

module lab4_structural(
    output [1:0] LED, //output 0 is sum, 1 is carry.
    input [2:0] IN
    );
    wire a,b1,b2,b3,b4;
    //Full Adder
    //assign LED[0] = ~IN[0]&~IN[1]&IN[2] | ~IN[0]&IN[1]&~IN[2] | IN[0]&~IN[1]&~IN[2] | IN[0]&IN[1]&IN[2];
    xor S1 (a,IN[0],IN[1]);
    xor S2 (LED[0],a,IN[2]);
    
    and C1 (b1, IN[0], IN[1]);
    and C2 (b2, IN[1], IN[2]); 
    and C3 (b3, IN[0], IN[2]);
    or CT (b4, b1,b2);
    or (LED[1], b4, b3);
    //assign SUM = OUT[0];
    //assign CARRY = OUT[1];
     
endmodule