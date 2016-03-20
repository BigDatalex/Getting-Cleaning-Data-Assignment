# Getting-Cleaning-Data-Assignment
This repo contains the Readme, CodeBook and R-Script (run_Analysis.R) for the Coursera Assignment of Getting &amp; Cleaning Data

Assignment Getting & Cleaning Data Week 4 - Readme

Prerequisites for executing the run_Analysis.R script:
	
	1. You need to have installed the package (dplyr)
	2. You need to have installed the package (tidyr)
	3. (optional) If you havent installed those packages yet, paste the following code into R:
		install.packages("dplyr")
		install.packages("tidyr")

Guide to execute the script (run_Analysis.R)

	1. download the zip file from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	2. unzip the zip-file in your favored directory
	3. download the script run_Analysis.R
	4. copy the filepath of the script and load it into R
	(that can be done using the function source(file="<your filepath>/run_Analysis.R")
	5. copy the filepath of the unzipped folder (UCI HAR Dataset)
	6. call the function in R and handover the filepath, where the UCI HAR Dataset folder is loated
	(For example: run_Analysis("<your filepath>/UCI HAR Dataset")

run_Analysis.R steps performed to create two tidy datasets:

	1. all tables are read into R
	2. features.txt is used to set the appropriate column names for the train and test dataset (X_test.txt, X_train.txt)
	3. for each dataset a vector is created with the descriptive activity names. Those vetors are then combined with the train 	and test dataset
	4. adds subject_test.txt and subject_train.txt to the specific dataset
	5. all dublicated columns are removed from the datasets (from 563 columns to 479) 
	6. prepares the rownames for binding train and test dataset
	7. extracts only the columns subject and activity and measurements with mean and std
	8. tidies the dataset
	# transforms the dataset so that column headers are variable names
	# removes hyphen from direction column
	# this dataset is called "x_all"
	9. creates a second tidy data set with the average of each variable for each activity and each subject.This dataset is 	called "x_all_mean"

	Hint: at the end, all dataframe created to create the two final dataframes are deleted, to show up only the final ones. 
	If you want to see also those ones (for better undersatnding) you can just comment the rm(...) out at the end of my code.
