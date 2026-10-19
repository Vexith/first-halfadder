`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();
   reg [7:0] ui_in;
   reg [7:0] uio_in;
   reg ena;
   reg clk;
   reg rst_n;

   wire [7:0] uo_out;
   wire [7:0] uio_out;
   wire [7:0] uio_oe;
   
   wire a = ui_in[0];
   wire b = ui_in[1];
   wire sum = uo_out[0];
   wire cry = uo_out[1];

   tt_um_wrapper uut (.ui_in  (ui_in), .uo_out (uo_out), .uio_in (uio_in), .uio_out(uio_out), .uio_oe (uio_oe), .ena (ena), .clk (clk), .rst_n  (rst_n));
   
endmodule
