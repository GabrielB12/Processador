module seletor(sel, zero, endAtual, endJump, endDesvio, saida);

input [2:0] sel;
input zero;
input [31:0] endAtual, endJump, endDesvio;

output reg [31:0] saida;

always @(*) begin
	case(sel)
		2'b00:
		begin
			saida = endAtual; //normal, não faz "nada"
		end
		
		2'b01: //jump é tomado
		begin
			saida = endJump;
		end
		
		2'b10:
		begin
			if(zero == 1) //branch é tomado
			begin
				saida = endDesvio;
			end
			
			else
			begin
				saida = endAtual;
			end
		end
		
		default: begin saida = endAtual; end
		
	endcase
end

endmodule
