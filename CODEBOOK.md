Code Book For Getting And Cleaning Data Course Project
------------------------------------------------------

## Raw data
### Source Location
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
### Purpose of collection
Detailed information about the data, its purpose, the way it was collected as well as information on the prior manipulation that were performed on it is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    
### Structure
The dataset includes the following files:
* "README.txt"
* "features_info.txt": Shows information about the variables used on the feature vector.
* "features.txt": List of all features.
* "activity_labels.txt": Links the class labels with their activity name.
* "train/X_train.txt": Training set.
* "train/y_train.txt": Training labels.
* "test/X_test.txt": Test set.
* "test/y_test.txt": Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
* "train/subject_train.txt": Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* "train/Inertial Signals/total_acc_x_train.txt": The acceleration signal from the smartphone accelerometer X axis in standard gravity units "g". Every row shows a 128 element vector. The same description applies for the "total_acc_x_train.txt" and "total_acc_z_train.txt" files for the Y and Z axis. 
* "train/Inertial Signals/body_acc_x_train.txt": The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* "train/Inertial Signals/body_gyro_x_train.txt": The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### License
Use of this dataset in publications must be acknowledged by referencing the following publication [1]
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

**Notes:** 
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

*For more information about this dataset contact: activityrecognition@smartlab.ws*

## Question the transformed tidy data is going to answer
The final goal of the manipulations on the raw data set is to get only the variables for the mean and standard deviation measurements and then to find the average of each of those variables for each activity and each subject.
  
## Actions taken to transform the data
* Decide which data files to use
After reading the description of the data and exploring its structure and content, the decision that the files in the "Inertial Signals" folder is not necessary for our goal as the information from it is contained in X_test.txt and X_train.txt too. So finally these two folders were not used.
* The script run_analysis.R contains all the necessary steps to clean up and transform the raw data into the data which serves our goal. The script can be found in the project's GitHub repository. There are no parameters to it and is run just by clicking on Source. Script location:
https://github.com/tatoncheva/GettingAndCleaningDataProject/blob/master/run_analysis.R
    
## Tidy data set
### Location
The file with the tidy data set called tidyDataSet.txt is on the Coursera evaluation page
### Dimensions
180 observations on 68 variables
### Details
The first two columns as the names suggest are for the activity performed then the subject identifier who performed the activity (total of 30 subjects) and then the mean value for each of the variables. Only the variables which concern the mean and standard deviation were used.
### Units
* For variables concerning the measurements acquired by the accelerometer are standard gravity units 'g'.
* For variables concerning the measurements acquired by the gyroscope are radians/second.
 
## Detailed description of variables
### General description about the naming of the variables
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
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

The set of variables that were estimated from these signals for the mean and the standard deviation are: 
* mean(): Mean value
* std(): Standard deviation
     
### Variables in the tidy data set
After the transformation of the data, the special characters like "-", "(", ")" were removed and the CamelCase convention on naming variables was used. The link between the variable name from the raw data and the variable name from the tidy data could then be easily done and by the general description above could be found each variable's purpose.
 
* "Activity"
* "Subject"
* "tBodyAccMeanX"
* "tBodyAccMeanY"
* "tBodyAccMeanZ"
* "tBodyAccStdX"
* "tBodyAccStdY"
* "tBodyAccStdZ"
* "tGravityAccMeanX"
* "tGravityAccMeanY"
* "tGravityAccMeanZ"
* "tGravityAccStdX"
* "tGravityAccStdY"
* "tGravityAccStdZ"
* "tBodyAccJerkMeanY"
* "tBodyAccJerkMeanX"
* "tBodyAccJerkMeanZ"
* "tBodyAccJerkStdX"
* "tBodyAccJerkStdY"
* "tBodyAccJerkStdZ"
* "tBodyGyroMeanX"
* "tBodyGyroMeanY"
* "tBodyGyroMeanZ"
* "tBodyGyroStdX"
* "tBodyGyroStdY"
* "tBodyGyroStdZ"
* "tBodyGyroJerkMeanX"
* "tBodyGyroJerkMeanY"
* "tBodyGyroJerkMeanZ"
* "tBodyGyroJerkStdX"
* "tBodyGyroJerkStdY"
* "tBodyGyroJerkStdZ"
* "tBodyAccMagMean"
* "tBodyAccMagStd"
* "tGravityAccMagMean"
* "tGravityAccMagStd"
* "tBodyAccJerkMagMean"
* "tBodyAccJerkMagStd"
* "tBodyGyroMagMean"
* "tBodyGyroMagStd"
* "tBodyGyroJerkMagMean"
* "tBodyGyroJerkMagStd"
* "fBodyAccMeanX"
* "fBodyAccMeanY"
* "fBodyAccMeanZ"
* "fBodyAccStdX"
* "fBodyAccStdY"
* "fBodyAccStdZ"
* "fBodyAccJerkMeanX"
* "fBodyAccJerkMeanY"
* "fBodyAccJerkMeanZ"
* "fBodyAccJerkStdX"
* "fBodyAccJerkStdY"
* "fBodyAccJerkStdZ"
* "fBodyGyroMeanX"
* "fBodyGyroMeanY"
* "fBodyGyroMeanZ"
* "fBodyGyroStdX"
* "fBodyGyroStdY"
* "fBodyGyroStdZ"
* "fBodyAccMagMean"
* "fBodyAccMagStd"
* "fBodyBodyAccJerkMagMean"
* "fBodyBodyAccJerkMagStd"
* "fBodyBodyGyroMagMean"
* "fBodyBodyGyroMagStd"
* "fBodyBodyGyroJerkMagMean"
* "fBodyBodyGyroJerkMagStd"