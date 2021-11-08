#!/bin/bash
set -eou pipefail

adder_srcs="band.v bnot.v bor.v bxor.v fadd4.v"

iverilog -g 2012 -s fadd4_tb -o fadd4_tb fadd4_tb.v ${adder_srcs}
./fadd4_tb