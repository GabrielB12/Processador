module bancoRegistradores(clk, leitura1, leitura2, escrita, regWrite, dataWrite, RS, RT, RD);

input clk, regWrite;
input [4:0] escrita, leitura1, leitura2; // endereços de leitura e escrita
input [31:0] dataWrite;

output [31:0] RS, RT, RD;

reg[31:0] registradores[31:0];


always @ (posedge clk)
begin
	if(regWrite == 1)
	begin
		registradores[escrita] = dataWrite;
	end
end


assign RS = registradores[leitura1];
assign RT = registradores[leitura2];
assign RD = registradores[escrita];

endmodule

