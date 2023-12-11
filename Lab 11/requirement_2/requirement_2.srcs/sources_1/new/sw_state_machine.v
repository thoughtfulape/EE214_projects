`timescale 1ns / 1ps

module sw_state_machine(

    input run, stop, inc, rst, clk,
    output s

    );
    
    localparam S0 = 2'b00;
    localparam S1 = 2'b11;
    localparam S2 = 2'b01;
    localparam S3 = 2'b10;
    
    reg [1:0] PS, NS;
    
    always @(PS, run, stop, inc) begin
        case(PS)
        S0: if(run & ~stop & ~inc) NS = S1;
            else if(~run & ~stop & inc) NS = S2;
            else NS = S0;
        S1: if(stop) NS = S0;
            else NS = S1;
        S2: NS = S3;
        S3: if(inc) NS = S3;
            else NS = S0;
        endcase
    end
    
    always @(posedge(clk), posedge(rst)) begin
        if(rst) PS <= S0;
        else PS <= NS;
    end
    
    assign s = PS[0];
    
endmodule
