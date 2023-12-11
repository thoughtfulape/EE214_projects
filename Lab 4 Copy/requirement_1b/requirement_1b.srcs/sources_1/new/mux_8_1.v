`timescale 1ns / 1ps

module mux_4_1 (
    input [7:0] sw,
    input [2:0] pb,
    output Y
);

reg tmp;

always @(sw, pb) begin
    case (pb)
    3'b0000:   tmp <= sw[0];
    3'b0001:   tmp <= sw[1];
    3'b0010:   tmp <= sw[2];
    3'b0011:   tmp <= sw[3];
    3'b0100:   tmp <= sw[4];
    3'b0101:   tmp <= sw[5];
    3'b0110:   tmp <= sw[6];
    3'b0111:   tmp <= sw[7];
    default: tmp <= 1'b0;
    endcase
end
assign Y = tmp;
endmodule
