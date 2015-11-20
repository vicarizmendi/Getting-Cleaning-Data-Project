run_analysis <- function(){

## vicarizmendi owner: Coursera Getting and Cleaning Data Course Project Script 
        
# You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each 
# measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

        
## Setup working directory under local github directory. It is assumed that the
## raw dataset has been downloaded and unzipped already

setwd("C:/Users/Victoria/Documents/GitHub/-/Getting-Cleaning-Data-Project")

## 1.Merges the training and the test sets to create one data set
        ## adding a new column "type" to indicate if data comes from trining or 
        ## from testing original datasets
        ## This has to be repeated for all files in "Inertial signals"
        ## Now the number of rows in all will be 7352 + 2947 = 10299


## create directory "UCI HAR Dataset/all" and  "UCI HAR Dataset/all/Inertial Signals"
## under the working directory to save the merged files
        
        mainDir <- "UCI HAR Dataset/all"
        subDir <- "UCI HAR Dataset/all/Inertial Signals"
        
        if (!(file.exists(mainDir))){
                dir.create(file.path(mainDir))
                dir.create(file.path(subDir))
        } 

                
## create file "body_acc_x_all.txt" with the data from train and test
        
        body_acc_x_train <-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt") 
        body_acc_x_test <-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
        body_acc_x_train$type<-"train"
        body_acc_x_test$type<-"test"
        body_acc_x_all <- rbind(body_acc_x_train,body_acc_x_test)
        
        write.table( body_acc_x_all,"UCI HAR Dataset/all/Inertial Signals/body_acc_x_all.txt")
        

## create file "body_acc_y_all.txt" with the data from train and test
        
        body_acc_y_train <-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt") 
        body_acc_y_test <-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
        body_acc_y_train$type<-"train"
        body_acc_y_test$type<-"test"
        body_acc_y_all <- rbind(body_acc_y_train,body_acc_y_test)
        write.table( body_acc_y_all,"UCI HAR Dataset/all/Inertial Signals/body_acc_y_all.txt")        

        
## create file "body_acc_z_all.txt" with the data from train and test
        
        body_acc_z_train <-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt") 
        body_acc_z_test <-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
        body_acc_z_train$type<-"train"
        body_acc_z_test$type<-"test"
        body_acc_z_all <- rbind(body_acc_z_train,body_acc_z_test)
        write.table( body_acc_z_all,"UCI HAR Dataset/all/Inertial Signals/body_acc_z_all.txt")  

        
## create file "body_giro_x_all.txt" with the data from train and test
                
        body_gyro_x_train <-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt") 
        body_gyro_x_test <-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
        body_gyro_x_train$type<-"train"
        body_gyro_x_test$type<-"test"
        body_gyro_x_all <- rbind(body_gyro_x_train,body_gyro_x_test)
        write.table( body_gyro_x_all,"UCI HAR Dataset/all/Inertial Signals/body_gyro_x_all.txt")
        

## create file "body_giro_y_all.txt" with the data from train and test
        
        body_gyro_y_train <-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt") 
        body_gyro_y_test <-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
        body_gyro_y_train$type<-"train"
        body_gyro_y_test$type<-"test"
        body_gyro_y_all <- rbind(body_gyro_y_train,body_gyro_y_test)
        write.table( body_gyro_y_all,"UCI HAR Dataset/all/Inertial Signals/body_gyro_y_all.txt")        
        
        
## create file "body_giro_z_all.txt" with the data from train and test        
        
        body_gyro_z_train <-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt") 
        body_gyro_z_test <-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
        body_gyro_z_train$type<-"train"
        body_gyro_z_test$type<-"test"
        body_gyro_z_all <- rbind(body_gyro_z_train,body_gyro_z_test)
        write.table( body_gyro_z_all,"UCI HAR Dataset/all/Inertial Signals/body_gyro_z_all.txt")  

        
## create file "total_acc_x_all.txt" with the data from train and test                 
        
        total_acc_x_train <-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt") 
        total_acc_x_test <-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
        total_acc_x_train$type<-"train"
        total_acc_x_test$type<-"test"
        total_acc_x_all <- rbind(total_acc_x_train,total_acc_x_test)
        write.table( total_acc_x_all,"UCI HAR Dataset/all/Inertial Signals/total_acc_x_all.txt")
        
        
## create file "total_acc_y_all.txt" with the data from train and test                 
        
        total_acc_y_train <-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt") 
        total_acc_y_test <-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
        total_acc_y_train$type<-"train"
        total_acc_y_test$type<-"test"
        total_acc_y_all <- rbind(total_acc_y_train,total_acc_y_test)
        write.table( total_acc_y_all,"UCI HAR Dataset/all/Inertial Signals/total_acc_y_all.txt")        
        
        
## create file "total_acc_z_all.txt" with the data from train and test
        
        total_acc_z_train <-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt") 
        total_acc_z_test <-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
        total_acc_z_train$type<-"train"
        total_acc_z_test$type<-"test"
        total_acc_z_all <- rbind(total_acc_z_train,total_acc_z_test)
        write.table( total_acc_z_all,"UCI HAR Dataset/all/Inertial Signals/total_acc_z_all.txt")  
        
        
        
## create file "subject_all.txt" with the data from train and test        
        
        subject_train <-read.table("UCI HAR Dataset/train/subject_train.txt") 
        subject_test <-read.table("UCI HAR Dataset/test/subject_test.txt")
        subject_train$type<-"train"
        subject_test$type<-"test"
        subject_all <- rbind(subject_train, subject_test)
        write.table(subject_all$V1,"UCI HAR Dataset/all/subject_all.txt",row.names = FALSE,
                    col.names = FALSE)  
        
## create "activity_all.txt", first the train activities features and after the
## test activities features        
        y_train <-read.table("UCI HAR Dataset/train/y_train.txt")
        y_test <-read.table("UCI HAR Dataset/test/y_test.txt")
        y_all<- rbind(y_train, y_test)
        write.table(y_all,"UCI HAR Dataset/all/activity_all.txt",row.names = FALSE,
                    col.names = FALSE)
        
         
## Produce file "X_all.txt" merging data from "X_train.txt" and "X_test.txt"
  
        ## subjects for training and subjects for testing
        subject_train<- (read.table("UCI HAR Dataset/train/subject_train.txt"))
        subject_test<- (read.table("UCI HAR Dataset/test/subject_test.txt"))

        ## act_labels give the names of the activities correponding to 1:6
        act_labels<- read.table("UCI HAR Dataset/activity_labels.txt")

        
        ## substitute the numbers 1:6 by the names of the activities in y_train
        ## y_train indicates per individual observation the kind of training 1:6
        y_train$activity<-""
        for (i in 1:nrow(y_train)) {
                n<-y_train$V1[i]
                y_train$activity[i]<-as.character(act_labels[n,2])
        }
        y_train<- subset(y_train,select=-V1)

        
        ## substitute the numbers 1:6 by the names of the activities in y_test
        ## y_test indicates per individual observation the kind of training 1:6
        y_test$activity<-""
        for (i in 1:nrow(y_test)) {
                n<-y_test$V1[i]
                y_test$activity[i]<-as.character(act_labels[n,2])
        }
        y_test<- subset(y_test,select=-V1)

        
        ## these are the names of the columns (features) of the X_train and X_test
        features <- read.table("UCI HAR Dataset/features.txt",colClasses = "character",encoding=" UTF-8")
        ## encoding can be bad!!!!

        
        
        ## X_train is the data.frame with the features of all train individuals
        ## the names of the columns are taken from the file features.txt
        X_train <- read.table("UCI HAR Dataset/train/X_train.txt",
                      col.names=features[,2],check.names=TRUE)
        
        ## include the activity of each individual set of measures and estimated
        ## variables in a new column named activity, taken from y_train. It is 
        ## assumed that the order has been respected
        X_train$activity<-y_train$activity

        ## include the subject of the activity in the measures x_train data frame,
        ## in a new column named subject, taken from subject_train
        X_train$subject <-subject_train$V1

        ## include a new column indicating if the observation is from the train 
        ## or from the test, in this case "train"
        X_train$type<-"train"

                
        ## x_test is the data.frame with the features of all test individuals
        ## the names of the columns are taken from the file features.txt
        X_test <- read.table("UCI HAR Dataset/test/X_test.txt",
                             col.names=features[,2])
        
        ## include the activity of each individual set of measures and estimated
        ## variables in a new column named activity, taken from y_test. It is 
        ## assumed that the order has been respected
        X_test$activity<-y_test$activity
        
        ## include the subject of the activity in the measures x_train data frame,
        ## in a new column named subject, taken from subject_test        
        X_test$subject <-subject_test$V1
        
        ## include a new column indicating if the observation is from the train 
        ## or from the test, in this case "test"
        X_test$type<-"test"

## combine X_train and X_test together and save it in a file named x_all.txt,
## changing the class of type, activity and subjevt to factor        

        X_all <- rbind(X_train, X_test)
        X_all$type<- as.factor(X_all$type)
        X_all$activity <- as.factor(X_all$activity)
        X_all$subject <- as.factor(X_all$subject)
        write.table(X_all,"UCI HAR Dataset/all/ X_all.txt")

                
### 2.Extracts only the measurements on the mean and standard deviation for 
### each measurement.         
        
        ## using the names of the features select only the means and stds, the
        ## vector param_mean_std will have the names of the columns to be included
        param<- names(X_all)
        write.table(param,"UCI HAR Dataset/all/ param.txt",row.names = FALSE,
                    col.names = FALSE) ## this is not needed
        param_mean<- grep("mean",param,value=TRUE)
        param_std<- grep("std",param,value=TRUE)
        param_mean_std<-c(param_mean,param_std)
        
        ## sort the names to get the means and stds close together
        param_mean_std<-sort(param_mean_std)
        
        ## Include the new columns at the beginning of the data.frame
        param_mean_std<-c("subject","activity","type",param_mean_std)


        ## select only columns containing mean or std and create X_all_mean_std
        X_all_mean_std<-subset(X_all,select=param_mean_std)
        write.table(param_mean_std,"UCI HAR Dataset/all/ param_mean_std.txt",
                    row.names = FALSE,col.names = FALSE) ## this is not needed
        write.table(X_all_mean_std,"UCI HAR Dataset/all/ X_all_mean_std.txt")

        ## this is only to ckeck
        read.table("UCI HAR Dataset/all/ X_all_mean_std.txt",nrows=3)

### 3.Uses descriptive activity names to name the activities in the data set,
### Already done using activity labels file and y_train and y_test files

        
                
### 4. Appropriately labels the data set with descriptive variable names.
### Already done by reading the file features and using it for naming the 
### columns when reading X_train.txt and X_test.txt
### some more cleaning is needed
        

### 5. From the data set in step 4, creates a second, independent tidy data set 
### with the average of each variable for each activity and each subject.

## libraries needed
library(plyr)

##  load the complete dataset generated with means and stds into a data.frame           
a<- read.table("UCI HAR Dataset/all/ X_all_mean_std.txt")

## Create a new column with the combination of the variables subject and activity
## to facilitate the calculation of the means by subject and activity

a$subjectActivity<-as.factor(paste(as.character(a$subject),as.character(a$activity)))


## Create a new data.frame with the columns to be removed from a - this could not
## be used afterwards

        mtx<-matrix("",ncol=3,nrow=nrow(a))
        b<-as.data.frame(mtx)
        colnames(b)<-c("subjectActivity","subject","activity")
        b$subjectActivity<-as.factor(a$subjectActivity)
        b$subject<-as.factor(a$subject)
        b$activity<-as.factor(a$activity)

## g will be the factor vector (subject/activity) for the split
## v, the levels of subject/activity will be the number of rows of the new
## data.frame with the results of the means
        
        g<-a$subjectActivity
        v<-levels(a$subjectActivity)
        
        
## Elimination from a data.frame of column type, and temporarily activity and 
## subject in order to use lapply with function colmeans(). All columns have 
## to be numeric
        
        a<-a[-grep("type",colnames(a))]
        a<-a[-grep("activity",colnames(a))]
        a<-a[-grep("subject",colnames(a))]
        

## Create a new data.frame DF to be used to collect the means of the features
## by subject and activity. the number of rows (180) of the new data.frame is equal 
## to the length of the factor subject/activity v<-levels(a$subjectActivity), 
## and the number of columns is the number of columns (79) of data.frame a, the 
## features    

        m<-matrix(0,ncol=ncol(a),nrow=length(v))
        DF<-as.data.frame(m)

## Using split(), lapply() and colMeans() we get every mean of each of the 79
## features and load it into the new data.frame DF
        
        
        l<-split(a,g)
        r<-lapply(l,colMeans)
        for (i in 1:length(v)) {
                
                DF[i,]<-as.vector(r[i][[1]])
        }

## Give names to all columns, the same as the ones in original data.frame a
                
        colnames(DF)<-colnames(a)

## Clean a bit the names of the features, eliminating the repeated Body and (X)...               
        
        colnames(DF)<-sub("BodyBody","Body", colnames(DF))
        
        zz<-colnames(DF)
        
        for (i in (1:length(zz))) {
                
                ncr<-nchar(zz[i])
                lst<- substr(zz[i],ncr,ncr)
                if (lst=="X"|lst=="Y"|lst=="Z") {
                        zz[i]<-paste(substr(zz[i],1,(ncr-4)),"(",lst,")",sep = "")
                }  
                else {
                        zz[i]<-substr(zz[i],1,(ncr-2))
                }
        }
        
        colnames(DF) <- zz
        
        
## Adding back the columns subject and activity and removing column subjectActivity,
## this is done undoing the paste done before using functions substr() and sub()
        
        DF$subjectActivity<-as.factor(v)
        DF$subject<-as.factor(substr(DF$subjectActivity,1,2))
        DF$subject <- as.factor(sub(" ","", DF$subject))
        DF$activity<-as.factor(substr(DF$subjectActivity,3,25))
        DF$activity <- as.factor(sub(" ","", DF$activity))
        DF$subjectActivity<-NULL
        
## reordering the columns, to get first "subject" and "activity" and then the
## rest of parameter means
        
        ## DF<-DF[c(80,81,1:79)]
        DF<-DF[c((ncol(DF)-1),ncol(DF),1:(ncol(DF)-2))]

## Sorting the result by subject in ascending order

        DF$subject<-as.integer(DF$subject)        
        DF<-arrange(DF,DF$subject)
        
## Save the result in file "UCI HAR Dataset/all/ X_all_mean_std_means.txt"       

        write.table(DF,"UCI HAR Dataset/all/ X_all_mean_std_means.txt",
                    row.names = FALSE)
       
}        
        


