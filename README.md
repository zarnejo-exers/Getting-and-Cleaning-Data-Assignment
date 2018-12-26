# Getting and Cleaning Data Course Project (Assignment Submission)

The purpose of this project is to demonstrate student's ability to collect, work with, and clean a data set. The goal is to be able to prepare tidy data that can be used for later analysis. [coursera assignment description]

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

This repository contains:
* run_analysis.R. 
	* Main program script - It takes as an input a UCI HAR Dataset. The dataset has to to be improved as it is expected to be in its raw-est form. Primary cleaning is done on the column names to improve readability. Cleaning includes removal of () and changing of '-' to '.'. Further cleaning involves expansion of t to time and f to frequency, as well as changin 'y' to 'activity'. Also, to improve quality of data, the observations are group in terms of subject and activity (subject pertaining to person/individual while activity pertaining to body movement). Finally, as the project requires, only the features with mean and standard deviation derivations were considered. The values for each feature were then averaged in order to provide the final tidy data required. 
	* It basically does the following: 
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement.
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names.
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* CodeBook.md
	* guide to understand program variables and method
* README.md
	* guide to run the entire program
* tidyDataSubmission.txt
	* sample program output



### Prerequisites

Must install on your workstation:
```
R Console or RStudio (at least R version 3.5.1)
R package (stringr and dplyr)
```

Must have a copy of UCI HAR Dataset on your working directory. 
``` 
You can get it here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
```

### Execution

Download run_analysis.R and place it on the same directory as with the UCI HAR Dataset

Open your local console (terminal for Mac and Ubuntu users, cmd for Windows user). 
Go to the directory of your UCI HAR Dataset and run_analysis.R

Execute file using the command
```
Rscript run_analysis.R
```

If authorization is requested, re-run using the command
```
sudo Rscript run_analysis.R
```
then give your password (worry not if no * or signs of you writing get shown, that's just how sudo works)

### That's it! 

Just view the resultant output file and there you have it :) 
The result is a tidy dataset version of the raw data after it is submitted to the merging, cleaning, and transforming work specified in the run_analysis.R

## Author
* Zenith O. Arnejo

## Acknowledgements
* to the author of https://drive.google.com/file/d/0B1r70tGT37UxYzhNQWdXS19CN1U/view
* to Lord Jesus for the provisions and encouragements! It's because of Jesus that I got to finish it, Literally :) 



