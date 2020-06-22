`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
//
// Module Name: FourBit_Sync_Count
// FIRST PROJECT!!!!!!!!!
// 4-bit up counter with synchronous high active reset/enable
//////////////////////////////////////////////////////////////////


module EightBit_Sync_Count(

//------------- PORT LIST   -----------------------------

counter_clock , // Clock input
reset , // high active reset
enable , // high active enable
counter_out // 8-bit vector countaining count number
);
    
//------------  INPUT PORTS (ports defined as inputs) ----------
input counter_clock;    
input reset;
input enable;

//-----------  OUTPUT PORTS  --------------------------
output [7:0] counter_out;

//-----------  INPUT PORTS DATA TYPE ------------------
wire counter_clock;
wire reset;
wire enable;

// -------  CLOCK CALIBRATION FROM OTHER MODULE  ----------
// wrapper for the clock divider
//clock_divider wrapper (
//.counter_clock(clock),
//.divided_clock(******) // where does divided clock go to?
//);

//-----------  OUTPUT PORTS DATA TYPE  -------------------
reg [7:0] counter_out; // 4-bit vector storage

//-----------  CODE BEGINS HERE  ------------------------
// Counter is positive edge triggered

always @ (posedge counter_clock)
begin: COUNTER /* Block name is placed after 'begin' keyword
named blocks are allowed for 'begin' and 'fork' */
   if (reset == 1'b1) begin
      counter_out <= #1 0;
   end
   /* At rising edge of counter_clock, check if reset is active, if it
   is then the counter output is set to zero */
   else if (enable == 1'b1) begin
      counter_out <= #1 counter_out + 1; /* use nonblocking
      assignment to SYNCHRONIZE the counter output with enable */
   end
   /* if enable is high AND reset is not high, then begin adding
   to counter in increments of 1 */ 
   
end // end of 'COUNTER' block
    
endmodule // end of 'FourBit_Sync_Count' Module
