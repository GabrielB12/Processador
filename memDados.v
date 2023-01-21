module memDados(clk, dados, memWrite, memRead, saidaDados, posicao, posAtual, saidaPC, endAtual);

input clk, memWrite, memRead;
input [31:0] posicao;
input [31:0] dados;
input [31:0] endAtual;
input wire posAtual; // saber se o programa acabou

output [31:0] saidaDados;
output wire [31:0] saidaPC;

reg[31:0] memoria[63:0];
reg[31:0] auxPC;

always @(posedge clock) begin
    if (flagPC == 1) begin
        auxPC <= endAtual; //salva o valor atual do PC
    end
end

always @(posedge clk)
begin
	if(memWrite == 1) //escrita
	begin
		memoria[posicao] = dados;
	end
end

assign saidaPC = auxPC;
assign saidaDados = memoria[posicao];

endmodule

