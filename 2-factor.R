grades= sample(c("A","B","C","D"),size=30,replace = T, prob=c(0.4, 0.2, 0.3, 0.1))
gradesF=factor(grades)
summary(grades)
summary(gradesF)
table(grades)
table(gradesF)
gradesFO=factor(grades, ordered=T)
gradesFO1=factor(grades, ordered=T, levels=c("B","C","A","D"))
gradesFO
summary(gradesFO1)
summary(gradesFO)

marks=ceiling(rnorm(30,mean=60,sd=5))
gender=factor(sample(c("M","F"),size=30,replace=T))
student1=data.frame(marks,gender,gradesFO1)
student1
boxplot(marks~gradesFO1, data=student1)
boxplot(marks~gradesFO1+gender, data=student1)
summary(marks)
abline(h=summary(marks))
quantile(marks)
