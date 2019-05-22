`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2019 03:29:54 PM
// Design Name: 
// Module Name: midterm_proj
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


module ALU(SEL,A,B,F

    );
    //9-bit ALU
    output logic [8:0]F;
    input [1:0] SEL;
    input [8:0] A, B;
    
    //typedef enum logic [1:0] {ADD = 2'b00, SUB = 2'b01, MULT = 2'b10, DIV = 2'b11} OP;
    //OP operation = OP'(SEL);
    logic trans;
    bit_8_RCA RCA1(A,B,trans);
    
    always_comb
    begin
        //basically a mux
        case(SEL)
        
        //ADD:
        2'b00:
        begin
            //F = A + B;
            F= trans;
                        //implement with RCA
        end
        
//        SUB:
        2'b01:
        begin
            F = A - B;
            
        end
        
        //MULT:
        2'b10:
        begin
            F = A * B;
            //multiplier? already implemented automatically by vivado/systemverilog
        end
        
        //DIV:
        2'b11:
        begin
            F = A / B;
        end
        default: F = A + B;
        
        endcase
    end
endmodule


module bit_8_RCA(A,B,F);
//tested, working
input [8:0] A,B;
output [8:0] F;
logic w1,w2,w3,w4,w5,w6,w7,w8;
 full_add A0(.IN1(A[0]),.IN2(B[0]),.CIN(1'b0),.F(F[0]),.C(w1));
 full_add A1(.IN1(A[1]),.IN2(B[1]),.CIN(w1),.F(F[1]),.C(w2));
 full_add A2(.IN1(A[2]),.IN2(B[2]),.CIN(w2),.F(F[2]),.C(w3));
 full_add A3(.IN1(A[3]),.IN2(B[3]),.CIN(w3),.F(F[3]),.C(w4));
 full_add A4(.IN1(A[4]),.IN2(B[4]),.CIN(w4),.F(F[4]),.C(w5));
 full_add A5(.IN1(A[5]),.IN2(B[5]),.CIN(w5),.F(F[5]),.C(w6));
 full_add A6(.IN1(A[6]),.IN2(B[6]),.CIN(w6),.F(F[6]),.C(w7));
 full_add A7(.IN1(A[7]),.IN2(B[7]),.CIN(w7),.F(F[7]),.C(w8));
 full_add A8(.IN1(A[8]),.IN2(B[8]),.CIN(w8),.F(F[8]));
endmodule


module full_add(
    output F,C, //output 0 is sum, 1 is carry.
    
    input IN1, IN2,CIN
    );
    //tested, working
    wire a,b1,b2,b3,b4;
    //Full Adder
    //assign LED[0] = ~IN[0]&~IN[1]&IN[2] | ~IN[0]&IN[1]&~IN[2] | IN[0]&~IN[1]&~IN[2] | IN[0]&IN[1]&IN[2];
    xor S1 (a,IN1,IN2);
    xor S2 (F,a,CIN);
    
    and C1 (b1, IN1, IN2);
    and C2 (b2, IN2, CIN);
    and C3 (b3, IN1, CIN);
    or CT (b4, b1,b2);
    or (C, b4, b3);
    //assign SUM = OUT[0];
    //assign CARRY = OUT[1];
    //F = IN1 xor IN2 xor CIN;
     
endmodule




module DFF(
    D,CLR,SET,LOAD,CLK100MHZ,Q,QBAR

    );
    input D,CLR,SET,LOAD, CLK100MHZ;
    //tested, working
    
    output logic Q, QBAR;
    
    
    always_ff @ (posedge CLK100MHZ)
    begin
    if((CLR == 1'b1 && SET == 1'b0) || (SET == 1'b1 && CLR == 1'b1))
    begin
        Q=1'b0;
        QBAR = 1'b1;
    end
    else
    if(SET == 1'b1 && CLR == 1'b0)
    begin
        Q=1'b1;
        QBAR=1'b0;
    end
    else
    
    if(LOAD == 1'b0)
    begin
        Q=Q;
        QBAR=~Q;
    end
    else
    if(LOAD == 1'b1 && CLR == 1'b0 && SET==1'b0)
    begin
        Q=D;
        QBAR=~D;
    end
    end
endmodule

module io(D,ld,st,clr,CLK100MHZ,Q,Qbar);
input [8:0] D;
input ld,st,clr,CLK100MHZ;
output [8:0] Q,Qbar;
//D is from switches
//stored on ld(LOAD)
//D,CLR,SET,LOAD,CLK100MHZ,Q,QBAR
DFF b0 (D[0],clr,st,ld,CLK100MHZ,Q,Qbar);
DFF b1 (D[1],clr,st,ld,CLK100MHZ,Q,Qbar);
DFF b2 (D[2],clr,st,ld,CLK100MHZ,Q,Qbar);
DFF b3 (D[3],clr,st,ld,CLK100MHZ,Q,Qbar);
DFF b4 (D[4],clr,st,ld,CLK100MHZ,Q,Qbar);
DFF b5 (D[5],clr,st,ld,CLK100MHZ,Q,Qbar);
DFF b6 (D[6],clr,st,ld,CLK100MHZ,Q,Qbar);
DFF b7 (D[7],clr,st,ld,CLK100MHZ,Q,Qbar);
DFF b8 (D[8],clr,st,ld,CLK100MHZ,Q,Qbar);
endmodule
