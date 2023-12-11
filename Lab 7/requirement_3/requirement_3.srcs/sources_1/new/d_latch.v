`timescale 1ns / 1ps

module d_latch(

    input G, D,
    output Q1out, Q2out

    );
    
    wire Q1, Q2;
    
    assign #1 Q1 = ~(~(D & G) & Q2);
    assign #1 Q2 = ~(~(~D & G) & Q1);
    assign Q2out = Q2;
    assign Q1out = Q1;
    
endmodule
