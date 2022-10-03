module divClk(entClk, halt, saidaClk);

input entClk;
input halt;

output reg saidaClk;

reg [27:0] cont = 28'd0;
parameter div = 28'd1;

always @(posedge entClk) 
begin
    if (halt) 
	 begin
        cont = cont;
        saidaClk = saidaClk;
    end
	 
	 else 
	 begin
        cont = cont + 28'b1;
        if (cont >= div) 
		  begin
            cont = 28'b0;
            saidaClk = ~saidaClk;
        end
    end
end

endmodule 