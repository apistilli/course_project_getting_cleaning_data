# Input files:
1) "UCI HAR Dataset/test/X_test.txt": contains the activity data of the test group
2) "UCI HAR Dataset/test/y_test.txt": contains the activity type for each entry
3) "UCI HAR Dataset/test/subject_test.txt": contains the subject id for each entry of the activity data
4) "UCI HAR Dataset/train/X_train.txt": contains the activity data for the train group
5) "UCI HAR Dataset/train/y_train.txt": contains the activity type for each entry of the activity data of the train group
6) "UCI HAR Dataset/train/subject_train.txt": contains the subject id for each entry of the activity data of the train group
7) "UCI HAR Dataset/features.txt": contains the names of the features for the activity data

The data has been aggregated by merging (with Rbind) type, subject and data and then by merging (cbind) the 3 resulting datasets

I've used the feature file to define the column names of the resulting dataset. I've manually created the names for the columns 1,2: subject and type.

I removed all the measurements not related to mean and standard deviation

I replaced the type id with a descriptive name of the activity

I edited the columns name following the tidy requirements

I generated the new dataset by calculating the mean for each type,subject group.
I saved the resulting dataset as "tidy.txt"

# Below a description of resulting data:
All variables are normalized and bounded within [-1,1].

subject: the subject associated with a given activity
type: type of activity the observation is referring to (Walking, standing, etc)

body acceleration mean for XYZ Axis
timebodyaccelerationmeanx
timebodyaccelerationmeany
timebodyaccelerationmeanz

body acceleration Standard Deviation for XYZ Axis
timebodyaccelerationstdx
timebodyaccelerationstdy
timebodyaccelerationstdz

Gravity acceleration mean for XYZ Axis
timegravityaccelerationmeanx
timegravityaccelerationmeany
timegravityaccelerationmeanz


Gravity acceleration Standard Deviation for XYZ Axis
timegravityaccelerationstdx
timegravityaccelerationstdy
timegravityaccelerationstdz

Jerk Signal for Body acceleration mean for XYZ Axis
timebodyaccelerationjerkmeanx
timebodyaccelerationjerkmeany
timebodyaccelerationjerkmeanz


Jerk Signal for Body acceleration Standard Deviation for XYZ Axis
timebodyaccelerationjerkstdx
timebodyaccelerationjerkstdy
timebodyaccelerationjerkstdz

Gyro Body mean for XYZ Axis
timebodygyromeanx
timebodygyromeany
timebodygyromeanz


Gyro Body Standard Deviation for XYZ Axis
timebodygyrostdx
timebodygyrostdy
timebodygyrostdz


Gyro Body Jerk mean for XYZ Axis
timebodygyrojerkmeanx
timebodygyrojerkmeany
timebodygyrojerkmeanz


Gyro Body Jerk Standard Deviation for XYZ Axis
timebodygyrojerkstdx
timebodygyrojerkstdy
timebodygyrojerkstdz

Time Body Acceleration mean and STD for XYZ Axis
timebodyaccelerationmagmean
timebodyaccelerationmagstd
timegravityaccelerationmagmean
timegravityaccelerationmagstd

timebodyaccelerationjerkmagmean
timebodyaccelerationjerkmagstd
timebodygyromagmean
timebodygyromagstd
timebodygyrojerkmagmean
timebodygyrojerkmagstd
frequencybodyaccelerationmeanx
frequencybodyaccelerationmeany
frequencybodyaccelerationmeanz
frequencybodyaccelerationstdx
frequencybodyaccelerationstdy
frequencybodyaccelerationstdz
frequencybodyaccelerationjerkmeanx
frequencybodyaccelerationjerkmeany
frequencybodyaccelerationjerkmeanz
frequencybodyaccelerationjerkstdx
frequencybodyaccelerationjerkstdy
frequencybodyaccelerationjerkstdz
frequencybodygyromeanx
frequencybodygyromeany
frequencybodygyromeanz
frequencybodygyrostdx
frequencybodygyrostdy
frequencybodygyrostdz
frequencybodyaccelerationmagmean
frequencybodyaccelerationmagstd
frequencybodybodyaccelerationjerkmagmean
frequencybodybodyaccelerationjerkmagstd
frequencybodybodygyromagmean
frequencybodybodygyromagstd
frequencybodybodygyrojerkmagmean
frequencybodybodygyrojerkmagstd
