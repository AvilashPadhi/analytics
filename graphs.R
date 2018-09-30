#plot----
women
plot(women)
plot(women, type="p",pch=19)
plot(women, type='l')
plot(women,type="p",pch=15,col=2)
plot(women,type="b",pch=15,col=2)
abline(lm(women$weight~women$height),col="red",lty=2,lwd=4)
#boxplot----
boxplot(women$height)
quantile(women$height)
quantile(women$height, seq(0,1,.1))
quantile(women$height, seq(0,1,.01)) #percentile breakdown
boxplot(women$height, col="green")
stem(women$height)
#histogram----
hist(women$height)
hist(women$height,breaks=10)
hist(women$height,breaks=5,col=(1:5))
#hist2
x=rnorm(100,50,10)
hist(x)     
hist(x,freq=F,col=(1:5))
lines(density(x))

#density plot: shape of data----
plot(density(x),col="red")

#pie----
gender
table(gender)
pie(table(gender))
x=c(10,20,40,50)
pie(x)
xlabels=c("A","B","C","D")
x/sum(x)
labels2=paste(xlabels, round(x/sum(x),2)*100, sep="-")
pie(x, labels=xlabels)
pie(x, labels=labels2)
x

#barplot----
barplot(x,col=(1:4))
barplot(x,col=(1:4),horiz=T)

#correlation plot----
pairs(women)
cor(women$height,women$weight)
cov(women$height,women$weight)

pairs(mtcars)
pairs(mtcars[1:4])
pairs(mtcars[c("disp","hp")])

#Frequency distribution----

#discrete category diagram
attend=c("A","P","P","A","P","A")
table(attend)

#discrete num diagram
#see sir's notes

#Continuos Data
set.seed(1234)
x3=runif(100,0,150) #range of numbers from 0 to 150m,100 values, this is continuos data
x3
x3=ceiling(x3)
x3
range(x3)

#divide range into step of 15 of 10 levels
breaks=seq(0,150, by=15)
breaks
length(breaks)
x3
x3.ct = cut(x3,breaks) #continuos data broken up into required breaks
x3.ct
table(x3.ct) #frequency table created
cbind(table(x3.ct)) #see it vertically
hist(table(x3.ct))
