`timescale 1ns / 1ps

module comparator(

    input [7:0]sw,
    input [2:0]btn,
    input clk,
    output [3:0]an,
    output [7:0]seg,
    output [2:0]led

    );
    
    wire [16:0]data;
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
    
    //register 
    reg [16:0]temp;
    always @(posedge(clk)) begin
        if(btn[2])
            temp <= data;
        else
            temp <= temp;
    end
    
    //comparator
    wire LT_O, EQ_O, GT_O;
    assign LT_O = (data < temp) ? 1'b1 : 1'b0;
    assign EQ_O = (data == temp) ? 1'b1 : 1'b0;
    assign GT_O = (data > temp) ? 1'b1 : 1'b0;
    
    assign led[0] = LT_O;
    assign led[1] = EQ_O;
    assign led[2] = GT_O;
    
endmodule
