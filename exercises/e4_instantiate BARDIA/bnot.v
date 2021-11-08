module bnot(
    input logic a,
    output logic r
);
    always_comb begin
        r = ~a;
    end
endmodule
