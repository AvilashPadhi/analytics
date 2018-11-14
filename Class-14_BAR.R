d<-read.csv("C:/Users/Avilash/Desktop/XIMB - BM/Term 5/BAR/11913_g.csv", header=T)
d$CREDIT<-as.factor(d$CREDIT)
install.packages("randomForest")
library(randomForest)
randomForest(CREDIT~.,data=d,ntree=500,mtry=5)
rf<-randomForest(CREDIT~.,data=d,ntree=500,mtry=5)
rf
plot(rf)

#Green-OOBs on 1s, Black- OOBs on zeros and Red-Overall OOB

randomForest(CREDIT~.,data=d,ntree=500,mtry=10)->rf
rf

#second parameter, mtry, needs to be fine tuned. TuneRF function is used to find which mtry and ntree levels will have lowest OOB and best fit.