`timescale 1ns/1ps
`include "..\mux_2x1.v"

module mux_2x1_tb;

    reg i0_tb, i1_tb, sel_tb;
    wire f_tb;

    mux_2x1 uut(i0_tb, i1_tb, sel_tb, f_tb);

    initial begin
        $dumpfile("../wave_forms/mux_2x1.vcd");
        $dumpvars(0, mux_2x1_tb);

        sel_tb = 0;

        i0_tb = 0; i1_tb = 0; #10;
        i0_tb = 0; i1_tb = 1; #10;
        i0_tb = 1; i1_tb = 0; #10;
        i0_tb = 1; i1_tb = 1; #10;

        sel_tb = 1;

        i0_tb = 0; i1_tb = 0; #10;
        i0_tb = 0; i1_tb = 1; #10;
        i0_tb = 1; i1_tb = 0; #10;
        i0_tb = 1; i1_tb = 1; #10;
    end

endmodule