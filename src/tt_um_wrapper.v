`default_nettype none

module tt_um_wrapper (input wire [7:0] ui_in, output wire[7:0] uo_out, input wire [7:0] uio_in, output wire [7:0] uio_out, output wire [7:0] uio_oe, input wire ena, input wire clk, input wire rst_n);
  wire _unused = &{ena, clk, rst_n, uio_in, uio_oe, ui_in[7:2], 1'b0}; // hack to compiler not mess around 

  tt_um_bitadder uut (.a (ui_in[0]), .b (ui_in[1]), .sum (uo_out[0]), .cry (uo_out[1]));

  assign uo_out[7:2] = 6'b0; // short the 6 bits remaining to GND

  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;
endmodule
