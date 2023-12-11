`timescale 1ns / 1ps

module CLA_tb;

    reg [3:0]N1, N2;
    wire [3:0]S;
    
    CLA_4_bit uut(
        .num1(N1),
        .num2(N2),
        .sum(S)
    );
    
    initial begin
    
   #50 N1 = 4'b0001;
       N2 = 4'b0001;
        
   #50 N1 = 4'b0001;
       N2 = 4'b0010;
        
   #50 N1 = 4'b0100;
       N2 = 4'b0101;
        
   #50 N1 = 4'b0100;
       N2 = 4'b0001;
       
   #50 N1 = 4'b1000;
       N2 = 4'b1001;
       
   end
   
endmodule
