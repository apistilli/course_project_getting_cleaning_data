library(plyr)
#library(ddply)
# Step 1 of assignment
# Merges the training and the test sets to create one data set.

# 1.1 read test and train files from the data folder

test_activity_data <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=F)
test_activity_type <- read.csv("UCI HAR Dataset/test/y_test.txt", header=F)
test_activity_subject <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=F)
train_activity_data <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=F)
train_activity_type <- read.csv("UCI HAR Dataset/train/y_train.txt", header=F)
train_activity_subject <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=F)


# 1.2 Merge Subject, Type and data files by rows
complete_type <- rbind(test_activity_type, train_activity_type)
complete_subject <- rbind( test_activity_subject, train_activity_subject)
complete_data <- rbind(test_activity_data, train_activity_data)

features <- read.csv("UCI HAR Dataset/features.txt", sep = " ", header=F)
names <- as.vector(features[,2])
colnames(complete_data) <- names

# 1.3 now I can finally merge the 2 datasets (train and test) into a single one
complete_dataset <- cbind(complete_subject,complete_type, complete_data)

names(complete_dataset)[1] <- "subject"
names(complete_dataset)[2] <- "type"

# 1.4 (optional) free memory from the other datasets
rm(test_activity_data,
   test_activity_subject, 
   test_activity_type, 
   train_activity_data, 
   train_activity_subject, 
   train_activity_type,
   complete_type,
   complete_data,
   complete_subject
  )

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

# 2.1 create a new data.frame containing Std and mean columns

new_dataset <- cbind(complete_dataset[1:2], 
                     complete_dataset[,grep('mean()|std()', colnames(complete_dataset))])

# 2.2 removing "meanFreq" as not relevant to the calculation
new_dataset <- new_dataset[,grep('meanFreq', colnames(new_dataset), invert=T)]

# step 3: Uses descriptive activity names to name the activities in the data set

activities <- c("1" = "WALKING",
                "2" = "WALKING_UPSTAIRS",
                "3" = "WALKING_DOWNSTAIRS",
                "4" = "SITTING",
                "5" = "STANDING",
                "6" = "LAYING"
                )
new_dataset <- mutate(new_dataset, type = activities[type])

# step 4: Appropriately labels the data set with descriptive variable names. 
new_names <- names(new_dataset)
new_names <-gsub("Acc","Acceleration",new_names) # Replace abbreviations
new_names <-gsub("^t","time",new_names) # Replace abbreviations
new_names <-gsub("^f","frequency",new_names) # Replace abbreviations
new_names <-gsub("\\W","",new_names) # remove all non alphanumeric characters
new_names <- tolower(new_names)

names(new_dataset)<-new_names
names(new_dataset)[2] <- "type"


# step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


tidy_dataset <-ddply(new_dataset, .(subject,type),numcolwise(mean))
write.table(tidy_dataset, file="tidy.txt", row.names=F)
