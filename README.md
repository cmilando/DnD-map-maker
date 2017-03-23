# map-maker
Making fog of war maps from tsv files

To get all these packages

`> install.packages(c('reshape2','ggplot2','igraph','maptools','spdep'))`

The website where you can download the tsv (tab separated file) is
https://donjon.bin.sh/5e/dungeon/

`play.r` is the main file

read in each line and then `plot_viewable` will update the map
