library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(picante)
library(raster)



df4 <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\archeology_missingcorrected5.csv',sep = ';',stringsAsFactors=FALSE)


#construction de la carte
eastasia <- c("China","Japan","North Korea", "South Korea")
eastasia.maps <- map_data("world", region = eastasia)
res <- c()
for (j in (1:4324)){
  if (eastasia.maps[j,1]>105){
    res <- append(res,j)
  }
}
eastasia2.maps <- eastasia.maps[res,]




for (j in 113:120){
  res <- which(df4[,j]=="1")
  res2 <- which(df4[,j]=="0")
  df <- df4[res,2:6]
  df2 <- df4[res2,2:6]
  gg1 <- ggplot() + geom_polygon(data = eastasia2.maps, aes(x=long, y = lat, group = group),fill = "white",color = "black") + 
    coord_fixed(1.3)
  plot(gg1  + 
          geom_point(data = df, aes(x = long, y = lat,colour = Date),size = 2)+
          scale_colour_gradient(low = "yellow", high = "red", na.value = NA)+
          geom_point(data = df2,aes(x = long, y = lat),size = 1,color = "grey",pch = 20)+
          ggtitle(colnames(df4)[j])
       ) 
}


