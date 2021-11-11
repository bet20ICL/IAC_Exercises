#!/bin/bash
set -eou pipefail

srcs="fsm.v"
testbench="fsm"

iverilog -g 2012 -s ${testbench}_tb -o ${testbench}_tb ${testbench}_tb.v ${srcs}
>&2 echo "compiled"
./${testbench}_tb