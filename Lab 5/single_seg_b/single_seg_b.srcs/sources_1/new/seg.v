`timescale 1ns / 1ps

module single_seg(

    input [4:0]sw,
    //input EN,
    output reg [7:0]seg,
    //output reg a,b,c,d,e,f,g,
    output [3:0]an

    );
    
    assign an[0] = 0;
    /*
    assign a = (sw[2] & ~sw[1] & ~sw[0]) + (~sw[3] & ~sw[2] & ~sw[1] & sw[0]);
    assign b = (sw[2] & ~sw[1] & sw[0]) + (sw[2] & sw[1] & ~sw[0]);
    assign c = (~sw[2] & sw[1] & ~sw[0]);
    assign d = (sw[2] & ~sw[1] & ~sw[0]) + (sw[2] & sw[1] & sw[0]) + (~sw[3] & ~sw[2] & ~sw[1] & sw[0]);
    assign e = sw[0] + (sw[2] & ~sw[1]);
    assign f = (sw[1] & sw[0]) + (~sw[2] & sw[1] & ~sw[0]) + (~sw[3] & ~sw[2] & sw[0]);
    assign g = (~sw[3] & ~sw[2] & ~sw[1]) + (sw[2] & sw[1] & sw[0]);
    */
    always @(sw) begin                  // gfedcba
            //0-9
            if      (sw == 3'd0) seg = 7'b11000000;
            else if (sw == 3'd1) seg = 7'b11111001;
            else if (sw == 3'd2) seg = 7'b10100100;
            else if (sw == 3'd3) seg = 7'b10110000;
            else if (sw == 3'd4) seg = 7'b10011001;
            else if (sw == 3'd5) seg = 7'b10010010;
            else if (sw == 3'd6) seg = 7'b10000010;
            else if (sw == 3'd7) seg = 7'b11111000;
            else if (sw == 4'd8) seg = 7'b10000000;
            else if (sw == 4'd9) seg = 7'b10010000;
            //A-F
            else if (sw == 4'd10) seg = 7'b10001000;
            else if (sw == 4'd11) seg = 7'b10000011;
            else if (sw == 4'd12) seg = 7'b11000110;
            else if (sw == 4'd13) seg = 7'b10100001;
            else if (sw == 4'd14) seg = 7'b10000110;
            else if (sw == 4'd15) seg = 7'b10001110;
            else                 seg = 7'b11111111;
    end
    
endmodule
