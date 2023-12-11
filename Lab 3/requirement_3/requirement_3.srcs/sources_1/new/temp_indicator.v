`timescale 1ns / 1ps

module temp_indicator(

    input [6:0]sw,
    output led
    
    );
    
    assign led = (~sw[6] & sw[5] & sw[4] & sw[3] & sw[2] & sw[1]) |
                 (sw[6] & ~sw[5] & ~sw[4] & sw[3] & ~sw[2] & ~sw[1] & ~sw[0]) | 
                 (sw[6] & ~sw[5] & ~sw[4] & ~sw[3]);
    
endmodule
