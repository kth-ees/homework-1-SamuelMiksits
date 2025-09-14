`timescale 1ns/1ns


module bin2bcd (
	input	logic [3:0] binary,
	output	logic [3:0] bcd,
	output	logic carry
);


	// LUTs for muxes
	
	// LUT for bcd
	logic [15:0][3:0] lut_bcd;

	always_comb begin
		lut_bcd[4'b0000] = 4'b0000;
		lut_bcd[4'b0001] = 4'b0001;
		lut_bcd[4'b0010] = 4'b0010;
		lut_bcd[4'b0011] = 4'b0011;
		lut_bcd[4'b0100] = 4'b0100;
		lut_bcd[4'b0101] = 4'b0101;
		lut_bcd[4'b0110] = 4'b0110;
		lut_bcd[4'b0111] = 4'b0111;
		lut_bcd[4'b1000] = 4'b1000;
		lut_bcd[4'b1001] = 4'b1001;
		lut_bcd[4'b1010] = 4'b0000;
		lut_bcd[4'b1011] = 4'b0001;
		lut_bcd[4'b1100] = 4'b0010;
		lut_bcd[4'b1101] = 4'b0011;
		lut_bcd[4'b1110] = 4'b0100;
		lut_bcd[4'b1111] = 4'b0101;
	end
	
	// LUT for carry
	logic [15:0] lut_carry = '0;
	// Set 10 and above to carry 1, all other are 0
	always_comb begin
		lut_carry[4'b1010] = 1;
		lut_carry[4'b1011] = 1;
		lut_carry[4'b1100] = 1;
		lut_carry[4'b1101] = 1;
		lut_carry[4'b1110] = 1;
		lut_carry[4'b1111] = 1;
	end

	mux16to1x4 mux_bcd(
		.a(lut_bcd),
		.s(binary),
		.c(bcd)
	);

	mux16to1 mux_carry(
		.a(lut_carry),
		.s(binary),
		.c(carry)
	);	


endmodule

module mux16to1 (
	input	logic [15:0] a,
	input	logic [3:0]  s,
	output	logic c
);

	// Use array indexing
	assign c = a[s];

endmodule


// Alternative version where every pin can "drive" 4 inputs
module mux16to1x4 (
	input logic [15:0][3:0] a,
	input logic [3:0] s,
	output logic [3:0] c
);
	
	// Same as before, but this time every slice contains 4 bits
	assign c = a[s];

endmodule
