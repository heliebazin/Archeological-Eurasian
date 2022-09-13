library(ape)
library(phytools)
library(picante)
culture <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\culture.csv',sep = ';',stringsAsFactors=FALSE)


col <-c("red", "darkolivegreen3", "blue", "orange", "yellow", "purple", "pink", "green","cyan","goldenrod2","coral4","darkorchid","darkturquoise","darkseagreen")
culk <- c('Yayoi','Chulmun','Mumun','Xiaozhushan','Shuangtuozi','Xiajiadian','Hongshan','Zuojiashan','Baijinbao','Xiaohexi','Xinglongwa','Xinkailiu','Zaisanovka','Zhaobaogou')
colfeuil = NULL

col2 <-c("red", "darkolivegreen3", "blue")
culk2 <- c('Yayoi','Chulmun','Mumun')
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
  legend(x = "bottomleft", legend=culk2,
         fill = col2, cex = 0.5, border="white",
         bty = 'n'
  )
}

colortree(ceramicMCC)
colortree(fullMCC)
colortree(toolsMCC)
colortree(otherMCC)


ceramiccons <- consensus(ceramic.trees,p=0.5)
fullcons <- consensus(full.trees,p=0.5)
othercons <- consensus(others.trees,p=0.5)
toolscons <- consensus(tools.trees,p=0.5)


colortree(ceramiccons)
colortree(fullcons)
colortree(toolscons)
colortree(othercons)
