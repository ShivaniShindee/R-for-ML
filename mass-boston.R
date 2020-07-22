library("Mass",lib.loc="C:/Program Files/R/R-3.4.4/library")
Boston
str(Boston)
summary(Boston)
data<-Boston
names(data)
colnames(data)
lmodel=lm(data$medv~data$lstat)
lmodel
summary(lmodel)
names(lmodel)
coef(lmodel)
lmodel$coefficients
confint(lmodel)
predict(lmodel,data.frame(lstat=c(5,10,15)),interval = "confidence")
plot(data$medv,data$lstat)
abline(lmodel,col="red")
plot(predict(lmodel),residuals(lmodel))