height<-c(5,9,6,7,4)
weight<-c(44,80,50,60,30)
linmodel<-lm(weight~height)
linmodel
summary(linmodel)
pred<-data.frame(height=8)
reslt<-predict(linmodel,pred)
reslt
