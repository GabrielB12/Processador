module outp(escrever, entrada, clock, milS,centS,dezS,uniS);

input [31:0] entrada;
input wire clock;
input wire escrever;

// servem para manter o estado do output
reg [3:0] uni;
reg [3:0] dez;
reg [3:0] cent;
reg [3:0] mil;

output [3:0] uniS;
output [3:0] dezS;
output [3:0] centS;
output [3:0] milS;

integer i;

initial begin
    uni = 4'b1111;
    dez = 4'b1111;
    cent = 4'b1111;
    mil = 4'b1111;
end

always @(*) begin

	uni = 4'b0000;
    dez = 4'b0000;
    cent = 4'b0000;
    mil = 4'b0000;

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
			uni[0] = entrada[i];
		end
end

assign uniS = uni;
assign dezS = dez;
assign centS = cent;
assign milS = mil;

endmodule