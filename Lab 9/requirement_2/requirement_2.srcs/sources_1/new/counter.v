`timescale 1ns / 1ps

module counter (
	input clk,
	output [1:0] B
);

reg [27:0] counter;

always @ (posedge clk)
    begin
	   counter <= counter + 1;
    end

assign B = counter[16:15];

endmodule