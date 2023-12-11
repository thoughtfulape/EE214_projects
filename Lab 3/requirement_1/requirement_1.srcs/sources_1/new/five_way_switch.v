`timescale 1ns / 1ps

module five_way_switch(
    
    input [4:0]sw,
    output led
    );
    
    //assign led = sw[0] ^ sw[1] ^ sw[2] ^ sw[3] ^ sw[4];
    
    assign led = (~sw[4] & ~sw[3] & sw[2] & ~sw[1] & ~sw[0]) |
                 (~sw[4] & sw[3] & ~sw[2] & ~sw[1] & ~sw[0]) | 
                 (~sw[4] & ~sw[3] & ~sw[2] & ~sw[1] & sw[0]) | 
                 (~sw[4] & sw[3] & sw[2] & ~sw[1] & sw[0]) | 
                 (~sw[4] & ~sw[3] & sw[2] & sw[1] & sw[0]) | 
                 (~sw[4] & sw[3] & ~sw[2] & sw[1] & sw[0]) | 
                 (~sw[4] & ~sw[3] & ~sw[2] & sw[1] & ~sw[0]) | 
                 (~sw[4] & sw[3] & sw[2] & sw[1] & ~sw[0]) | 
                 (sw[4] & ~sw[3] & ~sw[2] & ~sw[1] & ~sw[0]) |
                 (sw[4] & sw[3] & sw[2] & ~sw[1] & ~sw[0]) | 
                 (sw[4] & ~sw[3] & sw[2] & ~sw[1] & sw[0]) | 
                 (sw[4] & sw[3] & ~sw[2] & ~sw[1] & sw[0]) | 
                 (sw[4] & ~sw[3] & ~sw[2] & sw[1] & sw[0]) | 
                 (sw[4] & sw[3] & sw[2] & sw[1] & sw[0]) | 
                 (sw[4] & ~sw[3] & sw[2] & sw[1] & ~sw[0]) | 
                 (sw[4] & sw[3] & ~sw[2] & sw[1] & ~sw[0]);
    
    /*      
    assign led = (sw[2]) |
                 (sw[3]) | 
                 (sw[0]) | 
                 (sw[3] & sw[2] & sw[0]) | 
                 (sw[2] & sw[1] & sw[0]) | 
                 (sw[1] & sw[0]) | 
                 (sw[1]) | 
                 (sw[3] & sw[2] & sw[1]) | 
                 (sw[4]) |
                 (sw[4] & sw[3] & sw[2]) | 
                 (sw[4] & sw[2] & sw[0]) | 
                 (sw[4] & sw[3] & sw[0]) | 
                 (sw[4] & sw[1] & sw[0]) | 
                 (sw[4] & sw[3] & sw[2] & sw[1] & sw[0]) | 
                 (sw[4] & sw[2] & sw[1]) | 
                 (sw[4] & sw[3] & sw[1] );  
    */
    
endmodule
