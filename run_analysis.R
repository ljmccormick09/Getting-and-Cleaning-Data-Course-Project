## Course Project-Getting and Cleaning Data

## Read data into R

library(dplyr)

features <- read.table("C:/Users/lisa.mccormick/Documents/Coursera materials/Getting and Cleaning Data/Data_files/UCI HAR Dataset/features.txt", col.names = c("id","feature"))

activities <- read.table("C:/Users/lisa.mccormick/Documents/Coursera materials/Getting and Cleaning Data/Data_files/UCI HAR Dataset/activity_labels.txt", col.names = c("class", "activity"))

x_train <- read.table("C:/Users/lisa.mccormick/Documents/Coursera materials/Getting and Cleaning Data/Data_files/UCI HAR Dataset/train/X_train.txt", col.names = features$feature)

y_train <- read.table("C:/Users/lisa.mccormick/Documents/Coursera materials/Getting and Cleaning Data/Data_files/UCI HAR Dataset/train/y_train.txt", col.names = "class")

subject_train <- read.table("C:/Users/lisa.mccormick/Documents/Coursera materials/Getting and Cleaning Data/Data_files/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

x_test <- read.table("C:/Users/lisa.mccormick/Documents/Coursera materials/Getting and Cleaning Data/Data_files/UCI HAR Dataset/test/X_test.txt", col.names = features$feature)

y_test <- read.table("C:/Users/lisa.mccormick/Documents/Coursera materials/Getting and Cleaning Data/Data_files/UCI HAR Dataset/test/y_test.txt", col.names = "class")

subject_test <- read.table("C:/Users/lisa.mccormick/Documents/Coursera materials/Getting and Cleaning Data/Data_files/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

## Merge training and test sets

X_df <- rbind(x_train, x_test)
Y_df <- rbind(y_train, y_test)
subject_df <- rbind(subject_train, subject_test)
merged_df <- cbind(subject_df, Y_df, X_df)

View(merged_df)


## Only include mean and std dev measurements from dataset


library(dplyr)
mean_std_df <- merged_df %>% 
  select(subject, class, contains("mean"), contains("std"), contains("Mean"))


## Uses descriptive activity names to name the activities in the data set


list <- activities[,2]

mean_std_df$class[mean_std_df$class == '1'] <- list[1]
mean_std_df$class[mean_std_df$class == '2'] <- list[2]
mean_std_df$class[mean_std_df$class == '3'] <- list[3]
mean_std_df$class[mean_std_df$class == '4'] <- list[4]
mean_std_df$class[mean_std_df$class == '5'] <- list[5]
mean_std_df$class[mean_std_df$class == '6'] <- list[6]



## Label the data set with descriptive variable names


library(dplyr)
library(stringr)

names(mean_std_df)[2] = "activity"
names(mean_std_df)<-gsub("Freq", "Frequency", names(mean_std_df))
names(mean_std_df)<-gsub("tBody", "TimeBody", names(mean_std_df))
names(mean_std_df)<-gsub("BodyBody", "Body", names(mean_std_df))
names(mean_std_df)<-gsub("fBody", "FrequencyBody", names(mean_std_df))
names(mean_std_df)<-gsub("tGravity", "TimeGravity", names(mean_std_df))
names(mean_std_df)<-gsub("Acc", "Accelerometer", names(mean_std_df))
names(mean_std_df)<-gsub("Gyro", "Gyroscope", names(mean_std_df))
names(mean_std_df)<-gsub("Mag", "Magnitude", names(mean_std_df))
names(mean_std_df)<-gsub("std", "StDev", names(mean_std_df))

Tidydata <- mean_std_df

View(Tidydata)


## Create second tidy dataset with average of each variable for each activity and each subject.


library(dplyr)

Tidydata2 <- Tidydata %>% 
  group_by(subject, activity) %>%
  summarize_all(funs(mean))

View(Tidydata2)

write.table(Tidydata2, "Tidydata2.txt", row.name=FALSE)
