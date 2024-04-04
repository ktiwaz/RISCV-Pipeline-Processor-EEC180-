module DATA_MEM(
	
	input [7:0] address,
	input MemWrite,
	input MemRead,
	//input access_mem,
	input [31:0] WRITE_DATA,
	input clk,
	output reg [31:0] DATA
);

(* ram_init_file = "DATA_mem.mif" *) reg [31:0] d_MEM [255:0] /* synthesis ramstyle = "M9K" */;

always @(negedge clk) begin
	DATA = 32'b0;
	if (MemWrite) begin
		d_MEM[address] <= WRITE_DATA;
	end
	else if (MemRead) begin
		DATA <= d_MEM[address];
	end
end


endmodule

