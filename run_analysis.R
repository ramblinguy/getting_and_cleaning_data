###Coursera Data Exploration 
setwd("/Users/U57P85/Documents/R")

#load required libraries
library(dplyr)
library(reshape2)

#download data
if(!file.exists("fitbit.zip")){
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","fitbit.zip")
}

if(!file.exists("UCI HAR Dataset")){
  unzip("fitbit.zip")
}

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

##read datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_comb <- cbind(train_subjects,train_labels,train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_comb <- cbind(test_subjects,test_labels,test)

##merge the two datasets
total <- rbind(train_comb,test_comb)

##gives the names
colnames(total) <- c("subject","activity",features[,2])

##creates activity names
total$activity <- factor(total$activity,levels = activityLabels[,1], labels = activityLabels[,2])

###subset features
features_colnum <- grep((".*-mean.*|.*-std.*"),features[,2])
total_subset <- total[,features_colnum]

total_melted <- melt(total,id=c("subject","activity"))
total_mean <- dcast(total_melted, subject + activity ~variable,mean)

write.table(total_mean,file = "tidy.txt",sep = " ",quote = FALSE)
