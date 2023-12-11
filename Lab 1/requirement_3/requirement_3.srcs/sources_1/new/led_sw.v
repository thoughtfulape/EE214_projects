`timescale 1ns/1ps
module led_sw(
    output [11:0]led,
    input [11:0]sw
);

//input [9:0] sw;
//output [9:0] led;

assign led = sw;

endmodule