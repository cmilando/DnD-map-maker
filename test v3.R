#' give coordinates IDS
sub_tsv <- subset(tsv_melt,! is.na(value))
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
head(dist_tsv_melt)

#' create adjacency matrix
adj <- subset(data.frame(dist_tsv_melt), dist == 1)

#' make into graph
g <- graph_from_data_frame(as.matrix(adj[,1:2]), directed = F, 
                           vertices = as.data.frame(sub_tsv))
x11()
plot(g)

#' make a function for getting neighbors based on distance
get_names <- function(g, x) unname(unlist(lapply(adjacent_vertices(g,x),names)))

get_neighbors_recursive <- function(g, v, d) {
  if(d > 0) {
    return(list(
      get_neighbors_recursive(g, get_names(g, v),d - 1),
      get_names(g, v)
    ))
  }
}

get_neighbors <- function(g, v, d) {
  xx <- unique(unlist(get_neighbors_recursive(g, v, d)))
  if(d == 1) return(c(v,xx))
  return(xx)
}

get_neighbors(g, '51',2)
get_neighbors(g, '173',1)
get_neighbors(g, '221',2)


