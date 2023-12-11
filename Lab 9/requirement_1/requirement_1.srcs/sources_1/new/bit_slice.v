`timescale 1ns / 1ps

module bit_slice(

    input A, B, Cin,
    output P, G, S

    );
    
    assign P = A ^ B;
    assign G = A & B;
    assign S = P ^ Cin;
    
endmodule
