#!/bin/bash
set -eou pipefail

files="rtl/*.v"

for i in ${files}; do
    filename=$(basename ${i} .v)
    >&2 echo "Compiling ${filename}"
    iverilog -g 2012 -s ${filename} -o rtl/${filename} rtl/${filename}.v 
    >&2 echo "Running ${filename}"
    set +e
    rtl/./${filename} > stder
    RESULT=$?
    set -e
    if [ "${RESULT}" == "0" ]; then
        echo "${filename} Pass"
    else
        echo "${filename} Fail"
    fi
done