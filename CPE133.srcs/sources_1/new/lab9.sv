`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2019 03:18:30 PM
// Design Name: 
// Module Name: lab9
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


module JKFlipFlop(
    input clr,
    input CLK100MHZ,
    input [1:0] jk,
    output logic Q,
    output logic Qbar
    );
    always_ff @ (posedge CLK100MHZ)
    begin
        if(clr == 1'b1)
        begin
            Q = 1'b0;
            Qbar = 1'b1;
        end
        else
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
            default:;
            endcase
        end
    end
endmodule
