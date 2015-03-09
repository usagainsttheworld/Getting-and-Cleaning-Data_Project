# Getting-and-Cleaning-Data_Project

Here is how the script works:
1.Import packages which will be used later on.

2.First focus on the training data set, which includes 5 tables.

3.first of all, I took names of meansurements from "feature" table, and match them with "x_train" table to lable the variables. and then I selected columns with only measurements of mean and standard deviation as the task required.

4.Then, I used the information from "activity_lable" table and added a new column called "activity" to "y_train" table, also changed the first column of "y_train" lable as "activity_id".

5.Change the variable name to "subject" for "subject_train" table.

6.Bind there tables ("subject_train","x_train", and "y_train") by columns, and store in a new data.frame called "data_train".

7.Repeat the same process for testing date set.

8.Merge the training and testing data sets to creat a data set called "data_all".

9.Creates a second, independent tidy data set called "data_tidy" with the average of each variable for each activity and each subject.

10.Creat a txt file for the data_tidy data set.