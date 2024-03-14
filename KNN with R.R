#KNN in R

#Call ISLR libary for iris dataset
library(ISLR)

#Import dataset

df <- iris

#Check first rows

#print(head(df))

#Check structure

#print(str(df))

#############

#Standardize features

standardized.df <- scale(df[1:4])

final.df <- cbind(standardized.df,df[5])

#Train / Test Split 

library(caTools)

sample <- sample.split(final.df$Species, SplitRatio = 0.70)

#Training Data

train = subset(final.df,sample == T)

#Test Data

test = subset(final.df,sample == F)

#Model Training (KNN)

library(class)

set.seed(101)

predicted.species <- knn(train[1:4],test[1:4],train$Species,k=1)

mean(test$Species != predicted.species) # Result 0.022

####

#Choose a K value

predicted.species <- NULL
error.rate <- NULL

for(i in 1:10){
  set.seed(101)
  predicted.species = knn(train[1:4],test[1:4],train$Species,k=i)
  error.rate[i] = mean(test$Species != predicted.species)
}
  
print(error.rate)

## Plotting errors and selecting K with Elbow Method 

library(ggplot2)

k.values <- 1:10
error.df <- data.frame(error.rate,k.values)

pl <- ggplot(error.df,aes(x=k.values,y=error.rate)) + geom_point()+ geom_line()

print(pl)