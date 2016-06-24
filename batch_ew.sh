#!/bin/bash
FILE=$1
while read line; do
     ./edge_weight.sh ./edge_weight.R "${line}"
done < $FILE
