##'run_analysis.R' 

##1 Merges the training and the test sets to create one data set.

doMergeDataSet <- function() {
  testDataSet <- read.table('./UCI HAR Dataset/test/subject_test.txt')
  trainDataSet <- read.table('./UCI HAR Dataset/train/subject_train.txt')
  mergeDataSet <- rbind(trainDataSet, testDataSet)
  names(mergeDataSet) <- "subject"
  mergeDataSet
}

doMerge_X_dataset <- function() {
  X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
  X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
  X_merged  <- rbind(X_train, X_test)
  X_merged
}

doMerge_y_dataset <- function() {
  y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
  y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
  y_merged  <- rbind(y_train, y_test)
  y_merged
}

merge_dataset <- doMergeDataSet()
X_dataset <- doMerge_X_dataset()
y_dataset <- doMerge_y_dataset()


##2 Extracts only the measurements on the mean and standard deviation for each measurement.

get_measurements <- function() {
  features <- read.table('./UCI HAR Dataset/features.txt', header=FALSE, col.names=c('id', 'name'))
  ## get only columns with mean() or std() in their names
  feature_selected_columns <- grep('mean\\(\\)|std\\(\\)', features$name)
  ## subset the desired columns
  filtered_dataset <- X_dataset[, feature_selected_columns]
  # correct the column names
  names(filtered_dataset) <- features[features$id %in% feature_selected_columns, 2]
  filtered_dataset
}

X_filtered_dataset <- get_measurements()

##3 Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header=FALSE, col.names=c('id', 'name'))


##4 Appropriately labels the data set with descriptive variable names.

y_dataset[, 1] = activity_labels[y_dataset[, 1], 2]
names(y_dataset) <- "activity"

##5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Creates an intermediate dataset with all required measurement
whole_dataset <- cbind(merge_dataset, y_dataset, X_filtered_dataset)

measurements <- whole_dataset[, 3:dim(whole_dataset)[2]]
tidy_dataset <- aggregate(measurements, list(whole_dataset$subject, whole_dataset$activity), mean)
names(tidy_dataset)[1:2] <- c('subject', 'activity')
write.table(tidy_dataset, "./final_tidy_dataset.txt")
