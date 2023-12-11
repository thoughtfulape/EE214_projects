`timescale 1ns / 1ps

module pipo_shifter(

    input [7:0]sw,
    input [1:0]btn,
    input clk,
    output reg [7:0]led

    );
    
    reg [7:0]Q;
    
    //reg 
    always @(posedge(clk)) begin
        if(btn[0])  Q <= sw;
        else        Q <= Q;
    end
    
    //mux
    always @(btn[1]) begin
        if(btn[1])  led <= Q;
        else        led <= sw;
    end
    
endmodule
