`timescale 1ns / 1ps

module d_latch_tb;

    reg D, G;
    wire Q1, Q2, A, B;
    
    d_latch cut(.D(D), .G(G), .A(A), .B(B), .Q1o(Q1), .Q2o(Q2));
    
    initial begin 
        
        D = 0;
        G = 0;
        
        #100 D = 1;
             G = 0;
        #50  D = 0;
             G = 1;
        #1   D = 1;
             G = 0;
        
        #100 G = 1;
        #100 G = 0;
        #100 D = 1;
        #50 G = 1;
        //#100 D = 1;
        #50   D = 0; 
/*       #50  G = 1;
        #50  G = 0;
        #50  D = 0;
        #50  G = 1;
        #50  D = 1;
        #50  D = 0; */
        #100;
        
    end
    
endmodule
