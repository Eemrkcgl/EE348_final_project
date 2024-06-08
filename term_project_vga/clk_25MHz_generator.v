module clk_25MHz_generator(
	input clk,
	output reg clk_25MHz
);

always @(posedge clk) begin
	clk_25MHz <= ~ clk_25MHz;

end
endmodule
