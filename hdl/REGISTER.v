module REGISTER(
	input clk,
	input [4:0] rs1,
	input [4:0] rs2,
	input [4:0] rd,
	output reg [31:0] REGISTER_1,
	output reg [31:0] REGISTER_2,

	input RegWrite,
	input MemToReg,
	//input rst,
	input [31:0] WRITE_BACK_DATA
);

(* ram_init_file = "Register.mif" *) reg [31:0] REGISTER [31:0] /* synthesis ramstyle = "M9K" */;
// reading
always @(posedge clk) begin
	REGISTER_1 = REGISTER[rs1];
	REGISTER_2 = REGISTER[rs2];
end
// writing
always @(negedge clk) begin
	if (RegWrite) begin
			REGISTER[rd] = WRITE_BACK_DATA;
	end
end

endmodule