`timescale 1ns / 1ps

module nand_latch_tb;

    reg S, R;
    wire Q1out, Q2out;
    
    nand_latch cut (.S(S), .R(R), .Q1out(Q1), .Q2out(Q2));
    
    initial begin
    
        S = 1;
        R = 1;
        
        #100 S = 0;
        #100 S = 1;
        #100 R = 0;
        #100 R = 1;
        #100 R = 0;
             S = 0;
        #100 R = 1;
             S = 1;
        #100 R = 0;
             S = 0;
        #100; 
        
    end

endmodule
