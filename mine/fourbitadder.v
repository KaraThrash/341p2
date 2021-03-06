module fulladder(a,b,c,s,cout);
input a,b,c;
output s,cout;
wire w1, w2, w3, w4, s, cout;

xor g1(w1, a, b);
xor g2(s, w1, c);
 and g3(w2, c, b);
 and g4(w3, c, a);
 and g5(w4, a, b);
or g6(cout, w2, w3, w4);

endmodule
module fourbitadder(x,y,s,cout,cin);
input [3:0] x,y;
output [3:0] s;
input cin;
output cout;
wire c[3:0];
 fulladder f0 (x[0],y[0],cin,s[0],c[0]);
 fulladder f1 (x[1],y[1],c[0],s[1],c[1]);
 fulladder f2 (x[2],y[2],c[1],s[2],c[2]);
 fulladder f3 (x[3],y[3],c[2],s[3],cout);
endmodule
