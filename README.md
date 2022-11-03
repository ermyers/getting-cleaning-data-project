# getting-cleaning-data-project
This is the final course project for "Getting and Cleaning Data" on Coursera. The goal of this project is to download a dataset, perform some processing steps on it, and return a tidy dataset.

CodeBook.md describes the dataset, the processing that was performed on it, and the variable names.

run_analysis.R downloads and extracts the data, performs processing on the data (combining training and test data, renaming variables and columns to descriptive names, removing measurements that were not mean or standard deviation), and finally returns a tidy data set that consists of the average of each variable for each activity and each subject.

tidy_data_frame.txt is the output tidy data set that consists of the average of each variable for each activity and each subject.
