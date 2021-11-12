module f(
    input logic[4:0] a, input logic[4:0] b,
    output logic[2:0] x, output logic[2:0] y
);

    assign x = a[2:0] + b[2:0];
    assign y = a[4:2] + b[4:2];

endmodule