module PC (clk, pcin, pcout, reset, condicional, qtm, flagQtm, final);

input clk, reset, flagQtm;
input [2:0] condicional; //01 é de jump
input [31:0] qtm;
input [31:0] pcin;
output reg [31:0] pcout;
output reg final;

reg [31:0] qAtual;
reg [31:0] limiteQ;

initial
begin //para que pc começe em 0, onde estará a primeira instrução
	pcout = 32'b0;
	qAtual = 32'b0;
	limiteQ = 32'b0;
	final = 0;
end

always @(posedge clock)
begin
    if (flagQtm == 1) // se haverá uso do quantum
	begin
        limiteQ = qtm;
    end
end

always@(posedge clk)
begin
	if(reset == 1) // halt
	begin
		pcout = pcout;
		qAtual = 32'b0;
		limiteQ = 32'b0;
		final = 1; // manda quando o programa acaba
	end

	else if(qAtual > limiteQ) // estouro de Quantum
	begin
		final = 0;
		qAtual = 32'b0; // zera o quantum
		pcout = 32'b0; // volta pra posição 0, ou seja, pro SO
	end

	// tratando o jump
	else if(condicional == 2'b01)
	begin
		if (pcout >= 687) // não é SO
		begin
			final = 0;
            qAtual = qAtual + 1; // incrementa o quantum
        end
		else
		begin
			final = 0;
            qAtual = 32'b0; // se tá no SO não aumenta o quantum
        end
	end

	else
	begin
		qAtual = 32'b0;
		pcout = pcin;
	end
end

endmodule