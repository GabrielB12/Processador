module PC(clk, pcin, pcout, reset);

input clk, reset;
input [31:0] pcin;
output reg [31:0] pcout;

initial 
begin //para que pc começe em 0, onde estará a primeira instrução
	pcout = 32'b0;
end

always@(posedge clk, posedge reset)
begin
	if(reset == 1) // halt
		pcout = pcout;
	else
		pcout = pcin;
end

endmodule 