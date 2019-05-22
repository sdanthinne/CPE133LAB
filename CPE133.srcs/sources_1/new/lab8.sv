`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2019 02:37:12 PM
// Design Name: 
// Module Name: lab8
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
//module clk(output out);
//    always
//    begin
//        #5 out = 1;
//        #5 out = 0;
//    end
//endmodule

module basicflipflop(CLK100MHZ,D,Q,QBAR);
input D, CLK100MHZ;
output Q,QBAR;
reg Q, QBAR;

always @ (posedge CLK100MHZ)
begin
    Q=D;
    QBAR=~D;
end

endmodule


module DFlipFlop(
    D,CLR,SET,LOAD,CLK100MHZ,Q,QBAR

    );
    input D,CLR,SET,LOAD, CLK100MHZ;
    
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

module ltch(E,D,QBAR,Q);
input E,D;
output Q, QBAR;

reg Q,QBAR;

always @ (E,D)
    begin
    if(E==1'b1)
    begin
        Q=D;
        QBAR=~D;
    end
    else
    begin 
        Q=Q;
    end


end

endmodule

