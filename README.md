# Getting and Cleaning Data Project

The project uses data from the accelerometers from the Samsung Galaxy S smartphone. See CodeBook.md for more information about the data.

## About the Repository

This repository contains the following:
1. tidy_data.txt : This txt file contains the data that was worked with and cleaned.
2. run_analysis.R : This R script contains the codes used in performing the analysis.
3. CodeBook.md : This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.\
4. README.md : This provides an overview of the repository and the steps done in transforming the data.
5. UCI HAR Dataset : This contains the data sets used in this project.

## Data Transformation

Assuming the data was already downloaded and unzipped, the R script run_analysis.R does the following:
* Read the training and test data sets.
* Read the features and activity labels data sets.
* Merge the training and test data sets into one.
* Extract only the measurements on the mean and standard deviation for each measurement.
* Use descriptive activity names to name the activities in the data set.
* Appropriately label the data set with descriptive variable names.
* Create a tidy data set with the average of each variable for each activity and each subject.
* Create a text file containing the tidy data set.
