module deslocador(entPC, entSum, saida);

input [31:0] entPC;
input [25:0] entSum;
output reg [31:0] saida;

always@ (*)
begin
		saida = {entPC[31:28], entSum[25:0], 2'b00};
		//saida[27:2] = entSum[25:0];
		//saida[1:0] = 2'b00;
		//saida[31:28] = entPC[3:0];
end
 
endmodule 

