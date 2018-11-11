// Verilog model of circuit of Figure 3.35 in Digital Systems 5th ed.

module oneadder(a,b,c,s,cout);
input a,b,c;
output s,cout;
wire w1, w2, w3, w4, s;


xor g1(w1, a, b);
xor g2(s, w1, c);
 and g3(w2, c, b);
 and g4(w3, c, a);
 and g5(w4, a, b);
or g6(cout, w2, w3, w4);
endmodule

module fulladder(x,y,s,cout,cin);
input [15:0] y;
input [15:0] x;
output [15:0] s;
input cin;
output cout;
wire c[15:0];

 oneadder f0 (x[0],y[0],cin,s[0],c[0]);
 oneadder f1 (x[1],y[1],c[0],s[1],c[1]);
 oneadder f2 (x[2],y[2],c[1],s[2],c[2]);
 oneadder f3 (x[3],y[3],c[2],s[3],c[3]);
oneadder f4 (x[4],y[4],c[3],s[4],c[4]);
 oneadder f5 (x[5],y[5],c[4],s[5],c[5]);
 oneadder f6 (x[6],y[6],c[5],s[6],c[6]);
 oneadder f7 (x[7],y[7],c[6],s[7],c[7]);
oneadder f8 (x[8],y[8],c[7],s[8],c[8]);
 oneadder f9 (x[9],y[9],c[8],s[9],c[9]);
 oneadder f10 (x[10],y[10],c[9],s[10],c[10]);
 oneadder f11 (x[11],y[11],c[10],s[11],c[11]);
oneadder f12 (x[12],y[12],c[12],s[12],c[12]);
 oneadder f13 (x[13],y[13],c[13],s[13],c[13]);
 oneadder f14 (x[14],y[14],c[14],s[14],c[14]);
 oneadder f15 (x[15],y[15],c[15],s[15],cout);
endmodule



module subtract(x,y,s,cin);
input [15:0] y;
input [15:0] x;
output [15:0] s;
output [15:0]ycomp;
input [15:0]cin;
output [15:0]c;
input [15:0]yneg;
assign{one} = 1;
//assign{zero} = 0;
integer zero = 1;
//integer kone = 16'b1;
fulladder fulladd(y,zero,ycomp,c,cin);
assign{yneg} = ~ycomp;
fulladder fulladd2(x,yneg,s,cout,zero);
endmodule


module aluIn(x,y,opcode,s);
input [15:0] y;
input [15:0] x;
input [2:0]opcode;
output [15:0] s;
wire extra;
wire yneg[15:0] ;

output cout;

//negate negfun(x,y,yneg,cout,cin);
 //oneadder f0 (x[0],yneg[0],cin,s[0],c[0]);
subtract fulladd(x,y,s,opcode[2]);

endmodule 
