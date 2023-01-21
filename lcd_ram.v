module lcd_ram(write_clock, read_clock, reset, lcdPos, lcdPosRead, data, lcdmemWrite, dataRead);

	parameter DATA_WIDTH = 8; // X bits
	parameter BITS_SIZE = 5;
	localparam LCD_RAM_SIZE = 2**BITS_SIZE;

	input [DATA_WIDTH-1:0] data;
	input [BITS_SIZE-1:0] lcdPos, lcdPosRead;
	input write_clock, read_clock, reset;
	input [1:0] lcdmemWrite;

	output reg [DATA_WIDTH-1:0] dataRead;

	reg [DATA_WIDTH-1:0] LCD_RAM [LCD_RAM_SIZE-1:0]; // LCD_RAM_SIZE words of 32-bit memory


	initial
	begin : INIT
		LCD_RAM[0] = 8'h20;
		LCD_RAM[1] = 8'h20;
		LCD_RAM[2] = 8'h20;
		LCD_RAM[3] = 8'h20;
		LCD_RAM[4] = 8'h20;
		LCD_RAM[5] = 8'h20;
		LCD_RAM[6] = 8'h20;
		LCD_RAM[7] = 8'h20;
		LCD_RAM[8] = 8'h20;
		LCD_RAM[9] = 8'h20;
		LCD_RAM[10] = 8'h20;
		LCD_RAM[11] = 8'h20;
		LCD_RAM[12] = 8'h20;
		LCD_RAM[13] = 8'h20;
		LCD_RAM[14] = 8'h20;
		LCD_RAM[15] = 8'h20;
		LCD_RAM[16] = 8'h20;
		LCD_RAM[17] = 8'h20;
		LCD_RAM[18] = 8'h20;
		LCD_RAM[19] = 8'h20;
		LCD_RAM[20] = 8'h20;
		LCD_RAM[21] = 8'h20;
		LCD_RAM[22] = 8'h20;
		LCD_RAM[23] = 8'h20;
		LCD_RAM[24] = 8'h20;
		LCD_RAM[25] = 8'h20;
		LCD_RAM[26] = 8'h20;
		LCD_RAM[27] = 8'h20;
		LCD_RAM[28] = 8'h20;
		LCD_RAM[29] = 8'h20;
		LCD_RAM[30] = 8'h20;
		LCD_RAM[31] = 8'h20;
	end


	always @ (posedge write_clock)
	begin
		if (lcdmemWrite == 2'b10 || reset == 1'b1) begin
			LCD_RAM[0] <= 8'h20;
			LCD_RAM[1] <= 8'h20;
			LCD_RAM[2] <= 8'h20;
			LCD_RAM[3] <= 8'h20;
			LCD_RAM[4] <= 8'h20;
			LCD_RAM[5] <= 8'h20;
			LCD_RAM[6] <= 8'h20;
			LCD_RAM[7] <= 8'h20;
			LCD_RAM[8] <= 8'h20;
			LCD_RAM[9] <= 8'h20;
			LCD_RAM[10] <= 8'h20;
			LCD_RAM[11] <= 8'h20;
			LCD_RAM[12] <= 8'h20;
			LCD_RAM[13] <= 8'h20;
			LCD_RAM[14] <= 8'h20;
			LCD_RAM[15] <= 8'h20;
			LCD_RAM[16] <= 8'h20;
			LCD_RAM[17] <= 8'h20;
			LCD_RAM[18] <= 8'h20;
			LCD_RAM[19] <= 8'h20;
			LCD_RAM[20] <= 8'h20;
			LCD_RAM[21] <= 8'h20;
			LCD_RAM[22] <= 8'h20;
			LCD_RAM[23] <= 8'h20;
			LCD_RAM[24] <= 8'h20;
			LCD_RAM[25] <= 8'h20;
			LCD_RAM[26] <= 8'h20;
			LCD_RAM[27] <= 8'h20;
			LCD_RAM[28] <= 8'h20;
			LCD_RAM[29] <= 8'h20;
			LCD_RAM[30] <= 8'h20;
			LCD_RAM[31] <= 8'h20;
		end
		else if (lcdmemWrite == 2'b01) begin
			LCD_RAM[lcdPos] <= data;
		end

	end

	always @ (posedge read_clock)
	begin

		dataRead <= LCD_RAM[lcdPosRead];

	end



endmodule