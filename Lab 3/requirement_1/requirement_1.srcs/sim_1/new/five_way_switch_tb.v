`timescale 1ns / 1ps

module five_way_switch_tb;

    reg [4:0] sw;
    wire led;
    
    five_way_switch cut (.sw(sw), .led(led));
    
    integer k;
    
    initial begin
    sw = 0;
    for (k = 0; k < 32; k=k+1)
        #20 sw = k;
        
    #20 $finish;
    end
    
endmodule
