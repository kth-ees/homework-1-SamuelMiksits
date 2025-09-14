module full_adder (
  input logic a,b,c_in,
  output logic c_out, s
);
  logic s1,c1,c2;
  // The full adder in the skeleton is wrong, how could this happen to me? 
  // :(
  //half_adder ha1(a, b, s1, c1);
  //half_adder ha2(s1, c_in, c2, s);
  half_adder ha1(.a(a), .b(b), .s(s1), .c_out(c1));
  half_adder ha2(.a(s1), .b(c_in), .s(s), .c_out(c2));
  assign c_out = c1|c2;
endmodule
