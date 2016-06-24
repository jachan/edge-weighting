# edge-weighting
This is a tool made in Dr. Mareci's Lab to make scripting the edge weight calculations easier. The folder should contain edge_weight.sh and edge_weight.R. The shell script can be run without having to type ./edge_weight.sh by placing it within /usr/local/bin/. The script takes either 6 or 7 arguments which are detailed in the comments of edge_weight.sh.  Type -h for help.

Basic Usage
$0 is the script name
$1 is the path to the R script
$2 is the path to track_network.csv
$3 is the path to surface_area.csv
$4 is the path to the desired output file, if no file name is specified, it defaults to "edge_weights.csv"
$5 is the volume of each voxel
$6 is the number of seeds per voxel
$7 is a list of nodes of interest in the format "first,second,third,etc"
