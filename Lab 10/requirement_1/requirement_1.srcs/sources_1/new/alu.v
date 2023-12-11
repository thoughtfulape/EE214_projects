`timescale 1ns / 1ps

module alu(

    input [7:0]sw,
    input [2:0]ctrl,
    input [2:0]btn,
    input clk,
    output [7:0]seg,
    output [3:0]an,
    output reg [3:0]led

    );
    
    //registers
    reg [7:0]A, B;
    
    always @(posedge(clk)) begin
        if(btn[0])
            A <= sw;
        if(btn[1])
            B <= sw;
    end
    
    reg [7:0]F;
    //ALU implemented with a mux 
    always @(A, B, ctrl) begin
        if(ctrl == 3'b000)  F <= A + B;
        else if(ctrl == 3'b001)  F <= A + 1;
        else if(ctrl == 3'b010)  F <= A - B;
        else if(ctrl == 3'b011)  F <= A ^ B;
        else if(ctrl == 3'b100)  F <= A | B;
        else if(ctrl == 3'b101)  F <= A & B;
        else                     F <= 8'd0;
    end
    
    //status indicators 
    always @(F) begin
        led <= 3'b0000;
        if(F == 8'd0)
            led[0] <= 1;
        if((B > A) && ctrl == 3'b010)
            led[1] <= 1;
        if((A > 255) || (B > 255))
            led[4] <= 1;
    end
    
    //bin2bcd converter
    wire [11:0]data;
    bin2bcd bin2bcd(
        .bin(F),
        .bcd(data)
    );
    
    seg_wrapper display(
        .N(data),
        .clk(clk),
        .seg(seg),
        .an(an)
    );
    
endmodule
