module Ula(sel, enta, entb, resultado, zero, comp);

input[31:0] enta;
input[31:0] entb;
input[2:0] sel;
input[2:0] comp;

output zero;
output reg[31:0] resultado;

always @(enta or entb or sel or comp) 
begin
	case (sel[2:0])
		3'b000: resultado = enta + entb; //add
		3'b001: resultado = enta - entb; //sub
		3'b010: resultado = enta & entb; //and
		3'b011: resultado = enta | entb; //or
		3'b100: resultado = enta * entb; //mult
		3'b111: resultado = enta; //move-jump
		default: begin resultado = resultado; end
		endcase
		case(comp[2:0])
		3'b000: 
		begin //nada
					resultado = resultado;
		end
		3'b001: 
		begin //beq
			if((enta - entb) == 0)
				begin
					resultado = 32'b0;
				end
		end
		3'b010: 
		begin //bneq
			if((enta - entb) != 0)
				begin
					resultado = 32'b0;
				end
		end
		3'b011: 
		begin //sgt
					resultado = (enta < entb) ? 32'b0: 1'b1;
		end
		3'b100: 
		begin //slt
					resultado = (enta > entb) ? 32'b0: 1'b1;
		end
		3'b101:
		begin //beqz
			if((enta - 0) == 0)
				begin
					resultado = 32'b0;
				end
			else
				begin
					resultado = 1'b1;
				end
		end
		3'b111: 
		begin //beqo
			if(enta == 1)
				begin
					resultado = 32'b0;
				end
		else
				begin
					resultado = 1'b1;
				end
		end
		default:
		begin
			resultado = resultado;
		end
		//3'b110: resultado = enta / entb; // div
	endcase
end

assign zero = (resultado==32'b0) ? 1'b1: 1'b0;

endmodule
