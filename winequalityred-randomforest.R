wine<-read.csv("E:/Shivani Shinde/DS-clg/Datasets/winequality-red.csv")
head(wine)
wine$quality
wine$taste<-ifelse(wine$quality<6,'bad','good')
wine$taste 

wine$taste[wine$quality==6]<-'Normal'
wine$taste=as.factor(wine$taste)

table(wine$taste)

set.seed(123)

set<-sample(nrow(wine),0.6*nrow(wine))
set

train<-wine[set,]
train

test<-wine[-set,]
test

library(randomForest)
model<-randomForest(taste~.-quality,data=train)
model

pred<-predict(model,newdata=test)
pred

tab<-table(pred,test$taste)
tab

acc_val<-sum(diag(tab))/sum(tab)
print(paste("The accuracy of the model:",acc_val*100))

