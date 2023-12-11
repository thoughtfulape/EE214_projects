`timescale 1ns / 1ps

module wrapper(

    input  start, react, clk, reset, avg,
    output [7:0]seg,
    output [3:0]an,
    output led, indicator

    );
    
    wire [3:0]data0, data1, data2, data3;
    wire tc0, tc1, tc2, tc3, clk_div, hz10, s;
    wire rst, tally;
    wire [13:0] new_avg;
    
    clock_divider_1KHz clk_divider(
        .clk(clk),
        .clk_div(clk_div),
        .out(hz10)
    );
    
    counters c0(
        .rst(disp_rst),
        .clk_div(clk_div),
        .en(s),
        .dg(data0),
        .tc(tc0)
    );
    
    counters c1(
        .rst(disp_rst),
        .clk_div(tc0),
        .en(1),
        .dg(data1),
        .tc(tc1)
    );
    
    counters c2(
        .rst(disp_rst),
        .clk_div(tc1),
        .en(1),
        .dg(data2),
        .tc(tc2)
    );
    
    counters c3(
        .rst(disp_rst),
        .clk_div(tc2),
        .en(1),
        .dg(data3),
        .tc(tc3)
    );
    
    seg_wrapper controller(
        .din(bcd),
        .clk(clk),
        .seg(seg),
        .an(an)
    );
    
    rnd_num rnd_num(
        .start(start),
        .react(react),
        .clk(clk),
        .hz10(hz10),
        .s(s),
        .disp_rst(disp_rst),
        .reset(reset),
        .tally(tally)
    );
    
    averaging my_avg(
        /*
        .d0(data0),
        .d1(data1),
        .d2(data2),
        .d3(data3),
        */
        .bin(disp),
        .tally(tally),
        .clk(clk),
        .indicator(indicator),
        .average(new_avg)
    );
    
    wire[15:0]bcd;
    bin2bcd bin2bcd(
        .bin(Y),
        .bcd(bcd)
    );
    
    wire [13:0]disp;
    bcd2bin bcd2bin(
        .bcd0(data0),
        .bcd1(data1),
        .bcd2(data2),
        .bcd3(data3),
        .bin(disp)
    );
    
    reg [13:0]Y;
    always @(avg) begin
        case(avg)
        0:  Y <= disp;
        1:  Y <= new_avg;
        endcase
    end
    
    assign rst = disp_rst;
    assign led = s;
    
endmodule