library(ape)
library(phytools)
library(picante)
culture <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\culture.csv',sep = ';',stringsAsFactors=FALSE)


col <-c("red", "darkolivegreen3", "blue", "orange", "yellow", "purple", "pink", "green","cyan","goldenrod2","coral4","darkorchid","darkturquoise","darkseagreen")
culk <- c('Yayoi','Chulmun','Mumun','Xiaozhushan','Shuangtuozi','Xiajiadian','Hongshan','Zuojiashan','Baijinbao','Xiaohexi','Xinglongwa','Xinkailiu','Zaisanovka','Zhaobaogou')
colfeuil = NULL



colorleaf <- function(tree){
  n <- length(tree$tip.label)
  colfeuil <- rep("black",n)
  for (i in 1:n){
    ck = tree$tip.label[i]
    ul = culture$Cultures[culture$SiteName == ck]
    if(ul %in% culk == TRUE){
      j = which(culk == ul)
      colfeuil[i] = col[j]
    }
    else{
      colfeuil[i] = "black"
    }
  }
  return(colfeuil)
}

colortree <- function(tree){
  colfeuil <- colorleaf(tree)
  plot(tree,tip.color=colfeuil,cex=0.4)
}

colortree(ceramicMCC)
colortree(fullMCC)
colortree(toolsMCC)
colortree(otherMCC)
