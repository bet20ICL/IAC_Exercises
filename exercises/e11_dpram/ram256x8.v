module ram256x8(
    input logic clk,
    input logic write,
    input logic[7:0] addr,
    input logic[7:0] data_in,
    output logic[7:0] data_out
);

    reg [7:0] memory [255:0];

    initial begin
        integer i;
        for(i = 0; i < 256; i++) begin
            memory[i] = 0;
        end
        memory[0] = 10;
        memory[1] = 11;
        memory[2] = 12;
    end

    always @(*) begin
        if (write) begin
            memory[addr] <= data_in;
        end
    end

    always_ff @(posedge clk) begin
        data_out <= memory[addr];
    end

endmodule