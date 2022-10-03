module Extensor(entrada, entIn, saida, sel);

input sel;
input [16:0] entrada;
input [17:0] entIn;
output reg [31:0] saida;
 
 always @(*)
 begin
	case(sel)
	1'b0:
		begin
			//saida[31:16]=16'b000000000000000; //coloca 
			saida = {15'b0, entrada};
		end
	1'b1:
		begin
			saida = { {14{entIn[17]}}, entIn};
		end
	endcase
		
  //saida[15:0]=entrada[15:0]; //os 16 bits da entrada ficam os mesmos
  
end

endmodule 