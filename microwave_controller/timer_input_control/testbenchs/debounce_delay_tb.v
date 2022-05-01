`timescale 1ms/1ns
`include "..\debounce_delay.v"

module debounce_delay_tb;

    reg clock_tb, clear_tb;
    wire edge_out_tb;

    reg [7:0] counter_tb;

    debounce_delay uut(clock_tb, clear_tb, edge_out_tb);

    initial begin
        $dumpfile("../wave_forms/debounce_delay.vcd");
        $dumpvars(0, debounce_delay_tb);

        counter_tb = 8'd0;
        clock_tb = 1'b0;
        clear_tb = 1'b0;

        repeat(500) begin
            #5 clock_tb = ~clock_tb;
            counter_tb = counter_tb + 8'd1;

            if (counter_tb == 8'd10) begin
                clear_tb = 1'b1;
            end else if (counter_tb == 8'd100) begin
                clear_tb = 1'b0;    
            end
        end

    end

endmodule