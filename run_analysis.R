## Final Project for Getting and Cleaning Data on Coursera

## Set up environment
library("dplyr")

## Download and extract files

# The two lines of code below should download a .zip file to the working
# directory and then extract the contents to a folder in the working directory
# entitled "UCI HAR Dataset".
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "accelerometers.zip", mode="wb")
unzip("accelerometers.zip")

## 1. Merge training and test datasets

# Import the training set into R
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# Import the testing set into R
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

# Merge the training and testing data
subject <- rbind(subject_train,subject_test)
X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)
# Note: the subject, X, and y are still in separate data frames (to be combined
# in a later step), but the training and test data for each of these data frames
# has been combined

# Clear extraneous variables from the workspace
rm(subject_test,subject_train,X_test,X_train,y_test,y_train)

## 2. Extract only the mean and standard deviation

# Import the features data into R
features <- read.table("UCI HAR Dataset/features.txt") # column names

# Select only features that include mean() or std()
X_col_names <- features$V2[grep("mean()|std()",features$V2)]
X <- X[,grep("mean()|std()",features$V2)]

# Rename dataframe columns and combine subject, X, and y into a single dataframe
colnames(X) <- X_col_names
colnames(subject) <- c("Subject")
mean_std_df <- cbind(subject,y,X)

# Clear extraneous variables from the workspace
rm(features,subject,X,y,X_col_names)

## 3. Use descriptive activity names to name the activities in the dataset

# Import the activities data into R
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Add activity descriptions into data frame
mean_std_df <- merge(activities, mean_std_df, by.x = "V1", by.y = "V1")
mean_std_df <- subset(mean_std_df, select = -V1) # remove V1 from the dataframe
colnames(mean_std_df)[1] = "Activity" # rename V2 to Activity

# Clear extraneous variables from the workspace
rm(activities)

## 4. Label the data set with descriptive variable names
# This was already completed in step 2.

## 5. Create a tidy dataset with the average over each variable and each subject
averaged_df <- mean_std_df %>%
  group_by(Activity,Subject) %>%
  summarize_all(mean)
