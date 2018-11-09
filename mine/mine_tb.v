// Verilog test bench
`timescale 1ns/100ps
`include "mine.v"

module mine_tb;

wire A, B, C, D, E;
integer k=0;

assign {C,D} = k;
assign {A,B} = 1;
mine the_circuit(A, B, C, D, E);

   initial begin

      $dumpfile("mine.vcd");
      $dumpvars(0, mine_tb);

      for (k=0; k<8; k=k+1)
        #10 $display("from mine done testing case %d", k);
         $monitor ("req0=%b,req1=%b,gnt0=%b,gnt1=%b", A, B, C, D);
      $finish;

   end

endmodule
