library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(picante)
library(raster)



df<- read.csv(file = 'C://Users//helie//Documents//Archeological Eurasian//Full Data//Classeur1.csv', sep = ";")



eastasia <- c("China","Japan","North Korea", "South Korea")
eastasia.maps <- map_data("world", region = eastasia)
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
  geom_point(data = df[df$Culture == 'else',2:3], aes(x = long, y = lat), color = "black", size = 1)


eastasia2 <- c("Japan","North Korea", "South Korea")
eastasia2.maps <- map_data("world", region = eastasia2)
gg2 <- ggplot() + geom_polygon(data = eastasia2.maps, aes(x=long, y = lat, group = group),fill = "white",color = "black") + 
  coord_fixed(1.3)


gg2  + 
  geom_point(data = df[df$Culture == 'Yayoi',2:3], aes(x = long, y = lat), color = "red", size = 2)+
  geom_point(data = df[df$Culture == 'Mumun',2:3], aes(x = long, y = lat), color = "blue", size = 2)+
  geom_point(data = df[df$Culture == 'Chulmun',2:3], aes(x = long, y = lat), color = "darkolivegreen3", size = 2)
  



