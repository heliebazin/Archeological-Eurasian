library(logisticPCA)
library(ggplot2)





type <- c("character","character",rep("numeric",256))
df6 <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\archeology_missingcorrected6.csv',sep = ';',stringsAsFactors=FALSE,colClasses = type)

#Date la plus ancienne d'apparition de chaque technologie
res <- c()
for (j in (6:176)){
  res2 <- df4$Date[which(df4[,j] == 1)]
  res <- append(res, max(unique(res2)))
}
df6$Date_Min<-res

tableau <- df6[,4:255]


#Exponential PCA
logsvd_model = logisticSVD(tableau, k = 2)
plot(logsvd_model, type = "scores") + geom_point(aes(colour = df6$Tech)) + 
  ggtitle("Exponential Family PCA") 

plot(logsvd_model, type = "scores") + geom_point(aes(colour = df6$Date_Min)) + 
  ggtitle("Exponential Family PCA") + scale_colour_gradient(low = "yellow", high = "blue", na.value = NA)



#Logistic PCA
logpca_cv = cv.lpca(tableau, ks = 2, ms = 1:10)
m = which.min(logpca_cv)
logpca_model = logisticPCA(tableau, k = 2, m = which.min(logpca_cv))

plot(logpca_model, type = "scores") + geom_point(aes(colour = df6$Tech)) + 
  ggtitle("Logistic PCA") 

plot(logpca_model, type = "scores") + geom_point(aes(colour = df6$Date_Min)) + 
  ggtitle("Logistic PCA") + scale_colour_gradient(low = "yellow", high = "blue", na.value = NA)

