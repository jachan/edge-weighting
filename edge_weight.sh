#!/bin/bash
# Runs the R script located at faraday/john.chan/scripts/edge-weighting/edge_weight.R
# $1 is the path to track_network.csv
# $2 is the path to surface_area.csv
# $3 is the path to the desired output file, if no file name is specified, it defaults to "edge_weights.csv"
# $4 is the volume of each voxel
# $5 is the number of seeds per voxel
# $6 is a list of nodes of interest in the format "first,second,third,etc"

#help text
if [ "$1" == "-h" ]; then
  printf "Usage: \n"\$1" [path to edge_weight.R] \n"\$2" [path to track_network output] \n"\$3" [path to surface area output] \n"\$4" [path to desired output file] \n"\$5" [volume of each voxel] \n"\$6" [number of seeds per voxel] \n"\$7" [optional argument in comma delimited format that specifies only connections between certain nodes] \n"
  exit 0
fi

TRK="$1"
SA="$2"
OUT="$3"
VOL="$4"
SEED="$5"
LIST="$6"

Rscript /export/faraday/john.chan/scripts/edge-weighting/edge_weight.R --args $TRK $SA $OUT $VOL $SEED $LIST
