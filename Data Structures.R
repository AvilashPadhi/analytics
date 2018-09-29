# Data Structures in R

#Vectors----
x=1:10 #Create sequence of numbers from 1 to 10
x1 <- 1:20
(x1=1:30)
(x2=c(1,2,13,4,5)) #Concatinate and group several variables in a vector
class(x2) #Shows the class of vector
class(x1) 
(x3=letters[1:10]) #First 10 characters of the alphabet
LETTERS[1:26]
(x3b=c('a','Dhiraj','4'))
class(x3b)
letters[1:10]
letters[1:26]
?c #To find what a function means
x4=c(T,FALSE,TRUE,T,F)
class(x4)
x5b=c(1,'a',T,4L)
x5=c(3L,5L)
class(x5b)
x5a=c(3,5)
#access elements----
x6=seq(0,100,by=3)
?seq
ls() #Shows all printable values in my current environment
x6
length(x6) #How long is vector
x6[20] #Access/print the 20th value in the given vector
x6[c(2,4)] #Access 2nd and 4th value in given vector
x6[-1] #Prints the vector except for the first position
x6[-c(1:10)] #Removes first 10 values of vector
x6[-c(1:10,15:20)] #Removes 1 to 10 and 15 to 20
x6[-(length(x6)-1)] #Removes last value
x7 =c(x6,x2) #Creates new vector combining the elements from x6 and x2

#Modify----
sort(x6)
sort(x6[-c(1,2)])
sort(x6, decreasing = T)
rev(x6)
seq(-3,10,by=.2)
x=-3:2
x[2]<-0; x #Modifty 2nd variable of vector x with 0 and update same vector x
x[x<0]=5;x #Modify all elements less than 0 with 5
x<0
x<3
x=x[1:4]; x #Truncate to only first 4 values
x=seq(1,5, length.out=10)
x
x=NULL #CEASE EXISTENCE
x
x= rnorm(100) #normal distribution with mean 0 and std deviation of 1
x1=rnorm(1000, mean=50, sd=5)
plot(density(x1))
plot(density(x))
mean(x1)
abline(v=mean(x1))

#Matrices----
100:111
m1=matrix(1:12,nrow=4) #Filled by column, rows divisible by number of variables
m2=matrix(1:12,ncol=3, byrow=T) #Filled by row
m1
m2
x=101:124
length(x)
matrix(x, ncol=6) -> z
attributes(m1)
dim(m1)
dim(z)
#access elements of matrix
m1[1,2:3]
m1[c(1,3),]
m1[,1]
m1[,-c(1,3)]
#names 
paste("C","D",sep="-")
paste("C",1:100,sep="-")
colnames(m1) = paste("C",1:3,sep="")
rownames(m1) = paste("R",1:4,sep="")
m1
attributes(m1) #Shows row names and column names of the matrix
#Vector to Matrix
m3=1:24
dim(m3) = c(6,4)
m3
m2[c(T,F,F,F),c(2,3)] #logical indexing
m2
m2[m2>5]
m1[c("R1"),]
m1[c("R1"),c("C1","C3")]
#modify vector
m2
m2[2,2]
m2[2,2] = 10
m2
m2[m2>10] = 99
m2
rbind(m2,c(55,65,77))
cbind(m2,c(45,36,23,76))
cbind(m2,m2)
rbind(m2,m2)
#row and column summary
colSums(m1); rowSums(m1)
colMeans(m1); colMeans(m1)
t(m1) #transpose
#sweep
sweep(m1, MARGIN= 1, STATS=c(2,3,4,5), FUN="+") #rowwise
sweep(m1, MARGIN=2 , STATS=c(2,3,4), FUN="*") #colwise
#addmargins
?addmargins
addmargins(m1, margin=1, sum) #colwise func
addmargins(m1,margin=2,sd) #rowwise func
addmargins(m1,c(1,2),mean) #row and column wise function
addmargins(m1,c(1,2),list(list(mean,sum,max),list(var,sd))) #row and column functions

#Arrays----

#Data Frame----
#creating data frame vectors
rollno=1:30
sname= paste("Student",1:30,sep="")
gender=sample(c("M","F"),size=30,replace=T,prob=c(.7,.3))
marks=floor(rnorm(30,mean=50,sd=10))
marks2=ceiling(rnorm(30,40,5))
course=sample(c("BBA","MBA"),size=30,replace=T,prob=c(.5,.5))
#creating data frame
df1=data.frame(rollno,sname,gender,marks,marks2,course,stringsAsFactors = F)
df1
str(df1) #structure of DF
head(df1) #top 6 rows
head(df1,n=3) #top 3 rows
tail(df1) #bottom 6 rows
tail(df1,n=3) #bottom 3 rows
df1
summary(df1) #summary
df1$gender = factor(df1$gender)
df1$course = factor(df1$course)
summary(df1)
#as per conditions
df1[marks>50 & gender =="F",c("rollno","sname","gender","marks")]
names(df1) #names of columns
aggregate(df1$marks, by=list(df1$gender), FUN=max)
#check sir's notes
#Lists----
