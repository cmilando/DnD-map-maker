#' ----------------------------------------------------------------------------
#' AUTHOR: CWM
#' DATE: 3/17/2017
#' PURPOSE: Update the map on the fly
#' ----------------------------------------------------------------------------

source('read-in.r')
source('plot.r')

ever_viewed <- c()          #' if you want to start with a dark map
ever_viewed <- tsv_melt$ID  #' if you want to see the whole map

plot_viewable(tsv_melt, c('Group','group 2'), c('1029','500'), c(5,3))
