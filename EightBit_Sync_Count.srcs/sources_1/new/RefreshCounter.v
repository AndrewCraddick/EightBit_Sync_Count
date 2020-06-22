`timescale 1ns / 1ps

module RefreshCounter(
input refresh_clock,
output reg [1:0] refreshcounter = 0 /* this will be used to "refresh" the
                                       4 digits on the displlay, it's 
                                       frequency is 10kHz (1ms) as 
                                       specified by the Basys 3 board ref.
                                       manual  */
);

always@(posedge refresh_clock)
    refreshcounter <= refreshcounter + 1;
    
endmodule
