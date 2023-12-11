`timescale 1ns / 1ps

module wrapper(

    input  start, react, clk, reset,
    output [7:0]seg,
    output [3:0]an,
    output led

    );
    
    wire [3:0]data0, data1, data2, data3;
    wire tc0, tc1, tc2, tc3, clk_div, hz10, s;
    wire rst;
    
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
        .N1(data0),
        .N2(data1),
        .N3(data2),
        .N4(data3),
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
        .reset(reset)
    );
    
    assign rst = disp_rst;
    assign led = s;
    
endmodule