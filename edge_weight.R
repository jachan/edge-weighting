#parses input from terminal
args = commandArgs(trailingOnly = TRUE)
if (length(args)!=6) {
  stop("Wrong number of arguments.\n", call.=FALSE)
} else{
  track_network = args[2]
  surface_area = args[3]
  output = args[4]
  v = as.numeric(args[5])
  p = as.numeric(args[6])
}

#track_network is path to tracknetwork.csv
#surface_area is path to surface_area
#output is path to desired output directory
#v is volume of each voxel
#p is the number of seeds per voxel

#creates the path for output
output = paste(output,"edge_weights.csv", sep = "")

#reads in data
track_network = read.csv(file=track_network ,head = TRUE, sep="\t")
surface_area = read.csv(file=surface_area, head = TRUE, sep = ",")

#cons stores how many total connections there are
cons = 0

#isolates top part of track_network
for(n in 1:nrow(track_network)){
  if(track_network[n,1] == "Node"){
    break
  }
  cons = cons + 1
}
track_network = track_network[1:cons,]

#verifies that tracknetwork and surface area are matrices
track_network=as.matrix(track_network)
surface_area=as.matrix(surface_area)

#creates empty edge weight matrix
edge_weights = track_network[,1:2]
edge_weights = cbind(edge_weights,c(array(0,nrow(edge_weights))))
colnames(edge_weights)[3] = "edge weight"

#calculates edge weights
for(n in 1:nrow(edge_weights)){
  src_sa = surface_area[which(edge_weights[n,1] == surface_area[,1]),3]
  dest_sa = surface_area[which(edge_weights[n,2] == surface_area[,1]),3]
  edge_weights[n,3] = (v/p)*as.numeric(2/(src_sa+dest_sa))*as.numeric(track_network[n,3])
}
write.csv(edge_weights, file = output)
q()