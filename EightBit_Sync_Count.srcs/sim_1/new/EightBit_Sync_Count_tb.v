`timescale 1s / 1ms

`include "EightBit_Sync_Count.v" /* including module from design, the ` symbol
must preceed include (this isn't an apostrophe '), .v extension is used for 
verilog compilation, sv. is used for SystemVerilog */  
module EightBit_Sync_Count_tb();
reg counter_clock, reset, enable;
wire [7:0] counter_out;
// Declaring inputs as regs and outputs as wires

// initial block contains statements assigning values to signals at specified times
initial begin
  $display ("time\t clk reset enable counter"); /* clk represents clock in
  testbench environment */
  $monitor ("%g\t %b %b %b %b",
    $time, counter_clock, reset, enable, counter_out);
    /* $monitor "monitors" signals & prints out their values whenever they change,
    $time gives the simulation time as integer, */
  counter_clock = 1;
  reset = 0;
  enable = 0;
  #5 reset = 1;
  #10 reset = 0;
  #10 enable = 1;
  #220 enable = 0;
  #5 $finish; // because of the = sign all these steps execute SEQUENTIALLY
end

// Clock generator, runs throughout simulation as written here
always begin
  #5 counter_clock = ~counter_clock; // Toggle the counter_clock every 5 time units
end

// Connect DUT to test bench
EightBit_Sync_Count U_counter(
counter_clock,
reset,
enable,
counter_out
);


endmodule

