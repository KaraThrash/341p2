// Verilog test bench
`timescale 1ns/100ps
`include "fourbitadder.v"

module adder_tb;

wire A, B, C, D, E;
integer k=0;

assign {A} = k;
fourbitadder the_circuit(A,B,C,D,E);

   initial begin

      $dumpfile("fourbitadder.vcd");
      $dumpvars(0, adder_tb);

      for (k=0; k<8; k=k+1)
        #10 $display("adder testing case %d", C);

      $finish;

   end

endmodule
