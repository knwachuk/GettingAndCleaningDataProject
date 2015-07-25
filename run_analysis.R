# 1) Merges the training and the test sets to creae one data set.
# 2) Extracts only the measurement on the mean and standard deviation for each
#    measurements.
# 3) Uses descriptive activity names to name the activities in the data set.
# 4) Appropriately labels the data set with descriptive variable names.
# 5) From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.

# Loading the required libraries
library(dplyr)
library(tidyr)

# Data labelling
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")
feature_label <- read.table("UCI HAR Dataset/features.txt")
data_label <- c("Subject", "Activity")

# Reading in test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Reading in training data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Naming the first 2 columns [Manual]
colnames(subject_test) <- data_label[1]
colnames(y_test) <- data_label[2]
colnames(subject_train) <- data_label[1]
colnames(y_train) <- data_label[2]

# Cleaning the labels, i.e removing - and () in between text
feature_label <- feature_label %>%
    apply((1:2), FUN = function(x) gsub("\\(\\)", "", x)) %>% # Removing ()
    apply((1:2), FUN = function(x) gsub("-", "_", x))         # Removing _

# 4) Appropriately labels the data set with the descriptive variable names.
for (i in 1:561)
{
    names(X_test)[i] <- as.character(feature_label[i,2])
    names(X_train)[i] <- as.character(feature_label[i,2])
}

# Column binding Subject, Activity, [and adding a column for] Set, and 561
# feature vector for test case and train case as TEST and TRAIN object
TRAIN <-
    cbind(subject_train, y_train) %>%
    mutate(Set = "TRAIN") %>%
    cbind(X_train)

TEST <-
    cbind(subject_test, y_test) %>%
    mutate(Set = "TEST") %>%
    cbind(X_test)

# 1) Merges the training, TRAIN, and the test, TEST, sets to create one data
#    set.
DATA <-
    rbind(TRAIN, TEST)

# 3) Uses descriptive activity names to name the activities in the data set.
for (i in unique(DATA[[2]]))
{
    DATA[[2]][DATA[[2]] == i] <- as.character(activity_label[i,2])
}

# Removing duplicate columns
no_duplicate_DATA <- DATA[, !duplicated(names(DATA))]

# 2) Extract only the measurements on the mean and standard deviation for each
#    measurement.
nd_DATA_meanNstd <- select(no_duplicate_DATA,
                           Subject, Activity, Set,
                           contains("mean"), contains("std"))

# Grouping the data by Subject and Activity
grouped_DATA <- group_by(nd_DATA_meanNstd, Subject, Activity, Set)

# 5) From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject
avgDATA <- grouped_DATA %>% summarise_each(funs(mean))

# Making output file for submission
write.table(avgDATA, file=paste("avgDATA", ".txt"), row.names=FALSE)

# Cleaning the environment
rm(activity_label); rm(feature_label); rm(data_label)

rm(i)

rm(subject_train); rm(X_train); rm(y_train)
rm(subject_test); rm(X_test); rm(y_test)

rm(TEST); rm(TRAIN)

#rm(DATA);
rm(no_duplicate_DATA); rm(nd_DATA_meanNstd); rm(grouped_DATA)
