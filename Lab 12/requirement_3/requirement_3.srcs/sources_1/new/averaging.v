`timescale 1ns / 1ps

module averaging(

    input wire [13:0]bin,
    input tally, clk,
    output reg [13:0]average,
    output reg indicator

    );
    
    reg [3:0]count;
    reg [13:0]total;
    
    always @(posedge(tally)) begin
            if(count == 4'd8) begin
                count = 4'b0001;
                total = 0;
                end
            else
                count = count + 1;
                total = total + bin;
            if(count == 4'd8)
                indicator = 1;
            else
                indicator = 0;
    end
    
    always @(posedge(clk)) begin
        if(count == 4'd1)
            average = bin;
        else if(count == 4'd0)
            average = 14'd0;
        else
            average = total / count;
    end
    
endmodule
