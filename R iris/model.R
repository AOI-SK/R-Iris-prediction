library(RCurl) 		 
library(randomForest)   
library(caret)
iris <- read.csv(text = getURL("https://raw.githubusercontent.com/dataprofessor/data/master/iris.csv"))
TrainingIndex <- createDataPartition(iris$Species, p=0.8, list = FALSE)
TrainingSet <- iris[TrainingIndex,] # Training Set
TestingSet <- iris[-TrainingIndex,] # Test Set
write.csv(TrainingSet, "training.csv")
write.csv(TestingSet, "testing.csv")
TrainSet <- read.csv("training.csv", header = TRUE,stringsAsFactors = T)
TrainSet <- TrainSet[,-1]
model <- randomForest(Species ~ ., data = TrainSet, ntree = 500, mtry = 4, importance = TRUE)
saveRDS(model, "model.rds")

