
module outp(out, saidaUla, mil, cent, dez, uni);

input out;
input [31:0] saidaUla;
output reg[3:0] mil, cent, dez, uni;
integer i;

always @ (saidaUla) begin
if(out == 1)
begin
		mil = 4'b0000;
		cent = 4'b0000;
		dez = 4'b0000;
		uni = 4'b0000;
		
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
else 
	begin
      mil = 4'b0000;
		cent = 4'b0000;
		dez = 4'b0000;
		uni = 4'b0000;
	end
end

endmodule

/*
module outp(out, saidaUla, mil, cent, dez, uni);

input out;
input [31:0] saidaUla;
output reg[3:0] mil, cent, dez, uni;
integer i;

always @ (saidaUla) begin
//if(out == 1)
//begin
		mil = 4'b0000;
		cent = 4'b0000;
		dez = 4'b0000;
		uni = 4'b0000;
		
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
//else 
//	begin
 //     mil = 4'b0000;
//		cent = 4'b0000;
//		dez = 4'b0000;
//		uni = 4'b0000;
//	end
//end

endmodule
*/