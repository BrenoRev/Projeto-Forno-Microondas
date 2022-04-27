`timescale 1ms/1ms
`include "..\frequency_divide_by_100.v"

module frequency_divide_by_100_tb;

    reg in_clock_tb;
    wire out_clock_tb;

    frequency_divide_by_100 uut(in_clock_tb, out_clock_tb);

    initial begin
        $dumpfile("../wave_forms/frequency_divide_by_100.vcd");
        $dumpvars(0, frequency_divide_by_100_tb);

        in_clock_tb = 0;

        repeat(2000)
            #5 in_clock_tb = ~in_clock_tb;
        
    end

endmodule