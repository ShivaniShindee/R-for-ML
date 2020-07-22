trainraw<-read.csv("E:/Shivani Shinde/DS-clg/Datasets/train.csv", header = T, na.strings=c(" "))
trainraw
sapply(trainraw,function(x) sum(is.na(x)))
sapply(trainraw,function(x) length(unique(x)))
library(Amelia)
data<-subset(trainraw,select = c(2,3,5,6,7,8,10,12))
data$Age[is.na(data$Age)]<-mean(data$Age,na.rm=T)
data
contrasts(data$Sex)
contrasts(data$Embarked)
data
data<-data[!is.na(data$Embarked),]
data
rownames(data)<-NULL
train<-data[1:800,]
test<-data[801:889,]
mdl<-glm(Survived~., family = 'binomial', data=train)
anova(mdl, test='Chisq')
pred<-predict(mdl, newdata = subset (test, select = c(2,3,4,5,6,7,8)), type = 'response')
pred
pred<-ifelse(pred>0.5,1,0)
pred
mCE=mean(pred!=test$Survived)
print(paste('Accuracy:',1-mCE))
