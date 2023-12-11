`timescale 1ns / 1ps

module decoder_4_16(

    input [3:0]sw,
    output reg [15:0]led

    );
    
    always @ (sw) begin
        if      (sw == 4'd0) led = 15'b0000000000000001;
        else if (sw == 4'd1) led = 15'b0000000000000010;
        else if (sw == 4'd2) led = 15'b0000000000000100;
        else if (sw == 4'd3) led = 15'b0000000000001000;
        else if (sw == 4'd4) led = 15'b0000000000010000;
        else if (sw == 4'd5) led = 15'b0000000000100000;
        else if (sw == 4'd6) led = 15'b0000000001000000;
        else if (sw == 4'd7) led = 15'b0000000010000000;
        else if (sw == 4'd8) led = 15'b0000000100000000;
        else if (sw == 4'd9) led = 15'b0000001000000000;
        else if (sw == 4'd10) led = 15'b0000010000000000;
        else if (sw == 4'd11) led = 15'b0000100000000000;
        else if (sw == 4'd12) led = 15'b0001000000000000;
        else if (sw == 4'd13) led = 15'b0010000000000000;
        else if (sw == 4'd14) led = 15'b0100000000000000;
        else if (sw == 4'd15) led = 16'b1000000000000000;      
        else            led = 15'b000000000000000;
    end
    
endmodule
