dts<-c(25,33,41,57,68,79,83,97)
mean_data<-mean(dts)
mean_data
new1<-c(19,29,32,48,51,63,34,NA,NA,NA)
new1
mea_dt<-mean(new1,na.rm = TRUE)
mea_dt
mea_dt<-median(new1,na.rm = TRUE)
mea_dt



mtcars
mt<-mtcars
mt
head(mt)
str(mt)
summary(mt)
indata<-mt[,c("am","cyl","hp","wt")]
indata
logReg<-glm(am~cyl+hp+wt,data= indata,family = binomial)
logReg
summary(logReg)



input<-mt[,c('gear','carb')]
input
input2<-mt[,c('mpg','wt')]
input2
plot(input2,type='l',xlab='input2$mpg',ylab='input2$wt',col='red')
plot(input2,type='o',xlab='input2$mpg',ylab='input2$wt',col='red')
plot(input2,type='p',xlab='input2$mpg',ylab='input2$wt',col='red')
plot(x=input$gear, y=input$carb, xlab='gear', ylab='carb', xlim=c(1,5), main="Gears vs Carb")
plot(x=input$gear, y=input$carb, xlab='gear', ylab='carb', xlim=c(1,5), ylim=c(1,5), main="Gears vs Carb")
