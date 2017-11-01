library (dplyr)
 
# Read the train files

x_train <- read.table("/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("/UCI HAR Dataset/train/Y_train.txt")
sub_train <- read.table("/UCI HAR Dataset/train/subject_train.txt")

# Read the test files

x_test <- read.table("/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("/UCI HAR Dataset/test/Y_test.txt")
sub_test <- read.table("/UCI HAR Dataset/test/subject_test.txt")

# Read the activity labels

act <- read.table("/UCI HAR Dataset/activity_labels.txt")

# Read the features

feat <- read.table("/UCI HAR Dataset/features.txt")

# Merge the training set and test ser

x_tot <- rbind(x_test,x_train)
y_tot <- rbind(y_test,y_train)
sub_tot <- rbind(sub_test,sub_train)


# Update the column names with feature names

colnames(x_tot) <- feat[,2]

str(x_tot)

# Extract measurements on basis of mean and standard deviation

col <- grepl("mean",colnames(x_tot)) | grepl("std",colnames(x_tot))

# populating where logical vector is True

x_stdmean <- x_tot[,col]

# Updating the activity list

y_new <- merge(y_tot,act)

y_new$Activity <- y_new[,2]

y_activity <- y_new[,-2]

# Adding X_stdmean and y_activity

x_stdmeanf <- cbind(y_activity,x_stdmean)

str(x_stdmeanf)

# rename column 1 to Subject

colnames(x_stdmeanf)[1] <- "subject"

# Creating Tidy Data

Total <- cbind(x_stdmeanf, sub_tot)
Total_mean <- x_stdmeanf %>% group_by(Activity, subject) %>% summarize_all(funs(mean))
write.table(Total_mean, file = "/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)