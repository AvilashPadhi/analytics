d<-read.csv(file.choose())
summary(d)
str(d)
install.packages("ggplot2")
install.packages("car")
View(d)
colnames(d)[c(1,100)]
ft=lm(ViolentCrimesPerPop~.-communityname, data=d)
ft
library(car)
install.packages("carData")
install.packages("carData")
install.packages("carData")
library(car)
library(carData)
library(car)
prcomp(d[,-c(1,100)],scale=T)->pca
pca
pca$sdev #std dev in each component
#first has major explanatory power, then next has lower and subsequent have lower and so on
pca$sdev^2 #variation in each component
screeplot(pca)
sum(pca$sdev^2) #scaled data so it should be equal to number of variables
plot(pca$sdev^2/98) #shows fraction of variance explained by the variables/components
pca$sdev[1:10]
pca$sdev[1:10]^2
sum(pca$sdev[1:10]^2)/98 #so first ten components are able to explain about 79% of the variations in the variables
sum(pca$sdev[1:15]^2)/98 #15 variables is able to do so for about 85% of the variations
View(pca$x) #shows 98 transformed columns from the original columns, first has highest explanatory power and so on.
View(pca$rotation) #rotation matrix, this was applied on the original data set to get the pc1,pc2 matrix. this is the matrix that has changed the data
d1 <-as.data.frame(pca$x[,1:15]) #fetches only first 15 columns and is the new data set
View(d1)
d1$depv <- d[,100]
View(d1)
lm(depv~.,data=d1)->ft1
ft1
summary(ft1) #Rsquare has reduced
View(pca$rotation)
biplot(pca)
scatterplot(pca$rotation[1:20,1],pca$rotation[1:20,2])
text(pca$rotation[1:20,1],pca$rotation[1:20,2],labels=colnames(d)[2:21])