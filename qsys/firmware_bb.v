
module firmware (
	clk_clk,
	pio_out_export,
	reset_reset_n);	

	input		clk_clk;
	output	[31:0]	pio_out_export;
	input		reset_reset_n;
endmodule
