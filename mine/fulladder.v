
module fulladder(a,b,c,s,cout);
input a,b,c;
output s,cout;
wire w1, w2, w3, w4, s, cout;
reg a, b, c;

xor g1(w1, a, b),
xor g2(s, w1, c);
 and g3(w2, c, b),
 and g4(w3, c, a),
 and g5(w4, a, b);
or g6(cout, w2, w3, w4);

endmodule
