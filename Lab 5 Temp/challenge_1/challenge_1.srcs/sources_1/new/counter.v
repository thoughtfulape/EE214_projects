module counter (
	input clk,
	output Y
);

reg [27:0] counter;

always @ (posedge clk)
begin
	counter <= counter + 1;
end

assign Y = counter[15];

endmodule