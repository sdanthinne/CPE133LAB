`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2019 10:28:12 PM
// Design Name: 
// Module Name: lab13
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


module FSMn1(clk,reset,x,Z1,Z2);
    input logic clk,reset,x;
    output logic Z1,Z2;
    typedef enum logic[1:0] {A,B,C,D} state;
    state currentstate, nextstate;
    
    always_ff @ (posedge clk)
    begin
    if (reset) currentstate<=A;
    else currentstate<=nextstate;
    
    end
    
    always_comb
    begin
    case(currentstate)
    
        A: if(x)
        begin nextstate = A; Z1= 1'b1; Z2 = 1'b0;
        $display("current state is A, in 1");
        end
        else
        begin nextstate = C; Z1 = 1'b1; Z2 = 1'b0;
        $display("current state is A, in 0");

        end
        B: if(x)
            begin
            nextstate = B; Z1= 1'b0; Z2 = 1'b0;
            $display("current state is B, in 1");

            end
            else
            begin
            nextstate = D; Z1 = 1'b0; Z2 = 1'b0;
            $display("current state is B, in 0");

            end
       C:if(x)
           begin
           nextstate = A; Z1=1'b1;Z2=1'b0;
           $display("current state is C, in 1");

            
           end
           else
           begin
            nextstate = B; Z1 = 1'b1; Z2 = 1'b0;
            $display("current state is C, in 0");
           end
       D:if(x)
           begin
            nextstate = B; Z1=1'b0;Z2=1'b0;
            $display("current state is D, in 1");
            
           end
           else
           begin
            nextstate = A; Z1 = 1'b0; Z2 = 1'b1;
            $display("current state is D, in 0");
           end
           
       default: nextstate = A;   
    endcase
    end
endmodule

module stateSlow(clk,reset,x,Q,Qb,Z1,Z2);
input clk,reset,x;
output logic Z1,Z2;
logic slo;
output logic [1:0] Q,Qb;
cntr_new SL0 (clk,slo);
//jkFSM fsm (clk,reset,x,Z1,Z2,Q,Qb);
statemachine1_strct(slo, reset,x,Q,Qb, Z1,Z2);

endmodule

module statemachine1_strct(clk, reset,x,Q,Qb, Z1,Z2);
        input logic clk;
        input logic reset;
        input logic x;
        output logic Z1,Z2;
        output logic  [1:0]Q,Qb;
       wire j0,k0,k1, j1;
        
        assign  j0 = ~x  &  Q[1];
        assign  k0 = ~x  &  Q[1];
        assign j1 = ~ x;
        assign k1 = 1'b1;
        
  
        
       JKFF JKF0 (.clk(clk), .JK({j0,k0}),.clr(reset), .Q (Q[0]),
        .Qbar(Qb[0]));
       
       JKFF JKF1 (.clk(clk), .JK({j1,k1}),.clr(reset), .Q (Q[1]),
                .Qbar(Qb[1])); 
    //{j0,k0} is  a vector of two elements j0 and k0;the {  } is the concatenation 
    //    operator            
                
                assign Z2= (~x & Q[0] & Q[1]);
                        assign Z1 = Qb[0];  
endmodule
module JKFF(
    input clr,
    input clk,
    input [1:0] JK,
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
        begin
            case(JK)
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
            default:;
            endcase
        end
    end
endmodule

// module jkFSM(clk,clr,Z1,Z2,x,Q,Qb);
// input clk,clr,x;
// output logic Z1,Z2;
// output logic [1:0] Q,Qb;
// logic j0,k0,j1,k1;

// assign j0 = ~x&Q[1];
// assign j1 = ~x;
// assign k0 = ~x&Q[1];
// assign k1 = 1'b1;
// assign Z2 = ~x&Q[1]&Q[0];
// assign Z1 = ~Q[0];

// JKFF jf1 (clr,clk,{j0,k0},Q[0],Qb[0]);
// JKFF jf2 (clr,clk,{j1,k1},Q[1],Qb[1]);

// endmodule
