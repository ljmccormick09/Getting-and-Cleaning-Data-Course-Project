# Code Book

# About the source data

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



# Run the R script

You will need to download the data and save it in your working directory before running the script.

The script called run_analysis.R does the following steps according to the assignment directions:

1.Reads the dataset into R.
  Assign each data table a variable name and make sure the correct column headers are used for each type of data.

2.Merges the training and the test sets into one data set
  First merge the activity datasets into one table.
  Then merge the subject datasets into one table.
  Then merge the two datasets together to include the activity and subject data.

3.Only includes mean and std dev measurements from dataset
  Only select columns that measure mean or standard deviation data.

4.Uses descriptive activity names to name the activities in the data set
  Make a list of activities from the activities table, and replace the class codes with the names of the activities.

5.Labels the data set with descriptive variable names:
  Replaces the abbreviations with whole words to be more descriptive column headers.

6.Creates a second tidy dataset with the average of each variable for each activity and each subject.
  Groups the data by subject and activity then computes the mean for each group.
  Writes a text file to the working directory that contains the final tidy dataset.
      
        


