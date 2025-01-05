#!/bin/zsh

#fetching memory usage from nvidia-smi - used and total 
OUTPUT=$(nvidia-smi --query-gpu=memory.used,memory.total --format=csv,noheader,nounits)

#parsing numbers
USED=$(echo $OUTPUT | awk -F ',' '{print $1}')
TOTAL=$(echo $OUTPUT | awk -F ',' '{print $2}')

#format into percentage
if (( TOTAL > 0 )); then
    PERCENT=$(( (USED * 100) / TOTAL ))
else
    PERCENT=0
fi

echo "${PERCENT}%"

