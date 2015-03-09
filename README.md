Here is how the script works:

1.Import packages which will be used later on.

2.First focus on the training data set, which includes 5 tables.

3.First of all, I took names of meansurements from "feature" table, and match them with "x_train" table to lable the variables. and then I selected columns with only measurements of mean and standard deviation as the task required.

4.Then, I changed the variable name of "y_train" to "activity_id". I also added a new variable called "activity", and filled its value with names from "activity_lable" table according to "activity_id". 

5.Then, I changed the variable name to "subject" for "subject_train" table to make it easier to understand.

6.At last, I binded the above there tables which I modified ("subject_train","x_train", and "y_train") by columns, and store in a new data.frame called "data_train".

7.Then, I just repeated the same process for testing date set.

8.After I got both training and testing data set, I merged them to creat a data set called "data_all".

9.Then I creates a second tidy data set called "data_tidy" with the average of each variable for each activity and each subject as task required.

10.At last, I creat a txt file for the data_tidy data set using write.table()
