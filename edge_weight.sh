#!/bin/bash
# $0 is the script name
# $1 is the path to the R script
# $2 is the path to track_network.csv
# $3 is the path to surface_area.csv
# $4 is the path to the desired output file, if no file name is specified, it defaults to "edge_weights.csv"
# $5 is the volume of each voxel
# $6 is the number of seeds per voxel
# $7 is a list of nodes of interest in the format "first,second,third,etc"

#help text
if [ "$1" == "-h" ]; then
  printf "Usage: \n"\$1" [path to edge_weight.R] \n"\$2" [path to track_network output] \n"\$3" [path to surface area output] \n"\$4" [path to desired output file] \n"\$5" [volume of each voxel] \n"\$6" [number of seeds per voxel] \n"\$7" [optional argument in comma delimited format that specifies only connections between certain nodes] \n"
  exit 0
fi

R="$1"
TRK="$2"
SA="$3"
OUT="$4"
VOL="$5"
SEED="$6"
LIST="$7"

Rscript $R --args $TRK $SA $OUT $VOL $SEED $LIST
