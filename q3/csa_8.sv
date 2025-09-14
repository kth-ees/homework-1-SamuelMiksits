`timescale 1ns/1ns

module csa_8 (
	input	logic [7:0] A, B,
	output	logic [7:0] sum,
	output 	logic carry
);


	// Temporary sums from upper slice for carry in 0/1
	logic [3:0] s0;
	logic [3:0] s1;

	// Temporary carries from upper slice for carry in 0/1
	logic c0;
	logic c1;
	
	// Carry from lower 4 bit slice
	logic c3;

	// First 4 bit adder, lower output
	adder_4 adder30(
		.A(A[3:0]),
		.B(B[3:0]),
		.ci(1'b0),
		.sum(sum[3:0]),
		.carry(c3)
	);
	
	// Top 4 bits, carry in 0
	adder_4 adder74_0(
		.A(A[7:4]),
		.B(B[7:4]),
		.ci(1'b0),
		.sum(s0),
		.carry(c0)
	);

	// Top 4 bits, carry in 1
	adder_4 adder74_1(
		.A(A[7:4]),
		.B(B[7:4]),
		.ci(1'b1),
		.sum(s1),
		.carry(c1)
	);
	
	// Mux that selects the output sum
	mux2to1x4 mux_sum(
		.a(s0),
		.b(s1),
		.s(c3),
		.c(sum[7:4])
	);

	// Mux that selects the carry
	mux2to1 mux_carry(
		.a(c0),
		.b(c1),
		.s(c3),
		.c(carry)
	);


endmodule

module mux2to1 (
	input	logic a,
	input	logic b,
	input	logic s,
	output	logic c
);

	assign c = (~s & a) | (s & b);

endmodule

// Same as the one above, but a and b can drive 4 bits
module mux2to1x4 (
	input	logic [3:0] a,
	input	logic [3:0] b,
	input	logic s,
	output	logic [3:0] c
);

	assign	c = (s == 0) ? a :
	   			(s == 1) ? b :
				4'bx;

endmodule
