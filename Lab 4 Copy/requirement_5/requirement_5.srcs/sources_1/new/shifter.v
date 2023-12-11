`timescale 1ns / 1ps

module shifter(

    input [10:0]I,
    //input EN,
    input [1:0]A,
    input R,
    input D,
    input F,
    output reg [10:0]Y

    );
    
    always @ (I, A)
    begin
        if (A == 0)
            Y <= I;
        else begin
                if (R == 0)
                    if (A == 2'd1)
                        Y <= (D == 0) ? {I[9:0], F}:{F, I[10:1]};
                    else if (A == 2'd2)
                        Y <= (D == 0) ? {I[8:0], F, F}:{F, F, I[10:2]};
                    else 
                        Y <= (D == 0) ? {I[7:0], F, F, F}:{F, F, F, I[10:3]};
                else
                    if (A == 2'd1)
                        Y <= (D == 0) ? {I[9:0], I[10]}:{I[0], I[9:1]};
                    else if (A == 2'd2)
                        Y <= (D == 0) ? {I[8:0], I[10:9]}:{I[1:0], I[9:2]};
                    else
                        Y <= (D == 0) ? {I[7:0], I[10:8]}:{I[2:0], I[9:3]};
        end
    end
    
endmodule
