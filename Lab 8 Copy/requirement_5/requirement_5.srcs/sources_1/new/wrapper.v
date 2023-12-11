`timescale 1ns / 1ps

module wrapper(

    input clk,
    output reg [7:0]seg,
    output reg [3:0]an

    );
    
    reg [1:0]sig;
    wire clk_div;
    wire [3:0]data0, data1, data2, data3;
    wire tc0, tc1, tc2, tc3;
    
    clock_divider_1KHz clk_div(
        .clk(clk),
        .out(clk_div)
    );
    
    counters counter0(
        .clk_div(clk_div),
        .dg(data0),
        .tc(tc0)
    );
    
    counters counter1(
        .clk_div(tc0),
        .dg(data1),
        .tc(tc1)
    );
    
    counters counter2(
        .clk_div(tc1),
        .dg(data2),
        .tc(tc2)
    );
    
    counters counter3(
        .clk_div(tc2),
        .dg(data3),
        .tc(tc3)
    );
    
    wire[3:0] nums;
    mux mux(
        .I0(data0),
        .I1(data1),
        .I2(data2),
        .I3(data3),
        .sel(count),
        .Y(nums)
    );
    
    wire [1:0]count;
    counter_2_bit dsp_timer(
        .clk(clk),
        .count(count)
    );
    
    /*
    //mux timer 
    always @(posedge(Y)) begin
        if(sig == 2'd11) sig <= 0;
        else             sig <= sig + 1;
    end
    */
    
    /*
    //display clock divider 
    reg [16:0]dsp_timer;
    always @(posedge(clk)) begin
        dsp_timer <= dsp_timer + 1;
   end
   */
    /*
    //2-bit counter 
    reg [17:0]temp;
    reg [1:0]count;
    always @(posedge(clk)) begin
        temp <= temp + 1;
    end
    */
    
    //annode decoder 
    always @(count) begin
        case(count)
        2'b00:  an[0] = 0;
        2'b01:  an[1] = 0;
        2'b10:  an[2] = 0;
        2'b11:  an[3] = 0;
        default an <= 1;
        endcase
    end
    
    //sseg decoder 
    always @(nums) begin                  // gfedcba
            //0-9
            if      (nums == 4'd0) seg = 7'b01000000;
            else if (nums == 4'd1) seg = 7'b01111001;
            else if (nums == 4'd2) seg = 7'b00100100;
            else if (nums == 4'd3) seg = 7'b00110000;
            else if (nums == 4'd4) seg = 7'b00011001;
            else if (nums == 4'd5) seg = 7'b00010010;
            else if (nums == 4'd6) seg = 7'b00000010;
            else if (nums == 4'd7) seg = 7'b01111000;
            else if (nums == 4'd8) seg = 7'b00000000;
            else if (nums == 4'd9) seg = 7'b00010000;
            //A-F
            else                 seg = 7'b11111111;
    end
    
endmodule
