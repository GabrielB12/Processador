module deslocador2(ent, saida);

input [31:0] ent;
output reg [31:0] saida;

always@ (*)

begin
	saida = {ent[29:0], 2'b00};
	//saida[31:2] = ent[29:0];
	//saida[1:0] = 2'b00;
end

endmodule 