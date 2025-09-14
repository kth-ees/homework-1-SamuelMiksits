`timescale 1ns/1ns

module bin2bcd_tb;

    logic [3:0] tb_binary = '0; 
    logic [3:0] tb_bcd;
	logic tb_carry;

	bin2bcd uut(
		.binary(tb_binary),
		.bcd(tb_bcd),
		.carry(tb_carry)
	);

    initial begin

		#50 tb_binary = 4'b0000;
		#50 assert(tb_bcd == 4'b0000 && tb_carry == 0);
		#50 tb_binary = 4'b0001;
		#50 assert(tb_bcd == 4'b0001 && tb_carry == 0);
		#50 tb_binary = 4'b0010;
		#50 assert(tb_bcd == 4'b0010 && tb_carry == 0);
		#50 tb_binary = 4'b0011;
		#50 assert(tb_bcd == 4'b0011 && tb_carry == 0);
		#50 tb_binary = 4'b0100;
		#50 assert(tb_bcd == 4'b0100 && tb_carry == 0);
		#50 tb_binary = 4'b0101;
		#50 assert(tb_bcd == 4'b0101 && tb_carry == 0);
		#50 tb_binary = 4'b0111;
		#50 assert(tb_bcd == 4'b0111 && tb_carry == 0);
		#50 tb_binary = 4'b1000;
		#50 assert(tb_bcd == 4'b1000 && tb_carry == 0);
		#50 tb_binary = 4'b1001;
		#50 assert(tb_bcd == 4'b1001 && tb_carry == 0);
		#50 tb_binary = 4'b1010;
		#50 assert(tb_bcd == 4'b0000 && tb_carry == 1);
		#50 tb_binary = 4'b1011;
		#50 assert(tb_bcd == 4'b0001 && tb_carry == 1);
		#50 tb_binary = 4'b1100;
		#50 assert(tb_bcd == 4'b0010 && tb_carry == 1);
		#50 tb_binary = 4'b1101;
		#50 assert(tb_bcd == 4'b0011 && tb_carry == 1);
		#50 tb_binary = 4'b1110;
		#50 assert(tb_bcd == 4'b0100 && tb_carry == 1);
		#50 tb_binary = 4'b1111;
		#50 assert(tb_bcd == 4'b0101 && tb_carry == 1);
        #50 $stop;
    end;

endmodule
