`timescale 1ns / 1ps

module multiplier(

    input [7:0]sw,
    input [1:0]btn,
    input clk,
    output [15:0] bcd
    
    );
    
    //registers
    reg [7:0]op1, op2;
    always @(posedge(clk)) begin
        if(btn[0]) op1 <= sw;
        if(btn[1]) op2 <= sw;
    end
    
    reg [16:0]Y;
    always @(op1, op2) begin
        if((op1 * op2) > 9999)
            Y <= 16'd9999;
        else
            Y <= op1 * op2;
    end
    
    //binary to bcd converter 
    bin2bcd bin2bcd(
        .bin(Y),
        .bcd(bcd)
    );

endmodule
