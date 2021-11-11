module fsm(
    input logic clk,
    input logic reset,
    input logic sample_valid,
    input logic[2:0] sample_value,
    output logic[7:0] sum,
    output logic[7:0] count
);

    logic[7:0] sum_curr;
    logic[7:0] count_curr;

    always @(*) begin
        if (reset) begin
            sum_curr = 0;
            count_curr = 0;
        end
        else if (sample_valid) begin
            sum_curr = sum_curr + sample_value;
            count_curr++;
        end
    end

    always_ff @(posedge clk) begin
        sum <= sum_curr;
        count <= count_curr;
    end

endmodule