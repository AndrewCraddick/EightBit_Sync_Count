`timescale 1ns / 1ps

// This modules ties all other modules together and describes their connections which
// determines the overall behavior of the project. It is top in the hierarchy

module top(
input wire clock, // 100MHz
input wire enable,
input wire reset,                                                   
output wire [3:0] anode,                                                            
output wire [7:0] cathode                                                           
);                                                                                  
                                                                                    
wire refresh_clock;                                                                 
wire counter_clock;                                                          
wire [7:0] eight_bit_counter_value;                                                 
wire [3:0] ones;                                                                    
wire [3:0] tens;                                                                    
wire [3:0] hundreds;                                                                
                                                                                    
                                                                                    
//----------- Module Connections (Instantiations)  --------------------------                     
clock_divider #(4999) refreshclock_generator ( // #(number) overwrites global 'parameter' in clock_divider                            
.clock              ( clock                   ),                                   
.divided_clock      ( refresh_clock           ) // refresh_clock is 10kHz clock                        
);                                                                                   
                                                                                    
clock_divider #(4999999) counterclock_generator (                                   
.clock              ( clock                   ),                                      
.divided_clock      ( counter_clock           ) // counter_clock is 10Hz clock                         
);                                                                                  

EightBit_Sync_Count Binary_form_of_Count (
.counter_clock      ( counter_clock           ),
.reset              ( reset                   ),
.enable             ( enable                  ),
.counter_out        ( eight_bit_counter_value )
);                                              
                                                                                    
Binary_to_BCD Convert_Binary_to_BCD (                                               
.clock              ( clock                   ),                                    
.eight_bit_value    ( eight_bit_counter_value ), // [7:0] value to display          
.ones               ( ones                    ), // [3:0]...                        
.tens               ( tens                    ),                                    
.hundreds           ( hundreds                )  // ... [3:0]                       
);                                                                                  

seven_seg_controller SSD_Controller (
.refresh_clock      ( refresh_clock           ),
.Ones               ( ones                    ),
.Tens               ( tens                    ),
.Hundreds           ( hundreds                ),
.anode              ( anode                   ),
.cathode            ( cathode                 )
);

endmodule
