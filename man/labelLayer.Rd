% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/labelLayer.R
\name{labelLayer}
\alias{labelLayer}
\title{Label Layer}
\usage{
labelLayer(x, spdf, df, spdfid = NULL, dfid = NULL, txt,
  col = "black", cex = 0.7, overlap = TRUE, show.lines = TRUE,
  halo = FALSE, bg = "white", r = 0.1, ...)
}
\arguments{
\item{x}{an sf object, a simple feature collection.}

\item{spdf}{a SpatialPointsDataFrame or a SpatialPolygonsDataFrame; if spdf 
is a SpatialPolygonsDataFrame texts are plotted on centroids.}

\item{df}{a data frame that contains the labels to plot. If df is missing 
spdf@data is used instead.}

\item{spdfid}{identifier field in spdf, default to the first column 
of the spdf data frame. (optional)}

\item{dfid}{identifier field in df, default to the first column 
of df. (optional)}

\item{txt}{labels field in df.}

\item{col}{labels color.}

\item{cex}{labels cex.}

\item{overlap}{if FALSE, labels are moved so they do not overlap.}

\item{show.lines}{if TRUE, then lines are plotted between x,y and the word, 
for those words not covering their x,y coordinate}

\item{halo}{If TRUE, then a 'halo' is printed around the text and additional 
arguments bg and r can be modified to set the color and width of the halo.}

\item{bg}{halo color if halo is TRUE}

\item{r}{width of the halo}

\item{...}{further \link{text} arguments.}
}
\description{
Put labels on a map.
}
\examples{
library(sf)
opar <- par(mar = c(0,0,0,0))
mtq <- st_read(system.file("shape/martinique.shp", package="cartography"))
plot(st_geometry(mtq), col = "darkseagreen3", border = "darkseagreen4", 
     bg = "#A6CAE0")
labelLayer(x = mtq, txt = "LIBGEO", col= "black", cex = 0.7, font = 4,
           halo = TRUE, bg = "white", r = 0.1, 
           overlap = FALSE, show.lines = FALSE)
par(opar)

library(sp)
data("nuts2006")
plot(nuts0.spdf, border = NA, col = NA, add = FALSE, bg = "#A6CAE0")
plot(world.spdf, col  = "#E3DEBF", border=NA, add=TRUE)
plot(nuts0.spdf, col = "#D1914D",border = "white", lwd=1, add=TRUE)

# Selection of the 10 most populated countries of Europe
dflab <- nuts0.df[order(nuts0.df$pop2008, decreasing = TRUE),][1:10,]

# Label creation
dflab$lab <- paste(dflab$id, "\\n", round(dflab$pop2008/1000000,0), "M", sep ="")

# Label plot of the 10 most populated countries
labelLayer(spdf = nuts0.spdf, df = dflab, txt = "lab",
           col = "#690409", cex = 0.9, font = 2)
text(x = 5477360, y = 4177311, labels = "The 10 most populated countries of Europe
Total population 2008, in millions of inhabitants.",
     cex = 0.7, adj = 0)

# Layout plot
layoutLayer(title = "Most Populated Countries of Europe",
            author = "", sources = "",
            scale = NULL, col = NA, coltitle = "black",
            frame = FALSE, south = TRUE)
}
\seealso{
\link{layoutLayer}
}
