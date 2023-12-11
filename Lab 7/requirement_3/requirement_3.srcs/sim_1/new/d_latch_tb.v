`timescale 1ns / 1ps

module d_latch_tb;

    reg D, G;
    wire Q1o, Q2o;
    
    d_latch cut(.D(D), .G(G), .Q1o(Q1), .Q2o(Q2));
    
    initial begin 
        
        D = 0;
        G = 0;
        
        #100 G = 1;
        #100 G = 0;
        #100 D = 1;
        #100 D = 1;
        #50  G = 1;
        #50  G = 0;
        #50  D = 0;
        #50  G = 1;
        #50  D = 1;
        #50  D = 0;
        
    end
    
endmodule
