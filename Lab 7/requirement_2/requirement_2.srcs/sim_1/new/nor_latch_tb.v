`timescale 1ns / 1ps

module nor_latch_t;

    reg S,R;
    wire Q1o, Q2o;
    
    nor_latch cut(.S(S), .R(R), .Q1o(Q1), .Q2o(Q2));
    
    initial begin
    
        S = 0;
        R = 0;
        
        #100 S = 1;
        #100 S = 0;
        #100 R = 1;
        #100 R = 0;
        #100 S = 1;
             R = 1;
        #100 S = 1;
             R = 0;
        #100 S = 0;
             R = 0;
        #100 S = 1;
             R = 1;
        
    end
    
endmodule
