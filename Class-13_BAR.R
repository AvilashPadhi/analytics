install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
d<-read.csv("C:/Users/Avilash/Desktop/XIMB - BM/Term 5/BAR/11913_g.csv",header=T)
rpart(CREDIT~.,data=d,method="class")->dt
dt
rpart.plot(dt)

#benefits are you find the interaction between the variables and selection of important variables becomes easier.

printcp(dt)

#CP-Complexity parameter indicates incremental imporovement in your classification by one more split. root node error= 300 which defaulted out of 1000, this 0.3 is set as 1. xerror- relative error wrt to the misclassification error. 