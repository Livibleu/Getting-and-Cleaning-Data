# COURSERA Getting and Cleaning Data - Project
# Code to create a data directory, download and unzip of the file

## Create data directory
# if(!file.exists("data)){
#   dir.create("data")
# }

## Download the file from website
# fileURL<-"https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip"
# download.file(fileURL, destfile="./data/UCI_data.zip")

## Unzip files from local directory
# setwd("./data")
# unzip("./UCI_data.zip")
# To be sure that the files are at the good place
# list.files()
library(plyr)
# Step 1: Merges the training and the test sets to create one data set
# Train
xTrain<-read.table("train/X_train.txt")
yTrain<-read.table("train/y_train.txt")
subjectTrain<-read.table("train/subject_train.txt")
# Test
xTest<-read.table("test/X_test.txt")
yTest<-read.table("test/y_test.txt")
subjectTest<-read.table("test/subject_test.txt")
# Create the "x"data set by binding the 2 files
xData<-rbind(xTrain,xTest)
# The same for "y"data set
yData<-rbind(yTrain,yTest)
# And finally for the subjects
subjectData<-rbind("subjectTrain,subjectTest")

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
features<-read.table("features.txt")
# Make a list of the row number with mean or std in the 2nd column
meanAndStdFeatures<-grep("-(mean|std)\\(\\)", features[,2])
# Subset the same rows in xData
xData<-xData[,meanAndStdFeatures]
# Correction of the column names
names(xData)<-features[meanAndStdFeatures,2]

# Step 3: Uses descriptive activity names to name the activities in the data set
# The same principle as in step 2
activities<-read.table("activity_labels.txt")
yData[,1]<-activities[yData[,1],2]
names(yData)<-"activity"

# Step 4: Appropriately labels the data set with descriptive variable names
# Renaming of the column name
names(subjectData)<-"subject"
# Create one data set with all the data binded
data<-cbind(xData,yData,subjectData)

# Step 5: From the data set in step 4, creates a second, independent tidy data set withe the average of each variable for each activity and each subject
# We calculate on 66 variables, the 2 last are subject and activity
averagesData<-ddply(data,.(subjectData,activity), function(x) colMeans(x[,1:66]))
write.table(averagesData,"averages_data.txt", row.name=FALSE)

# Good luck!!!!!