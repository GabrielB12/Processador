module extInput(saida, entIn, inp);

input [17:0] entIn;
input wire inp;
output reg [31:0] saida; 

always @(*)
begin
	if(inp == 1)
	begin
			 saida = { {14{entIn[17]}}, entIn};
	end
		  
end

endmodule
