# Project Codebook

## Original Dataset Description
The data used in this project was collected by researchers interested in human activity recognition using smartphones. A group of 30 volunteers each performed 6 activities wearing a smartphone on the waist. The smartphone accelerometer and gyroscope were used to collect linear acceleration and angular velocity at 50 Hz. More detailed description of the project can be found at the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data processing steps

Data were downloaded from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The downloaded zip file was extracted into the working directory. The downloaded datasets were originally split into training and test data, with data consisting of X (a table of accelerometer- and gyroscope-derived measurements), y (a number 1-6 corresponding to activity for each measurement in X), and subject (a number 1-30 corresponding to the person performing the activity for each measurement in X).

The training and test data were imported into R using read.table() and were combined into a single R data frame (mean_std_df). Accelerometer and gyroscope measurements not corresponding to mean or standard deviation values were removed from this data frame, numbers corresponding to activities were replaced with activity names, and all column names were changed to describe the variables in the column.

Finally, another R data frame (averaged_df) was created that averaged all of the measurements from mean_std_df across each subject and activity. The column names for this data frame are the same as the column names for mean_std_df, but represent averaged quantities instead of all of the data.

## Variables
Activity - The activity that the subject was performing. Possible values include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Subject - The subject number (1-30) of the person performing the activity.

The explanation for the remaining variables is taken from the text of features_info.txt, which is included in the data download link.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation
