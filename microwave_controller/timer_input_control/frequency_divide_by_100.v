module frequency_divide_by_100 (
    input in_clock,
    output reg out_clock
);

    reg [6:0] count;

    initial begin
        count <= 7'd0;
        out_clock = 1'b0;
    end

    always @(posedge in_clock) begin
        count <= count + 7'd1;

        if (count >= 7'd99) begin
            count <= 7'd0;
        end

        if (count < 7'd50) begin
            out_clock <= 1'b1;
        end else begin
            out_clock <= 1'b0;
        end
    end

endmodule