`timescale 1ns / 1ps

module challenge_1_wrapper(

    input [7:0]sw,
    //input pb,
    output [3:2]an,
    output an0, an1,
    output [7:0]seg,
    input clk
    //output led

    );
    
    wire [3:0]data;
    wire select;
    //wire button;
    
    mux_2_1 input_mux_2_1(
        .sw(sw),
        .Y(data),
        .sel(select)
    );
    
    seg_output output_seg_output(
        .I(data),      
        .seg(seg)
    );
    
    counter output_counter(
        .clk(clk),
        .Y(select)
    );
    
    assign an0 = select;
    assign an1 = ~select;
    assign an[3] = 1;
    assign an[2] = 1;
    
endmodule
