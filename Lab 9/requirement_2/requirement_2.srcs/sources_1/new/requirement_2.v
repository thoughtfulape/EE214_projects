`timescale 1ns / 1ps

module requirement_2(
    
    input [7:0]sw,
    input [2:0]btn,
    input clk,
    output [1:0]led,
    output [3:0]an,
    output [7:0]seg
    
    );
    
    wire [11:0]data;
    
    add_subtract myadder(
        .sw(sw),
        .btn(btn),
        .led(led),
        .clk(clk),
        .bcd(data)
    );
    
    seg_wrapper controller(
        .clk(clk),
        .seg(seg),
        .an(an),
        .N(data)
    );
    
endmodule
