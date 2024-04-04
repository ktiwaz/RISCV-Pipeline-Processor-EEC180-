module instruction_write_back (
	//input
	input clk,
	input [33:0] MEMWB,
	input [31:0] MEM_DATA,
	input [31:0] ALU_DATA,
	
	output reg [31:0] WRITE_BACK,
	//output reg RegWrite,
	output RegWrite,
	//output
	output [4:0] rd
);
assign RegWrite = MEMWB[32];
assign rd = MEMWB[11:7];

// choose the write back from ALU or MEMORY
always @(*) begin
	if (MEMWB[33]) begin
		WRITE_BACK = MEM_DATA;
	end
	else begin
		WRITE_BACK = ALU_DATA;
	end
end


endmodule