`timescale 1ns / 1ps

module serial_adder_tb;

    reg A, B, rst, clk;
    wire F, Cout;
    
    serial_adder cut(
        .A(A),
        .B(B),
        .rst(rst),
        .clk(clk),
        .F(F),
        .Cout(Cout)
    );
    
    always 
        #5 clk = ~clk;
    
    initial begin
    
        clk = 0;
        rst = 1;
        
        #10 
        rst = 0;
        A = 1;
        B = 0;
        #10 
        A = 0;
        B = 1;
        #10 
        A = 1;
        B = 1;
        #10 
        A = 1;
        B = 0;
        #10 
        A = 0;
        B = 0;
        #10 
        A = 1;
        B = 1;
        #30
        A = 0;
        B = 0;
        #20 
        A = 1;
        B = 1;
        #10 
        A = 1;
        B = 0;  
        
    end          
   
endmodule
