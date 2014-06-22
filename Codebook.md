## Codebook for Course Project for Getting and Cleaning Data on Coursera


### Background

This file describes the variable names chosen for each of the columns of the tidy data set and their relationship to the source data as required by the Course Project for the "Getting and Cleaning Data" course being conducted through Coursera by staff at John Hopkins Bloomberg School of Public Health.

The source data were provided in a .zip file at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip which also includes a "README.txt" file describing the experiment which was conducted to produce the original source data, the intial processing which was performed on that data, and the structure of the datasets containing the resulting data.

Also included is a "features_info.txt" file describing the features selected to be included in the dataset and the derivation of the abbreviated names used in the dataset :

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.  Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.  Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).  Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.  (Note the 'f' to indicate frequency domain signals). [1]"

The data consist of 10,299 observations of 561 smartphone movement parameters together with a record of the activity being performed at the time that the measurements were recorded and a number identifying the volunteer performing the activity.


### run_analysis.R

A script called "run_analysis.R" was created to read the various data files and combine and transform them into a single tidy data set containing the average of each variable for each activity and each subject.  As part of the transformation, the names of the variables used in the new tidy data set expanded the abbreviations used in the source data to their full form to improve readability.


### Variable Names

Variable names used in the tidy data set are described using the following convention :

- variable name
    - variable type
        - variable description
            - allowable values

Variable names included in the tidy data set are :

- subject
    - numeric
        - subject identifier number
            - 1 to 30

- activity
    - character
        - activity being performed at the time of the measurement
            - "WALKING
", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"


- Mean_of_time_Body_Accelerometer_mean_X,Y,Z
    - numeric
        - Mean of mean of Accelerometer time domain signal of Body movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_time_Body_Accelerometer_std_X,Y,Z
    - numeric
        - Mean of standard deviation of Accelerometer time domain signal of Body movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_time_Gravity_Accelerometer_mean_X,Y,Z
    - numeric
        - Mean of mean of Accelerometer time domain signal of Gravity component of movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_time_Gravity_Accelerometer_std_X,Y,Z
    - numeric
        - Mean of standard deviation of Accelerometer time domain signal of Gravity component of movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_time_Body_Accelerometer_Jerk_mean_X,Y,Z
    - numeric
        - Mean of mean of Accelerometer time domain signal of Body Jerk movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_time_Body_Accelerometer_Jerk_std_X,Y,Z
    - numeric
        - Mean of standard deviation of Accelerometer time domain signal of Body Jerk movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_time_Body_Gyroscope_mean_X,Y,Z
    - numeric
        - Mean of mean of Gyroscope time domain signal of Body movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_time_Body_Gyroscope_std_X,Y,Z
    - numeric
        - Mean of standard deviation of Gyroscope time domain signal of Body movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_time_Body_Gyroscope_Jerk_mean_X,Y,Z
    - numeric
        - Mean of mean of Gyroscope time domain signal of Body Jerk movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_time_Body_Gyroscope_Jerk_std_X,Y,Z
    - numeric
        - Mean of standard deviation of Gyroscope time domain signal of Body Jerk movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_time_Body_Accelerometer_Magnitude_mean
    - numeric
        - Mean of mean of Magnitude of Accelerometer time domain signal of Body movement
            - -1.0 to +1.0

- Mean_of_time_Body_Accelerometer_Magnitude_std
    - numeric
        - Mean of standard deviation of Magnitude of Accelerometer time domain signal of Body movement
            - -1.0 to +1.0

- Mean_of_time_Gravity_Accelerometer_Magnitude_mean
    - numeric
        - Mean of mean of Magnitude of Accelerometer time domain signal of Gravity component of movement
            - -1.0 to +1.0

- Mean_of_time_Gravity_Accelerometer_Magnitude_std
    - numeric
        - Mean of standard deviation of Magnitude of Accelerometer time domain signal of Gravity component of movement
            - -1.0 to +1.0

- Mean_of_time_Body_Accelerometer_Jerk_Magnitude_mean
    - numeric
        - Mean of mean of Magnitude of Accelerometer time domain signal of Body Jerk movement
            - -1.0 to +1.0

- Mean_of_time_Body_Accelerometer_Jerk_Magnitude_std
    - numeric
        - Mean of standard deviation of Magnitude of Accelerometer time domain signal of Body Jerk movement
            - -1.0 to +1.0

- Mean_of_time_Body_Gyroscope_Magnitude_mean
    - numeric
        - Mean of mean of Magnitude of Gyroscope time domain signal of Body movement
            - -1.0 to +1.0

- Mean_of_time_Body_Gyroscope_Magnitude_std
    - numeric
        - Mean of standard deviation of Magnitude of Gyroscope time domain signal of Body movement
            - -1.0 to +1.0

- Mean_of_time_Body_Gyroscope_Jerk_Magnitude_mean
    - numeric
        - Mean of mean of Magnitude of Gyroscope time domain signal of Body Jerk movement
            - -1.0 to +1.0

- Mean_of_time_Body_Gyroscope_Jerk_Magnitude_std
    - numeric
        - Mean of standard deviation of Magnitude of Gyroscope time domain signal of Body Jerk movement
            - -1.0 to +1.0

- Mean_of_frequency_Body_Accelerometer_mean_X,Y,Z
    - numeric
        - Mean of mean of Accelerometer frequency domain signal of Body movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_frequency_Body_Accelerometer_std_X,Y,Z
    - numeric
        - Mean of standard deviation of Accelerometer frequency domain signal of Body movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_frequency_Body_Accelerometer_Jerk_mean_X,Y,Z
    - numeric
        - Mean of mean of Accelerometer frequency domain signal of Body Jerk movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_frequency_Body_Accelerometer_Jerk_std_X,Y,Z
    - numeric
        - Mean of standard deviation of Accelerometer frequency domain signal of Body Jerk movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_frequency_Body_Gyroscope_mean_X,Y,Z
    - numeric
        - Mean of mean of Gyroscope frequency domain signal of Body movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_frequency_Body_Gyroscope_std_X,Y,Z
    - numeric
        - Mean of standard deviation of Gyroscope frequency domain signal of Body movement in the x,Y,Z direction
            - -1.0 to +1.0

- Mean_of_frequency_Body_Accelerometer_Magnitude_mean
    - numeric
        - Mean of mean of Magnitude of Accelerometer frequency domain signal of Body movement
            - -1.0 to +1.0

- Mean_of_frequency_Body_Accelerometer_Magnitude_std
    - numeric
        - Mean of standard deviation of Magnitude of Accelerometer frequency domain signal of Body movement
            - -1.0 to +1.0

- Mean_of_frequency_Body_Body_Accelerometer_Jerk_Magnitude_mean
    - numeric
        - Mean of mean of Magnitude of Accelerometer frequency domain signal of Body Jerk movement
            - -1.0 to +1.0

- Mean_of_frequency_Body_Body_Accelerometer_Jerk_Magnitude_std
    - numeric
        - Mean of standard deviation of Magnitude of Accelerometer frequency domain signal of Body Jerk movement
            - -1.0 to +1.0

- Mean_of_frequency_Body_Body_Gyroscope_Magnitude_mean
    - numeric
        - Mean of mean of Magnitude of Gyroscope frequency domain signal of Body movement
            - -1.0 to +1.0

- Mean_of_frequency_Body_Body_Gyroscope_Magnitude_std
    - numeric
        - Mean of standard deviation of Magnitude of Gyroscope frequency domain signal of Body movement
            - -1.0 to +1.0

- Mean_of_frequency_Body_Body_Gyroscope_Jerk_Magnitude_mean
    - numeric
        - Mean of mean of Magnitude of Gyroscope frequency domain signal of Body Jerk movement
            - -1.0 to +1.0

- Mean_of_frequency_Body_Body_Gyroscope_Jerk_Magnitude_std
    - numeric
        - Mean of standard deviation of Magnitude of Gyroscope frequency domain signal of Body Jerk movement
            - -1.0 to +1.0


### License

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

