## Course Project
* The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

### This repo contains 3 other files
* summarized_data_txt
* Codebook.md
* run_analysis.R

### How the data was processed:
* downloading the data and unzip 	
	* source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	* the zip file should unzip nicely into a "UCI HAR Dataset" folder
* reading the files and storing them into data frames
* bindings and mergings were then done to put the test and training sets into one data frame	
	* required library(dplyr)
	* 561 columns were named by features.txt
	* 3 columns were binded, {subject, activity, mode}
	* data frame test_train has all the required data in one
* reshaped into the required format
	* required library(reshape2)
	* 180 observations of averages (30 subjects and 6 activities each)
	* summarized_data.txt was written out from ttData which is the final of reshaped data frame.
