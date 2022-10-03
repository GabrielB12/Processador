module outp(out, saidaUla, mil, cent, dez, uni);

// TODO: arrumar o halt para mostrar o output

input out;
input [31:0] saidaUla;

// servem para manter o estado do output
reg[3:0] mil, cent, dez, uni;

// saidas
output reg [3:0] mil_, cent_, dez_, uni_;

integer i;

initial 
begin
		mil = 4'b1111;
		cent = 4'b1111;
		dez = 4'b1111;
		uni = 4'b1111;
end

//TODO: verificar o always daqui
always @ (saidaUla) begin
if(out == 1)
begin
		//mil = 4'b0000;
		//cent = 4'b0000;
		//dez = 4'b0000;
		//uni = 4'b0000;
		
		// Tamanho total (4*4 = 16)
		for(i = 15; i >= 0; i = i-1) 
		begin
			if(mil >= 5) mil = mil + 4'd3;
			if(cent >= 5) cent = cent + 4'd3;
			if(dez >= 5) dez = dez + 4'd3;
			if(uni >= 5) uni = uni + 4'd3;
			mil = mil << 1;
			mil[0] = cent[3];				
			cent = cent << 1;
			cent[0] = dez[3];
			dez = dez << 1;
			dez[0] = uni[3];
			uni = uni << 1;
			uni[0] = saidaUla[i];
		end

	end
/*
else 
	begin
      mil = 4'b0000;
		cent = 4'b0000;
		dez = 4'b0000;
		uni = 4'b0000;
	end
	*/
end

assign uni_ = uni;
assign dez_ = dez;
assign cent_ = cent;
assign mil_ = mil;

endmodule