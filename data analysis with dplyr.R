#Data Analysis using dplyr

install.packages("dplyr")
library(dplyr)
?mtcars
mtcars
dplyr::filter(mtcars,mpg>25 & am==1)
filter(mtcars,mpg>25 & am==1)
mtcars%>% filter(mpg>25 & am==1)
mtcars%>% filter(mpg>25 & am==1) %>% arrange(wt)
mtcars%>% filter(mpg>25 & am==1) %>% arrange(wt)%>% summarise(n())
mtcars%>% filter(mpg>25 & am==1) %>% arrange(wt)%>% count()
mtcars%>%group_by(am)%>%summarise(mean(mpg))
mtcars%>%group_by(am)%>%summarise(mean(gear))
#mutate----
mutate(mtcars,displ_l=disp/61.0237) #keeps other cols
transmute(mtcars,displ_l=disp/61.0237) #removes other cols
mutate(mtcars,cyl=NULL) #do not display cyl column

#structure
mtcars%>%group_by(am)%>%summarise(mean(mpg),max(wt),min(wt))

#see sir's notes