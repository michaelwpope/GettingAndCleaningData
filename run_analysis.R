
##  run_analysis.R

##  Analysis script for Course Project for "Getting and Cleaning Data" module

#   Read in names of defined activities and features

activities <- read.table( "UCI HAR Dataset/activity_labels.txt", colClasses = "character" )
activity_names <- activities[ , 2 ]
features <- read.table( "UCI HAR Dataset/features.txt", colClasses = "character" )
feature_names <- features[ , 2 ]

#   Read in data tables for the 'train' data files

x_train <- read.table( "UCI HAR Dataset/train/X_train.txt", colClasses = "numeric" )
y_train <- read.table( "UCI HAR Dataset/train/y_train.txt", colClasses = "numeric" )
subject_train <- read.table( "UCI HAR Dataset/train/subject_train.txt", colClasses = "numeric" )

#   Read in data tables for the 'test' data files

x_test <- read.table( "UCI HAR Dataset/test/X_test.txt", colClasses = "numeric" )
y_test <- read.table( "UCI HAR Dataset/test/y_test.txt", colClasses = "numeric" )
subject_test <- read.table( "UCI HAR Dataset/test/subject_test.txt", colClasses = "numeric" )

#   Combine the rows of the 'train' and 'test' data files into one

x_all <- rbind( x_train, x_test )
y_all <- rbind( y_train, y_test )
subject_all <- rbind( subject_train, subject_test )

#   Name each column of the combined data

names( x_all ) <- feature_names
names( y_all ) <- "activity"
names( subject_all ) <- "subject"

#   Select only columns which represent the mean or std of a measurement

x_mean_std <- x_all[ , sort( c( grep( "mean()", names( x_all ), fixed = TRUE ), grep( "std()", names( x_all ), fixed = TRUE ) ) ) ]

#   Remove or replace invalid characters in feature names

names( x_mean_std ) <- gsub("-|,", "_", gsub("\\(|)", "", names( x_mean_std ) ) )

#   Modify feature names to improve readability

names( x_mean_std ) <- gsub( "fBody", "frequency_Body", gsub( "tGravity", "time_Gravity", gsub( "tBody", "time_Body", names( x_mean_std ) ) ) )
names( x_mean_std ) <- gsub( "Gyro", "_Gyroscope", gsub( "Acc", "_Accelerometer", gsub( "BodyBody", "Body_Body", names( x_mean_std ) ) ) )
names( x_mean_std ) <- gsub( "Mag", "_Magnitude", gsub( "Jerk", "_Jerk", names( x_mean_std ) ) )

#   Combine the feature data colums with columns for the subject and activity

all_mean_std <- cbind( subject_all, y_all, x_mean_std )

#   Compute the mean of each feature data column and sort the results by the subject and activity

all_mean_std.means <- aggregate( all_mean_std[ c( -1, -2 ) ], by = all_mean_std[ c( "subject", "activity" ) ], FUN = mean )
all_mean_std.means <- all_mean_std.means[ order( all_mean_std.means$subject, all_mean_std.means$activity ), ]

#   Modify column names to show they are calculated mean values

names( all_mean_std.means )[ c( -1, -2 ) ] <- lapply( names( all_mean_std.means )[ c( -1, -2 ) ], function( name ) paste( "Mean_of_", name, sep = "" ) )

#   Replace the activity factor numbers with names

all_mean_std.means$activity <- activity_names[ all_mean_std.means$activity ]

#   Write the tidy dataset to a text file

write.table( all_mean_std.means, "UCI_HAR_Dataset_feature_means.txt", row.names = FALSE )

#   The output table can be read into R using the command

#     means <- read.table( "UCI_HAR_Dataset_feature_means.txt", header = TRUE, check.names = FALSE )

