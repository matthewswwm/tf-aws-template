#!/bin/bash
#
### template.sh
# Description of what the shellscript does
# Tested on <OS>

set -e
set -x

echo "[INFO]: Starting script"

### Check input variables. Exit if wrong number is supplied
if [[ $# -ne 2 ]]; then
    echo "[ERROR]: No arguments supplied"
    echo "[ERROR]: Usage: $0 USER_INPUT_1 USER_INPUT_2"
    exit 1
else
   USER_INPUT_1="$1"
   USER_INPUT_2="$2"
fi

echo $USER_INPUT_1 & $USER_INPUT_2

echo "[INFO]: Script completed"
