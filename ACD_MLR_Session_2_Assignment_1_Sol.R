rm(list=ls())
setwd("C:/BigData/Analytics/R/MLR")
library(class)

x1 = c(0,1,2,6,5.5,6.5)
y1 = c(0,1,2,6,7,5)
c <- c('A','A','A','B','B','B')
c <- as.factor(c)
df = data.frame(x1,y1,c)

plot(df$x1,df$y1)

table(df$c)

train <- df

x1 = c(4,3.5,5.8)
y1 = c(4,3.5,5)
test <- data.frame(x1,y1)

train1 <- subset(train,select = -(c))
pred = knn(train1, test, train$c , k=1)
table(pred)

#output : for given test A: 1 , B:2