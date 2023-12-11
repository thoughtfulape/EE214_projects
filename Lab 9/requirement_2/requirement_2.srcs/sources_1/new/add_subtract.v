`timescale 1ns / 1ps

module add_subtract(

    input [7:0]sw,
    input [2:0]btn,
    input clk,
    output reg [1:0]led,
    output [11:0] bcd
    
    );
    
    //registers
    reg [7:0]op1, op2;
    always @(posedge(clk)) begin
        if(btn[0]) op1 <= sw;
        if(btn[1]) op2 <= sw;
    end
    
    //controlled inverter 
    reg [7:0]temp;
    always @(btn[2]) begin
        if(btn[2])
            temp <= ~op2;
        else
            temp <= op2;
    end  
    
    //adder / subtractor
    reg [7:0]Y;
    always @(op1, op2) begin
        led[1] = 0;
        if(btn[2])
            Y <= op1 + (temp + 1);
        else if((op1 + op2) <= 255)
            Y <= op1 + op2;
        else begin
            Y <= 8'd255;
            led[1] = 1;
        end
    end
    
    
    //check if overflow or negative
    always @(Y) begin
        if(btn[2] && (op1 < temp)) begin
            led[0] = 1;
        end 
    end
    
    
    //binary to bcd converter 
    bin2bcd bin2bcd(
        .bin(Y),
        .bcd(bcd)
    );
endmodule
