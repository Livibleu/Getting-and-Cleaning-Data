# Introduction
The script run_analysis performs the 5 steps of the project

. Step 1: read the different txt files and bind the files
. Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
. Step 3: Uses descriptive activity names to name the activities in the data set
. Step 4: Appropriately labels the data set with descriptive variable names
. Step 5: From the data set in step 4, creates a second, independent tidy data set withe the average of each variable for each activity and each subject

# Data tables and variables

. xTrain, yTrain, xTest, yTest, subjectTrain, subjectTest are data.tables from the txt files
. xData,yData and subjectData are the result of merging the different datasets
. features contains the correct names for the xData set
. activities is the same approach
. data is he result of merging xData, yData and subjectData
. averagesData contains the averages
