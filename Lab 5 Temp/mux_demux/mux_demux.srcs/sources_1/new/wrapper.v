`timescale 1ns / 1ps

module wrapper(

    input [7:0]sw,
    input clk,
    output [7:0]led,
    output red

    );
    
    wire sdata;
    wire [2:0]sel;
    
    mux input_mux(
        .I(sw),
        .sel(sel),
        .Y(sdata)
    );
    
    demux output_demux(
        .EN(sdata),
        .sel(sel),
        .Y(led)
    );
    
    
    counter output_counter(
        .clk(clk),
        .B(sel)
    );
    
    assign red = sdata;
    
endmodule
