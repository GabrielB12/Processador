
module instructionMemory(clk, endentrada, saida);

input clk;
input [31:0] endentrada;
output [31:0] saida;

reg[31:0] mem[999:0];

initial
	begin
		$readmemb("SO-teste.txt", mem, 0, 616);
		$readmemb("prog1.txt", mem, 617, 722);
		$readmemb("prog2.txt", mem, 723, 770);
		$readmemb("prog3.txt", mem, 771, 825);
	end

always @ (posedge clk)
	begin
		saida = mem[endentrada];
	end

endmodule



