library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(picante)
library(raster)

type2 <- c("character","numeric","numeric","character",rep("numeric",172))
df4 <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\archeology_missingcorrected5.csv',sep = ';',stringsAsFactors=FALSE,colClasses = type2)

#preparer la carte

eastasia <- c("China","Japan","North Korea", "South Korea")
eastasia.maps <- map_data("world", region = eastasia)
carte1 <- c()
for (j in (1:4324)){
  if (eastasia.maps[j,1]>105){
    carte1 <- append(carte1,j)
  }
}
eastasia2.maps <- eastasia.maps[carte1,]


#sélectionner la première occurence de chaque technologie

res <- c()
for (j in (6:176)){
  res2 <-  which(df4[,j] == 1)
  k <- which( df4[res2,5] == max(df4[res2,5]))
  res <- append(res,res2[k])
}


res3 <- c()
for (j in (6:176)){
  res2 <- df4$Date[which(df4[,j] == 1)]
  res3 <- append(res3, max(res2))
}


df <- df4[res,]



gg1 <- ggplot() + geom_polygon(data = eastasia2.maps, aes(x=long, y = lat, group = group),fill = "white",color = "black") + 
  coord_fixed(1.3)
gg1  + 
  geom_point(data = df[df$Culture == 'Yayoi',2:3], aes(x = long, y = lat), color = "red", size = 1)+
  geom_point(data = df[df$Culture == 'Mumun',2:3], aes(x = long, y = lat), color = "blue", size = 1)+
  geom_point(data = df[df$Culture == 'Chulmun',2:3], aes(x = long, y = lat), color = "darkolivegreen3", size = 1)+
  geom_point(data = df[df$Culture == 'Xiaozhushan',2:3], aes(x = long, y = lat), color = "orange", size = 1)+
  geom_point(data = df[df$Culture == 'Shuangtuozi',2:3], aes(x = long, y = lat), color = "yellow", size = 1)+
  geom_point(data = df[df$Culture == 'Xiajiadian',2:3], aes(x = long, y = lat), color = "purple", size = 1)+
  geom_point(data = df[df$Culture == 'Hongshan',2:3], aes(x = long, y = lat), color = "pink", size = 1)+
  geom_point(data = df[df$Culture == 'Zuojiashan',2:3], aes(x = long, y = lat), color = "green", size = 1)+
  geom_point(data = df[df$Culture == 'Baijinbao',2:3], aes(x = long, y = lat), color = "cyan", size = 1)+
  geom_point(data = df[df$Culture == 'Xiaohexi',2:3], aes(x = long, y = lat), color = "goldenrod2", size = 1)+
  geom_point(data = df[df$Culture == 'Xinglongwa',2:3], aes(x = long, y = lat), color = "coral4", size = 1)+
  geom_point(data = df[df$Culture == 'Xinkailiu',2:3], aes(x = long, y = lat), color = "darkorchid", size = 1)+
  geom_point(data = df[df$Culture == 'Zaisanovka',2:3], aes(x = long, y = lat), color = "darkturquoise", size = 1)+
  geom_point(data = df[df$Culture == 'Zhaobaogou',2:3], aes(x = long, y = lat), color = "darkseagreen", size = 1)+
  geom_point(data = df[df$Culture == 'else',2:3], aes(x = long, y = lat), color = "black", size = 1)+
  ggtitle("Full")




#même approche pour chaque catégorie de technologies

tech <- c(6,75,112,121,147,164,176)
tech.names <- c("Ceramics","Stone Tools","Buildings","Food","Shell","Burials")
for (j in 1:6){
  x <- (tech[j]+1):(tech[j+1])
  df5 <- df4[,c(1:5,x)]
  res <- c()
  for (k in (6:ncol(df5))){
    res2 <- df5$Date[which(df5[,k] == 1)]
    res <- append(res,c(which(df5$Date == max(unique(res2)))))
  }
  
  df <- df5[unique(res),]
  
  gg1 <- ggplot() + geom_polygon(data = eastasia2.maps, aes(x=long, y = lat, group = group),fill = "white",color = "black") + 
    coord_fixed(1.3)
  
  print(gg1  + 
          geom_point(data = df[df$Culture == 'Yayoi',2:3], aes(x = long, y = lat), color = "red", size = 1)+
          geom_point(data = df[df$Culture == 'Mumun',2:3], aes(x = long, y = lat), color = "blue", size = 1)+
          geom_point(data = df[df$Culture == 'Chulmun',2:3], aes(x = long, y = lat), color = "darkolivegreen3", size = 1)+
          geom_point(data = df[df$Culture == 'Xiaozhushan',2:3], aes(x = long, y = lat), color = "orange", size = 1)+
          geom_point(data = df[df$Culture == 'Shuangtuozi',2:3], aes(x = long, y = lat), color = "yellow", size = 1)+
          geom_point(data = df[df$Culture == 'Xiajiadian',2:3], aes(x = long, y = lat), color = "purple", size = 1)+
          geom_point(data = df[df$Culture == 'Hongshan',2:3], aes(x = long, y = lat), color = "pink", size = 1)+
          geom_point(data = df[df$Culture == 'Zuojiashan',2:3], aes(x = long, y = lat), color = "green", size = 1)+
          geom_point(data = df[df$Culture == 'Baijinbao',2:3], aes(x = long, y = lat), color = "cyan", size = 1)+
          geom_point(data = df[df$Culture == 'Xiaohexi',2:3], aes(x = long, y = lat), color = "goldenrod2", size = 1)+
          geom_point(data = df[df$Culture == 'Xinglongwa',2:3], aes(x = long, y = lat), color = "coral4", size = 1)+
          geom_point(data = df[df$Culture == 'Xinkailiu',2:3], aes(x = long, y = lat), color = "darkorchid", size = 1)+
          geom_point(data = df[df$Culture == 'Zaisanovka',2:3], aes(x = long, y = lat), color = "darkturquoise", size = 1)+
          geom_point(data = df[df$Culture == 'Zhaobaogou',2:3], aes(x = long, y = lat), color = "darkseagreen", size = 1)+
          geom_point(data = df[df$Culture == 'else',2:3], aes(x = long, y = lat), color = "black", size = 1)+
          geom_text(data = df, aes(x = long, y = lat, label = Date),hjust = 0.1,vjust=1.1,angle = 0,size = 1.5)+
          ggtitle(tech.names[j]))
  
}


