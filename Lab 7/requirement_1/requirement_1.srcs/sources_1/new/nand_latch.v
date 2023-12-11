`timescale 1ns / 1ps

module nand_latch(

    input S, R,
    output Q1out, Q2out

    );
    
    wire Q1, Q2;
    
    assign #1 Q1 = ~(S & Q2);
    assign #1 Q2 = ~(R & Q1);
    assign Q2out = Q2;
    assign Q1out = Q1;
    
endmodule
