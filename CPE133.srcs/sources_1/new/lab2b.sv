`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2019 03:09:24 PM
// Design Name: 
// Module Name: lab2b
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


module AND(
    input a1, a2,
    output o
    );
    assign o = a1 & a2;
endmodule

module OR(
    input a1, a2,
    output o
    );
    assign o = a1 | a2;
endmodule
