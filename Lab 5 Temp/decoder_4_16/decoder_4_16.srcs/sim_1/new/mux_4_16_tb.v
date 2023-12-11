`timescale 1ns / 1ps

module mux_4_16_tb;

    reg [3:0]sw;
    wire [15:0]led;
    
    decoder_4_16 cut (.sw(sw), .led(led));
    
    integer k = 0;
    
    initial begin
    
    for (k = 0; k < 16; k = k + 1) begin
        #10
        sw = k;
        end
    end
    
    
endmodule
