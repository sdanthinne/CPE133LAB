`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2019 03:15:30 PM
// Design Name: 
// Module Name: midtermPractical
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


module midtermPractical(
    input [2:0] X,
    output F
    );
    //equivalency X[2] = x3
    //Logic synthesizes to wire
    logic w1,w2,w3,x2not,x1not,x0not, or1;
    
    not n1 (x2not,X[2]);
    not n2 (x1not,X[1]);
    not n3 (x0not,X[0]);
    and a1 (w1,x2not,X[0]);
    and a2 (w2,x1not,X[2]);
    and a3 (w3,x0not,X[1]);
    or o1 (or1,w1,w2);
    or o2 (F,or1,w3);
    
    
    
    
endmodule
