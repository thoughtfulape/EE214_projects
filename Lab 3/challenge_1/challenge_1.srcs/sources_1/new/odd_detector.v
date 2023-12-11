`timescale 1ns / 1ps

module odd_detector(

    input [11:0] sw,
    output led

    );
    
    assign led = sw[0] ^ sw[1] ^ sw[2] ^ sw[3] ^ sw[4] ^ sw[5] ^ 
                 sw[6] ^ sw[7] ^ sw[8] ^ sw[9] ^ sw[10] ^ sw[11];
    
endmodule
