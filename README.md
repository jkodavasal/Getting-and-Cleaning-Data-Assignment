# Getting-and-Cleaning-Data-Assignment
The goal of this assignment is to work with datasets containing measurements from the Gyroscope and Accelerometer from Samsung Galaxy smartphones from 30 different volunteers (subjects) involved in six distinct activties: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying. More info on this project is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The actual data used in this assignment was downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This repo contains these items:
# run_analysis.R script which does the following:
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
   1. IMPORTANT NOTE: I do not include the measurement meanFreq(), since I interpret this task as reading only the mean() and std() values. This is why my subset contains 66 variables, while if meanFreq() were included, it would contain 79 variables. 
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This code was developed and tested on RStudio, runnnig R version 3.3.1 (2016-06-21), Platform: x86_64-w64-mingw32/x64 (64-bit), on a Windows 7 operating system. Do install.packages("reshape"), install.packages("reshape2") if you don't already have these installed in your version of R

Run run_analysis.R within a folder, that also contains the "UCI HAR Dataset" folder which is unzipped from the downloaded zip file. The script writes out three tab-separated .txt data files. X.txt, and y.txt contain the merged and subsetted (on mean and std) data by combining X_train.txt and X_test.txt (in that order using row binding), and also y_train.txt and y_test.txt (in that order using row binding). It also writes out a merged file subject.txt obtained by row binding (in order) subject_train.txt and subject_test.txt. After performing the required data-tidying, by computing means of all the measurements (in X.txt) over Activity Name (y.txt) and Subject number (subject.txt), a tidy.txt data file is written in the same run folder which contains 180 rows (6 activities times 30 subjects), and 68 columns -- 1st column is Subject number 2nd Column is Activity Name, Cols 3-68 represent the mean values of all the 66 measurements considered, for a particular subject, performing a particular activity.

All the .txt files written in this folder may be read into R using read.table.

# CodeBook.md file:
This file provides a reference to the variables used in run_analysis.R. This modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.




