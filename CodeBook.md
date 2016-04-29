CodeBook.md
Getting and Cleaning Data Course Assignment

Introduction
create one R script called run_analysis.R does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Variable

1. testDataSet, trainDataSet, X_test, X_train, y_test, y_train holds data from downloaded files.
2. merge_dataset, X_dataset, y_dataset holds merged data for futher analysis.
3. X_filtered_dataset holds the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features.
4. activity_labels holds descriptive activity names to name the activities in the data set
5. whole_dataset holds bind value of merge_dataset, y_dataset, X_filtered_dataset. Using this variable Intermediate Dataset in generated in CSV format.
6. Finally, tidy_dataset hold the final aggregate value which will be later stored in a .txt file. 


