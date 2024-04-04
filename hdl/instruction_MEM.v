module instruction_MEM(
	input [7:0] PC,
	input clk,
	output reg [31:0] instruction
);

(* ram_init_file = "instruction_mem.mif" *) reg [7:0] i_MEM [255:0] /* synthesis ramstyle = "M9K" */;

always @(PC) begin 
	instruction = {i_MEM[PC],i_MEM[PC + 8'h01],i_MEM[PC + 8'h02],i_MEM[PC + 8'h03]};
end
endmodule


