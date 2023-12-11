`timescale 1ns / 1ps

module mux_2_1(

    input [7:0]sw,
    input sel,
    output reg [3:0]Y

    );
    
    reg temp;
    
    always @(sel) begin
        if   (sel == 1) Y <= sw[7:4];
        else            Y <= sw[3:0];
    end    
    
endmodule
