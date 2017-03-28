#' ----------------------------------------------------------------------------
#' AUTHOR: CWM
#' DATE: 3/17/2016
#' PURPOSE: the plotting function
#' ----------------------------------------------------------------------------

player_list = c('red','blue','green','purple','pink','brown')

plot_viewable <- function(df,names, v, d) {
  
  #' error checking
  stopifnot(length(v) == length(d))
  stopifnot(length(names) == length(v))
  
  #' get neighbors based on position and distance viewable
  currently_veiwable <- vector('list',0)
  for(i in 1:length(v)) {
    currently_viewable <- c(currently_veiwable,get_neighbors(g, v[i], d[i]))
  }
  ever_viewed <<- unique(c(ever_viewed, currently_viewable))
  
  #' turn off all things that are not viewable
  df$value[! (df$ID %in% ever_viewed)] <- ""
  
  #' the point where the player is
  pt <- subset(df,ID %in% v)
  pt$names <- names
  
  #' return the plot
  ggplot(data = df) + theme_bw() + 
    geom_tile(aes(x = x, y = -y,fill = value), color = 'black') +
    geom_text(aes(x = x, y = -y, label = ID),size = 2) +
    geom_point(data = pt,
               mapping = aes(x = x, y = -y,color = names), 
               shape = 19, size = 5) +
    geom_label(data = pt,
               mapping = aes(x = x, y = -y,label = names, 
                             color = names), 
               size = 3,
               nudge_y = 4, nudge_x = -1,
               show.legend = F) +
    scale_color_manual(values = player_list) + 
    scale_fill_manual(values = map_colors, 
                      labels = map_labels, na.value = 'black')
  
}


