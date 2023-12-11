`timescale 1ns / 1ps

module encoder_tb();

    reg [3:0]IT;
    reg EinT;
    wire EoutT;
    wire [1:0]YT;
    
    encoder cut (.I(IT), .Ein(EinT), .Eout(EoutT), .Y(YT));
    
    integer k;
    
    initial begin
        IT = 0;
        EinT = 1'b0;
        for(k = 0; k < 16; k = k + 1)
        begin
            IT = k;
            #10; 
        end
        EinT = 1'b1;
        for(k = 0; k < 16; k = k + 1)
        begin
            IT = k;
            #10; 
        end
        $finish;
    end
endmodule
