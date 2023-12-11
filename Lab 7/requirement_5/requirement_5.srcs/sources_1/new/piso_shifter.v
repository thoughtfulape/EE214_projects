`timescale 1ns / 1ps

module piso_shifter(

    input [7:0]sw,
    input [3:0]sw2,
    input [1:0]btn,
    input clk,
    output [7:0]led,
    output [7:0]led2

    );
    
    //counter
    
    reg [25:0] cntr;

    always @ (posedge(clk)) begin
        cntr <= cntr + 1;
    end
    
    //register 
    
    reg [7:0]Q1;
    reg [7:0]Q2;
    
    always @(posedge(cntr[25])) begin
        if (btn[0]) Q1 <= sw;
        else        Q1 <= {Q1[6:0], Q2[7]};
    end
    
    always @(posedge(cntr[25])) begin
        if (btn[1])      Q2 <= sw2;
        else if(~btn[0]) Q2 <= {Q2[6:0], Q1[7]};
    end
    
    assign led = Q1;
    assign led2 = Q2;
    
endmodule
