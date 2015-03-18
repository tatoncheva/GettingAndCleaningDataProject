library(dplyr)
library(plyr)
library(reshape2)

# this is a function for the repeating manipulation of both - the test and the train data.
manipulateData <- function (filesDirName, subjectFile, activityFile, measurementsFile, 
                            activityLabels, searchedCols){
    subjects <- read.table(file.path(getwd(), filesDirName, subjectFile))
    activities <- read.table(file.path(getwd(), filesDirName, activityFile))
    activitiesLabels <- select(join(activities, activityLabels), V2)
    names(activitiesLabels) <- "Activity"
    names(subjects) <- "Subject"
    data <- read.table(file.path(getwd(), filesDirName, measurementsFile))
    data <- select(data,  searchedCols$V1)
    names(data) <- searchedCols$V2 
    dataFull <- cbind(subjects, activitiesLabels, data)
    
}

# read the variables, get only those for the mean and the standard deviation
# then make the variables more readable and valid column names using the CamelCase.
colNames <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = F)
searchedCols <- filter(colNames, grepl("mean()|std()", V2) & !grepl("meanFreq()|angle.", V2))
searchedCols$V2 <- gsub("mean", "Mean", searchedCols$V2)
searchedCols$V2 <- gsub("std", "Std", searchedCols$V2)
searchedCols$V2 <- gsub("[[:punct:]]", "", searchedCols$V2)

# read the activity labels and make them more readable too.
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = F)
activityLabels$V2 <- sub("_", " ", activityLabels$V2)

# read the measurement data for test and train, manipulate it and create the means
# by each variable for each subject and each activity. Write the tidy data to a file.
dataTest <- manipulateData("UCI HAR Dataset/test", "subject_test.txt", "y_test.txt", "X_test.txt", activityLabels, searchedCols)
dataTrain <- manipulateData("UCI HAR Dataset/train", "subject_train.txt", "y_train.txt", "X_train.txt", activityLabels, searchedCols)
dataFull <- rbind(dataTest, dataTrain)
dataMelted  <- melt(dataFull, id = c("Activity", "Subject"), measure.vars = c(names(dataFull)[3:length(names(dataFull))]))
tidyData <- dcast(dataMelted, Activity + Subject ~ variable, mean)
write.table(tidyData, "tidyDataSet.txt", row.name=F)
