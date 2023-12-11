`timescale 1ns / 1ps

module add_subtract_tb;

    reg [7:0]sw;
    reg[2:0]btn;
    wire[7:0]sum;
    
    add_subtract cut(
        .sw(sw),
        .btn(btn),
        .Y(sum)
    );
    
    initial begin
    
    sw = 7'b00000001;
    btn[0] = 1;
    
    #50
    sw = 7'b00000010;
    btn[0] = 0;
    btn[1] = 1;
    
    end
    
endmodule
