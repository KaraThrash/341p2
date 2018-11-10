// Verilog test bench
`timescale 1ns/100ps
`include "mine.v"

module mine_tb;

wire[3:0] aa;
wire[3:0] bb;
wire[3:0] runsum;
wire[3:0] sum;
wire c_out;
wire A, B, C, D, E;
integer k=0;

assign {aa} = k;
assign {bb} = 0;
assign {E} = 0;
assign runsum = sum;
mine the_circuit(bb,aa, sum, c_out, E);

   initial begin
	
      $dumpfile("mine.vcd");
      $dumpvars(0, mine_tb);
$display("first %b", aa);
      for (k=0; k<8; k=k+1)
        #10 $display("from mine doe %b as welel as %b", runsum,bb);
       $display("other %b", runsum);

      $finish;

   end

endmodule
