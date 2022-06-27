library(ape)
library(phytools)
library(picante)




japcor.trees <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Japon-Corée\\Full\\japcor.trees')
yayoi.trees <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Japon-Corée\\Yayoi\\yayoi.trees')
chulmun.trees <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Japon-Corée\\Chulmun\\chulmun.trees')
mumun.trees <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Japon-Corée\\Mumun\\mumun.trees')
yayoimumun.trees <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Japon-Corée\\YayoixMumun\\yayoimumun.trees')


japcorMCC <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Japon-Corée\\Full\\MCCjapcor.nex')
yayoiMCC <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Japon-Corée\\Yayoi\\MCCyayoi.nex')
chulmunMCC <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Japon-Corée\\Chulmun\\MCCchulmun.nex')
mumunMCC <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Japon-Corée\\Mumun\\MCCmumun.nex')
yayoimumunMCC <- read.nexus(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Japon-Corée\\YayoixMumun\\MCCyayoimumun.nex')



japcorcons <- consensus(japcor.trees,p=0.5)
yayoicons <- consensus(yayoi.trees,p=0.5)
chulmuncons <- consensus(chulmun.trees, p=0.5)
mumuncons <- consensus(mumun.trees, p=0.5)
yayoimumuncons <- consensus(yayoimumun.trees, p=0.5)

colortree(japcorMCC)
colortree(yayoiMCC)
colortree(chulmunMCC)
colortree(mumunMCC)
colortree(yayoimumunMCC)

colortree(japcorcons)
colortree(yayoicons)
colortree(chulmuncons)
colortree(mumuncons)
colortree(yayoimumuncons)
