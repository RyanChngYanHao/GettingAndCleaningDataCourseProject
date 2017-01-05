## downloading the data, unzip
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "d.zip", mode = "wb")
downloadedTime <- date()
unzip("d.zip")
setwd("./UCI HAR Dataset")

## reading the files
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
features <- read.table("features.txt", stringsAsFactors = FALSE)

list.files("./test")
subject_test <- read.table("./test/subject_test.txt", stringsAsFactors = FALSE)
X_test <- read.table("./test/X_test.txt", stringsAsFactors = FALSE)
y_test <- read.table("./test/y_test.txt", stringsAsFactors = FALSE)

list.files("./train")
subject_train <- read.table("./train/subject_train.txt", stringsAsFactors = FALSE)
X_train <- read.table("./train/X_train.txt", stringsAsFactors = FALSE)
y_train <- read.table("./train/y_train.txt", stringsAsFactors = FALSE)


## bindings & mergings
library(dplyr)

test_rows <- left_join(y_test, activity_labels)         # naming the rows
colnames(X_test) <- features[[2]]                       # naming the columns
t1 <- rep("test", 2947)
test_result <- data.frame(subject = subject_test$V1, 
                          activity = test_rows$V2, 
                          mode = t1, X_test)

train_rows <- left_join(y_train, activity_labels)       # naming the rows
colnames(X_train) <- features[[2]]                      # naming the columns
t2 <- rep("train", 7352)
train_result <- data.frame(subject = subject_train$V1, 
                           activity = train_rows$V2, 
                           mode = t2, X_train)

## Merges the training and the test sets to create one data set.
test_train <- rbind(test_result, train_result)

## Extracts only the measurements on the mean and standard deviation for each measurement.
n1 <- grep(".*mean()", names(test_train))
n2 <- grep(".*std()", names(test_train))
n <- c(1:3, n1, n2)
tt <- test_train[,n]

## From the data set, creates a second, 
## independent tidy data set with the average of 
## each variable for each activity and each subject.
library(reshape2)

ttMelt <- melt(tt, id = c("subject", "activity", "mode"))
ttData <- dcast(ttMelt, subject+activity+mode ~ variable, mean)
write.table(ttData, file = "summarized_data.txt", row.name = FALSE)