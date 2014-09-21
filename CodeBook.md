# The following codebook describe the files and the data used in this assignment and how they have been transformed during the process

Input files:
"UCI HAR Dataset/test/X_test.txt": contains the activity data of the test group
"UCI HAR Dataset/test/y_test.txt": contains the activity type for each entry
"UCI HAR Dataset/test/subject_test.txt": contains the subject id for each entry of the activity data
"UCI HAR Dataset/train/X_train.txt": contains the activity data for the train group
"UCI HAR Dataset/train/y_train.txt": contains the activity type for each entry of the activity data of the train group
"UCI HAR Dataset/train/subject_train.txt": contains the subject id for each entry of the activity data of the train group
"UCI HAR Dataset/features.txt": contains the names of the features for the activity data

The data has been aggregated by merging (with Rbind) type, subject and data and then by merging (cbind) the 3 resulting datasets

I've used the feature file to define the column names of the resulting dataset. I've manually created the names for the columns 1,2: subject and type.

I removed all the measurements not related to mean and standard deviation

I replaced the type id with a descriptive name of the activity

I edited the columns name following the tidy requirements

I generated the new dataset by calculating the mean for each type,subject group.
I saved the resulting dataset as "tidy.txt"