library("plyr")
library("data.table")

datatrain <- read.table("train/X_train.txt")
datatest <- read.table("test/X_test.txt")
activityTrain <- read.table("train/y_train.txt")
activityTest <- read.table("test/y_test.txt")
subjectTrain <- read.table("train/subject_train.txt")
subjectTest <- read.table("test/subject_test.txt")

dataactivity <- read.table("activity_labels.txt")

mergedData <- rbind(datatrain, datatest)
mergedSubject <- rbind(subjectTrain, subjectTest)
mergedActivity <- rbind(activityTrain, activityTest)
mergedActivityName <- join(mergedActivity, dataactivity, by="V1")

datafeature <- read.table("features.txt")
featureSet <- grep("*(mean|std)\\(\\)*" , as.character(datafeature[ , 2]))
featureName <- as.character(datafeature[ featureSet, 2])
merged <- mergedData[ , featureSet]
merged_data <- cbind(mergedSubject, mergedActivityName[,2], merged)
names(merged_data) <- c("subject", "activity", featureName)


merged_table <- data.table(merged_data)
keys <- setdiff(names(merged_table), c("subject","activity"))
tidydata <- merged_table[, lapply(.SD, mean), by=c("subject","activity"), .SDcols=keys]

write.table(tidydata, "tidy.txt")