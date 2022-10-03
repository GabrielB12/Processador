module testeRegistradores(clk, entradaTeste, leitura1, leitura2, escrita, regWrite, dataWrite, RS, RT, saidaWrite);

input clk, regWrite;
input wire [4:0] escrita; // endereços de leitura e escrita
input wire [4:0] leitura1;
input wire [4:0] leitura2;
input [31:0] entradaTeste;
input [31:0] dataWrite;

output [31:0] RS, RT, saidaWrite;

reg[31:0] registradores[31:0];

//parameter[4:0] teste1 = leitura1;

//assign registradores[leitura1] = entradaTeste;

assign RS = registradores[leitura1];
assign RT = registradores[leitura2];

always @ (posedge clk)
begin
	if(regWrite == 1)
	begin
		registradores[escrita] = dataWrite;
	end
end

assign saidaWrite = registradores[escrita];

endmodule
