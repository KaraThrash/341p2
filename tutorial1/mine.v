// Verilog model of circuit of Figure 3.35 in Digital Systems 5th ed.

module mine(E, F, A, B, C, D);

   output E, F;
   input  A, B, C, D;

   assign E = A || (B && C) || ((!B) && D);
   assign F = ((!B) && C) || (B && (!C) && (!D));

endmodule
