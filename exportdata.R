rm(list=ls())
library(readxl)
library(tidyverse)

df <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\archeology_missingcorrected2.csv',sep = ';',stringsAsFactors=FALSE)
culture <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\culture.csv',sep = ';',stringsAsFactors=FALSE)
yayoi <- culture$SiteName[culture$Cultures== 'Yayoi']
chulmun <- culture$SiteName[culture$Cultures== 'Chulmun']
mumun <- culture$SiteName[culture$Cultures== 'Mumun']


library(ape)
exportdata<- function(i,j,nom,df){
  n<- nrow(df)
  p<- ncol(df)
  arch <- df[3:p][,i:j]
  l = split(arch, f=df$SiteName)
  write.nexus.data(l,file = nom,format = 'standard',interleaved = FALSE)
}

exportdata(108,171,'others.nex')


