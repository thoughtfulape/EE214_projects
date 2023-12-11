`timescale 1ns / 1ps

module rnd_num(

    input clk, hz10, start, react, reset,
    output s, disp_rst
    
    );
    
    //register
    reg [6:0]key;
    
    always @(posedge(clk)) begin
        if(latch)
            key <= num1;
    end
    
    //comparator 
    wire eq;
    assign eq = (num2 == key) ? 1'b1 : 1'b0;
    
    wire [6:0]num1, num2;
    
    rand_state my_rsm(
        .clk(clk),
        .start(start),
        .react(react),
        .eq(eq),
        .latch(latch),
        .cntr_en(cntr_en),
        .disp_rst(disp_rst),
        .s(s),
        .num2_rst(num2_rst),
        .reset(reset)
    );
    
    rnd my_rnd(
        .clk(clk),
        .num1(num1)
    );
    
    count_up my_counter(
        .hz10(hz10),
        .num2_rst(num2_rst),
        .num2(num2),
        .en(cntr_en)
    );
    
endmodule

module rnd(

    input clk,
    output reg [6:0]num1
    
    );
    
    always @(posedge(clk)) begin
        if(num1 == 7'd90)
            num1 <= 7'd10;
        else
            num1 <= num1 + 1;
    end
    
endmodule

module count_up(

    input en, hz10, num2_rst,
    output reg [6:0]num2
    
    );
    
    always @(posedge(hz10), posedge(num2_rst)) begin
    if(en)begin
        if(num2_rst)
            num2 = 7'd0;
        else
            num2 <= num2 + 1;
        end 
    end
    
endmodule

module rand_state(
    
    input clk, start, react, eq, reset,
    output reg latch, disp_rst, num2_rst, cntr_en, s
    
    );
    
    //random number logic state machine 
    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b11;
    localparam S3 = 2'b10;
    
    reg [1:0]PS, NS;
    
    always @(*) begin
        case(PS)
        S0: if(start) NS = S1;
            else      NS = S0;
        S1:           NS = S2;
        S2: if(eq)    NS = S3;
            else      NS = S2;
        S3: if(react) NS = S0;
            else      NS = S3;
        default: NS = S0;
        endcase
    end
    
    always @(posedge(clk), posedge(reset)) begin
        if(reset) PS <= S0;
        else PS <= NS;
    end
    
    always @(PS) begin
        latch = 0;
        disp_rst = 0;
        num2_rst = 0;
        cntr_en = 0;
        s = 0;
        if(PS == S1) begin
            latch = 1;
            disp_rst = 1;
            num2_rst = 1;
            end
        else if(PS == S2)
            cntr_en = 1;
        else if(PS == S3)
            s = 1;
    end
    
endmodule

