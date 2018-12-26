#Reference:
#https://drive.google.com/file/d/0B1r70tGT37UxYzhNQWdXS19CN1U/view

library(stringr) #for paste0
library(dplyr) #for group_by

#1. Merge Training and Test Datasets
##set important consts
dataclass <- c("test", "train")
datatype <- c("X", "y", "subject")

##container for the data
datacontainer <- data.frame()

##loops through the created list of consts in order to read the data from the local directory
for(i in dataclass){
  flag <- 1
  datamatrix = data.frame()
  ##loops through different dataclass and right away merges the data into 1 vector + 1 class(train, test)
  for(j in datatype){
    print("Reading Data... ")
    directory <- paste0("./UCI HAR Dataset/", i, "/", j, "_", i, ".txt")
    print(directory)
    res <- read.table(directory)
    if(flag == 1){
      #4a. Appropriately labels the data set with descriptive variable names.
      datanames <- read.table("./UCI HAR Dataset/features.txt")
      colnames(res) <- as.character(datanames[, 2])
      datamatrix <- res
      flag <- 2
    }else{
      colnames(res) <- j
      datamatrix <- cbind(datamatrix, res)
    }
  }
  print("Merging Data... ")
  datacontainer <- rbind(datacontainer, datamatrix)
}

print("...Processing Data (Cleaning)... ")
#2. Extracts only the measurements on the mean and standard deviation for each measurement. + y and subject col
#get column indeces of the data pertaining to mean and standard deviation computation using grep (column-name referenced)
msd.colindeces <- grep("mean|std", names(datacontainer))
msd.colindeces <- c(dim(datacontainer)[2], dim(datacontainer)[2]-1, msd.colindeces)
datacontainer <- datacontainer[, msd.colindeces]

#3. Uses descriptive activity names to name the activities in the data set
#read activity label file
datalabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
datacontainer$y <- datalabels$V2[match(datacontainer$y, datalabels$V1)]

##4b. clean columnnames
#change y to activity
colnames(datacontainer)[2] <- "activity"
#change special characters to R-advised characters
colnames(datacontainer) <- gsub("-", ".", names(datacontainer))
colnames(datacontainer) <- gsub("\\(|\\)", "", names(datacontainer))
#make variable readable for easy referencing
colnames(datacontainer) <- gsub("^f", "freq", names(datacontainer))
colnames(datacontainer) <- gsub("^t", "time", names(datacontainer))
#lower-case column names in order to avoid variable mismatch
colnames(datacontainer) <- tolower(names(datacontainer))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy.data <- datacontainer %>% group_by(subject, activity) %>% summarize_all(funs(mean))

print("...Writing Tidy data to file... ")
#writing result to file
write.table(tidy.data, "./tidyDataSubmission.txt", row.name=FALSE)

print("...Closing file")