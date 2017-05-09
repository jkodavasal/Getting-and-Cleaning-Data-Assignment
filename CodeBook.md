# run_analysis.R
* X_train: Data Frame (DF) that contains data read from X_train.txt
* y_train: DF that contains data read from y_train.txt
* X_test: DF that contains data read from X_test.txt
* y_test: DF that contains data read from y_test.txt
* subject_train: DF that contains data read from subject_train.txt
* subject_test: DF that contains data read from subject_test.txt
* X_merged: DF from row binding of X_train and X_test
* y_merged: DF that row binding of Y_train and y_test
* subject_merged: DF that row binding of subject_train and subject_test
* featureName_df: stores the feature names for the 561 features read from features.txt
* featureNames: featureName_df as a character vector of feature names
* colIndices: numeric vector containing the 66 indeces from featureNames that have either a mean() or std() in their name
* X_merged_extract: a subset of X_merged only containing the columns corresponding to measurements with mean() or std() in their names
* activity_labels_df: a DF containing the activity numbers and their corresponding names, read from activity_labels.txt
* activity.code: a character vector containing the strings corresponding to the activity names
* y_merged_labels_char: a character vector of length equal to the total number of observations which contains the activity names corresponding to the activity codes in y_merged
* y_merged_descr: y_merged_labels_char stored as a DF
* X-merged_extract, y_merged_descr, and subject_merged are respectively written to the data files X.txt, y.txt, and subject.txt
* messy_df: a DF containing a column binding of data read as DF's from X.txt, y.txt, and subject.txt
* messy_df_melt: a DF obtained by melting (using reshape library) messy_df, by indicating that ActivityName and Subject are factors, and the rest of the variables are measurements
* tidy_df: obtained by performing a dcast operation (from reshape2 library) on messy_df_melt, where the variable means are obtained based on Subject and Activity Name. -- this DF has 180 rows and 68 columns
* tidy_df is written to a file called tidy.txt for submission to Coursera.

# Location of files used (with respect to the base project folder)
* /                      :        run_analysis.R,  UCI HAR Dataset
* /UCI HAR Dataset       :        train, test, activity_labels.txt, features.txt
* /UCI HAR Dataset/train/:        X_train.txt, y_train.txt, subject_train.txt
* /UCI HAR Dataset/test/ :        X_test.txt,  y_test.txt,  subject_test.txt

Note: the Inertial Signals sub-folder under train and test folders is not used in this work


# Variable names in the tidy data set
Factor variables: Subject (30 LEVELS: goes from 1-30), ActivityName (6 LEVELS: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)

The measured variables in this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

Resulting in all 66 variables per observation

There are 10299 observations in all over all the 6 activities for the 30 subjects. We summarize this data by computing means of these 66 variables across Subject and Activity, resulting in 180 observations in our tidy.txt dataset.

The below are the 66 variables:

* tBodyAccMag.std
* tGravityAccMag.mean
* tGravityAccMag.std
* tBodyAccJerkMag.mean
* tBodyAccJerkMag.std
* tBodyGyroMag.mean
* tBodyGyroMag.std
* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std
* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* fBodyAccMag.mean
* fBodyAccMag.std
* fBodyBodyAccJerkMag.mean
* fBodyBodyAccJerkMag.std
* fBodyBodyGyroMag.mean
* fBodyBodyGyroMag.std
* fBodyBodyGyroJerkMag.mean
* fBodyBodyGyroJerkMag.std






