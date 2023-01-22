
module instructionMemory(clk, endentrada, saida);

input clk;
input [31:0] endentrada;
output [31:0] saida;

reg[31:0] mem[999:0];

initial
	begin
		$readmemb("SO-teste.txt", mem, 0, 687);
		$readmemb("prog1.txt", mem, 688, 793);
		$readmemb("prog2.txt", mem, 794, 840);
		$readmemb("prog3.txt", mem, 841, 895);
	end

always @ (posedge clk)
	begin
		saida = mem[endentrada];
	end

endmodule



