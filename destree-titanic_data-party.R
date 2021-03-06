library(party)
head(readingSkills)
summary(readingSkills)
inputdata<-readingSkills[c(1:105),]
readingSkills
inputdata
DTREES<-ctree(nativeSpeaker~age+shoeSize+score,data=inputdata)
plot(DTREES)
set.seed(678)
dataSet<-read.csv("D:/Dataset/titanic_data.csv")
dataSet
head(dataSet)
tail(dataSet)
summary(dataSet)
library(dplyr)
clean_data<-dataSet%>%
  select(-c(home.dest,cabin,name,x,ticket))%>%
  mutate(pclass=factor(pclass,levels=c(1,2,3),labels=c('Upper','Middle','Lower')),survived=factor(survived,levels=c(0,1),labels=c('No','Yes')))%>%
  na.omit(clean_data)
glimpse(clean_data)
clean_data
Train_data &lt;-function(data,size=0.8,train=TRUE){
  n_r=nrow(data)
  t_row=size*n_r
  train_sample & lt; -1:t_row
  if(train==TRUE){
    return(data[train_sample,])
  }
else{
  return(data[-train_sample,])
    }}
data_train<-Train_data(clean_data,0.8,train=TRUE)
dim(data_train)