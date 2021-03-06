path="https://raw.githubusercontent.com/guru99-edu/R-programming/master/test.csv"
df_tita<-read.csv(path,sep=',')
summary(df_tita)
str(df_tita)
lst_na<-colnames(df_tita)[apply(df_tita,2,anyNA)]
lst_na
library(dplyr)
df_tita_drop<-df_tita%>%na.omit()
dim(df_tita_drop)
avg_miss<-apply(df_tita[,colnames(df_tita)%in%lst_na],2,mean,na.rm=TRUE)
avg_miss
df_titrep<-df_tita%>%mutate(rep_mean_age=ifelse(is.na(Age),avg_miss[1],Age),rep_mean_fare=ifelse(is.na(Fare),avg_miss[2],Fare))
df_titrep
summary(df_titrep)
summary(df_titrep)
sum(is.na(df_titrep$Age))
sum(is.na(df_titrep$rep_mean_age))
avg_miss<-apply(df_tita[,colnames(df_tita)%in%lst_na],2,median,na.rm=TRUE)
avg_miss
df_titrep<-df_tita%>%mutate(rep_median_age=ifelse(is.na(Age),avg_miss[1],Age),rep_median_fare=ifelse(is.na(Fare),avg_miss[2],Fare))
df_titrep
sum(is.na(df_titrep$Age))
sum(is.na(df_titrep$rep_median_age))
summary(df_titrep)
