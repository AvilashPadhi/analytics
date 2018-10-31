library("cluster")
library("clustertend")
library("NbClustd")
data(iris)
str(iris)
d <- iris
dist(iris[,-5])->dt
View(as.matrix(dt))
hclust(dt,method="single")->clsin
plot(clsin)

#Single linkage is not working in this data set as we need to try other methods

hclust(dt,method="complete")->clcom
plot(clcom)

#better clustering, subjective distribution of the dendogram can be done. Look for clarity not the size of cluster etc.

cutree(clcom, k=3)->clusters
clusters

#clustering vectors/ labels/ group names have been assigned now

#additional checks will now be carried out using silhouette coefficient, eg "7" is in cluster 1, but does 7 belong better in cluster 1 or other clusters.

#find distance of "7" from all group members and find average and call it a7, from own group.

#look at distance of "7" from distance to all group members of cluster 2, b2, is avg distance between 7 and members of cluster 2. similarly b3 is avg distance between 7 and members of cluster 3.

#silo width is simply defined as (b7-a7)/max(b7,a7). This value is always between -1 and +1.

#you have to be closer to your group members than in other clusters

plot(silhouette(clusters,dt))

#150 obs, cluster 1 has 50 obs with silo width of 0.76, which is good. Cluster 2 has 72 but silouhette of 0.31 is bad with some members in negatove silohouette. cluster 3 is a good cluster. cluster 2 is worse off than cluster 3 and cluster 1

silhouette(clusters,dt)

#eg, row 64 is in a negative silo width and is better fit in cluster 3. this is how you read the output in silo function.

d<- iris
str(d)

d$size<- sample(1:4, 150, repl=T)
as.ordered (d$size) -> d$size
str(d)

#clustering on non uniform data. species is a factor variable while size is an ordered factor. how do deal with such mixed data situations?

#stratify within each cluster or the other way is to normalise everything and bring every single variable into the range of 0 and 1. check notes for rank and range normalisation explanations.

max(d$Sepal.Length)
min(d$Sepal.Length)

#normalisation of all colums in done through gower metric

daisy(d,metric="gower") ->dt

#this gives normalisation of mixed data using gower metric

View(as.matrix(dt))

#this makes a normalised distance matrix with mixed data to be used in clustering

dist(scale(iris[,-5]))->dt

hopkins(d[,-c(5,6)],n=25)

#fairly small hopkins measure and is steady so the data set is well clusterable

d1<- data.frame(x=rnorm(100),y=rnorm(100))
hopkins(d1,n=15)

#hopkins measures shot up to 0.4

d1<- data.frame(x=rnorm(100),y=rnorm(100), z=rnorm(100),w=rnorm(100))
hopkins(d1,n=15)

#high hopkin's measure, random data is not clusterable

library(NbClust)

NbClust(iris[,-5],min.nc=2,max.nc=8, method="complete")

#So from above, best number of clusters in the given data set is 3 as given in the output.

