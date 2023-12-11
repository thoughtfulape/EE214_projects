`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module mux_4_1 (
    input [7:0] data,
    input [2:0] sel,
    output Y
);

// we can only assign values to registers 
// inside an always block
reg tmp;

always @(data, sel) begin
    case (sel)
    3'b0000:   tmp <= data[0];
    3'b0001:   tmp <= data[1];
    3'b0010:   tmp <= data[2];
    3'b0011:   tmp <= data[3];
    3'b0100:   tmp <= data[4];
    3'b0101:   tmp <= data[5];
    3'b0110:   tmp <= data[6];
    3'b0111:   tmp <= data[7];
    default: tmp <= 1'b0;
    endcase
end
assign Y = tmp;
endmodule
