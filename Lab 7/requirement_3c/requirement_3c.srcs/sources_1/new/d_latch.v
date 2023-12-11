`timescale 1ns / 1ps

module d_latch(

    input G, D,
    output Q1o, Q2o, A, B

    );
    
    wire Q1, Q2;
    
    assign #1 A = ~(D & G);
    assign #1 B = ~(~D & G);
    assign #1 Q1 = ~(A & Q2);
    assign #1 Q2 = ~(B & Q1);
    assign Q2o = Q2;
    assign Q1o = Q1;
    
endmodule
