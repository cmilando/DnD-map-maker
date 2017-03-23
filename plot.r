#' ----------------------------------------------------------------------------
#' AUTHOR: CWM
#' DATE: 3/17/2016
#' PURPOSE: the plotting function
#' ----------------------------------------------------------------------------


plot_viewable <- function(df,v,d) {
  
  #' get neighbors based on position and distance viewable
  currently_viewable <- get_neighbors(g, v, d)
  ever_viewed <<- unique(c(ever_viewed, currently_viewable))
  
  #' turn off all things that are not viewable
  df$value[! (df$ID %in% ever_viewed)] <- ""
  
  #' the point where the player is
  pt <- subset(df,ID == v)
  
  #' return the plot
  ggplot(data = df) + theme_bw() + 
    geom_tile(aes(x = x, y = -y,fill = value), color = 'black') +
    geom_text(aes(x = x, y = -y, label = ID)) +
    geom_point(data = pt,
               mapping = aes(x = x, y = -y), 
               shape = 23, size = 5, color = 'red', fill = 'yellow') +
    scale_fill_manual(values = map_colors, labels = map_labels, na.value = 'black')
  
}