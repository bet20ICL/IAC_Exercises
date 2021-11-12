module rom(
    input logic clk,
    input logic[7:0] address,
    output logic[7:0] data_0,
    output logic[7:0] data_1,
    output logic[7:0] data_2,
    output logic[7:0] data_3
);

    reg [7:0] memory [255:0];

    initial begin
        integer i;
        for(i = 0; i < 256; i++) begin
            memory[i] = 0;
        end
        memory[5] = 8'hE3;
        memory[12] = 8'h1;
    end

    always_ff @(posedge clk) begin
        data_0 <= memory[address];
        data_1 <= memory[address + 1];
        data_2 <= memory[address + 2];
        data_3 <= memory[address + 3];
    end

endmodule