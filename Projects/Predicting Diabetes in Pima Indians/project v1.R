library(ggplot2)
library(tree)
library(rpart)
library(randomForest)
library(caret)
library(rpart.plot)
library(data.table) 
library(plyr)
library(corrplot)
library(ROCR)

# Dataset from https://www.kaggle.com/uciml/pima-indians-diabetes-database
data <- read.csv(file = "diabetes.csv",header = TRUE,sep = ",")
summary(data)
nrow(data)
ncol(data)
data$Outcome=as.factor(data$Outcome)
summary(data)
dataforplot=data
dataforplot$Outcome = revalue(data$Outcome, c("0"="Not Diabetic", "1"="Diabetic"))
boxplot(dataforplot$DiabetesPedigreeFunction~Outcome,data=dataforplot, main="DiabetesPedigreeFunction",
        xlab="", ylab="DiabetesPedigreeFunction", col="brown")
boxplot(dataforplot$BloodPressure~Outcome,data=dataforplot, main="Blood Pressure ",
        xlab="", ylab="Blood Pressure", col="brown")
ggplot(dataforplot, aes(fill=dataforplot$Outcome, x=dataforplot$Age)) + 
        geom_histogram(position="stack", stat="bin", binwidth = 10) + 
        stat_bin(binwidth=10, geom="text", colour="white", size=3.5, aes(label=..count.., group=dataforplot$Outcome, y=(..count..)), position=position_stack(vjust=0.5)) +
        scale_x_continuous(name="Age",breaks=seq(0,max(dataforplot$Age), 10)) + 
        scale_y_continuous(name="Number of Patients") +
        ggtitle("Number of Patients in Age group") + 
        scale_fill_discrete(name = "") +
        theme(plot.title = element_text(hjust = 0.5))
ggplot(dataforplot, aes(fill=dataforplot$Outcome, x=dataforplot$Glucose)) + 
        geom_histogram(position="stack", stat="bin", binwidth = 20) + 
        stat_bin(binwidth=20, geom="text", colour="white", size=3.5, aes(label=..count.., group=dataforplot$Outcome, y=(..count..)), position=position_stack(vjust=0.5)) +
        scale_x_continuous(name="Glucose",breaks=seq(0,max(dataforplot$Glucose), 20)) + 
        scale_y_continuous(name="Number of Patients") +
        ggtitle("Glucose Levels") + 
        scale_fill_discrete(name = "") +
        theme(plot.title = element_text(hjust = 0.5))
cor(dataforplot[,1:8])
heatmap(cor(dataforplot[,1:8]),Colv = NA, Rowv = NA, scale="column")
 
index_train<-sample(768,512)

train_set <- data[index_train, ]
test_set <- data[-index_train, ]

train_set_logistic=train_set
test_set_logistic=test_set

# Fit the Logistic Regression Model using the training_set 
logistic_model <- glm(Outcome ~ ., family = "binomial", data = train_set_logistic)

print(summary(logistic_model))

train_set_logistic$Prediction <- predict(logistic_model, newdata = train_set_logistic, type = "response" )
test_set_logistic$Prediction  <- predict(logistic_model, newdata = test_set_logistic , type = "response" )

# distribution of the prediction score grouped by known outcome
ggplot(train_set_logistic, aes(Prediction, color = as.factor(Outcome) ) ) + 
        geom_density( size = 1 ) +
        ggtitle( "Training Set's Predicted Score" )

ROCRpred = prediction(train_set_logistic$Prediction, train_set_logistic$Outcome)
ROCRperf = performance(ROCRpred, "tpr", "fpr")
plot(ROCRperf, colorize=TRUE, print.cutoffs.at=seq(0,1,by=0.1), text.adj=c(-0.2,1.7), main="ROC curve")

train_set_logistic$Prediction=ifelse(train_set_logistic$Prediction > 0.30,1,0)
table(train_set_logistic$Outcome, train_set_logistic$Prediction)
confusionMatrix(as.factor(as.numeric(train_set_logistic$Prediction)),as.factor(train_set_logistic$Outcome),positive = "1")

test_set_logistic$Prediction=ifelse(test_set_logistic$Prediction > 0.30,1,0)
table(test_set_logistic$Outcome, test_set_logistic$Prediction)
confusionMatrix(as.factor(as.numeric(test_set_logistic$Prediction)),as.factor(test_set_logistic$Outcome),positive = "1")

train_set_dt=train_set
test_set_dt=test_set
dt_model=rpart(Outcome~., data=train_set_dt, method = 'class')
dt_model_forplot=rpart(Outcome~., data=train_set_dt[,c(1,2,6,8,9)], method = 'class') # for better visualization of the tree.
summary(dt_model)
rpart.plot(dt_model_forplot,cex=0.5)
train_set_dt$Prediction <- predict( dt_model, newdata = train_set_dt, type = "class" )
test_set_dt$Prediction  <- predict( dt_model, newdata = test_set_dt , type = "class" )
table(train_set_dt$Outcome, train_set_dt$Prediction)
confusionMatrix(as.factor((train_set_dt$Prediction)),as.factor(train_set_dt$Outcome),positive = "1")
table(test_set_dt$Outcome, test_set_dt$Prediction)
confusionMatrix(as.factor((test_set_dt$Prediction)),as.factor(test_set_dt$Outcome),positive = "1")

train_set_rf=train_set
test_set_rf=test_set
rf_model=randomForest(Outcome~., data=train_set_rf, ntree = 300, importance = TRUE,OOB=TRUE)
print(rf_model)
train_set_rf$Prediction <- predict( rf_model, newdata = train_set_rf, type = "class" )
table(train_set_rf$Outcome, train_set_rf$Prediction)
confusionMatrix(as.factor((train_set_rf$Prediction)),as.factor(train_set_rf$Outcome))
test_set_rf$Prediction  <- predict( rf_model, newdata = test_set_rf , type = "class" )
table(test_set_rf$Outcome, test_set_rf$Prediction)
confusionMatrix(as.factor((test_set_rf$Prediction)),as.factor(test_set_rf$Outcome))
plot(rf_model)

