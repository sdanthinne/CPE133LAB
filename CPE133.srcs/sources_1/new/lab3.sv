`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2019 03:57:16 PM
// Design Name: 
// Module Name: lab3
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


module lab3(
    input A,
    input B,
    input C,
    output LED
    );
    assign LED = C&(A|B);//A&C | A&B;
endmodule

module lab3_structural(input A,B,C,output LED,wire m);
    or A1(m,A,B);
    and A2(LED,m,C);
endmodule
