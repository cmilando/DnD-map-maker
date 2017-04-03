map_labels <- c(
  "''" = "''",

  "DB"  = 'DB',
  "DL"  = 'DL',
  "DR"  = 'DR',
  "DT"  = 'DT',

  "DPL" = 'DPL',
  "DPR" = 'DPR',
  "DPT" = 'DPT',
  "DPB" = 'DPB',

  "DSL" = 'DSL',
  "DSR" = 'DSR',
  "DST" = 'DST',
  "DSB" = 'DSB',

  "F"   = 'F',

  "SD"  = 'SD',
  "SDD" = 'SDD',
  "SU"  = 'SU',
  "SUU" = 'SUU'
)

map_colors <- c(
  "''" = 'black',

  "DB"  = 'green',
  "DL"  = 'red',
  "DR"  = 'pink',
  "DT"  = 'brown',

  "DPL" = 'yellow',
  "DPR" = 'yellow',
  "DPT" = 'yellow',
  "DPB" = 'yellow',

  "DSL" = 'purple',
  "DSR" = 'purple',
  "DST" = 'purple',
  "DSB" = 'purple',

  "F"   = 'white',

  "SD"  = 'grey',
  "SDD" = 'grey',
  "SU"  = 'grey',
  "SUU" = 'grey'
)

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
