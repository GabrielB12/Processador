module CPU(CLOCK_50, SW, KEY, instAtual, posicaoMem, outULA, zero, RT, RD, RS, HEX0, HEX1, HEX2, HEX3, printa, data);

wire clkSaida;
output reg [31:0] instAtual, posicaoMem, outULA, RS, RT, RD;
output reg [31:0] data;
output reg [0:6] HEX0, HEX1, HEX2, HEX3;
output reg zero;
output reg printa;

//fios para interligar os componentes
wire [31:0] pcin;
wire [31:0] endAtual;
wire [31:0] endSomapc;
wire [31:0] endSomabranch;
wire [31:0] endJump;
wire [31:0] saidaExtendida;
wire [31:0] saidaExtendidaInp;
wire [31:0] branchDeslocado;
wire [31:0] inst;
wire [31:0] writeData;
wire [31:0] ALUenter;
wire [31:0] endReg;
wire [31:0] regRS, regRT, regRD;
wire [31:0] escolhaUla;
wire [31:0] saidaUla;
wire [31:0] saidaDados;
wire [17:0] saidaIn;

//fios da unidade de controle
wire reset;
wire [2:0] condicional;
wire [2:0] aluCtrl;
wire escolhaReg;
wire origemEscrita;
wire imediato;
wire memWrite;
wire memRead;
wire regWrite;
wire out;
wire inp;
wire escolheExt;

wire haltIn;

//Para o sete-segmentos
wire a, b, c, d, e, f, g; //fios que conectarao no 7 segmentos
wire a2, b2, c2, d2, e2, f2, g2; //fios que conectarao no 7 segmentos
wire a3, b3, c3, d3, e3, f3, g3; //fios que conectarao no 7 segmentos
wire a4, b4, c4, d4, e4, f4, g4; //fios que conectarao no 7 segmentos
wire [3:0] mil, cent, dez, uni;


// beq, bneq, slt e sgt
wire [2:0] comp;

//clock
input wire CLOCK_50;

//botões
input wire [17:0] SW;
input wire [3:0] KEY;

//para branch
wire aluZero; 

//divisor de clock
divClk(CLOCK_50, haltIn, clkSaida);

//interligando os componentes
PC(clkSaida, pcin, endAtual, reset);

somador somaPC(endAtual, 32'd4, endSomapc); //pc + 4

somador somaBranch(endSomapc, branchDeslocado, endSomabranch);

deslocador deslocaJump(endSomapc, inst[25:0], endJump);// pega os 4 primeiros bits do pc e junta com os 26 da inst e move 2 pra esquerda

seletor mult(condicional, aluZero, endSomapc, endJump, endSomabranch, pcin); //multiplexador para escolher qual o end do pc

instructionMemory(clkSaida, endAtual, inst);

input_ inpt(SW, inp, KEY[3], haltIn, saidaIn);

Extensor(inst[16:0], saidaIn, saidaExtendida, escolheExt); // escolhe o que será extendido

deslocador2 deslocaBranch(saidaExtendida, branchDeslocado);

multiplexador2 multpReg(escolhaReg, inst[16:12], inst[21:17], endReg); //escolhe o registrador de escrita

bancoRegistradores banco(clkSaida, inst[26:22], inst[21:17], endReg, regWrite, writeData, regRS, regRT, regRD);

multiplexador2 multUla(imediato, regRT, saidaExtendida, escolhaUla); //escolhe ou o imediato ou o registrador

Ula(aluCtrl, regRS, escolhaUla, saidaUla, aluZero, comp);

multiplexador2 multOrigem(origemEscrita, saidaDados, saidaUla, writeData); //ou vem da Ula ou da memória

// Converte  valor desejado em unidade, dezena, centena e milhar, para os 4 dislpays de 7 segmentos
// RT ou RD ?
outp(out, regRT, mil, cent, dez, uni);

// Manda cada "casa" para um conversor BCD
bcd novoBCD (.W(uni[3]), .X(uni[2]), .Y(uni[1]), .Z(uni[0]),  .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));
bcd novoBCD2 (.W(dez[3]), .X(dez[2]), .Y(dez[1]), .Z(dez[0]),  .a(a2), .b(b2), .c(c2), .d(d2), .e(e2), .f(f2), .g(g2));
bcd novoBCD3 (.W(cent[3]), .X(cent[2]), .Y(cent[1]), .Z(cent[0]),  .a(a3), .b(b3), .c(c3), .d(d3), .e(e3), .f(f3), .g(g3));
bcd novoBCD4 (.W(mil[3]), .X(mil[2]), .Y(mil[1]), .Z(mil[0]),  .a(a4), .b(b4), .c(c4), .d(d4), .e(e4), .f(f4), .g(g4));

memDados(clkSaida, regRT, memWrite, memRead, saidaDados, saidaUla);

unidadeControle(inst[31:27], reset, condicional, aluCtrl, escolhaReg, origemEscrita, imediato, memWrite, memRead, regWrite, comp, out, inp, escolheExt);

always @ (*)
begin
	posicaoMem = endAtual;
	printa = out;
	outULA = saidaUla;
	instAtual = inst;
	zero = aluZero;
	data = saidaDados;
	RS = regRS;
	RT = regRT;
	RD = regRD;
	
	// Pinagem dos 4 displays de 7 segmentos
	{HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5], HEX0[6]} = {a, b, c, d, e, f, g}; //pinagem do display de 7 segmentos da unidade
	{HEX1[0], HEX1[1], HEX1[2], HEX1[3], HEX1[4], HEX1[5], HEX1[6]} = {a2, b2, c2, d2, e2, f2, g2}; //pinagem do display de 7 segmentos da dezena
	{HEX2[0], HEX2[1], HEX2[2], HEX2[3], HEX2[4], HEX2[5], HEX2[6]} = {a3, b3, c3, d3, e3, f3, g3}; //pinagem do display de 7 segmentos da centena
	{HEX3[0], HEX3[1], HEX3[2], HEX3[3], HEX3[4], HEX3[5], HEX3[6]} = {a4, b4, c4, d4, e4, f4, g4}; //pinagem do display de 7 segmentos de milhar
	
end

endmodule


/* ------------------------PARA TESTE NO FPGA REMOTO-------------------------------*/
/*
module CPU(SW, HEX0, HEX1, HEX2, HEX3);

//input clkSaida;
input wire [0:17] SW;
output reg [0:6] HEX0, HEX1, HEX2, HEX3;

//fios para interligar os componentes
wire [31:0] pcin;
wire [31:0] endAtual;
wire [31:0] endSomapc;
wire [31:0] endSomabranch;
wire [31:0] endJump;
wire [31:0] saidaExtendida;
wire [31:0] branchDeslocado;
wire [31:0] inst;
wire [31:0] writeData;
wire [31:0] ALUenter;
wire [31:0] endReg;
wire [31:0] regRS, regRT, regRD;
wire [31:0] escolhaUla;
wire [31:0] saidaUla;
wire [31:0] saidaDados;
wire [17:0] saidaIn;

//fios da unidade de controle
wire reset;
wire [2:0] condicional;
wire [2:0] aluCtrl;
wire escolhaReg;
wire origemEscrita;
wire imediato;
wire memWrite;
wire memRead;
wire regWrite;
wire out;

//Para o sete-segmentos

wire a, b, c, d, e, f, g; //fios que conectarao no 7 segmentos
wire a2, b2, c2, d2, e2, f2, g2; //fios que conectarao no 7 segmentos
wire a3, b3, c3, d3, e3, f3, g3; //fios que conectarao no 7 segmentos
wire a4, b4, c4, d4, e4, f4, g4; //fios que conectarao no 7 segmentos
wire [3:0] mil, cent, dez, uni;


// beq, bneq, slt e sgt
wire [2:0] comp;

//para branch
wire aluZero;

//interligando os componentes
PC(SW[0], pcin, endAtual, reset);

somador somaPC(endAtual, 4, endSomapc); //pc + 4

deslocador deslocaJump(endSomapc, inst[25:0], endJump);// pega os 4 primeiros bits do pc e junta com os 26 da inst e move 2 pra esquerda

somador somaBranch(endSomapc, branchDeslocado, endSomabranch);

seletor mult(condicional, aluZero, endSomapc, endJump, endSomabranch, pcin); //multiplexador para escolher qual o end do pc

instructionMemory(SW[0], endAtual, inst);

Extensor(inst[16:0], saidaIn, saidaExtendida, escolheExt);

deslocador2 deslocaBranch(saidaExtendida, branchDeslocado);

multiplexador2 multpReg(escolhaReg, inst[16:12], inst[21:17], endReg); //escolhe o registrador de escrita

bancoRegistradores banco(SW[0], inst[26:22], inst[21:17], endReg, regWrite, writeData, regRS, regRT, regRD);

multiplexador2 multUla(imediato, regRT, saidaExtendida, escolhaUla); //escolhe ou o imediato ou o registrador

Ula(aluCtrl, regRS, escolhaUla, saidaUla, aluZero, comp);

// Converte  valor desejado em unidade, dezena, centena e milhar, para os 4 dislpays de 7 segmentos
//outp(out, saidaUla, mil, cent, dez, uni);
// RT ou RD ?
outp(out, regRT, mil, cent, dez, uni);

// Manda cada "casa" para um conversor BCD
bcd novoBCD (.W(uni[3]), .X(uni[2]), .Y(uni[1]), .Z(uni[0]),  .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));
bcd novoBCD2 (.W(dez[3]), .X(dez[2]), .Y(dez[1]), .Z(dez[0]),  .a(a2), .b(b2), .c(c2), .d(d2), .e(e2), .f(f2), .g(g2));
bcd novoBCD3 (.W(cent[3]), .X(cent[2]), .Y(cent[1]), .Z(cent[0]),  .a(a3), .b(b3), .c(c3), .d(d3), .e(e3), .f(f3), .g(g3));
bcd novoBCD4 (.W(mil[3]), .X(mil[2]), .Y(mil[1]), .Z(mil[0]),  .a(a4), .b(b4), .c(c4), .d(d4), .e(e4), .f(f4), .g(g4));

multiplexador2 multOrigem(origemEscrita, saidaDados, saidaUla, writeData); //ou vem da Ula ou da memória

memDados(SW[0], regRT, memWrite, memRead, saiDadados, saidaUla);

unidadeControle(inst[31:27], reset, condicional, aluCtrl, escolhaReg, origemEscrita, imediato, memWrite, memRead, regWrite, comp, out, inp, escolheExt);

//always @ (posedge clkSaida)
always @ (*)
begin
	
	// Pinagem dos 4 displays de 7 segmentos
	{HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5], HEX0[6]} = {a, b, c, d, e, f, g}; //pinagem do display de 7 segmentos da unidade
	{HEX1[0], HEX1[1], HEX1[2], HEX1[3], HEX1[4], HEX1[5], HEX1[6]} = {a2, b2, c2, d2, e2, f2, g2}; //pinagem do display de 7 segmentos da dezena
	{HEX2[0], HEX2[1], HEX2[2], HEX2[3], HEX2[4], HEX2[5], HEX2[6]} = {a3, b3, c3, d3, e3, f3, g3}; //pinagem do display de 7 segmentos da centena
	{HEX3[0], HEX3[1], HEX3[2], HEX3[3], HEX3[4], HEX3[5], HEX3[6]} = {a4, b4, c4, d4, e4, f4, g4}; //pinagem do display de 7 segmentos de milhar
	
end

endmodule
*/