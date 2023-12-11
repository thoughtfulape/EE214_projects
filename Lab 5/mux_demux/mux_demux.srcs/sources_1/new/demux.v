`timescale 1ns / 1ps

module demux(

    input EN,
    input [2:0]sel,
    output reg [7:0]Y

    );
    
    always @(sel) begin
        if (EN)
            if      (sel == 3'd0) Y = 7'b00000001;
            else if (sel == 3'd1) Y = 7'b00000010;
            else if (sel == 3'd2) Y = 7'b00000100;
            else if (sel == 3'd3) Y = 7'b00001000;
            else if (sel == 3'd4) Y = 7'b00010000;
            else if (sel == 3'd5) Y = 7'b00100000;
            else if (sel == 3'd6) Y = 7'b01000000;
            else if (sel == 3'd7) Y = 7'b10000000;
            else                  Y = 7'b00000000;
        else Y = 7'b00000000;
    end
    
endmodule
