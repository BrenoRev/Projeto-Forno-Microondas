`timescale 1ns/1ps
`include "..\priority_encoder.v"

module priority_encoder_tb;

    reg [9:0] keypad_tb;
    reg enable_n_tb;

    wire [3:0] BCD_out_tb;
    wire data_valid_tb;

    priority_encoder uut(.keypad(keypad_tb), .enable_n(enable_n_tb), .BCD_out(BCD_out_tb), .data_valid(data_valid_tb));

    initial begin
        $dumpfile("../wave_forms/priority_encoder.vcd");
        $dumpvars(0, priority_encoder_tb);

        enable_n_tb = 1;

        #10 keypad_tb = 10'b00_0000_0000;
        #10 keypad_tb = 10'b10_0101_0101;
        #10 keypad_tb = 10'b00_0000_0000;
        #10 keypad_tb = 10'b01_0110_1010;
        #10 keypad_tb = 10'b00_0000_0111;

        #10 enable_n_tb = 0;

        #10 keypad_tb = 10'b10_0101_0101;
        #10 keypad_tb = 10'b01_0110_1010;
        #10 keypad_tb = 10'b00_0000_0000;
        #10 keypad_tb = 10'b00_0000_0111;
        #10 keypad_tb = 10'b00_0000_0000; #10;
    end

endmodule