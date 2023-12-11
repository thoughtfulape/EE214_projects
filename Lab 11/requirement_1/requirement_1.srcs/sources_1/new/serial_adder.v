`timescale 1ns / 1ps

module serial_adder(

    input A, B, rst, clk,
    output F, Cout

    );
    
    localparam S0 = 2'b00;
    localparam S1 = 2'b10;
    localparam S2 = 2'b01;
    localparam S3 = 2'b11;
    reg [1:0] PS, NS;
    
    always @(PS, A, B) begin
        case(PS)
        S0: if(~A&~B) NS = S0;
            else if(A&B) NS = S2;
            else NS = S1;
        S1: if(~A&~B) NS = S0;
            else if(A&B) NS = S2;
            else NS = S1;
        S2: if(~A&~B) NS = S1;
            else if(A&B) NS = S3;
            else NS = S2;
        S3: if(~A&~B) NS = S1;
            else if(A&B) NS = S3;
            else NS = S2;
        endcase
    end
    
    always @(posedge(clk), posedge(rst)) begin
        if(rst)
            PS <= S0;
        else
            PS <= NS;
    end
    
    assign F = PS[1];
    assign Cout = PS[0];
    
endmodule
