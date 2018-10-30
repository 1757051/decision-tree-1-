names(iris)
library(caret)
set.seed(123)
intrain=createDataPartition(y=iris$Species,p=0.8,list=FALSE)
train=iris[intrain]
train=iris[intrain,]
test=iris[-intrain,]
 #decision tree
library(e1071)
trctrl=trainControl(method="repeatedcv",number=10,repeats=3)
tree=train(Species~.,data=train,method="rpart",parms=list(split="information"),

                             trControl= trctrl,tuneLength=10)
library(rpart.plot)
prp(tree$finalModel)
test_pred=predict(tree,newdata=test)
confusionMatrix(test_pred,test$Species)
