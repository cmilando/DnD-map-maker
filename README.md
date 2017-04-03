# map-maker
Making fog of war maps from tsv files

### Setup
Get set up with [R](https://www.r-project.org/)

Fire up the R REPL:
`R`

````
/* install required packages*/
> install.packages(c('reshape2','ggplot2','igraph','maptools','spdep'))

/* load the main file */
> source('play.r')
````

executing the line `x11()` will make a plot window that is movable & sizable outside of Rstudio

### Info
The website where you can generate example tsv files is https://donjon.bin.sh/5e/dungeon/
