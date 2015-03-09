#Course project for Getting and Cleaning Data

#import packages might be used
library(dplyr)
library(tidyr)
library(reshape2)
#for "x_train" table, lable the variables with appropriate names (names are from "feature" table, and only measurements of mean and standard deviation were extracted) 
features<-read.table("features.txt") [,2]
sub_features<-grep("mean|std",features,value=TRUE)
x_train<-read.table("X_train.txt")
names(x_train)=features
x_train<-x_train[,sub_features]
#for "y_train" table, add column of activity names 
activity_labels<-read.table("activity_labels.txt") [,2]
y_train<-read.table("Y_train.txt")
y_train<-mutate(y_train,activity=activity_labels[y_train[,1]])
colnames(y_train)[1]="activity_id"
#for "subject_train" table, change variable name to "subject"
subject_train<-read.table("subject_train.txt")
colnames(subject_train)[1]="subject"
#bind there tables,"subject_train","x_train","y_train", together by columns, and store in a new data.frame called "data_train"
data_train<-bind_cols(subject_train,y_train, x_train)
############################
#Repeat the process for test data set
#for "x_test" table, lable the variables with appropriate names (names are from "feature" table, and only measurements of mean and standard deviation were extracted) 
features<-read.table("features.txt") [,2]
sub_features<-grep("mean|std",features,value=TRUE)
x_test<-read.table("X_test.txt")
names(x_test)=features
x_test<-x_test[,sub_features]
#for "y_test" table, add column of activity names 
activity_labels<-read.table("activity_labels.txt") [,2]
y_test<-read.table("Y_test.txt")
y_test<-mutate(y_test,activity=activity_labels[y_test[,1]])
colnames(y_test)[1]="activity_id"
#for "subject_test" table, change variable name to "subject"
subject_test<-read.table("subject_test.txt")
colnames(subject_test)[1]="subject"
#bind there tables,"subject_train","x_train","y_train", together by columns, and store in a new data.frame called "data_train"
data_test<-bind_cols(subject_test,y_test, x_test)
########################
#Merge the training and test data sets to creat a data set called "data_all"
data_all<-bind_rows(data_train, data_test)
#Creates a second, independent tidy data set called "data_tidy" with the average of each variable for each activity and each subject
data_tidy<-
        data_all %>%
        group_by(activity,subject) %>%
        summarise_each(funs(mean))
#creat a txt file for the data_tidy data set
write.table(data_tidy,file="result.txt", row.name=FALSE)
