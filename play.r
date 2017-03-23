#' ----------------------------------------------------------------------------
#' AUTHOR: CWM
#' DATE: 3/17/2016
#' PURPOSE: Update the map on the fly
#' ----------------------------------------------------------------------------

source('read-in.r')
source('plot.r')

ever_viewed <- c()          #' if you want to start with a dark map
#ever_viewed <- tsv_melt$ID  #' if you want to see the whole map

plot_viewable(tsv_melt, '93', 2)
plot_viewable(tsv_melt, '127', 2)
plot_viewable(tsv_melt, '327', 2)