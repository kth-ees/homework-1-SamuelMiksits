`timescale 1ns/1ns

module multiplier #(parameter N) (
	input	logic [N-1:0] a,b,
	output	logic [2*N-1:0] product
);

	// Signed this time, need to have sign extension for every row
	logic [N-1:0][2*N-1:0] s;
	logic [N-1:0][2*N-1:0] c;
	logic [N-1:0][2*N-1:0] pp; //propagate product

	logic [2*N-1:0] a_ext;
	logic [2*N-1:0] b_ext;
	logic [2*N-1:0] a_ext_neg; //2's complement of b
	logic [2*N-1:0] a_ext_neg_tmp;


	genvar i, j;
	generate
		
	 	// Initialize sign extended version of a/b
		assign a_ext[N-1:0] = a[N-1:0];
		assign b_ext[N-1:0] = b[N-1:0];
		
		for (i = N; i < 2*N; i++) begin
			assign a_ext[i] = a[N-1];
			assign b_ext[i] = b[N-1];
		end

		// Create negative version
		for (i = 0; i < 2*N; i++) begin
			assign a_ext_neg_tmp[i] = ~a_ext[i]; 
		end
		
		logic [2*N-1:0] carry_chain;

		// After complementing all the bits, add 1
		half_adder HA_COMPLEMENT(
			.a(a_ext_neg_tmp[0]),
			.b(1'b1),
			.s(a_ext_neg[0]),
			.c_out(carry_chain[0])
		);

		for (i = 1; i < 2*N; i++) begin
			half_adder HA_COMPLEMENT(
				.a(a_ext_neg_tmp[i]),
				.b(carry_chain[i-1]),
				.s(a_ext_neg[i]),
				.c_out(carry_chain[i])
			);
		end


		// First output, outside loop
		and A1(s[0][0], a_ext[0], b_ext[0]);
		assign product[0] = s[0][0];
		
		// unsigned version
		
		// Treat "left" operand as "sum in", right operand as product
		// Need to start generating sum in for first row
		for (i = 1; i < N; i++) begin : first_row
			and A_tmp(s[0][i], a_ext[i], b_ext[0]); 
		end
		

		// sign extension
		for (i = N; i < 2*N; i++) begin
			assign s[0][i] = s[0][N-1];
		end

		assign c[0] = '0;

		// Multiplication
		for (i = 1; i < N-1; i++) begin : loop1
			// First column, carry in 0
			half_adder HA1(
					.s(s[i][0]),
				   	.a(s[i-1][1]),
				    .b(a_ext[0] & b_ext[i]),
					.c_out(c[i][0]));
			
			// Middle columns
			for (j = 1; j < 2*N-1; j++) begin : loop2
				full_adder FA1(
					.s(s[i][j]),
				   	.a(s[i-1][j+1]),
				    .b(a_ext[j] & b_ext[i]),
					.c_in(c[i][j-1]),
					.c_out(c[i][j]));
			end

			// Last column (leftmost), take sum in from carry in from row
			// above
			full_adder FA2(
					.s(s[i][2*N-1]),
				   	.a(c[i-1][2*N-1]),
				    .b(a_ext[2*N-1] & b_ext[i]),
					.c_in(c[i][2*N-2]),
					.c_out(c[i][2*N-1]));
			
		end	

		// Last row, select negative a. Reason for this:
		// If b is positive, then that means the top bit is 0, so the whole
		// row of partial products will be zero. If b is negative, then select
		// complement of a, which result in always having complement of
		// a being correct
		// First column, carry in 0
		half_adder HA1(
				.s(s[N-1][0]),
			   	.a(s[N-2][1]),
			    .b(a_ext_neg[0] & b_ext[N-1]),
				.c_out(c[N-1][0]));
		
		// Middle columns
		for (j = 1; j < 2*N-1; j++) begin : loop2
			full_adder FA1(
				.s(s[N-1][j]),
			   	.a(s[N-2][j+1]),
			    .b(a_ext_neg[j] & b_ext[N-1]),
				.c_in(c[N-1][j-1]),
				.c_out(c[N-1][j]));
		end

		// Last column (leftmost), take sum in from carry in from row
		// above
		full_adder FA2(
				.s(s[N-1][2*N-1]),
			   	.a(c[N-2][2*N-1]),
			    .b(a_ext_neg[2*N-1] & b_ext[N-1]),
				.c_in(c[N-1][2*N-2]),
				.c_out(c[N-1][2*N-1]));
						
		// Route sum outputs to output
		
		//"Diagonal" (N-1 first elements)
		for (i = 1; i < N; i++) begin
			assign product[i] = s[i][0];
		end
		
		//Bottom row (N-1 last elements)
		for (i = 1; i < N; i++) begin
			assign product[i+N-1] = s[N-1][i];
		end

		//Last element (carry out to result)
		assign product[2*N-1] = s[N-1][N];

	endgenerate

endmodule
