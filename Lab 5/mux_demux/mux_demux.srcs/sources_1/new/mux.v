`timescale 1ns / 1ps

module mux(

    input [7:0]I,
    input [2:0]sel,
    output Y

    );
    
    reg temp;
    
    always @(I, sel) begin
        case(sel)
        3'd0:    temp <= I[0];
        3'd1:    temp <= I[1];
        3'd2:    temp <= I[2];
        3'd3:    temp <= I[3];
        3'd4:    temp <= I[4];
        3'd5:    temp <= I[5];
        3'd6:    temp <= I[6];
        3'd7:    temp <= I[7];
        default  temp <= 1'b0;
        endcase
    end
    
    assign Y = temp;
    
endmodule
