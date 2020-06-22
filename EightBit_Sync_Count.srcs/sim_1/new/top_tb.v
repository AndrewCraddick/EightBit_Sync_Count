`timescale 1ns / 1ps

module top_tb;

reg clock; //100MHz
reg enable;
reg reset;
wire [3:0] anode;
wire [7:0] cathode;

top UUT (clock, enable, reset, anode, cathode); // ordered wrapping

always #5 clock = ~clock; // this makes the clock 100MHz

initial begin
    $monitor ("%g\t %b %b %b %b %b",
        $time, clock, enable, anode, cathode, reset);
   clock = 1;
   reset = 0;
   enable = 0;
   #50 reset = 1;
   #50 reset = 0;
   #50 enable = 1;
   //#220 enable = 0;
      
end
endmodule
