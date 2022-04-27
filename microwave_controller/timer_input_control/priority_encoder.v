module priority_encoder(
    keypad, enable_n,
    BCD_out, data_valid
);

    input wire [9:0] keypad;
    input wire enable_n;

    output reg [3:0] BCD_out;
    output wire data_valid;

    assign data_valid = ~enable_n && (keypad != 10'b00_0000_0000);

    always @(keypad, enable_n) begin
        if (~enable_n) begin
            if (keypad[9])
                BCD_out = 4'b1001;
            else if (keypad[8])
                BCD_out = 4'b1000;
            else if (keypad[7])
                BCD_out = 4'b0111;
            else if (keypad[6])
                BCD_out = 4'b0110;
            else if (keypad[5])
                BCD_out = 4'b0101;
            else if (keypad[4])
                BCD_out = 4'b0100;
            else if (keypad[3])
                BCD_out = 4'b0011;
            else if (keypad[2])
                BCD_out = 4'b0010;
            else if (keypad[1])
                BCD_out = 4'b0001;
            else if (keypad[0])
                BCD_out = 4'b0000;
            else
                BCD_out = 4'bxxxx;
        end
        else begin
            BCD_out = 4'bzzzz;
        end
    end

endmodule