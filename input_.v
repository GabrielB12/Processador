module input_(switch, escreveInput, btn, haltIn, saida);

input wire [17:0] switch; //  botões para a entrada
input wire escreveInput; // flag da UC
input wire btn; // botão a ser pressionado para fazer a leitura

output reg haltIn;
output reg [17:0] saida; //  valor de saída, para ser colocado em um registrador

always @(*)
begin
	saida <= switch;
    if (escreveInput == 1 && btn == 1)
	 begin
        saida <= switch; // recebve o valor dos switchs
		  haltIn <= 0;
    end
	 else if(escreveInput == 1 && btn == 0)
	 begin
        saida <= 18'b0; // se o botão não estiver pressionado o valor é 0
		  haltIn <= 1; // para o divisor de frequência segurar
    end

end

endmodule