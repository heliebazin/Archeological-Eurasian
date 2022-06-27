library(ape)
library(phangorn)


culture <- read.csv(file = 'C:\\Users\\helie\\Documents\\Archeological Eurasian\\Full Data\\culture.csv',sep = ';',stringsAsFactors=FALSE)


yayoi <- culture$SiteName[culture$Cultures== 'Yayoi']
chulmun <- culture$SiteName[culture$Cultures== 'Chulmun']
mumun <- culture$SiteName[culture$Cultures== 'Mumun']
xiaozhushan <-  culture$SiteName[culture$Cultures== 'Xiaozhushan']
shuangtuozi <-  culture$SiteName[culture$Cultures== 'Shuangtuozi']
xiajiadian <-  culture$SiteName[culture$Cultures== 'Xiajiadian']
hongshan <-  culture$SiteName[culture$Cultures== 'Hongshan']
zuojiashan <- culture$SiteName[culture$Cultures== 'Zuojiashan']
baijinbao <- culture$SiteName[culture$Cultures== 'Baijinbao']
xiaohexi <- culture$SiteName[culture$Cultures== 'Xiaohexi']
xinglongwa <-  culture$SiteName[culture$Cultures== 'Xinglongwa']
xinkailiu <-  culture$SiteName[culture$Cultures== 'Xinkailiu']
zaisanovka <-  culture$SiteName[culture$Cultures== 'Zaisanovka']
zhaobaogou <-  culture$SiteName[culture$Cultures== 'Zhaobaogou']


monophyle <- function(file,culture){
  c = 0
  n = length(file)
  for (j in 1:1000){
    branchetest  = is.monophyletic(file[[n - j]],culture)
    if(branchetest == TRUE){
      c = c + 1
    }
  }
  return (c/1000)
}

monophyle(full.trees,yayoi)


