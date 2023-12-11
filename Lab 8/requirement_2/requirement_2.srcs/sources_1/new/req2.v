`timescale 1ns / 1ps

module req2(

    input clk,
    output reg [3:0]led

    );
    
    reg [27:0]c1;
    
    always @(posedge(clk)) begin
        c1 <= c1 + 1;
    end
    
    always @(posedge(c1[27])) begin
        led <= led + 1;
    end 
    
endmodule
