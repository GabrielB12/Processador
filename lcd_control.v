module lcd_control(localLCD, dadoLCD, localSaida, valorSaida);

	input [4:0] localLCD, positionReg;
	input [7:0] dadoLCD, dataReg;
	input [1:0] flags;

	output [4:0] localSaida;
	output [7:0] valorSaida;

	// localLCD é o valor do segundo segmento da instrução, que significa a posição no LCD que o caractere vai ficar
	// dadoLCD é o valor dos últimos 8 bits, do imediato, referentes ao valor em ASCII do caractere
	/*Ex:
	100111_00000_00000_00000_00000100000; // lcd 0 32 espaço
	100111_00001_00000_00000_00000100000; // lcd 1 32 espaço --Bianchi CPU/SO--
	100111_00010_00000_00000_00001000010; // lcd 2 66 B
	100111_00011_00000_00000_00001101001; // lcd 3 105 i
	100111_00100_00000_00000_00001100001; // lcd 4 97 a
	100111_00101_00000_00000_00001101110; // lcd 5 110 n
	100111_00110_00000_00000_00001100011; // lcd 6 99 c
	100111_00111_00000_00000_00001101000; // lcd 7 104 h
	100111_01000_00000_00000_00001101001; // lcd 8 105 i
	100111_01001_00000_00000_00000100000; // lcd 9 32 espaço
	100111_01010_00000_00000_00001000011; // lcd 10 67 C
	100111_01011_00000_00000_00001010000; // lcd 11 80 P
	100111_01100_00000_00000_00001010101; // lcd 12 85 U
	100111_01101_00000_00000_00000101111; // lcd 13 47 /
	100111_01110_00000_00000_00001010011; // lcd 14 83 S
	100111_01111_00000_00000_00001001111; // lcd 15 79 O
	*/
	assign localSaida = localLCD;
	assign valorSaida = dadoLCD;


endmodule
