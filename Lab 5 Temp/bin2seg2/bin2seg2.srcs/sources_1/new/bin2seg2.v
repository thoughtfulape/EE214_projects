`timescale 1ns / 1ps

module bin2seg2(

    input [7:0]sw,
    input pb,
    output [3:2]an,
    output an0, an1,
    output [7:0]seg
    //output led

    );
    
    wire [3:0]data;
    //wire button;
    
    mux_2_1 input_mux_2_1(
        .sw(sw),
        .Y(data),
        .sel(pb)
    );
    
    seg_output output_seg_output(
        .I(data),      
        .seg(seg)
    );
    
    assign an0 = pb;
    assign an1 = ~pb;
    assign an[3] = 1;
    assign an[2] = 1;
    //assign led = pb;
    
endmodule
