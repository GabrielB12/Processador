module unidadeControle(opcode, reset, condicional, aluCtrl, escolhaReg, origemEscrita, imediato, memWrite, memRead, regWrite, comp, out, inp, escolheExt);

input [4:0] opcode;

//SINAIS DE SAÍDA
output reg [2:0] condicional; //10 - jump e 01 - branch
output reg [2:0] aluCtrl; //ula recebe
output reg escolhaReg; //escrita ou no RT(1) ou no RD(0)
output reg imediato; //1 de a operação for com o imediato, 0 se for com o RT
output reg origemEscrita; // se vem da ula ou da memória
output reg memWrite; //se existe escrita
output reg memRead; // se existe leitura
output reg regWrite; //se existe escrita nos registradores
output reg reset; //resetar propriamente
output reg [2:0] comp; // flag para indicar para a ULA que a operaçao eh de comparaçao
output reg out; // indica que haverá impressao da saída
output reg inp; // indica que haverá leitura da entrada
output reg escolheExt; // escolhe entre duas entradas para o extensor de bit

always @(opcode) 
begin 
	case(opcode)
		5'b00000: //add
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b000; //código da soma
			escolhaReg = 0; // escreve em RD
			imediato = 0; // não usa imediato, e sim RT
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b00001: //addi
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b000; //código da soma
			escolhaReg = 1; // escreve em RT
			imediato = 1; // usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b00010: //sub
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b001; //código da subtração
			escolhaReg = 0; // escreve em RD
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b00011: //subi
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b001; //código da subtração
			escolhaReg = 1; // escreve em RT
			imediato = 1; // usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b00100: //or
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b011; //código do "ou"
			escolhaReg = 0; // escreve em RD
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b00101: //ori
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b000; //código do "ou"
			escolhaReg = 1; // escreve em RT
			imediato = 1; // usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b00110: //and
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b010; //código do "e"
			escolhaReg = 0; // escreve em RD
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b00111: //andi
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b010; //código do "e"
			escolhaReg = 1; // escreve em RT
			imediato = 1; // usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b01000: //jump (ula = 111)
		begin
			condicional = 2'b01; //tem jump 
			aluCtrl = 3'b111; //código do "move"
			escolhaReg = 1; // escreve em RT
			imediato = 1; // usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 0; //não escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b01001: //lw
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b000; //código de soma
			escolhaReg = 1; // escreve em RT
			imediato = 1; // usa imediato
			origemEscrita = 0; //valor vem da MEMÓRIA
			memWrite = 0; //não escreve na memória
			memRead = 1; //le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b01010: //sw
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b000; //código de soma
			escolhaReg = 1; // escreve em RT
			imediato = 1; // usa imediato
			origemEscrita = 0; //valor vem da MEMÓRIA
			memWrite = 1; //escreve na memória
			memRead = 0; //não le da memória
			regWrite = 0; //não escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b01011: //mult(ula = 100)
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b100; //código de multiplicação
			escolhaReg = 0; // escreve em RD
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b01100: //multi(ula = 100)
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b100; //código de multiplicação
			escolhaReg = 1; // escreve em RT
			imediato = 1; // usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b01101: //beq(ula = 101)
		begin
			condicional = 2'b10; //tem branch
			aluCtrl = 3'b111; //código do branch
			escolhaReg = 1; // escreve em RT
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 0; //não escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b001; // compara 1
			out = 0;
			inp = 0;
			escolheExt = 0;
 		end
		
		5'b01110: //bneq(ula = 110)
		begin
			condicional = 2'b10; //tem branch
			aluCtrl = 3'b111; //código do branch
			escolhaReg = 1; // escreve em RT
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 0; //não escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b010; // compara 1
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b01111: //move(ula = 111)
		begin
			condicional = 2'b00; //nao tem branch nem jump
			aluCtrl = 3'b111; //código do move
			escolhaReg = 1; // escreve em RT 
			imediato = 1; // usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b10000: //halt
		begin
			condicional = 2'b00; //nao tem branch nem jump
			aluCtrl = 3'b111; //código do move
			escolhaReg = 0; // escreve em RD
			imediato = 0; // nao usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 1; //reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b10001: //slt
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b111; //código do move
			escolhaReg = 0; // escreve em RD
			imediato = 0; // não usa imediato, e sim RT
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b100; // compara 3
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b10010: //sgt
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b111; //código do move
			escolhaReg = 0; // escreve em RD
			imediato = 0; // não usa imediato, e sim RT
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b011; // compara 3
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b10011: //out
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b000; //código da soma
			escolhaReg = 1; // escreve em RT
			imediato = 1; // usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 0; //nao escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 1;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b10100: // beqz
		begin
			condicional = 2'b10; //tem branch
			aluCtrl = 3'b111; //código do branch
			escolhaReg = 0; // escreve em RD // VERIFICAR
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 0; //não escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b101; // compara 5
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b10101: //div
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b111; //código de multiplicação
			escolhaReg = 0; // escreve em RD
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b110; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b10110: //nop
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b111; //código de multiplicação
			escolhaReg = 1; // escreve em RD
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 0; //nao escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b10111: // beqo - equal one
		begin
			condicional = 2'b10; //tem branch
			aluCtrl = 3'b111; //código do branch
			escolhaReg = 1; // escreve em RT
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 0; //não escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b111; // compara 6
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
		5'b11000: // input
		begin
			condicional = 2'b00; //não  tem branch
			aluCtrl = 3'b111; //código do branch
			escolhaReg = 1; // escreve em RT
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 1; //escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // compara 6
			out = 0;
			inp = 1; // tem entrada
			escolheExt = 1;
		end
		
		default:
		begin
			condicional = 2'b00; //não tem jump ou branch
			aluCtrl = 3'b111; //código do move
			escolhaReg = 1; // escreve em RD
			imediato = 0; // não usa imediato
			origemEscrita = 1; //valor vem da ULA
			memWrite = 0; //não escreve na memória
			memRead = 0; //não le da memória
			regWrite = 0; //nao escreve nos registradores
			reset = 0; //não reseta
			comp = 3'b000; // nao compara
			out = 0;
			inp = 0;
			escolheExt = 0;
		end
		
	endcase
end

endmodule 