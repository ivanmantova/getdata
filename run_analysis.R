#######################################################
# Peer Review assignment for Getting and Cleaning Data
# -----------------------------------------------------
# Set the working directory where the data is located
# and run this script. It will create two tidy data
# files according to the description in README.md.
#######################################################

# setwd("C:\path\to\data")

# Load dependency
library(reshape)

#######################################################
# Part 1: Cleanse and save the resulting tidy data
#######################################################

# Function reused throughout the script
read_merge_datasets <- function (table1, table2, cols = NA) {
  # read subject column in to vector
  tab1 <- read.table(table1)
  tab2 <- read.table(table2)
  ds <- rbind(tab1, tab2)
  
  if (!is.na(cols)) {
    colnames(ds) <- cols
  }

  ds
}

# Load subject data set
subject <- read_merge_datasets("test/subject_test.txt"
                              , "train/subject_train.txt"
                              , c("subject"))
subject$subject <- as.factor(subject$subject)

# Load activities data set
act_y <- read_merge_datasets("test/y_test.txt"
                            , "train/y_train.txt"
                            , c("activity"))

act_labels <- read.table("activity_labels.txt")
colnames(act_labels) <- c("code", "label")

act_y$activity <- factor(act_y$activity, labels = act_labels$label)

# Load variables data set
act_x <- read_merge_datasets("test/X_test.txt"
                             ,"train/X_train.txt")

features <- read.table("features.txt")
colnames(features) <- c("code", "feature")

names(act_x) <- features$feature

df <- cbind(subject, act_y, act_x)

# Get columns requested for the assignment
cols_mean <- grep("mean", x=names(df), ignore.case=TRUE)
cols_std <- grep("std", x=names(df), ignore.case=TRUE)
cols_final <- c(1, 2, cols_mean, cols_std)
tidy <- df[,cols_final]

# Write data set to CSV
write.csv(tidy
          ,file= "part-1-tidy.csv"
          ,quote = TRUE
          ,row.names = FALSE)

#######################################################
# Part 2: Take the mean of each variable
#######################################################
molten <- melt(tidy, id.vars = c("subject", "activity"))
df_mean <- cast(molten, ... ~ variable, mean)

# Write data set to CSV
write.csv(df_mean
         ,file= "part-2-tidy.csv"
         ,quote = TRUE
         ,row.names = FALSE)
