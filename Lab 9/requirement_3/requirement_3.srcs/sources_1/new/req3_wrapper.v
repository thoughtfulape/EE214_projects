`timescale 1ns / 1ps

module req3_wrapper(
    
    input [7:0]sw,
    input [1:0]btn,
    input clk,
    output [3:0]an,
    output [7:0]seg
    
    );
    
    wire [15:0]data;
    
    multiplier mult(
        .sw(sw),
        .btn(btn),
        .clk(clk),
        .bcd(data)
    );
    
    seg_wrapper controller(
        .N(data),
        .clk(clk),
        .an(an),
        .seg(seg)
    );
    
endmodule
