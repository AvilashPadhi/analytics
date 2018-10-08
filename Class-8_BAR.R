d<- read.csv(file.choose(),header = T)
id<-sample(1:1994,0.8*1994)
train<- d[id,]
test<-d[-id,]
prcomp(train[,2:99],scale=T)->pca
pca$sdev
screeplot(pca)
plot(cumsum(pca$sdev^2))
View(pca$X)
train1 <- as.data.frame(pca$x)
train1$depv<-train[,100]
lm(depv~PC1+PC2+PC3+PC4, train1) ->ft
summary(ft) #the regression model is built, how will I use this on new data now?
View(pca$rotation)
scale(test[,2:99])->teststd #scaled version of the test data, this is to be multiplied to the original rotation matrix to get pricipal component output
as.matrix(teststd) %*% pca$rotation #scaled data is multiplied with the rotation matrix
as.matrix(teststd) %*% pca$rotation ->testfinal
View(testfinal)
testfinal<- as.data.frame(testfinal) #stored matrix is now treated as a data frame
predict(ft, testfinal)->p
mean(abs(test[,100]-p))
lm(depv~PC1+PC2+PC3+PC4+PC5+PC6+PC7, train1) ->ft1
predict(ft1, testfinal)->p1
mean(abs(test[,100]-p1))
#Error keeps reducing as we keep adding more variables/ components
#PCA transformation can only be done on numerical variables
View(pca$x)
first15<-row.names(pca$x)[1:15]
first15
plot(pca$x[1:15,1],pca$x[1:15,2]) #scatter plot of PC1 and Pc2 variables for first 15 rows
first15 <- as.numeric(first15)
first15
text(pca$x[1:15,1],pca$x[1:15,2],train[1:15,1])
#so based on 2 pricipal components we can see how seperate communities are clustered/ segmented
d<-data.frame(x1=rnorm(3),x2=rnorm(3),x3=rnorm(3),x4=rnorm(3))
d
prcomp(d)
#principal componenets cannot be more than minimum columns and rows, rest data is exhausted