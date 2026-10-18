`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();
   reg a;
   reg b;

   wire sum;
   wire cry;

   bitadder uut (.a(a), .b(b ), .sum(sum), .cry(cry));
   
endmodule
