`timescale 1ns / 1ps

module requirement_2(

    input [2:0] I0, I1, I2, I3,
    input [1:0] sel,
    output [2:0] Y

    );
    
    reg [2:0]temp;
    
    always @(I0, I1, I2, I3, sel)
    begin
        case(sel)
        2'b00:  temp <= I0;
        2'b01:  temp <= I1;
        2'b10:  temp <= I2;
        2'b11:  temp <= I3;
        default temp <= 2'b00;
        endcase
    end
    
    assign Y = temp;
    
endmodule
