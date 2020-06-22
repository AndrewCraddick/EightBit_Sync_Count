`timescale 1ns / 1ps
// counter based
module clock_divider #(parameter div_value = 4999)( // make div_value global

//------------- PORT LIST   -----------------------------
clock, // 100MHz
divided_clock // 1Hz => .5s ON and .5s OFF 
);
    
//------------  INPUT PORTS  ---------------------------
input clock;

//------------  OUTPUT PORTS  --------------------------
output divided_clock = 0; // initialize as zero

//-----------  INPUT PORTS DATA TYPE ------------------
wire clock;

//-----------  OUTPUT PORTS DATA TYPE  -----------------
reg divided_clock;

    
// ------------ counter -------------------------------
integer counter_value = 0; // 32-bit wide reg bus by definition, initialize as 0

/* parameter div_value as determined by below equation:
   what we want to divide the clock by to get the desired frequency:
   div_value = 100MHz/(2*desired frequency) - 1 = 49999999Hz */

always@ (posedge clock)
begin
  if (counter_value == div_value)
      counter_value <= 0; // reset value
  else
      counter_value <= counter_value + 1; // count up to 49999999 then reset
end

//------------ divide clock -----------------------
always@ (posedge clock)
begin
   // keep counting until 49999999 (div_value)
   if(counter_value == div_value)
       divided_clock <= ~divided_clock; /* invert clock every 5000000 clock cycles, 
       50000000 because we begin counting at 0 not 1 */
   else
       divided_clock <= divided_clock; // store value
end
endmodule
