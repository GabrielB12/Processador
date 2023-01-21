module mux3(sel, enta, entb, entc, saida);

input sel;
input [31:0] enta, entb;

output reg [31:0] saida;

always@(*)
begin
	case(sel[1:0])
        2'b00: saida = enta;
        2'b01: saida = entb;
        2'b10: saida = entc;
	endcase
end

endmodule
