module shift16(
    input logic clk,
    input logic[15:0] a, 
    input logic[3:0] distance,
    output logic[15:0] r
);

    logic[15:0] b;
    assign b = 2 ** distance;

    logic[15:0] rdelay;

    mul16 multi(.clk(clk), .a(a), .b(b), .r(rdelay));

    always_ff @(posedge clk) begin
        r <= rdelay;
    end

endmodule