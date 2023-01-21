module LCD_display_string(index,out,word);
	input [4:0] index;
	input [7:0] word;
	output [7:0] out;
	reg [7:0] out;


	// ASCII hex values for LCD Display
	// Enter Live Hex Data Values from hardware here
	// LCD DISPLAYS THE FOLLOWING:
	//----------------------------
	//| Count=XX                  |
	//| DE2                       |
	//----------------------------

	parameter 	N0 = 8'h30, N1 = 8'h31, N2 = 8'h32, N3 = 8'h33, N4 = 8'h34, N5 = 8'h35, N6 = 8'h36,
					N7 = 8'h37, N8 = 8'h38, N9 = 8'h39,
					AA = 8'h41, BB = 8'h42, CC = 8'h43, DD = 8'h44, EE = 8'h45, FF = 8'h46, GG = 8'h47,
					HH = 8'h48, II = 8'h49, JJ = 8'h4A, KK = 8'h4B, LL = 8'h4C, MM = 8'h4D, NN = 8'h4E,
					OO = 8'h4F, PP = 8'h50, QQ = 8'h51, RR = 8'h52, SS = 8'h53, TT = 8'h54, UU = 8'h55,
					VV = 8'h56, WW = 8'h57, XX = 8'h58, YY = 8'h59, ZZ = 8'h5A,
					A  = 8'h61, B  = 8'h62, C  = 8'h63, D  = 8'h64, E  = 8'h65, F  = 8'h66, G  = 8'h67,
					H  = 8'h68, I  = 8'h69, J  = 8'h6A, K  = 8'h6B, L  = 8'h6C, M  = 8'h6D, N  = 8'h6E,
					O  = 8'h6F, P  = 8'h70, Q  = 8'h71, R  = 8'h72, S  = 8'h73, T  = 8'h74, U  = 8'h75,
					V  = 8'h76, W  = 8'h77, X  = 8'h78, Y  = 8'h79, Z  = 8'h7A,
					BLANK = 8'h20, PIPE = 8'h7C, EQUAL = 8'h3D, LTHAN = 8'h3C, GTHAN = 8'h3E,
					TIMES = 8'h2A, PLUS = 8'h2B, MINUS = 8'h2D, DIV = 8'h2F,
					QMARK = 8'h3F;

	localparam  P00 = 5'h00, P01 = 5'h01, P02 = 5'h02, P03 = 5'h03, P04 = 5'h04, P05 = 5'h05,
					P06 = 5'h06, P07 = 5'h07, P08 = 5'h08, P09 = 5'h09, P0A = 5'h0A, P0B = 5'h0B,
					P0C = 5'h0C, P0D = 5'h0D, P0E = 5'h0E, P0F = 5'h0F,
					P10 = 5'h10, P11 = 5'h11, P12 = 5'h12, P13 = 5'h13, P14 = 5'h14, P15 = 5'h15,
					P16 = 5'h16, P17 = 5'h17, P18 = 5'h18, P19 = 5'h19, P1A = 5'h1A, P1B = 5'h1B,
					P1C = 5'h1C, P1D = 5'h1D, P1E = 5'h1E, P1F = 5'h1F;



	always@(*) begin

		case (index)
			default: out <= word;
		endcase

	end
endmodule
