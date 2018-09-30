#mtcars linear regression
#https://cran.r-project.org/web/packages/olsrr/olsrr.pdf
#install.packages("olsrr")
install.packages("olsrr")
library(olsrr)
model= lm(mpg~disp+hp+wt+qsec,data=mtcars)
model
k=ols_step_all_possible(model)
k
plot(k)

#create model and check which one is better

m1=lm(mpg~wt,data=mtcars)
m2=lm(mpg~hp+wt+qsec,data=mtcars)
anova(m1,m2) #if pvalue is <0.05 reject Ho
#Ho: Model m1, is better:m1 should be subset of m2

AIC(m1,m2)
AIC(m1)
#Lower AIC, better model