`timescale 1ns / 1ps

module mux_2_1(

    input [7:0]sw,
    input sel,
    output [3:0]Y

    );
    
    reg [3:0]temp;
    
    always @(sel) begin
        case(sel)
        1'd1:   temp <= sw[7:4];
        default temp <= sw[3:0];
        endcase
    end    
    
    assign Y = temp;
    
endmodule
