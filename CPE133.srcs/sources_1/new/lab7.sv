`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2019 09:55:14 PM
// Design Name: 
// Module Name: lab7
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


module mux2x1(
    F,A,B,SEL
    );
////clock with 2ns period 
//    reg clk;
//    parameter cycle =1;
//    always begin
//        #cycle
//        clk = 1;
//        #cycle
//        clk=0;
//    end

    input A,B,SEL;
    output F;
    logic W1,NSEL,W2;
    //use # for prop. delay
    not #15 (NSEL,SEL);
    and #18 (W1,A,SEL);
    and #18 (W2,B,NSEL);
    or #15 (F,W1,W2);
    
endmodule

module mux4x1(
    A,B,C,D,SEL1,SEL2,F
    );
    input A,B,C,D,SEL1,SEL2;
    output F;
    logic W1,W2,NSEL1,NSEL2;
    
    mux2x1 IN1(.F(W1),.A(A),.B(B),.SEL(SEL2));
    mux2x1 IN2(.F(W2),.A(C),.B(D),.SEL(SEL2));
    mux2x1 OUT1(.F(F),.A(W1),.B(W2),.SEL(SEL1));

    

endmodule
