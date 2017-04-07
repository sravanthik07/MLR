rm(list=ls())
setwd("C:/BigData/Analytics/R/MLR")
library(party)

data(iris)
summary(iris)

sum(is.na(iris))

index <- sample(1:nrow(iris),replace = F,0.8*nrow(iris))
train <- iris[index,]
test <- iris[-index,]

#Predictions using modelc50
library(C50)
ModelC50 <- C5.0(train$Species~.,data = train,rules =T)
predMc50 <- predict(ModelC50, train)
table(train$Species, predMc50)
predMc50 <- predict(ModelC50, test)
table(test$Species, predMc50)

#Predictions using decision tree
treePred <- ctree(train$Species~.,data = train)
predTree <- predict(treePred, train)
table(train$Species,predTree)
predTree <- predict(treePred, test)
table(test$Species,predTree)