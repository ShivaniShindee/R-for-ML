library(tree)
library(ISLR)

attach(Carseats) #dataset carseats=r environment =attach kar diya 

summary(Carseats)

Carseats
hi=ifelse(Sales<=8,'No','Yes') #hi=variable. categorial or classify 
hi

Carseats=data.frame(Carseats,hi) # add kiya carseats + hi =carseats
str(Carseats) #dataframe

tree_cs=tree(hi~.-Sales,Carseats) #regression=tree.  response variable is hi and pred =sales. using dataframe =carseats
tree_cs   # Regression tree hai 

head(tree_cs)
cols(tree_cs)

str(tree_cs)

summary(tree_cs)

plot(tree_cs)
text(tree_cs,pretty=0)

set.seed(2) # rando replica
train=sample(1:nrow(Carseats),200) # training dataset = select Sample from carseats (dataframe) (1:nrow)  
train

cs_test=Carseats[-train,] # test dataset ko slicing kiya hai (one part remove)
cs_test

hi_test=hi[-train]
hi_test

tree_cs=tree(hi~.-Sales,Carseats,subset=train)  # create a model for decision tree . response= hi .predictor= sales dataframe=carseats subset=train
tree_cs
plot(tree_cs)
text(tree_cs,pretty=0)

pred_tree=predict(tree_cs,cs_test,type="class") #model=tree_cs; test kiya hai model vs test datasets  : type=classfication
tab1=table(pred_tree,hi_test)   
tab1       # output value confusion matrix
#accuracy in the test dataset

acc=sum(diag(tab1))/sum(tab1)
print(paste("The Accuracy of the model:",acc*100))

#running the tree

set.seed(3)
cv_cs=cv.tree(tree_cs,FUN=prune.misclass)  # cv.tree=function /cross validation check tree_cs = model of dataset vs subset=traindataaset     # validate study the pattern of data and the dataset and traindtata  ex= it is resampling technique   FUN stand for function  prune means removing 
names(cv_cs)

par(mfrow=c(1,2))

plot(cv_cs$size,cv_cs$dev,type="b")

plot(cv_cs$k,cv_cs$dev,type='b')

prune_cs=prune.misclass(tree_cs,best=11) # give me the best node =9 that fits in model after pruning 

plot(prune_cs)
text(prune_cs,pretty=0)

#accuracy of tree pruned with best of 9 nodes in tree

tree_prunePred=predict(prune_cs,cs_test,type="class")
prune_tab=table(tree_prunePred,hi_test)
acc1=sum(diag(prune_tab))/sum(prune_tab)
print(paste("The Accuracy of the model:",acc1*100))

