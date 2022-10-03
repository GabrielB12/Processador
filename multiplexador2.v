module multiplexador2(sel, enta, entb, saida);

input sel;
input [31:0] enta, entb;

output reg [31:0] saida;

always@(*)
begin
	case(sel)
		1'b0:
			saida = enta;
		1'b1:
			saida = entb;
		default: begin saida = enta; end
	endcase
end

endmodule
