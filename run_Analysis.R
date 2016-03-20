run_Analysis <- function(directory){
  setwd(directory)
  # read lables for tables
    activity_labels <- read.table("activity_labels.txt")
    features <- read.table("features.txt")
    
  # read test data tables
    subject_test <- read.table("./test/subject_test.txt")
    X_test <- read.table("./test/X_test.txt", row.names=NULL)
    y_test <- read.table("./test/y_test.txt")
  
  # read train data tables
    subject_train <- read.table("./train/subject_train.txt")
    X_train <- read.table("./train/X_train.txt",row.names=NULL)
    y_train <- read.table("./train/y_train.txt")  
  
  # set column names
  names(X_test) <- features[,2]
  names(X_train) <- features[,2]  
  
  # create vector with descriptive activity names
  activity_labels$V2 <- as.character(activity_labels$V2)
  test_activity <- c()
  train_activity <- c()
  
  for(i in 1:nrow(y_test)){    
    for (j in 1:6){        
      if (y_test[i,1]==activity_labels[j,1]) {
        test_activity[i] <- activity_labels[j,2]            
      }
    }
  }
  
  for(i in 1:nrow(y_train)){    
    for (j in 1:6){        
      if (y_train[i,1]==activity_labels[j,1]) {
        train_activity[i] <- activity_labels[j,2]            
      }
    }
  }
  
  #add descriptive activity vector to datasets
  X_test$activity <- test_activity
  X_train$activity <- train_activity
  
  # add subject to datasets  
  X_test$subject <- subject_test[,1]
  X_train$subject <- subject_train[,1]
  
  #remove dublicated columns  
  X_test_unique <- X_test[, !duplicated(colnames(X_test))]
  X_train_unique <- X_train[, !duplicated(colnames(X_train))]
  
  #prepare rownames for binding datasets
  test_rows <- as.character(c(7353:10299))
  X_test_unique$row <- test_rows
  rownames(X_test_unique) <- X_test_unique$row
  X_test_unique <- X_test_unique[,1:479]
  
  #bind train & test datasets together
  X_all <- rbind(X_test_unique, X_train_unique)
  
  #extract only the measurements on the mean and standard deviation and subject & activity columns
  measurements <- grep("(*mean*)|(*std*)|(subject)|(activity)", names(X_all))
  X_all_filtered <- X_all[, measurements]
  
  #tidy the dataset
    # set all colnames lower case    
    X_all_filtered$activity <- tolower(X_all_filtered$activity)
  
  # transform the dataset so that column headers are variable names
    library(tidyr)
    x_all_filtered_tidy <- gather(X_all_filtered, measurement, value, -activity, -subject)
    x_all_filtered_tidy <- separate(x_all_filtered_tidy, col=measurement, into=c("measurement", "direction"), sep="\\(\\)")
    x_all_filtered_tidy <- separate(x_all_filtered_tidy, col=measurement, into=c("measurement", "calculation"), sep="\\-")
  
  #remove hyphen from direction column
  x_all_filtered_tidy$direction <- sub("\\-", "", x_all_filtered_tidy$direction )
  
  # assign to global environment
  X_all <<- x_all_filtered_tidy
  
  #creates a second tidy data set with the average of each variable for each activity and each subject
  library(dplyr)
  x_all_grouped <- group_by(x_all_filtered_tidy, activity, subject, measurement, calculation, direction)
  X_all_mean <<- summarize(x_all_grouped, meanvalue=mean(value))
  
  rm(X_all, X_all_filtered, X_test, X_test_unique, X_train, X_train_unique, activity_labels, features, subject_test, subject_train, y_test, y_train)
}