`timescale 1ns / 1ps

module single_seg(
    
    input clk,
    output reg [7:0]seg,
    output [3:0]an

    );
    
    assign an[0] = 0;
    
    clock_divider_1KHz clk_div(
        .clk(clk),
        .led(Bin)
    );
    
    reg [3:0]num;
    
    always @(posedge(Bin)) begin
        if (num == 4'd9) num <= 3'd0;
        else             num <= num + 1;
    end
 
    always @(num) begin                  // gfedcba
            //0-9
            if      (num == 4'd0) seg = 7'b01000000;
            else if (num == 4'd1) seg = 7'b01111001;
            else if (num == 4'd2) seg = 7'b00100100;
            else if (num == 4'd3) seg = 7'b00110000;
            else if (num == 4'd4) seg = 7'b00011001;
            else if (num == 4'd5) seg = 7'b00010010;
            else if (num == 4'd6) seg = 7'b00000010;
            else if (num == 4'd7) seg = 7'b01111000;
            else if (num == 4'd8) seg = 7'b00000000;
            else if (num == 4'd9) seg = 7'b00010000;
            //A-F
            else                 seg = 7'b11111111;
    end
    
endmodule
