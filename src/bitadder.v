module tt_um_bitadder ( input wire a, input wire b, output wire sum, output wire cry);
   assign sum = a ^ b;   // XOR gate    
   assign cry = a & b;   // carry output
endmodule
