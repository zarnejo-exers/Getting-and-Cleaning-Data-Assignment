## run_analysis Codebook

### Setup

Given a raw UCI HAR Dataset, this R program tidies the dataset in preparation for better and deeper analysis work.

### Raw data
UCI HAR Dataset contains the following:
* A training dataset with 2947 observations
* A testing dataset with 7352 observations 

each dataset contains the following variables:
* 561 different body movement descriptive feature
* 1 activity label (specifies the kind of movement)
* 1 subject (pertaining to specific human volunteer)

```
Note:
The dataset was reduced to only 79 feature variables + 1 activity label + 1 subject since the project only requires measurement derived with mean and standard deviation.
```

### Variables
* dataclass
	* contains the 2 different kinds of data[subset]
	* chr [1:2] "test" "train"
* datatype
	* contains the 3 major feature variables 
	* chr [1:3] "X" "y" "subject"
* flag
	* just a flag used to assist in inserting on empty dataframe
	* num 2
* datamatrix
	* contains the dataset from a file
	* 'data.frame':	7352 obs. of  563 variables:
	* initial column headers as read from the file
		* angle(tBodyAccJerkMean),gravityMean)
		* angle(tBodyAccMean,gravity)
		* angle(tBodyGyroJerkMean,gravityMean)
		* angle(tBodyGyroMean,gravityMean)
		* angle(X,gravityMean)
		* angle(Y,gravityMean)
		* angle(Z,gravityMean)
		* ...
		* y
* i <and> j
	* looping variable (contains actual value of the char list defined by dataclass and dataype var)
	* chr
* datanames
	* actual column names of the 561 features (needed since after reading the file, the column names are just identified as V1, V2, ... Vn)
	* 'data.frame':	561 obs. of  2 variables:
 		* V1: int  - index
 		* $ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",.. - feature names
* datacontainer
	* contains the merged training and testing dataset
	* 'data.frame':	10299 obs. of  81 variables:
 		* subject                         : int  
 		* activity                        : Factor w/ 6 levels "LAYING","SITTING",..
 		* timebodyacc.mean.x              : num 
 		* timebodyacc.mean.y              : num 
 		* timebodyacc.mean.z              : num 
 		* ... 
 		* freqbodybodygyrojerkmag.meanfreq: num 
* msd.colindeces
	* mean standard diviation, column indeces
	* identifies columns pertaining to mean and standard deviation feature computations
	* a total of 79 columns + 1 subject column and 1 activity column
	* num [1:81] 
* tidy.data
	* container for the final tidy data
	* Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	180 obs. of  81 variables


### Cleaning/Transformations
* To ensure readable columnnames the following are done:
	* remove all ()
	* changed - to .
	* expand all starting t to time
	* expand all startin f to freq (to identify frequency)
	* change column with "y" header to "activity"
* To ensure one observation per row and one variable per column
	* performed group_by on subject first then activity
