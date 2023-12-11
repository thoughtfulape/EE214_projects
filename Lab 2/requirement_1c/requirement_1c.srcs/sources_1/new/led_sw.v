`timescale 1ns / 1ps

module led_sw(
    input [7:0]sw,
    output [3:0]led,
    output red1,
    output red2,
    output green
    //output blue
    );

//Req1
/*
assign led[0] = (sw[0] & ~sw[1]) | (~sw[0] & sw[1]);
assign led[1] = (~sw[1] & ~sw[2] & ~sw[3]) | (sw[1] & sw[2] & ~sw[3]) | (sw[1] & ~sw[2] & sw[3]);
assign led[2] = (sw[4] & ~sw[5] & ~sw[6] & ~sw[7]) | (sw[4] & sw[5] & ~sw[6] & ~sw[7]) |
                (~sw[4] & ~sw[5] & sw[6] & ~sw[7]) | (sw[4] & sw[5] & sw[6] & sw[7]);
*/

//Req2
/*
assign led[0] = (sw[0] | sw[1]) & (~sw[0] | ~sw[1]);
assign led[1] = (~sw[1] | sw[2] | sw[3]) & (sw[1] | ~sw[2] | sw[3]) & (sw[1] | sw[2] | ~sw[3]) & (sw[1] | ~sw[2] | ~sw[3]) & (~sw[1] | ~sw[2] | ~sw[3]);
assign led[2] = (sw[4] | sw[5] | sw[6] | sw[7]) & (sw[4] | ~sw[5] | sw[6] | sw[7]) & (~sw[4] | sw[5] | ~sw[6] | sw[7]) & (sw[4] | ~sw[5] | ~sw[6] | sw[7]) & 
                (~sw[4] | ~sw[5] | ~sw[6] | sw[7]) & (sw[4] | sw[5] | sw[6] | ~sw[7]) & (~sw[4] | sw[5] | sw[6] | ~sw[7]) & (sw[4] | ~sw[5] | sw[6] | ~sw[7]) & 
                (~sw[4] | ~sw[5] | sw[6] | ~sw[7]) & (sw[4] | sw[5] | ~sw[6] | ~sw[7]) & (~sw[4] | sw[5] | ~sw[6] | ~sw[7]) & (sw[4] | ~sw[5] | ~sw[6] | ~sw[7]);
*/


//Req3
assign led[3] = (sw[3] & ~sw[4] & ~sw[5] & ~sw[6]) | (sw[3] & sw[4] & ~sw[5] & ~sw[6]) | (~sw[3] & ~sw[4] & sw[5] & ~sw[6]) | (~sw[3] & sw[4] & sw[5] & ~sw[6]) | 
                (sw[3] & ~sw[4] & ~sw[5] & sw[6]) | (sw[3] & sw[4] & ~sw[5] & sw[6]) | (~sw[3] & ~sw[4] & sw[5] & sw[6]) | (~sw[3] & sw[4] & sw[5] & sw[6]);


//Req4
/*
sw[0] = coolant temperature (CT)
sw[1] = coolant low (CL)
sw[2] = oil temperature (OT)
sw[3] = oil low (OL)
*/
//Yellow Indicator
/*
assign red1 = (~sw[0] & sw[1] & ~sw[2] & ~sw[3]) | (~sw[0] & ~sw[1] & ~sw[2] & sw[3]) | 
              (~sw[0] & ~sw[1] & sw[2] & ~sw[3]) | (sw[0] & ~sw[1] & ~sw[2] & sw[3]);
assign green = (~sw[0] & sw[1] & ~sw[2] & ~sw[3]) | (~sw[0] & ~sw[1] & ~sw[2] & sw[3]) | 
              (~sw[0] & ~sw[1] & sw[2] & ~sw[3]) | (sw[0] & ~sw[1] & ~sw[2] & sw[3]);
//Red Indicator
assign red2 = (sw[0] & sw[1] & ~sw[2] & ~sw[3]) | (~sw[0] & ~sw[1] & sw[2] & sw[3]) |
              (sw[0] & ~sw[1] & sw[2] & ~sw[3]) | (sw[0] & sw[1] & ~sw[2] & sw[3]);  
*/

/*
assign led[0] = (sw[0] & sw[1] & ~sw[2] & ~sw[3]) | (sw[0] & ~sw[1] & sw[2] & ~sw[3]) | 
                (sw[0] & ~sw[1] & ~sw[2] & sw[3]) | 
                (~sw[0] & sw[1] & sw[2] & ~sw[3]) | (~sw[0] & sw[1] & ~sw[2] & sw[3]) | 
                (~sw[0] & ~sw[1] & sw[2] & sw[3]);
assign led[1] = (sw[4] & ~sw[5] & ~sw[6] & ~sw[7]) | (~sw[4] & sw[5] & ~sw[6] & ~sw[7]) | 
                (~sw[4] & ~sw[5] & sw[6] & ~sw[7]) | (~sw[4] & ~sw[5] & ~sw[6] & sw[7]);
*/
endmodule
