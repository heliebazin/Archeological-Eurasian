library(logisticPCA)
library(ggplot2)



donnees<- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\archeology_missingcorrected5.csv',sep = ';',stringsAsFactors=FALSE) 
culture = donnees$Culture
color = c("cyan","darkolivegreen3","black","chartreuse1","grey","pink","brown","deepskyblue4","blue","beige","yellow", "darkorchid","goldenrod2","orange","coral4" , "purple","red","darkturquoise", "darkseagreen","green")
#Exponential PCA

logsvd_model = logisticSVD(donnees[,6:176], k = 2)
plot(logsvd_model, type = "scores") + geom_point(aes(colour = culture)) + 
  ggtitle("Exponential Family PCA") + scale_colour_manual(values = color)+
  geom_text(aes(label = donnees$Date),size = 2,hjust =0.1,vjust=1)





#Log PCA

logpca_cv = cv.lpca(donnees[,6:176], ks = 2, ms = 1:10)
m = which.min(logpca_cv)
logpca_model = logisticPCA(donnees[,6:176], k = 2, m = which.min(logpca_cv))

plot(logpca_model, type = "scores") + geom_point(aes(colour = culture)) + 
  ggtitle("Logistic PCA") + scale_colour_manual(values = color)+
  geom_text(aes(label = donnees$Date),size = 1.5,hjust = 0,vjust=1)


#Convex Log PCA

clogpca_model = convexLogisticPCA(donnees[,6:176], k = 2, m = which.min(logpca_cv))
plot(clogpca_model, type = "scores") + geom_point(aes(colour = culture)) + 
  ggtitle("Convex Logistic PCA") + scale_colour_manual(values = color)+
  geom_text(aes(label = donnees$Date),size = 1.5,hjust = 0,vjust=1)