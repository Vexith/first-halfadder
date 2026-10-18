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

   initial begin
      $dumpfile("waves.vcd");
	   $dumpvars(0, tb_bitadder);
	
	   // sum = 0 and carry = 0, so (0 + 0  = 0)	
	   a = 0; b = 0;
	   #10;

	   // sum = 1 and carry = 0, so 0 + 1 = 1
	   a = 0; b = 1;
	   #10;

	   // sum = 1 and carry = 0, so 1 + 0 = 1
	   a = 1; b = 0;
	   #10;

	   // 1 + 1 = 2 in binary (sum = 0, carry = 1)
	   a = 1; b = 1;
	   #10;

	   $finish;
   end
   
endmodule
