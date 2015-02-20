#Data for project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#R script does the following

#1.) Merge the training and test sets to create one data set

#Read in the data
sub_test<-read.table("subject_test.txt")
sub_train<-read.table("subject_train.txt")
x_test<-read.table("X_test.txt")
x_train<-read.table("X_train.txt")
y_test<-read.table("y_test.txt")
y_train<-read.table("y_train.txt")

#Combine training and test data
subject<-rbind(sub_test,sub_train)
x<-rbind(x_test,x_train)
y<-rbind(y_test,y_train)

#2.) Extract only the measurements on the mean and standard deviation for each measurement. 
features<-read.table("features.txt")

#create indices of mean and standard
ind_std<-grep("-std\\(\\)", features[, 2])
ind_mean<-grep("-mean\\(\\)", features[, 2])

#combine, sort and store indices into index vector
mean_std<-sort(c(ind_std,ind_mean))


#clean and assign names to x then print head of measurements on the mean and standard deviation
x<-x[,mean_std]
names(x)<-features[mean_std,2]
names(x)
names(x)<-gsub("\\(|\\)","",names(x))
names(x)
names(x)<-gsub("-","_",names(x))
names(x)
head(x)


#3.) Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
y[,1] <- activities[y[,1], 2]
names(y) <- "activity"


#4.) Appropriately labels the data set with descriptive activity names
names(subject) <- "subject"
clean <- cbind(subject, y, x)
write.table(clean, "clean_data.txt")

#5.) From the data set in step 4, creates a second independent tidy data set with the average 
# of each variable for each activity and each subject
unique_sub <- unique(subject)[,1]
num_sub <- length(unique_sub)
num_act <- length(activities[,1])
num_col <- dim(clean)[2]
my_result <- clean[1:(num_sub*num_act), ]


row<-1
for (i in 1:num_sub) {
for (j in 1:num_act) {
result[row, 1] <- unique_sub[i]
result[row, 2] <- activities[j, 2]
tmp <- clean[clean$subject==i & clean$activity==activities[j, 2], ]
my_result[row, 3:num_col] <- colMeans(tmp[, 3:num_col])
row <- row+1
}
}
write.table(result, "averages.txt")

#































