module mux_2x1(
    input i0, i1, select,
    output F
);

    assign F = (i0 & ~select) || (i1 & select);

endmodule