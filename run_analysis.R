##Download files
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="Dataset.zip")

# Unzip dataSet
unzip(zipfile="Dataset.zip",exdir=".")


##Read Train data in to Tables
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")


##Read Test data in to Tables

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Read features and labels
features <- read.table('UCI HAR Dataset/features.txt')
activityLabels = read.table('UCI HAR Dataset/activity_labels.txt')


##Assign column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
      
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
      
colnames(activityLabels) <- c('activityId','activityType')


## Merging data
##Column Merge
train_merge <- cbind(y_train, subject_train, x_train)
test_merge <- cbind(y_test, subject_test, x_test)

## Row merge
combined <- rbind(train_merge, test_merge) 


##Extracting column names what we need
mycol <- colnames(combined)

##Create logical vector for columns which have mean and std in label
ourColumns <- (grepl("activityId" , mycol) | 
                 grepl("subjectId" , mycol) | 
                 grepl("mean.." , mycol) | 
                 grepl("std.." , mycol) 
                 )
##

MeanandStd <- combined[ , ourColumns == TRUE]


##
combinedActivityNames <- merge(MeanandStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

##Tidy data set
myTidySet <- aggregate(. ~subjectId + activityId, combinedActivityNames, mean)
myTidySet <- myTidySet[order(myTidySet$subjectId, myTidySet$activityId),]


##write in file
write.table(myTidySet, "myTidySet.txt", row.name=FALSE)














