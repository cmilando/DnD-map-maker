#' ----------------------------------------------------------------------------
#' AUTHOR: CWM
#' DATE: 3/17/2017
#' PURPOSE: read in and make graph
#'          Run this first
#' ----------------------------------------------------------------------------

library(reshape2); library(ggplot2)
library(igraph); library(maptools)
library(spdep)

#' read in the TSV file of the dungeon
#fname <- "The Dungeon of Demonic Annihilation 01 (tsv).txt"
fname <- "The Secret Labyrinth of Woe 01 (tsv) (1).txt"
tsv <- read.csv(fname, sep = "\t", colClasses = "character")
tsv <- rbind("",tsv)
colnames(tsv) <- 1:ncol(tsv)
tsv$y <- 1:nrow(tsv)

#' reshape to in db form
tsv_melt <- melt(tsv,id.vars = 'y',
                 measure.vars = as.character(1:(ncol(tsv)-1)),
                 variable.name = 'x')

tsv_melt$x <- as.numeric(tsv_melt$x)
tsv_melt$ID <- row.names(tsv_melt)

#' give coordinates IDS
sub_tsv <- subset(tsv_melt,value != "")
sub_tsv$value <- as.character(sub_tsv$value)
sub_tsv$y <- -sub_tsv$y
coordinates(sub_tsv) <- c("x","y")
sub_tsv <- sub_tsv[,c('ID','value')]
sub_tsv <- cbind(sub_tsv, coordinates(sub_tsv))

#' calculate distance matrix
dist_tsv <- as.matrix(dist(coordinates(sub_tsv),method = 'euclidean'))
dist_tsv[upper.tri(dist_tsv,diag = T)] <- NA

#' reshape and drop blanks
dist_tsv_melt <- melt(dist_tsv)
colnames(dist_tsv_melt) <- c("ID1","ID2","dist")
dist_tsv_melt <- apply(dist_tsv_melt,2,as.numeric)

#' create adjacency matrix
adj <- subset(data.frame(dist_tsv_melt), dist == 1)

#' make into graph
g <- graph_from_data_frame(as.matrix(adj[,1:2]), directed = F,
                           vertices = as.data.frame(sub_tsv))

#' load custom functions
source('static.r')
