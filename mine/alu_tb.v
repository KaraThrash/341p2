// Verilog test bench
`timescale 1ns/100ps
`include "alu.v"

module alu_tb;

wire[15:0] aa;
wire[15:0] bb;
wire[15:0] runsum;
wire[15:0] sum;
wire[3:0] op;
wire c_out;
wire A, B, C, D, E;

integer k=0;

assign {aa} = k;
assign {bb} = 2 ;
assign {op} =  110;

assign runsum = sum;
aluIn the_circuit(aa,bb, op,sum);

   initial begin
	
      $dumpfile("alu.vcd");
      $dumpvars(0, alu_tb);
$display("first %b", aa);
      for (k=0; k<10; k=k+1)
        #10 $display("Sum is %b",runsum);
       $display("other %b", runsum);

      $finish;

   end

endmodule
