library(plyr)

# Step 1
# Merge the training and test sets to create one data set
###############################################################################

dataFeaturesTrain <- read.table("train/X_train.txt")
dataFeaturesTest <- read.table("test/X_test.txt")

dataActivityTest <- read.table("test/y_test.txt")
dataActivityTrain <- read.table("train/y_train.txt")

subjectTest <- read.table("test/subject_test.txt")
subjectTrain <- read.table("train/subject_train.txt")

dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)
dataActivity <- rbind(dataActivityTrain, dataActivityTest)
dataSubject <- rbind(subjectTrain, subjectTest)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
dataFeatures<- x_data[, mean_and_std_features]

# correct the column names
names(dataFeatures) <- features[mean_and_std_features, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set
###############################################################################

activities <- read.table("activity_labels.txt")

# update values with correct activity names via subnetting
dataActivity[, 1] <- activities[dataActivity[, 1], 2]

# correct column name
names(dataActivity) <- "activity"

# Step 4
# Appropriately label the data set with descriptive variable names
###############################################################################

# correct column name
names(dataSubject) <- "subject"

# bind all the data in a single data set
all_data <- cbind(dataFeatures, dataActivity, dataSubject)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################

# 66 <- 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)