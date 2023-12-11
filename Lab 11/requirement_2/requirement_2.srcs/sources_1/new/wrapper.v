`timescale 1ns / 1ps

module wrapper(

    input run, stop, inc, rst, clk,
    output [7:0]seg,
    output [3:0]an

    );
    
    wire [3:0]data0, data1, data2, data3;
    wire tc0, tc1, tc2, tc3, clk_div, s;
    
    clock_divider_1KHz clk_divider(
        .clk(clk),
        .clk_div(clk_div)
    );
    
    sw_state_machine state(
        .run(run),
        .stop(stop),
        .inc(inc),
        .rst(rst),
        .s(s),
        .clk(clk_div)
    );
    
    counters c0(
        .rst(rst),
        .clk_div(clk_div),
        .en(s),
        .dg(data0),
        .tc(tc0)
    );
    
    counters c1(
        .rst(rst),
        .clk_div(tc0),
        .en(1),
        .dg(data1),
        .tc(tc1)
    );
    
    counters c2(
        .rst(rst),
        .clk_div(tc1),
        .en(1),
        .dg(data2),
        .tc(tc2)
    );
    
    counters c3(
        .rst(rst),
        .clk_div(tc2),
        .en(1),
        .dg(data3),
        .tc(tc3)
    );
    
    seg_wrapper controller(
        .N1(data0),
        .N2(data1),
        .N3(data2),
        .N4(data3),
        .clk(clk),
        .seg(seg),
        .an(an)
    );
    
endmodule
