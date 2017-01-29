
## read libraries
library(data.table)
library(plyr)

## upload data

# training set: 
path <- paste(getwd(), "/data/train/X_train.txt", sep = "")
X_train <- fread(path)

path2 <- paste(getwd(), "/data/train/y_train.txt", sep = "")
Y_train <- fread(path2)

path3 <- paste(getwd(), "/data/train/subject_train.txt", sep = "")
subject_train <- fread(path3)

# test set: 
path4 <- paste(getwd(), "/data/test/X_test.txt", sep = "")
X_test <- fread(path4)

path5 <- paste(getwd(), "/data/test/y_test.txt", sep = "")
Y_test <- fread(path5)

path6 <- paste(getwd(), "/data/test/subject_test.txt", sep = "")
subject_test <- fread(path6)

# features
path7 <- paste(getwd(), "/data/features.txt", sep = "")
features <- fread(path7)

# activity labels
path8 <- paste(getwd(), "/data/activity_labels.txt", sep = "")
activity_labels <- fread(path8)

## merge train and test together
X_data <- rbind(X_train, X_test)
Y_data <- rbind(Y_train, Y_test)
subject <- rbind(subject_train, subject_test)

## select only features with measurements on the mean and standard deviation
features_mean_std <- grep(".*mean.*|.*std.*", features[,V2])
X_data <- as.data.frame(X_data)
X_data <- X_data[,features_mean_std]

## connect activity, subject and variable values for selected variables together
data_all <- cbind(Y_data, subject, X_data)
## assign to all variables meaningful names
names(data_all) <- c("activity", "subject", features[features_mean_std,V2])

## convert activity and subject to factor
data_all$activity <- factor(data_all$activity, levels = activity_labels$V1, labels = activity_labels$V2)
data_all$subject <- as.factor(data_all$subject)

## melt the data so that the variable names are in one variable and in other variable their values
tidy_data <- melt(data_all, id = c("activity", "subject"))

## aggregate the data -> calculate mean of each variable for each activity, subject combination
tidy_data <- dcast(tidy_data, activity + subject ~ variable, mean)

## save the data
write.table(tidy_data, "tidy_data.txt", row.names = FALSE, quote = FALSE)



