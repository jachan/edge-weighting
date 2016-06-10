#!/bin/bash
# $0 is the script name
# $1 is the path to the R script
# $2 is the path to track_network.csv
# $3 is the path to surface_area.csv
# $4 is the path to the desired output directory
# $5 is the volume of each voxel
# $6 is the number of seeds per voxel
# $7 is a list of nodes of interest in the format "first second third etc."

R="$1"
TRK="$2"
SA="$3"
OUT="$4"
VOL="$5"
SEED="$6"
LIST="$7"

echo "$LIST"

Rscript $R --args $TRK $SA $OUT $VOL $SEED $LIST
