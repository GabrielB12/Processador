
module instructionMemory(clk, endentrada, saida);

input clk;
input [31:0] endentrada;
output [31:0] saida;

reg[31:0] mem[269:0]; //memória
//reg[31:0] temp[127:0]; //memória
//reg[31:0] mem[0:63];
integer i;
integer j = 0;
integer aux = 0;

always@(posedge clk) 
begin
	if(aux == 0)
	begin
		/*
		// Leitura do arquivo em uma variavel auxiliar
		$readmemb("cod_binario.txt", temp);
		// LAÇO PARA LER O ARQUIVO EM POSIÇOES DE 4 EM 4 
		for(i = 0; i < 127; i = i + 1)
		begin
			mem[j] = temp[i];
			j = j + 4;
		end
		*/

mem[	0	]=32'b	10110000000000000000000000000000	;

		/*
		mem[0] = 32'b00001_00000_00001_00000000000000001; //R1 = R0 + 1
		mem[4] = 32'b00001_00000_00010_00000000000000010; //R2 = R0 + 2
		mem[8] = 32'b10010_00010_00001_00011_000000000000; // R3 = R2 > R1
		mem[12] = 32'b10100_00011_00000_00000000000000001; //beqz r3
		mem[16] = 32'b01000_000000000000000000000000110; // jump p/ 24
		mem[20] = 32'b00001_00000_00001_00000000000000011; //R1 = R0 + 3
		mem[24] = 32'b10000_00000_00000_00000000000000000; // halt
		*/
		
		/*
		mem[0] = 32'b00001_00000_00001_00000000000000001; //R1 = R0 + 1
		mem[4] = 32'b00001_00000_00010_00000000000000001; //R2 = R0 + 1
		mem[8] = 32'b00000_00010_00001_00011_000000000000; // R3 = R2 + R1
		mem[12] = 32'b01111_00010_00001_00000000000000000; //R1 = R2
		mem[16] = 32'b01111_00011_00010_00000000000000000; //R2 = R3
		mem[20] = 32'b10011000000001100000000000000000; // instrução de output
		mem[24] = 32'b01000_000000000000000000000000010; //jump para [8]
		*/

	aux = 1; // parar a execução
	end
	
end

assign saida = mem[endentrada];

endmodule



