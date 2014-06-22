## README file for Course Project for Getting and Cleaning Data on Coursera


### Background

This file describes the steps used to obtain and process a series of data files to produce a single tidy data set as required by the Course Project for the "Getting and Cleaning Data" course being conducted through Coursera by staff at John Hopkins Bloomberg School of Public Health.

The data were provided in a .zip file at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and were downloaded to local storage and unzipped to individual folders and files prior to being processed using the R programming language.

The data consist of 10,299 observations of 561 smartphone movement parameters together with a record of the activity being performed at the time that the measurements were recorded and a number identifying the volunteer performing the activity.

The Course Project requirement was to "... create one R script called run_analysis.R that does the following.

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set.
4.  Appropriately labels the data set with descriptive variable names.
5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject."


### run_analysis.R

A script called "run_analysis.R" was created to read the various data files and combine and transform them into a single tidy data set containing the average of each variable for each activity and each subject.

Steps performed by the script are :

* Read in names of defined activities and features using the "read.table" function and convert to a character vector for later use
* Read in data tables for the "train" and "test" data files, again using the "read.table" function
* Combine the rows of the "train" and "test" data files into one using the "rbind" function
* Name each column of the combined data using the "names" function and the previously loaded feature names
* Select only columns which represent the mean or standard deviation of a measurement by subsetting using the "grep" function to identify target columns
* Remove or replace invalid characters in feature names using the "gsub" function
* Modify feature names to improve readability by expanding abbreviations to their full form using the "gsub" function
* Combine the feature data columns with columns representing the subject and activity for each set of measurements using the "cbind" function
* Compute the mean of each feature data column using the "aggregate" function
* Sort the results by the subject and activity using the "order" function
* Modify column names to show they are calculated mean values using the "lapply" function and an anonymous function
* Replace the activity factor numbers with the corresponding activity names
* Write the tidy data set to a text file using the "write.table" function

The tidy data set was formatted as a simple text ( .txt ) file to ensure compatibility with the Coursera website and to enable it to be viewed or read using a wide range of tools or languages, including Notepad, Excel and R.  The tidy data set can be read into R using the function :

means <- read.table( "UCI_HAR_Dataset_feature_means.txt", header = TRUE, check.names = FALSE )


### Codebook.md

The names chosen for each of the rows and columns of the tidy data set and their relationship to the source data are documented in the associated file "Codebook.md"

