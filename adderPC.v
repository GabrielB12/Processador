module adderPC(endereco, saida);

input [31:0] endereco;
output [31:0] saida;

assign saida = endereco + 32'd4; //PC + 4 

endmodule 