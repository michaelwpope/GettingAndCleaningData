
##  run_analysis.R

##  Analysis script for Course Project for "Getting and Cleaning Data" module

activities <- read.table( "UCI HAR Dataset/activity_labels.txt", colClasses = "character" )
activity_names <- activities[ , 2 ]
features <- read.table( "UCI HAR Dataset/features.txt", colClasses = "character" )
feature_names <- features[ , 2 ]

X_train <- read.table( "UCI HAR Dataset/train/X_train.txt", colClasses = "numeric" )
y_train <- read.table( "UCI HAR Dataset/train/y_train.txt", colClasses = "numeric" )
subject_train <- read.table( "UCI HAR Dataset/train/subject_train.txt", colClasses = "numeric" )

X_test <- read.table( "UCI HAR Dataset/test/X_test.txt", colClasses = "numeric" )
y_test <- read.table( "UCI HAR Dataset/test/y_test.txt", colClasses = "numeric" )
subject_test <- read.table( "UCI HAR Dataset/test/subject_test.txt", colClasses = "numeric" )

X_all <- rbind( X_train, X_test )
names( X_all ) <- feature_names

y_all <- rbind( y_train, y_test )
names( y_all ) <- "activity"

subject_all <- rbind( subject_train, subject_test )
names( subject_all ) <- "subject"

X_mean_std <- X_all[ , sort( c( grep( "mean()", names( X_all ), fixed = TRUE ), grep( "std()", names( X_all ), fixed = TRUE ) ) ) ]
all_mean_std <- cbind( subject_all, y_all, X_mean_std )

all_mean_std.means <- aggregate( all_mean_std[ names( all_mean_std )[ c( -1, -2 ) ] ], by = all_mean_std[ c( "subject", "activity" ) ], FUN = mean )
all_mean_std.means <- all_mean_std.means[ order( all_mean_std.means$subject, all_mean_std.means$activity ), ]
all_mean_std.means$activity <- activity_names[ all_mean_std.means$activity ]
names( all_mean_std.means )[ c( -1, -2 ) ] <- lapply( names( all_mean_std.means )[ c( -1, -2 ) ], function( name ) paste( "Mean of", name ) )

write.table( all_mean_std.means, "UCI_HAR_Dataset_feature_means.txt", row.names = FALSE )

##  means <- read.table( "UCI_HAR_Dataset_feature_means.txt", header = TRUE, check.names = FALSE )

