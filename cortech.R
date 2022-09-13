library(psych)
library(factoextra)
library(usedist)
library(cluster)
library(ape)
library(phytools)
library(picante)
library (ggplot2)


dist.cor <- get_dist(table, method = "pearson")
dist.cor[is.na(dist.cor)] <- 0
fviz_dist(dist.cor)


