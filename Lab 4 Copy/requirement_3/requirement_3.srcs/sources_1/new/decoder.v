`timescale 1ns / 1ps

module decoder(

    input [1:0]sw,
    input [3:0]pb,
    output [3:0]led

    );
    
    reg [3:0] led;
    
    always @ (sw, pb) begin
        if      ((sw == 2'd0) & pb[0]) led = 4'b0001;
        else if ((sw == 2'd1) & pb[1]) led = 4'b0010;
        else if ((sw == 2'd2) & pb[2]) led = 4'b0100;
        else if ((sw == 2'd3) & pb[3]) led = 4'b1000;
        else                           led = 4'b0000;
    end
    
endmodule
