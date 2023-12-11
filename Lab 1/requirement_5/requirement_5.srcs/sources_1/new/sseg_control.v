`timescale 1ns / 1ps

module sseg_control(

    input [7:0]sw,
    input [3:0]pb,
    output [3:0]an,
    output [7:0]seg

    );
    
assign seg[7] = !sw[0];
assign seg[6] = !sw[1];
assign seg[5] = !sw[2];
assign seg[4] = !sw[3];
assign seg[3] = !sw[4];
assign seg[2] = !sw[5];
assign seg[1] = !sw[6];
assign seg[0] = !sw[7];
assign an[0] = !pb[0];
assign an[1] = !pb[1];
assign an[2] = !pb[2];
assign an[3] = !pb[3];


endmodule

