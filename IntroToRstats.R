library(ggplot2)
library(sciplot)
library(mosaic)
library(tableone)
library(survival)
library(car)

#I'm going to create a vector
vec1=c(1,2,3,4,5,6,7,8)
vec1
#I'm going to create a data frame 

##I'm going to perform some basic statistical analyses
vec2=c(2,7,4,7,1,9,12,6)
vec2

#mean median and mode
mean()
median()
mode()

#variance and standard deviation 
var(vec1)
sd(vec1)

#chi square test 
chisq.test(vec1,vec2)

#t.test 
t.test(vec1,vec2)

#wilcoxn and mann-whitney U test 
wilcox.test(vec1,vec2)

#testing for normality of data
shapiro.test(vec2)

# qqplot to visualize normality 
qqnorm(vec1)
student=read.csv("student(1).csv")
summary(student)


# create the model

modDistance = lm(home~region, data=myStudents)
modDistance
# ask for output

summary(modDistance)
Anova(modDistance, type=3)      # requires car

# Tukey posthoc test

summary(glht(modDistance, linfct=mcp(region="Tukey"))) # requires multcomp

# check assumptions

plot(modDistance)

# try again with a log transform

modLogDistance = lm(log10(home+1)~region, data=myStudents)
plot(modLogDistance)

summary(modLogDistance)
anova(modLogDistance, type=3)

# the posthoc test is not necessary
# summary(glht(modLogDistance, linfct=mcp(region="Tukey"))) 

# make a graph

boxplot(log10(home+1)~region, data=myStudents,
        ylab = "log(distance to campus, miles)",
        xlab = "region")

# Conclusion: fail to reject the null hypothesis