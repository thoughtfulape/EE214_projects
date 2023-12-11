`timescale 1ns / 1ps

module CLA_4_bit(

    input [7:0]sw,
    input clk,
    output [7:0]seg,
    output [3:0]an

    );
    
    //CPG Unit
    wire [3:0]sum;
    wire [3:0]carry, G, P;
    assign carry[0] = 0;
    assign carry[1] = G[0];
    assign carry[2] = G[1] | (P[1] & G[0]);
    assign carry[3] = G[2] | (P[2] & P[1] & G[0]) | (P[2] & G[1]);
    
    bit_slice B0(
        .A(sw[0]),
        .B(sw[4]),
        .Cin(0),
        .P(P[0]),
        .G(G[0]),
        .S(sum[0])
    );
    
    bit_slice B1(
        .A(sw[1]),
        .B(sw[5]),
        .Cin(carry[1]),
        .P(P[1]),
        .G(G[1]),
        .S(sum[1])
    );
    
    bit_slice B2(
        .A(sw[2]),
        .B(sw[6]),
        .Cin(carry[2]),
        .P(P[2]),
        .G(G[2]),
        .S(sum[2])
    );
    
    bit_slice B3(
        .A(sw[3]),
        .B(sw[7]),
        .Cin(carry[3]),
        .P(P[3]),
        .G(G[3]),
        .S(sum[3])
    );
    
    
    wire [7:0]data;
    bin2bcd bin2bcd(
        .bin(sum),
        .bcd(data)
    );
    
    seg_wrapper controller (
        .N(data),
        .clk(clk),
        .an(an),
        .seg(seg)
    );
    
endmodule
