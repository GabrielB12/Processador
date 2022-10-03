module memDados(clk, dados, memWrite, memRead, saidaDados, posicao);

input clk, memWrite, memRead;
input [31:0] posicao;
input [31:0] dados;

output [31:0] saidaDados;

reg[31:0] memoria[63:0];

always @(posedge clk)
begin
	if(memWrite == 1) //escrita
	begin
		memoria[posicao] = dados;
	end
	/*
	if(memRead == 1) //apens leitura
	begin
		saidaDados = memoria[posicao];
	end
	*/
end

assign saidaDados = memoria[posicao];

endmodule

