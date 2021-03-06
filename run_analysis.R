#*******************Getting and Cleaning Data Course Project -  May 2015 - Farrukh Shahzad******
library(plyr)

# file URL & destination file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "./data/activity.zip"

# download the file & note the time
download.file(fileUrl, destfile)
dateDownloaded <- date()

#*************Step 1: Read and merge the data

# read in the data for test and training sets, & labels
test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

training <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainingLabel <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
trainingSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

activityLabel <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

# clean up the the labels by removing excessive brackets and underscores
features <- gsub("\\()", "", features$V2)

activityLabel <- activityLabel$V2
activityLabel <- tolower(activityLabel)
activityLabel <- sub("_", " ", activityLabel)

# relabel the names of columns 
names(test) <- features; names(training) <- features
names(testLabel) <- "activity"; names(trainingLabel) <- "activity"
names(testSubject) <- "participant"; names(trainingSubject) <- "participant"

# create a DF & bind the training data to the bottom of the test data
DF <- rbind(test, training)


#********************Step 2:  extract only the columns containing standard deviation or mean
criteria <- grep("mean|std", names(DF))

# create a new, separate DF that holds only identifiers initially
DF_test <- data.frame(testLabel, testSubject)
DF_training <- data.frame(trainingLabel, trainingSubject)
DF_new <- rbind(DF_test, DF_training)

#*********************Step 3: Uses descriptive activity names to name the activities in the data set
# for each in criteria: add the DF criteria column to a new DF
for (each in criteria){
  DF_new <- cbind(DF_new, DF[each])
}

#*********************Step 4: Uses descriptive activity names to name the activities in the data set
# replace the activity numbers with their respective labels
DF_new$activity <- mapvalues(DF_new$activity, 
                             from = levels(factor(DF_new$activity)), 
                             to = activityLabel)


#******************** Step 5: Appropriately labels the data set with descriptive variable names.
# variable for each activity & subject
DF_tidy <- aggregate(DF_new, list(DF_new$participant, DF_new$activity), mean)

# clean up the columns and column names from a result of aggregating
DF_tidy$participant <- NULL; DF_tidy$activity <- NULL
names(DF_tidy)[1] <- "participant"; names(DF_tidy)[2] <- "activity"

# write out the dataframe into a file
write.table(file = "tidydata.txt", x = DF_tidy, row.names = FALSE)


