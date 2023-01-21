module lcd(CLOCK_50,LCD_ON,LCD_BLON,LCD_RW,LCD_EN,LCD_RS,LCD_DATA,position,word);

	input CLOCK_50;    		//50 MHz clock
	output LCD_ON;    // LCD Power ON/OFF
	output LCD_BLON;    // LCD Back Light ON/OFF
	output LCD_RW;    // LCD Read/Write Select, 0 = Write, 1 = Read
	output LCD_EN;    // LCD Enable
	output LCD_RS;    // LCD Command/Data Select, 0 = Command, 1 = Data
	inout [7:0] LCD_DATA;    // LCD Data bus 8 bits

	output [4:0] position;
	input [7:0] word;

	wire DLY_RST;
	Reset_Delay r0(.iCLK(CLOCK_50),.oRESET(DLY_RST));

	// turn LCD ON
	assign LCD_ON    =  1'b1;
	assign LCD_BLON  =  1'b1;

LCD_Display u1(
   .iCLK_50MHZ(CLOCK_50),
   .iRST_N(DLY_RST),
	.position(position),
	.word(word),
   .DATA_BUS(LCD_DATA),
   .LCD_RW(LCD_RW),
   .LCD_E(LCD_EN),
   .LCD_RS(LCD_RS)
);


endmodule
