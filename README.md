# Getting-and-Cleaning-Data-Assignment
The goal of this assignment is to work with datasets containing measurements from the Gyroscope and Accelerometer from Samsung Galaxy smartphones from 30 different volunteers (subjects) involved in six distinct activties: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying. More info on this project is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The actual data used in this assignment was downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This repo contains these items:
# run_analysis.R script which does the following:
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Run run_analysis.R within a folder, that also contains the "UCI HAR Dataset" folder which is unzipped from the downloaded zip file. The script writes out three tab-separated .txt data files. X.txt, and y.txt contain the merged and subsetted (on mean and std) data by combining X_train.txt and X_test.txt (
