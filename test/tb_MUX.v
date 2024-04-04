module tb_MUX;

	reg clk;
	reg [31:0] a;
	reg [31:0] b;
	reg s;
	
	wire [31:0] out;
	
MUX UUT (
	.clk(clk),
	.a(a),
	.b(b),
	.s(s),
	.out(out)
);

initial begin
	a = 32'b1;
	b = 32'b0;
	s = 1'b0;
	#20;
	s = 1'b1;
		
end
endmodule