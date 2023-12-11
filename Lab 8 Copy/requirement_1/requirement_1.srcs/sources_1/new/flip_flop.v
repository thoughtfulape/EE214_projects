`timescale 1ns / 1ps

module flip_flop(

    input clk, D, rst,
    output reg Q

    );
    
    wire Q1, Qn;
    
    assign #1 Q1 = ~(D & Qn);
    assign #1 Qn = ~(clk & Q1);
    //assign Q2out = Q2;
    
    always @(clk) begin
        if (rst) Q = 0;
        else     Q = Q1;
    end
     
endmodule
