library(psych)
library(factoextra)
library(usedist)
library(dendextend)
library(cluster)
library(ape)
library(phytools)
library(picante)
library (ggplot2)


type <- c("character","character",rep("numeric",256))
df6 <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\archeology_missingcorrected6.csv',sep = ';',stringsAsFactors=FALSE,colClasses = type)
#données manquantes = absence technologie

df6[is.na(df6)] <- 0

table <- df6[,3:258]
rownames(table) <- make.unique(df6$Tech)
colorCodes <- c(Ceramics="red", Stone_Tools="green", Buildings="blue", Burials="yellow",Shell = "orange",Food="purple")



#approche correlation

dist.cor <- get_dist(table, method = "pearson")
dist.cor[is.na(dist.cor)] <- 0
hc <- hclust(dist.cor)
dend <- as.dendrogram(hc)
labels_colors(dend) <- colorCodes[df6$Tech][order.dendrogram(dend)]
plot(dend)





#approche pvalue

pvalue <- matrix(NA,171,171)
rownames(pvalue) <- make.unique(df6$Tech)
res <- c()
for (i in 2:171){
  for(j in 1:(i-1)){
    res  <- append(res,as.double(cor.test(table[,i],table[,j])[3]))
  }

}
res[is.na(res)] <- 0
pvalue[lower.tri(pvalue)]<- res
diag(pvalue) <- 0


test <- as.dist(pvalue, diag = TRUE)
hc2 <- hclust(test)
dend2 <- as.dendrogram(hc2)
labels_colors(dend2) <- colorCodes[df6$Tech][order.dendrogram(dend2)]
plot(dend2)



#matrice distance 



dist.cor <- get_dist(table, method = "pearson")
dist.cor[is.na(dist.cor)] <- 0
fviz_dist(dist.cor)


