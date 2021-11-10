#!/bin/bash
set -eou pipefail

srcs="mul16.v shift16.v"

iverilog -g 2012 -s shift16_tb -o shift16_tb shift16_tb.v ${srcs}
>&2 echo "compiled"
./shift16_tb