// Verilog test bench
`timescale 1ns/100ps
`include "mine.v"

module mine_tb;

wire A, B, C, D, E;
integer k=0;

assign {A,B,C,D} = k;
mine the_circuit(E, A, B, C, D);

   initial begin

      $dumpfile("mine.vcd");
      $dumpvars(0, mine_tb);

      for (k=0; k<8; k=k+1)
        #10 $display("from mine done testing case %d", k);

      $finish;

   end

endmodule
