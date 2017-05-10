# run_analysis.R script that performs the following operations
# required for Getting and Cleaning Data course Assignment
################################################################################

# Part 1 : Merges the training and the test sets to create one data set.

# Read in the X_train, X-test, Y_train, and Y_test text data and store in
# dataframes with the same names
X_train<-read.table("UCI HAR Dataset/train/X_train.txt") #dimension: 7352 x 561
X_test<-read.table("UCI HAR Dataset/test/X_test.txt") #dimension: 2947 x 561

y_train<-read.table("UCI HAR Dataset/train/y_train.txt") #dimension: 7352 x 1
y_test<-read.table("UCI HAR Dataset/test/y_test.txt") #dimension: 2947 x 1

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge the training and test data (bind rows) into X_merged and y_merged 
# data frames such that the training data comes first
X_merged <- rbind(X_train, X_test) # dimension: 10299 x 561
y_merged <- rbind(y_train, y_test) # dimension: 10299 x 1
subject_merged <- rbind(subject_train, subject_test) #dimension: 10299 x 1
colnames(subject_merged) <- "Subject"


################################################################################

# Part 2: Extracts only the measurements on the mean and standard deviation for 
# each measurement.

# Storing the names of the 561 features in a character vector to parse 
# for features that represent mean and std

# first read the features.txt file and store in a dataframe
featureName_df <- read.table("UCI HAR Dataset/features.txt")

# convert the feature names in this DF into a character vector (from factor)
featureNames <- as.character(featureName_df$V2)

# Create a variable calle dcolIndices that stores the column indices
# corresponding to X_merged that contain the mean and std values only
# by grepping for these key words in the featureNames vector
colIndices <- grep("mean\\(\\)|std\\(\\)", featureNames) #returns 66 indices

# Please note here that we have to EXCLUDE the features with meanFreq(),
# and only look for the patterns mean() and std(). This is my interpretation 
# of the question. If meanFreq() were also included, we would have 79 features

# subset the X_merged data through selecting only these columns and 
# store the new smaller data set (fewer columns) in X_merged_extract
X_merged_extract <- X_merged[,colIndices] # dimension: 10299 x 66

#Note that we don't have to do anything with y_merged here.

################################################################################

# Part 3: Uses descriptive activity names to name the activities in the data set

# Read the activity numbers and labels as a two-column data frame from .txt file
activity_labels_df <- read.table("UCI HAR Dataset/activity_labels.txt") 

# Assign the number labels in the first column to the numeric vector 
# activity.code
activity.code<-as.numeric(activity_labels_df$V1)

# Name the entries of the numeric vector activity.code using the 
# string labels corresponding to the activity name in the second column
# of the data frame activity_labels_df
names(activity.code)<-as.character(activity_labels_df$V2)


# Create a character vector y_merged_labels_char containing the activity names
# corresponding to the numbers in the y_merged data frame
y_merged_labels_char <- names(activity.code)[match(y_merged$V1, activity.code)]

# Store y_merged_labels into the data frame y_merged_descr
y_merged_descr <- data.frame(ActivityName = y_merged_labels_char)

################################################################################

# Part 4: Appropriately labels the data set with descriptive variable names.
# I have kept the same notation as the code book supplied in features_info.txt
# In the original data, there were no variable names, and the DF had by default
# V1, V2, ..., V561. This will name the columns descriptively accoring to 
# features.txt, and we clean up to remove (). The "-" will automatically
# be replaced by "." when we re-read from a txt file

colnames(X_merged_extract) = gsub("[()]","",featureNames[colIndices])
################################################################################

# Put this all togther by writing out the modified merged, descriptive data
# set as text files X.txt and y.txt

write.table(X_merged_extract, "X.txt", sep="\t")
write.table(y_merged_descr, "y.txt", sep="\t")
write.table(subject_merged, "subject.txt", sep="\t")

################################################################################

# Part 5: From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.

# start by reading in X.txt, y.txt, subject.txt and column binding them
messy_df <- cbind(read.table("X.txt"), read.table("y.txt"), read.table("subject.txt"))

# The messy_df: first 66 columns represent the selected measurements (features),
# column 67 contains the Activity Name, and column 68 contains the 
# subject number
library(reshape)
library(reshape2)

# Use the melt function to create a new data frame that knows which columns
# represent the factors (subject number and activity name), and which columns
# represent the continuous measurements (each of the 66 subsetted features)
messy_df_melt <- melt(messy_df, id=c("ActivityName", "Subject"), measure.vars=names(messy_df)[1:66])

tidy_df <-dcast(messy_df_melt, Subject + ActivityName ~ variable, mean)
write.table(tidy_df, "tidy.txt", sep="\t")

# Note this tidy_df has 180 rows (6 activities times 30 subjects), and 
# 68 columns. The first column corresponds to Subject number, Second Column to
# Activity Name, and the remaining 66 columns represent the means of the 
# various observations over subject number/Activity Name combinations






