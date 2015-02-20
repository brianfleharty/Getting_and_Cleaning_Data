#Course Project Code Book
[Source of the original data:](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
[Original description:](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
##The R script (run_analysis.R) performs the following to clean up the data:
###Merges the training and test sets to create one data set.
Read in the data (subject_test, subject_train, X_test, X_train,y_test, and y_train)
Combine training and test data (store in vectors named subject, x and y)
###Extracts only the measurements on the mean and standard deviation for each measurement. 
create indices of mean and standard from features.txt by grepping –std() and –mean()
combine, sort and store indices into index vector
clean and assign names to x then print head of measurements on the mean and standard deviation
###Reads activity_labels.txt and applies activity names to activities
    ..*WALKING
    ..*WALKING_UPSTAIRS
    ..*WALKING_DOWNSTAIRS
   ..*SITTING
    ..*STANDING
   ..*LAYING
###Appropriately labels the data set with descriptive names and writes to document named “clean_data.txt”
    ..*tBodyAcc_mean_X
    ..*tBodyAcc_mean_Y
    ..*tBodyAcc_mean_Z
    ..*tBodyAcc_std_X
    ..*tBodyAcc_std_Y 
    ..*tBodyAcc_std_A 
   ..*tGravityAcc_mean_X 
    ..*tGravityAcc_mean_Y
###Creates a second independent tidy data set with the average of each measurement for each activity and writes to document “averages.txt”
