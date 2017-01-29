# Getting and Cleaning Data: Course Project

This repository contains script, documentation files and final data file for course project for course "Getting and Cleaning Data". Goal of the project was to create a tidy data set with the average of each variable for each activity and each subject based on data sets downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

## The R code file: `run_analysis.R`
The tidy data set is created using this script. To run the script, the data has to be downloaded and stored in working directory in file 'data'. 

First all data needed is loaded to R. Then train and test data are combined for each type of data set available (so `X_train` is connected to `X_test`, `y_train` to `y_test` and `subject_train` to `subject_test`). In next step are selected only variables with mean and standard deviation measures from the list of features. Then the combined file with variable values X is subset to have only these variables. The subset variable values X are then combined with the activity codes Y and subject IDs. Then meaningful names are assigned to each variable. 

To calculate the average values of each variable for each activity and subject ID combination, the `activity` and `subject` variables are converted to factors and then the data set is melted so that the variable names are in one variable and in another are their values. Then this melted data set is aggregated so that for each combination of activity and subject ID we have average value of each variable. This table is stored to `tidy_data.txt` file. 

## The `CodeBook.md` file
The code book contains information about the original data set, the transformations performed and description of variables in the final data set. 
