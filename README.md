---
title: "README"
author: "vicarizmendi"
date: "November,18th 2015"
output: html_document
---

### Introduction


This is the Coursera "Getting and Cleaning Data"" Course Project.

It consists mainly in getting a raw dataset, representing data collected from 
the accelerometers from the Samsung Galaxy S smartphone, and manipulate it to 
produce a new one with the mean values per subject and activity of a subset of
the variables given in the raw data set.

The experiment is done with:

* 30 volunteers, 19-48 years
* (Samsung Galaxy S II) on the waist, with embedded accelerometer and gyroscope
* 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz
* 6 different activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING
* 2 random partitions, "train", 70% of volunteers, and "test",30% of volunteers

A full description is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The resulting file "X_all_mean_std_means.txt"" , jointly with this README.md file
and the corresponding Codebook.md file are uploaded in this github repo,
"Getting-Cleaning-Data-Project"



### Description of raw dataset

The raw dataset is dowloaded from the link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After dowloading and unzipping, we get the directory "UCI HAR Dataset" with some
files and two subdirectories, "train" and "test".

#### Files in the main directory 

* README: Complete information about the experiment, data collected, the content 
of each record and the files included in the directories. This information is 
available and no need to copy it here.
* Other files applicable to both raw data subsets, as explained in README:

        - list of feature names (variables measured or calculated), columns of X files
        - activity numbers/names assignment


#### Files in the subdirectories "UCI HAR Dataset/train" and "UCI HAR Dataset/test"

The files in both directories have the same names and represent the same kind of
data, belonging to training and testing partitions respectively.

In each subdirectory we get:

* Subject file, with as many rows as the file with the features (X_train.txt or 
X_test.txt), and one column, with a number between 1 and 30, representing the 
subject (volunteer) the features are beloging to, in file X.
* y file, with as many rows as the file with the features (X_train.txt or 
X_test.txt), and one column, with a number between 1 and 6, representing the 
activity the features are beloging to, in file X.
* X file, the dataset with the features measured and calculated, but for us raw
data. For X_train 7352 observations and for X_test 2947 observations 
* Subdirectory "Inertial Signals"" with data extractions from the smartphones, all
with 128 samples (columns), and 7352 rows for train and 2947 for test

        - total acceleration in units g in the 3 axes x, y and z
        - body acceleration( substracting the gravity from the total acceleration) in g 
        units in the 3 axes x,y and z
        - angular velocity vector in units radians/second. in the 3 axes x, y and z



### Description of the script generated

In order to follow the Course Project instructions the script prepared has the following
steps:

1. Manually create subdirectory under github local directory to dowload the raw dataset
2. Manually download dataset from link given
3. Manually unzip dataset. This is done in a subdirectory "UCI HAR Dataset"
4. Enter RStudio and produce run_analysis.R script function, 

with the following steps:

1. Setup the working directory to local github directory for the repo: C:/Users/Victoria/Documents/GitHub/-/Getting-Cleaning-Data-Project
2. Create directory "UCI HAR Dataset/all" and  "UCI HAR Dataset/all/Inertial Signals" 
under the working directory to save the merged files
3. Create file "body_acc_x_all.txt" with the data from train and test

        3.1 Read body_acc_x_train and test files with read.table -> data.frames
        3.2 Add to both data.frames a new column named "type" with the content "train" and "test" respectively, not to loose this information in case it is needed for future use
        3.3 Merge both data.frames with rbind function
        3.4 Save the result in a file with the same name but in subdirectory "/all/Inertial Signals "and finished in _all
        
4. Repeat this process for all files in "/train/Inertial Signals" and "/test/Inertial Signals"
5. Create file "subject_all.txt" with the data from train and test, following the same process explained in 3. This will be the column of the volunteer subjects of the merged train and test features
6. Create "activity_all.txt", merging "y_train.txt" and "y_test.txt", first the train activities features and after the test activities features
7. Produce "X_all.txt"" as a merge and some improvement of "X_train.txt"" and "X_test.txt", by following the next steps:

        7.1 Read "subject_train.txt" and "subject_test.txt"" into data.frames
        7.2 Read "activity_labels.txt" into data.frame act_labels
        7.3 Substitute in y_train and y_test data.frames the numbers of activities by the corresponding names following the data.frame act_labels
        7.4 Read "features.txt" into a data.frame. The second column contains the names of the features (columns) of files "X_train" and "X_test". This will be used to name the columns of X_all.txt
        7.5 Read "X_train.txt" and "X_test.txt" into two data.frames and add two columns in both corresponding to the "subject" and "activity"", from the data.frames just read and transformed. Add another column $type indicating "train" and "test" respectively, to preserve this information in the merge.
        7.6 Merge both data.frames into one X_all, with function rbind() into X_all data.frame
        7.7 Change the classes of columns "activity", "subject" and "type" to as.factor
        7.8 Write the resulting data.frame into file "UCI HAR Dataset/all/X_all.txt". This will be the file to be used for the production of the file asked for.

8. Using the names of the features select only the ones that are means and stds, and create a new data.frame and txt file with only the columns chosen:

        8.1 Use grep() function to choose only the features that include the word "mean" or "std" in vector "param_mean_std", and sort it to get the means and std of the different features closed together. Finally add "subject", "activity" and "type" at the beginning of the vector
        8.2 Get the data.frame of only means and stds of the features by using the function subset() of data.frame X_all, with select equal to vector "param_mean_std". The new data.frame is named "X_all_mean_std"
        8.3 Write this data.frame into the file "UCI HAR Dataset/all/X_all_mean_std.txt"
        
9. For the last part of the project, we need to install library(plyr)
10. Read the "UCI HAR Dataset/all/X_all_mean_std.txt" into data.frame a
11. Add to a a new column of the paste of columns a$subject and a$activity, to simplify the calculation of the means by subject and activity data.frame. this new column is a$subjectActivity of class factor
12. Get the number of different duplet subject/activity as the levels of a$subjectActivity. This will the the number of rows of the requested file, integer v. The number of colums will be the same as in data.frame a
13. Eliminate from data.frame "a"" the columns "subject", "activity" and "type" to be able to use the function lapply of colMeans, after splitting it into a list of data.frames by the a$subjectActivity. 
14. Create DF, an empty data.frame of v rows and ncol(a) columns, to be used to load the values of the means. This has to be done through a matrix and then changing the class to data.frame
15. Split the data.frame a by the a$subjectActivity. The result is a "l" list of data.frames with the data features of each duplet subject/activity
16. Use lapply() over the list "l"the function colMeans (). The result is a list of data.frames with one row containing the means of each feature
17. Populate the data.frame DF with the content of the mean values DF[i,]<-as.vector(r[i][[1]]), being i the row corresponding of each duplet (subject;activity)
18. Assign colnames(DF) with the same names as the colnames(a)
19. Adding back the columns DF$subject and DF$activity and removing columns DF$subjectActivity, this is done undoing the paste done before using functions substr() and sub()
20. Reordering the columns to get the firsts DF$subject and DF$activity
21. Sorting the result DF by DF$subject in ascending order
22. Writing the data.frame DF in "UCI HAR Dataset/all/ X_all_mean_std_means.txt", without row names, the requested file
        
        
        

### Description of the processed dataset

The resulting file "UCI HAR Dataset/all/ X_all_mean_std_means.txt", is a file of 180 rows and 81 columns, $subject, $activity and 179 mean features by subject and activity.

Included the features meanFreq, but not sure if it would have to be removed. Just in case I didn't remove them, but they can be eliminated very easily.

The names of the features haven't been changed except the one with body repeated.

The units of the features on the final file are the same as the ones of the original files, g for acceleration and radiant/second for angular velocity, but they are normalized as the original data

