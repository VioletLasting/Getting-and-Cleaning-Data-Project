##Getting and Cleaning Data##

#-----------------------------------------------------------------#
# 1. Merge the training and the test sets to create one data set. #
#-----------------------------------------------------------------#

#Read the training data set.
train_x <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
train_y <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
train_subject <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

#Read the test data set.
test_x <- read.table (".\\UCI HAR Dataset\\test\\X_test.txt")
test_y <- read.table (".\\UCI HAR Dataset\\test\\y_test.txt")
test_subject <- read.table (".\\UCI HAR Dataset\\test\\subject_test.txt")

#Read activity labels.
act_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

#Read features.
features <- read.table(".\\UCI HAR Dataset\\features.txt")

#Assign column names.
##Training data set
colnames(train_x) <- features[,2]
colnames(train_y) <- "Activity"
colnames(train_subject) <- "Subject"
##Test data set
colnames(test_x) <- features[,2]
colnames(test_y) <- "Activity"
colnames(test_subject) <- "Subject"

#Bind/Merge the datasets.
training <- cbind(train_subject, train_y, train_x)
test <- cbind(test_subject, test_y, test_x)
data_merged <- rbind(training, test)

#-------------------------------------------------------------------------------------------#
# 2. Extract only the measurements on the mean and standard deviation for each measurement. #
#-------------------------------------------------------------------------------------------#

mean_sd <- grepl("Subject|Activity|mean|std", colnames(data_merged))
data_extracted <- data_merged[,mean_sd]

#---------------------------------------------------------------------------#
# 3. Use descriptive activity names to name the activities in the data set. #
#---------------------------------------------------------------------------#

data_extracted$Activity <- factor(data_extracted$Activity, levels = act_labels[,1], labels = act_labels[,2])

#----------------------------------------------------------------------#
# 4. Appropriately label the data set with descriptive variable names. #
#----------------------------------------------------------------------#

colnames(data_extracted) <- gsub("^t", "time", names(data_extracted))
colnames(data_extracted) <- gsub("^f", "frequency", names(data_extracted))
colnames(data_extracted) <- gsub("Acc", "Accelerometer", names(data_extracted))
colnames(data_extracted) <- gsub("Gyro", "Gyroscope", names(data_extracted))
colnames(data_extracted) <- gsub("Mag", "Magnitude", names(data_extracted))
colnames(data_extracted) <- gsub("BodyBody", "Body", names(data_extracted))

#---------------------------------------------------------------------------------------------------------------------#
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. #
#---------------------------------------------------------------------------------------------------------------------#

data_ave <- aggregate(. ~Subject + Activity, data_extracted, mean)
data_ave <- data_ave[order(data_ave$Subject, data_ave$Activity),]

#-----------------------------------------------------#
# 6. Create a text file containing the tidy data set. #
#-----------------------------------------------------#

write.table(data_ave, file = "tidy_data.txt", row.name=FALSE)


#-End-of-Script--------------------------------------------------------------------------------------------------------#