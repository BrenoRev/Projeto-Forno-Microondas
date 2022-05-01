`include "priority_encoder.v"
`include "frequency_divide_by_100.v"
`include "debounce_delay.v"
`include "mux_2x1.v"

module timer_control_level2(
    keypad, enable_n, clock_100Hz,
    D, load_n, pgt_1Hz
);

    input [9:0] keypad;
    input enable_n, clock_100Hz;
    
    output wire [3:0] D;
    output wire load_n, pgt_1Hz;

    wire clock_1Hz, data_valid, delayed_data_valid;

    priority_encoder encoder(.keypad(keypad), .enable_n(enable_n), .BCD_out(D), .data_valid(data_valid));

    frequency_divide_by_100 divide(.in_clock(clock_100Hz), .out_clock(clock_1Hz));

    debounce_delay delay(.clock(clock_100Hz), .clear(data_valid), .edge_out(delayed_data_valid));

    mux_2x1 mux(.i0(delayed_data_valid), .i1(clock_1Hz), .select(enable_n), .F(pgt_1Hz));

    assign load_n = ~data_valid;

endmodule