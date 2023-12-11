`timescale 1ns / 1ps

module encoder(

    input [3:0]I,
    input Ein,
    output reg Eout,
    output reg [1:0]Y

    );
    
    always @ (Ein, I)
    begin
        if(Ein == 1)
        begin
            if(I[3] == 1) Y <= 2'd3;
        else if (I[2] == 1) Y <= 2'd2;
        else if (I[1] == 1) Y <= 2'd1;
        else                Y <= 2'd0;
        end
        else Y <= 2'd0;
    end
    
    always @ (Ein, I)
    begin
        if(Ein == 1 && I == 0)
            Eout = 1;
        else Eout = 0;
    end
    
endmodule
