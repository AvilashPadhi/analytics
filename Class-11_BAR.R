#KMEANS CLUSTERING

data(iris)
str(iris)
kmeans(iris[,-5],3)->cl
str(cl)
summary(cl)
cl
cl$size
cl$totss
cl$withinss
d<-iris
d$cluster<-cl$cluster
View(d)
boxplot(Sepal.Length ~ cluster, data=d)

#this can help profile these various segments

boxplot(Sepal.Width~cluster, data=d)
summary(aov(Sepal.Width~as.factor(cluster), data=d))
d$age<-rnorm(150,24,1.5)
head(d)

#we need to standardise the data here as it distorts groping otherwise

as.data.frame(scale(d[,-c(5,6)])) ->d1
head(d1)

#brings down the variation in age and clustering is better again

d1$age<-.5*d1$age

#this reduces weight of age by 50%

kmeans(d1,3)

#as between/ total sum of square decreasesx, the explanatory power reduces. also age is not necessary as it distorts data. distribution of age is same across all clusters.

kmeans(d1,4)

install.packages("cluster")
install.packages("clustertend")
install.packages("NbClust")

#HIERARCHIAL CLUSTERING

