`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2019 04:01:29 PM
// Design Name: 
// Module Name: lab10
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
module cntrMod(RST, clk,LD, UP, DIN,count);
    parameter N=26;
    input RST,LD,UP,clk;
    input [N-1:0] DIN;
    output logic [N-1:0] count;
    logic nclk;
    cntr_new c1(clk,nclk);
    
    always_ff @ (posedge nclk)
    begin
        if(RST == 1'b1)
        begin
            count = 0;
        end
        else if(LD == 1'b1)
        begin
            count = DIN;
        end
        else
        begin
            if(UP == 1'b1)
            begin
                count+=1;
            end
            else if(UP == 1'b0)
            begin
                count-=1;
            end
        end
        
    end
    
    
endmodule

module cntr(clk,CLR,Q,Qb
    );
    input clk,CLR;
    output [1:0] Q,Qb;
    logic w1;
    logic [1:0]a;
    assign a = {1'b1,1'b1};
    JKFF j1(.clr(CLR),.clk(clk),.jk(a), .Q (Q[0]),.Qbar(Qb[0]));
    JKFF j2(.clr(CLR),.clk(Qb[0]),.jk(a), .Q (Q[1]),.Qbar(Qb[1]));

module JKFF(
    input clr,
    input clk,
    input [1:0] jk,
    output logic Q,
    output logic Qbar
    );
    always_ff @ (posedge clk)
    begin
        if(clr == 1'b1)
        begin
            Q = 1'b0;
            Qbar = 1'b1;
        end
        else
        if(clr == 1'b0)
        begin
            case(jk)
            2'b00: 
            begin
            Q=Q;
            Qbar=~Q;
            end
            2'b01:
            begin
            Q=1'b0;
            Qbar = ~Q;
            end
            2'b10:
            begin
            Q=1'b1;
            Qbar = ~Q;
            end
            2'b11:
            begin
            Q=~Q;
            Qbar=~Q;
            end
            default:
            begin
            Q=Q;
            Qbar=~Q;
            end
            endcase
        end
    end
endmodule

endmodule

module dffcntr(A,clr,clk,Q,Qbar);
input [1:0] A;
input clr,clk;
output [1:0] Q,Qbar;
//D0 = Q0bar
//D1 = Q1 xor Q0

DFF b0(Qbar[0],clr,clk);
//DFF b1();


module DFF(
    D,CLR,CLK100MHZ,Q,QBAR

    );
    input D,CLR,CLK100MHZ;
    
    output logic Q, QBAR;
    
    
    always_ff @ (posedge CLK100MHZ)
    begin
    if((CLR == 1'b1))
    begin
        Q=1'b0;
        QBAR = 1'b1;
    end
    else
    if(CLR == 1'b0)
    begin
        Q=D;
        QBAR=~D;
    end
    else
    begin
    Q=Q;
    QBAR=~Q;
    end
    end
endmodule

endmodule