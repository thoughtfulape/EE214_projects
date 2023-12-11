`timescale 1ns / 1ps

module counter_2_bit(

    input clk,
    output [1:0] count
    
    );
    
    reg [17:0]temp;
    
    always @(posedge(clk)) begin
        temp <= temp + 1;
    end
    
    assign count = temp[17:16];
    
endmodule
