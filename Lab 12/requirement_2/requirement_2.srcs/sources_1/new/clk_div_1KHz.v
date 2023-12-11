`timescale 1ns / 1ps
module clock_divider_1KHz(
    input clk,
    output reg out, clk_div  
    );
	
localparam terminalcount1 = (50000 - 1);
reg [16:0] count1, count2;
wire tc1, tc2;

assign tc1 = (count1 == terminalcount1);	// Place a comparator on the counter output

always @ (posedge(clk))
begin
    if (tc1) count1 <= 0;		// Reset counter when terminal count reached
    else count1 <= count1 + 1;
end

always @ (posedge(clk))
begin
    if (tc1) clk_div = !clk_div;	// T-FF with tc as input signal
end

localparam terminalcount2 = (50 - 1);

assign tc2 = (count2 == terminalcount2);

always @(posedge(clk_div)) begin
    if (tc2) count2 <= 0;
    else count2 <= count2 + 1;
end

always @(posedge(clk_div)) begin
    if (tc2) out = !out;
end

endmodule