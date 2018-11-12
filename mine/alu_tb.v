// Verilog test bench
`timescale 1ns/10ps
`include "alu.v"

module alu_tb;

wire[15:0] aa;
wire[15:0] bb ;
wire[15:0] runsum;
wire[15:0] sum;
wire[2:0] op;

integer k=0;

assign {aa} = k ;
assign {bb} = 1;
assign {op} =  110;
aluIn the_circuit(aa,bb, op,sum);

   initial begin
	//bb = 1;
      $dumpfile("alu.vcd");
     $dumpvars(0, alu_tb);
   // $monitor("other %b", aa);

     for (k=0; k<10; k=k+1)
         #10 $display($time,,,,"output: %b <> A:%b <> B: %b",sum,aa,bb);
 

   end

endmodule
