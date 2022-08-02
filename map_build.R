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



#placer les sites pour chaque technologie
colors <- c("cyan"="Baijinbao","darkolivegreen3"="Chulmun","black"="else","chartreuse1"="Haminmangha","grey"="Hanshu","pink"="Hongshan","brown"="Houtaomuga","deepskyblue4"="Houwa","blue"="Mumun","beige"="Pianpuzi","yellow"="Shuangtuozi","darkorchid"="Xinkailiu","goldenrod2"="Xiaohexi","orange"="Xiaozhushan","coral4"="Xinglongwa" , "purple"="Xiajiadian","red"="Yayoi","darkturquoise"="Zaisanovka", "darkseagreen"="Zhaobaogou","green"="Zuojiashan")
for (j in 113:120){
  res <- which(df4[,j]=="1")
  df <- df4[res,3:6]
  gg1 <- ggplot() + geom_polygon(data = eastasia2.maps, aes(x=long, y = lat, group = group),fill = "white",color = "black") + 
    coord_fixed(1.3)
  print(gg1  + 
    geom_point(data = df[df$Culture == 'Yayoi',1:2], aes(x = long, y = lat), color = "red", size = 1)+
    geom_point(data = df[df$Culture == 'Mumun',1:2], aes(x = long, y = lat), color = "blue", size = 1)+
    geom_point(data = df[df$Culture == 'Chulmun',1:2], aes(x = long, y = lat), color = "darkolivegreen3", size = 1)+
    geom_point(data = df[df$Culture == 'Xiaozhushan',1:2], aes(x = long, y = lat), color = "orange", size = 1)+
    geom_point(data = df[df$Culture == 'Shuangtuozi',1:2], aes(x = long, y = lat), color = "yellow", size = 1)+
    geom_point(data = df[df$Culture == 'Xiajiadian',1:2], aes(x = long, y = lat), color = "purple", size = 1)+
    geom_point(data = df[df$Culture == 'Hongshan',1:2], aes(x = long, y = lat), color = "pink", size = 1)+
    geom_point(data = df[df$Culture == 'Zuojiashan',1:2], aes(x = long, y = lat), color = "green", size = 1)+
    geom_point(data = df[df$Culture == 'Baijinbao',1:2], aes(x = long, y = lat), color = "cyan", size =1)+
    geom_point(data = df[df$Culture == 'Xiaohexi',1:2], aes(x = long, y = lat), color = "goldenrod2", size = 1)+
    geom_point(data = df[df$Culture == 'Xinglongwa',1:2], aes(x = long, y = lat), color = "coral4", size = 1)+
    geom_point(data = df[df$Culture == 'Xinkailiu',1:2], aes(x = long, y = lat), color = "darkorchid", size = 1)+
    geom_point(data = df[df$Culture == 'Zaisanovka',1:2], aes(x = long, y = lat), color = "darkturquoise", size = 1)+
    geom_point(data = df[df$Culture == 'Zhaobaogou',1:2], aes(x = long, y = lat), color = "darkseagreen", size = 1)+
    geom_point(data = df[df$Culture == 'Haminmangha',1:2], aes(x = long, y = lat), color = "chartreuse1", size = 1)+
    geom_point(data = df[df$Culture == 'Hanshu',1:2], aes(x = long, y = lat), color = "grey", size = 1)+
    geom_point(data = df[df$Culture == 'Houtaomuga',1:2], aes(x = long, y = lat), color = "brown", size = 1)+
    geom_point(data = df[df$Culture == 'Houwa',1:2], aes(x = long, y = lat), color = "deepskyblue4", size = 1)+
    geom_point(data = df[df$Culture == 'Pianpuzi',1:2], aes(x = long, y = lat), color = "beige", size = 1)+
    geom_point(data = df[df$Culture == 'else',1:2], aes(x = long, y = lat), color = "black", size = 1)+
    geom_text(data = df, aes(x = long, y = lat, label = Date),hjust = 0.1,vjust=1.1,angle = 0,size = 1.5)+
    ggtitle(colnames(df4)[j]) + 
    scale_color_manual(values = c("cyan","darkolivegreen3","black","chartreuse1","grey","pink","brown","deepskyblue4","blue","beige","yellow", "darkorchid","goldenrod2","orange","coral4" , "purple","red","darkturquoise", "darkseagreen","green")))
}






        