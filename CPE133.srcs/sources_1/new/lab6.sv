`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2019 02:15:12 PM
// Design Name: 
// Module Name: tri_state_decoder
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


module tri_state_decoder(A, B,CTRL,
     LED
    );//CTRL synonymous with enable
    input A,B,CTRL;
    output LED [3:0];
    logic A1,A2,A3,A4, NA,NB;
    
    not (NA,A);
    not (NB,B);
    
    and (A1, NA,NB);
    bufif1(LED[0],A1,CTRL);
    
    and (A3, NA,B);
    bufif1(LED[2],A3,CTRL);
    
    and (A2, A,NB);
    bufif1(LED[1],A2,CTRL);
    
    and (A4, A,B);
    bufif1(LED[3],A4,CTRL);
    
endmodule


