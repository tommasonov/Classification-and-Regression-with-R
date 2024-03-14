#Import Library and dataset

library(ISLR)

df <- College

#Check first rows of Dataset

#print(head(df))

#Check structure of Dataset

#print(str(df))

#EDA

library(ggplot2)

#Scatterplot of Grad.Rate versus Room.Board, Colored by the Private column

pl <- ggplot(df,aes(Room.Board,Grad.Rate)) + geom_point(aes(color=Private))

#Histogram of full time undergrad students, colored by Private

pl2 <- ggplot(df,aes(F.Undergrad)) + geom_histogram(aes(fill=Private),color='black',bins=50,alpha=0.5) + theme_bw()

#Histogram of Grad.Rate colored by Private

pl3 <- ggplot(df,aes(Grad.Rate)) + geom_histogram(aes(fill=Private),color='black',bins=50,alpha=0.5) + theme_bw()

#We can see a college with Grad Rate > 100%
#Lat's check 

library(dplyr)

#print(filter(df,Grad.Rate > 100))

#Cazenovia College has values with Grad.Rate > 100 to 100

df['Cazenovia College','Grad.Rate'] <- 100

###Train Test Split

library(caTools)
set.seed(101)

sample <- sample.split(df$Private, SplitRatio = 0.70)

train <- subset(df, sample == T)

test <- subset(df, sample == F)

#Decision Tree

library(rpart)

tree <- rpart(Private ~ .,method='class',data=train )

tree.preds <- predict(tree,test)

### 

tree.preds <- as.data.frame(tree.preds)

joiner <- function(x){
  if (x >= 0.5){
    return("Yes")
  }else{
    return("No")
  }
}
tree.preds$Private <- sapply(tree.preds$Yes,joiner)

#Create Confusion Matrix

conf.mat <- table(tree.preds$Private,test$Private)


#Let's plot Decision Tree

library(rpart.plot)

tree.plot <- prp(tree)

##Random Forest

library(randomForest)

rf.model <- randomForest(Private ~ ., data=train,importance=T)

#Confusion Matrix on Trining

rf.conf.mat <- rf.model$confusion

#check feature importance

rf.model$importance

#Predictions

rf.preds <- predict(rf.model,test)

#Confusion Matrix on Test

table(rf.preds,test$Private)

     