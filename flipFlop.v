module flipFlop(clk, ent, sel, saida);

input clk;
input ent;
input sel;

output reg saida;

always @(posedge clk)
begin
	if(sel) begin
		saida = ent;
	end
end

endmodule
