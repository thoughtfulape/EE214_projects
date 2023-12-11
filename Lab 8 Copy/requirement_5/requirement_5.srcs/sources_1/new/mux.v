`timescale 1ns / 1ps

module mux(

    input [3:0] I0, I1, I2, I3,
    input [1:0]sel,
    output [3:0]Y

    );
    
    reg[3:0] temp;
    
    always @(sel) begin
        case(sel)
        2'b00:  temp <= I3;
        2'b01:  temp <= I2;
        2'b10:  temp <= I1;
        2'b11:  temp <= I0;
        endcase
    end
    
    assign Y = temp; 
    
endmodule
