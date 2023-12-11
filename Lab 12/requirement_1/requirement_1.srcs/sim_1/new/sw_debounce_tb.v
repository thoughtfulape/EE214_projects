`timescale 1ns / 1ps

module sw_debounce_tb;

    reg data, clk, rst;
    wire db;
    
    sw_debounce cut(
        .data(data),
        .clk(clk),
        .rst(rst),
        .db(db)
    );
    
    always 
    
        #20 clk = ~clk;
    
    initial begin
    
        clk = 0;
        rst = 1;
        
        #40 
        rst = 0;
        data = 0;
        
        #40 
        data = 1;
        
        #40 
        data = 0;
        
        #40 
        data = 1;
        
        #40 
        data = 1;
        
        #80 
        data = 0;
        
        #40 
        data = 1;
        
        #40 
        data = 0;
        
        #40 
        data = 0;
        
    end
    
endmodule
