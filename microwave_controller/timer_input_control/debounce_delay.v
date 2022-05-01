module debounce_delay(
    clock, clear,
    edge_out
);

    input clock, clear;
    output reg edge_out;

    reg [2:0] count;

    initial begin
        count <= 3'd7;
        edge_out <= 1'b0;
    end

    always @(posedge clock, posedge clear) begin
        if (clear == 1'b1) begin
            count <= 3'd0;
            edge_out <= 1'b0;
        end else begin
            if (count < 3'd7) begin
                count <= count + 3'd1;
            end else begin
                count <= 3'd7;
            end

            if (count == 3'd4) begin
                edge_out <= 1'b1;
            end
        end
    end

endmodule