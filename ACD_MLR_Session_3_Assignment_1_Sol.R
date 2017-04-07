rm(list=ls())
setwd("C:/BigData/Analytics/R/MLR")
#install.packages("caret")
#install.packages("lattice")

#install.packages("mlbench")
#Classify the people as republican and democrat using Naïve Bayes. 
#Create a confusion matrix and tell the accuracy level

library(mlbench)
library(DMwR)
library(caret)

data(HouseVotes84)
#ds <- data.frame(lapply(HouseVotes84, as.character), stringsAsFactors = FALSE)
ds <- HouseVotes84

charToNum <- function(vi){
  vi = ifelse(vi == 'y',1,0)
}
ds$V1 <- sapply(ds$V1, charToNum)
ds$V2 <- sapply(ds$V2, charToNum)
ds$V3 <- sapply(ds$V3, charToNum)
ds$V4 <- sapply(ds$V4, charToNum)
ds$V5 <- sapply(ds$V5, charToNum)
ds$V6 <- sapply(ds$V6, charToNum)
ds$V7 <- sapply(ds$V7, charToNum)
ds$V8 <- sapply(ds$V8, charToNum)
ds$V9 <- sapply(ds$V9, charToNum)
ds$V10 <- sapply(ds$V10, charToNum)
ds$V11 <- sapply(ds$V11, charToNum)
ds$V12 <- sapply(ds$V12, charToNum)
ds$V13 <- sapply(ds$V13, charToNum)
ds$V14 <- sapply(ds$V14, charToNum)
ds$V15 <- sapply(ds$V15, charToNum)
ds$V16 <- sapply(ds$V16, charToNum)
ds[is.na(ds)] <- 0
str(ds)

index = sample(1:nrow(ds), replace = F, 0.7*nrow(ds))
train <- ds[index,]
test <- ds[-index,]

library(e1071)
predNavie <- naiveBayes(train$Class~.,train)
trainNavie <- predict(predNavie, train[,-c(train$Class)])
table(train$Class, trainNavie)
#Train Accuracy: 95%
#Recall to Democrat: 96%
#Precision to Democrat : 95%

testNavie <- predict(predNavie, test[,-c(test$Class)])
table(test$Class, testNavie)
#Accuracy: 91%
#Recall to Democrat: 97%
#Precision to Democrat : 89%