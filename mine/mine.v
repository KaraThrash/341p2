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
input [3:0] y;
input [3:0] x;
output [3:0] s;
input cin;
output cout;
wire c[3:0];

 oneadder f0 (x[0],y[0],cin,s[0],c[0]);
 oneadder f1 (x[1],y[1],c[0],s[1],c[1]);
 oneadder f2 (x[2],y[2],c[1],s[2],c[2]);
 oneadder f3 (x[3],y[3],c[2],s[3],cout);
endmodule

module negate(x,y,s,cout,cin);
input [3:0] y;
input [3:0] x;
output [3:0] s;
input cin;
output cout;
wire one,bw[3:0],c[3:0];
assign{one} = 1;
not(bw[0],y[0]);
not(bw[1],y[1]);
not(bw[2],y[2]);
not(bw[3],y[3]);
 oneadder f0 (x[0],bw[0],one,s[0],c[0]);
 oneadder f1 (x[1],bw[1],c[0],s[1],c[1]);
 oneadder f2 (x[2],bw[2],c[1],s[2],c[2]);
 oneadder f3 (x[3],bw[3],c[2],s[3],cout);


endmodule

module mine(x,y,s,cout,cin);
input [3:0] y;
input [3:0] x;
output [3:0] s;
wire extra;
wire [3:0] yneg;
input cin;
output cout;
wire c[3:0];
negate negfun(x,y,yneg,cout,cin);
 oneadder f0 (x[0],yneg[0],cin,s[0],c[0]);

 oneadder f1 (x[1],yneg[1],c[0],s[1],c[1]);
 oneadder f2 (x[2],yneg[2],c[1],s[2],c[2]);
 oneadder f3 (x[3],yneg[3],c[2],s[3],cout);
endmodule
