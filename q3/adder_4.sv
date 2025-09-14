// Adding carry in, since the block diagram in assignment shows
// the adder_4 having them, so I feel like this code is wrong.
// Can otherwise implement this trivially with cascading
module adder_4 (
  input logic [3:0] A, B,
  input logic ci,
  output logic [3:0] sum,
  output logic carry
);
  assign {carry, sum} = A+B+ci;
endmodule
