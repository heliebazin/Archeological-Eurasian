library(logisticPCA)
library(ggplot2)





type <- c("character","character","character",rep("numeric",256))
df6 <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\archeology_missingcorrected6.csv',sep = ';',stringsAsFactors=FALSE,colClasses = type)
type2 <- c("character","numeric","numeric","character",rep("numeric",172))
df4 <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\archeology_missingcorrected5.csv',sep = ';',stringsAsFactors=FALSE,colClasses = type2)


#Date la plus ancienne d'apparition de chaque technologie
res2 <- c()
res4 <- c()
df6[,4] <- c()

for (j in (6:176)){
  k = j - 5
  i <- which(df4[,j] == 1)
  mauv <- df4[i,c(4,5)]
  indx <- which(mauv[,2]==max(mauv[,2]))
  df6[k,4] <- mauv[indx[1],2]
  df6[k,3] <- mauv[indx[1],1]
  
}



tableau <- df6[,5:256]




#Exponential PCA
logsvd_model = logisticSVD(tableau, k = 2)




plot(logsvd_model, type = "scores") + geom_point(aes(colour = df6$Tech)) + 
  ggtitle("Exponential Family PCA") 


plot(logsvd_model, type = "scores") + geom_point(aes(colour = df6$Apparition)) + 
  ggtitle("Exponential Family PCA") 

plot(logsvd_model, type = "scores") + geom_point(aes(colour = df6$Date_Min)) + 
  ggtitle("Exponential Family PCA") + scale_colour_gradientn(colours = terrain.colors(10))



#Logistic PCA
logpca_cv = cv.lpca(tableau, ks = 2, ms = 1:10)
m = which.min(logpca_cv)
logpca_model = logisticPCA(tableau, k = 2, m = which.min(logpca_cv))

plot(logpca_model, type = "scores") + geom_point(aes(colour = df6$Tech)) + 
  ggtitle("Logistic PCA") 
plot(logpca_model, type = "scores") + geom_point(aes(colour = df6$Apparition)) + 
  ggtitle("Logistic PCA") 

plot(logpca_model, type = "scores") + geom_point(aes(colour = df6$Date_Min)) + 
  ggtitle("Logistic PCA") + scale_colour_gradientn(colours = terrain.colors(10))

