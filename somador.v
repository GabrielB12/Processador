module somador(a, b, saida); //soma duas entradas quaisquer(full adder)

input [31:0] a, b;
output reg [31:0] saida;

always @(*) 
begin
	saida = a + b;
end

endmodule 