`timescale 1ns / 1ps

module sseg_controller(

    input [3:0]I,
    input [1:0]sel,
    output reg [7:0]seg

    );
    
    always @(I) begin                  // gfedcba
        if(sel == 2'b11)
            //0-9
            if      (I == 3'd0) seg = 8'b01000000;
            else if (I == 3'd1) seg = 8'b01111001;
            else if (I == 3'd2) seg = 8'b00100100;
            else if (I == 3'd3) seg = 8'b00110000;
            else if (I == 3'd4) seg = 8'b00011001;
            else if (I == 3'd5) seg = 8'b00010010;
            else if (I == 3'd6) seg = 8'b00000010;
            else if (I == 3'd7) seg = 8'b01111000;
            else if (I == 4'd8) seg = 8'b00000000;
            else if (I == 4'd9) seg = 8'b00010000;
            //A-F
            else if (I == 4'd10) seg = 8'b00001000;
            else if (I == 4'd11) seg = 8'b00000011;
            else if (I == 4'd12) seg = 8'b01000110;
            else if (I == 4'd13) seg = 8'b00100001;
            else if (I == 4'd14) seg = 8'b00000110;
            else if (I == 4'd15) seg = 8'b00001110;
            else                 seg = 8'b01111111;
        else
            if      (I == 3'd0) seg = 8'b11000000;
            else if (I == 3'd1) seg = 8'b11111001;
            else if (I == 3'd2) seg = 8'b10100100;
            else if (I == 3'd3) seg = 8'b10110000;
            else if (I == 3'd4) seg = 8'b10011001;
            else if (I == 3'd5) seg = 8'b10010010;
            else if (I == 3'd6) seg = 8'b10000010;
            else if (I == 3'd7) seg = 8'b11111000;
            else if (I == 4'd8) seg = 8'b10000000;
            else if (I == 4'd9) seg = 8'b10010000;
            //A-F
            else if (I == 4'd10) seg = 8'b10001000;
            else if (I == 4'd11) seg = 8'b10000011;
            else if (I == 4'd12) seg = 8'b11000110;
            else if (I == 4'd13) seg = 8'b10100001;
            else if (I == 4'd14) seg = 8'b10000110;
            else if (I == 4'd15) seg = 8'b10001110;
            else                 seg = 8'b11111111;
    end
    
    
endmodule

module decoder(

    input [1:0]sel,
    output reg [3:0]an
    
    );
    
    always @(sel) begin
        case(sel)
        2'b00:  an = 4'b1110;
        2'b01:  an = 4'b1101;
        2'b10:  an = 4'b1011;
        2'b11:  an = 4'b0111;
        endcase
    end

endmodule

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

module mux(

    input [1:0]sel,
    input [3:0]D0, D1, D2, D3,
    output reg[3:0]Dout
    
);

    always @(sel) begin
        case(sel)
        2'b00:  Dout <= D0;
        2'b01:  Dout <= D1;
        2'b10:  Dout <= D2;
        2'b11:  Dout <= D3;
        endcase
    end
    
endmodule

module seg_wrapper(
    
    //input [15:0]N,
    input [3:0]N1, N2, N3, N4,
    input clk,
    output [7:0]seg,
    output [3:0]an
    
    );
    
    wire [1:0]sel;
    wire [3:0]data;
    
    counter mycounter(
        .clk(clk),
        .B(sel)
    );
    
    sseg_controller seg_decoder(
        .I(data),
        .sel(sel),
        .seg(seg)
    );
    
    decoder an_decoder(
        .sel(sel),
        .an(an)
    );
    
    mux mymux(
    .D0(N1),
    .D1(N2),
    .D2(N3),
    .D3(N4),
    .sel(sel),
    .Dout(data)
    );
    
endmodule