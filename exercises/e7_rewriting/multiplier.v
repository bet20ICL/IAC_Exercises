
module multiplier(
    input clk,
    input logic valid_in,
    input logic[31:0] a,
    input logic[31:0] b,
    output logic valid_out,
    output logic[63:0] r
);
    logic[31:0] mp, mp_next;
    logic[63:0] mc, mc_next;
    logic[63:0] acc, acc_next;
    logic[5:0] i, i_next;

    logic[3:0] mp_nibble;

    assign mp_nibble = mp[3:0];

    always_comb begin

        case(valid_in)
            1'd1: begin
                mp_next = a;
                mc_next = b;
                acc_next = 0;
                i_next = 0;
            end
            default: begin
                case(i)
                    5'd8: begin end
                    default: begin
                        acc_next = acc + mp_nibble * mc;
                        mp_next = mp>>4;
                        mc_next = mc<<4;
                        case(mp)
                            31'd0: i_next = 8;
                            default: i_next = i + 1;
                        endcase                        
                    end
                endcase
            end
        endcase
    end

    always_ff  @(posedge clk) begin
        mp <= mp_next;
        mc <= mc_next;
        acc <= acc_next;
        i <= i_next;

        case(i_next)
            5'd8: begin
                r <= acc_next;
                valid_out <= 1;                
            end
            default: begin
                r <= r;
                valid_out <= 0;                
            end
        endcase
    end
endmodule
