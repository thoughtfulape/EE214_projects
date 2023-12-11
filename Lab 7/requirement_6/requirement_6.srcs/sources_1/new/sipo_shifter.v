`timescale 1ns / 1ps

module sipo_shifter(

    input sw,
    input btn,
    input clk,
    output [7:0]led

    );
    
    //register 
    reg [7:0]Q;
    
    always @(posedge(btn)) begin
       if(btn) Q <= {Q[6:0], sw};
       else Q <= Q;
    end
    
    assign led = Q;
    
endmodule
