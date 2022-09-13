library(ape)
library(phangorn)



ceramicMCC <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Ceramics\\MCCceramic.nex')
toolsMCC <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Tools\\MCCtools.nex')
fullMCC <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\paper_experiment\\MCCfull.nex')
otherMCC <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Others\\MCCother.nex')

ceramic.trees <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Ceramics\\ceramics.trees.trees')
tools.trees <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Tools\\tools.trees.trees')
full.trees <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\paper_experiment\\pdcov.trees')
others.trees <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Others\\others.trees.trees')

MCdist <- function(file1,file2){
  n1 <- length(file1)
  n2 <- length(file2)
  l <- 1:4
  M <- matrix(NA,1000,4)
  for (i in 1:1000){
    t1 <- file1[[n1-i]]
    t2 <- file2[[n2-1000-i]]
    M[i,] <- treedist(t1,t2)
  }
  l <- colMeans(M)
  return (l)
}

sym_diff <- matrix(NA, 4,4)
branch_diff <- matrix(NA, 4,4)
path_diff <- matrix(NA, 4,4)
quad_diff <- matrix(NA, 4,4)

l11 <- MCdist(full.trees,full.trees)
l21 <- MCdist(full.trees,ceramic.trees)
l31 <- MCdist(full.trees,tools.trees)
l41 <- MCdist(full.trees,others.trees)
l22 <- MCdist(ceramic.trees,ceramic.trees)
l32 <- MCdist(ceramic.trees,tools.trees)
l42 <- MCdist(ceramic.trees,others.trees)
l33 <- MCdist(tools.trees,tools.trees)
l43 <- MCdist(tools.trees,others.trees)
l44 <- MCdist(others.trees,others.trees)



sym_diff[1,1] <- l11[1]
sym_diff[2,1] <- l21[1]
sym_diff[3,1] <- l31[1]
sym_diff[4,1] <- l41[1]
sym_diff[2,2] <- l22[1]
sym_diff[3,2] <- l32[1]
sym_diff[4,2] <- l42[1]
sym_diff[3,3] <- l33[1]
sym_diff[4,3] <- l43[1]
sym_diff[4,4] <- l44[1]


branch_diff[1,1] <- l11[2]
branch_diff[2,1] <- l21[2]
branch_diff[3,1] <- l31[2]
branch_diff[4,1] <- l41[2]
branch_diff[2,2] <- l22[2]
branch_diff[3,2] <- l32[2]
branch_diff[4,2] <- l42[2]
branch_diff[3,3] <- l33[2]
branch_diff[4,3] <- l43[2]
branch_diff[4,4] <- l44[2]

path_diff[1,1] <- l11[3]
path_diff[2,1] <- l21[3]
path_diff[3,1] <- l31[3]
path_diff[4,1] <- l41[3]
path_diff[2,2] <- l22[3]
path_diff[3,2] <- l32[3]
path_diff[4,2] <- l42[3]
path_diff[3,3] <- l33[3]
path_diff[4,3] <- l43[3]
path_diff[4,4] <- l44[3]

quad_diff[1,1] <- l11[4]
quad_diff[2,1] <- l21[4]
quad_diff[3,1] <- l31[4]
quad_diff[4,1] <- l41[4]
quad_diff[2,2] <- l22[4]
quad_diff[3,2] <- l32[4]
quad_diff[4,2] <- l42[4]
quad_diff[3,3] <- l33[4]
quad_diff[4,3] <- l43[4]
quad_diff[4,4] <- l44[4]


