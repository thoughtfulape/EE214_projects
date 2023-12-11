`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2021 12:23:05 PM
// Design Name: 
// Module Name: rgb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rgb(
    
    input [2:0]pb,
    input sw,
    output [2:0]led
    
    );
    
assign led[0] = pb[0]&sw;
assign led[1] = pb[1]&sw;
assign led[2] = pb[2]&sw;
    
endmodule
