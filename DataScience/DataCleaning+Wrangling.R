library(ggplot2)
library(sciplot)
library(mosaic)
library(tableone)
library(survival)
library(car)


student=read.csv("student(1).csv")
student

#Introduction to data cleaning book
#https://cran.r-project.org/doc/contrib/de_Jonge+van_der_Loo-Introduction_to_data_cleaning_with_R.pdf

#cheat sheet for data wrangling
#https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf

write.csv(data,"data.csv",na="0")

#turning "0" into "NA" for a vector 
x[x==0] <- NA


#turning "NA" into "0" for a vector
data[is.na(data)] =0


#removing "NA" from data analysis 
newstudent <- na.omit(student)
newstudent

#removing "0" from a data frame
student[student == 0] <- NA
newstudent <- na.omit(student)
newstudent

plot(newstudent$workhr, newstudent$gpa)
lm(workhr~gpa, data = newstudent)
abline(lm(workhr~gpa, data = newstudent))

summary(newstudent$gpa,newstudent$workhr)

summary(lm(workhr~gpa, data = newstudent))
lm(workhr~gpa, data = student)
abline(lm(workhr~gpa, data = newstudent))


summary(lm(workhr~gpa, data = student))

count(easy$BMI..30)

count(CCUData)


