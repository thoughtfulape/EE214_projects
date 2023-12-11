`timescale 1ns / 1ps

module sw_debounce(

    input data, clk, rst,
    output db

    );
    
    localparam S0 = 2'b00;
    localparam S1 = 2'b10;
    localparam S2 = 2'b11;
    localparam S3 = 2'b01;
    
    reg [1:0] PS, NS;
    
    always @(*) begin
        case(PS)
        S0: if(data) NS = S1;
            else     NS = S0;
        S1: if(data) NS = S2;
            else     NS = S0;
        S2: if(data) NS = S2;
            else     NS = S3;
        S3: if(data) NS = S2;
            else     NS = S0;
        endcase
    end
    
    always @(posedge(clk), posedge(rst)) begin
        if(rst) PS <= S0;
        else    PS <= NS;
    end
    
    assign db = PS[0];
    
endmodule
