## As part of course work: Summarized data from Samsung data

## The summarized_data.txt was derived from RStudio following the steps below:

### downloading the data and unzip 	
	* source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	* the zip file should unzip nicely into a "UCI HAR Dataset" folder
### reading the files and storing them into data frames
### bindings and mergings were then done to put the test and training sets into one data frame	
	* required library(dplyr)
	* 561 columns were named by features.txt
	* 3 columns were binded, {subject, activity, mode}
	* data frame test_train has all the required data in one
### reshaped into the required format
	* required library(reshape2)
	* 180 observations of averages (30 subjects and 6 activities each)
	* summarized_data.txt was written out from ttData which is the final of reshaped data frame.

## Code book on variables
* subject 	- there were 30 subjects, using numbers 1 to 30 to name them
* activity 	- there were 6 activities {WALKING,
 WALKING_UPSTAIRS,
 WALKING_DOWNSTAIRS
, SITTING,
 STANDING
, LAYING
}
* mode		- identifies subject were classified under "test" or "train" where 70% of subjects were in train and 30% were in test
* the rest of the column names were taken from features.txt, kindly refer to features_info.txt for more details.