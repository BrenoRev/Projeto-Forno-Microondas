`timescale 1ms/1ns
`include "timer_control_level2.v"

// este módulo deve ser compilado a partir do diretório "/microwave_controller/timer_input_control"
// devido ao uso de diferentes hierarquias de pastas
module timer_control_level2_tb;

    reg [9:0] keypad_tb;
    reg enable_n_tb, clock_100Hz_tb;

    wire [3:0] D_tb;
    wire load_n_tb, pgt_1Hz_tb;

    timer_control_level2 uut(keypad_tb, enable_n_tb, clock_100Hz_tb, D_tb, load_n_tb, pgt_1Hz_tb);

    initial begin
        $dumpfile("./wave_forms/timer_control_level2.vcd");
        $dumpvars(0, timer_control_level2_tb);

        clock_100Hz_tb = 0; enable_n_tb = 1; keypad_tb = 10'b00_0000_0000;
    end

    initial begin
        repeat(500)
            #5 clock_100Hz_tb = ~clock_100Hz_tb;
    end 

    initial begin
        #10 keypad_tb = 10'b00_0001_0000;
        #100 keypad_tb = 10'b00_0000_0000;
        #100 keypad_tb = 10'b00_1000_0000;
        #300 keypad_tb = 10'b10_0010_0001;
        #100 keypad_tb = 10'b00_0000_0000;

        #10 enable_n_tb = 0;

        #10 keypad_tb = 10'b00_1001_0000;
        #100 keypad_tb = 10'b00_0000_0000;
        #100 keypad_tb = 10'b00_0010_0000;
        #300 keypad_tb = 10'b01_0010_0001;
        #100 keypad_tb = 10'b00_0000_0000;
        #100 keypad_tb = 10'b00_1100_0000;
        #100 keypad_tb = 10'b00_0000_0000;
        
        #10 enable_n_tb = 1; #100;
    end

endmodule