---
title: "CodeBook.md"
author: "vicarizmendi"
date: "3 de noviembre de 2015"
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

### Description of the processed dataset

I created new directories "UCI HAR Dataset/all" and  "UCI HAR Dataset/all/Inertial Signals" to save all merged files. All the files in "UCI HAR Dataset/train", "UCI HAR Dataset/train/Inertial Signals" and "UCI HAR Dataset/test", "UCI HAR Dataset/test/Inertial Signals" have been merged and a new column is included in all of them $type, to preserve the origin of the data "train" or "test", just in case we need to use this info in the future.


The resulting file "UCI HAR Dataset/all/ X_all_mean_std_means.txt", is a file of 180 rows and 81 columns, $subject, $activity and 179 mean features by subject and activity.

Included the features with meanFreq, but not sure if they would have to be removed. Just in case I didn't remove them, but they can be eliminated very easily, by assigning NULL to each colum with meanFreq in the data.frame.

The names of the features haven't been changed except the one with body repeated, and the ...X by (X), ...Y by (Y), ...Z by (Y) as I consider the names quite "self_explained". I removed also extra ..

The units of the features on the final file are the same as the ones of the original files, g for acceleration and radiant/second for angular velocity, but they are normalized as the original data 

