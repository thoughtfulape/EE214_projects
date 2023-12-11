`timescale 1ns / 1ps

module nor_latch(

    input S, R,
    output Q1o, Q2o

    );
    
    wire Q1, Q2;
    
    assign Q1 = ~(S | Q2);
    assign Q2 = ~(R | Q1);
    assign Q1o = Q1;
    assign Q2o = Q2;
    
endmodule
