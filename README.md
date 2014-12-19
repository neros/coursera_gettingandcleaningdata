#################################################################
###Summary
#################################################################

The script returns a data.table and saves this table to disk according to the specifications of the Getting and Cleaning
Data project course assignment.  The final output is a file called "tidy_output.txt".  A description of the output variables
are discussed in "codebook_for_tidy_output.txt" and for convenience, duplicated below in this readme file.

Input data for this analysis comes from the Samsung activity study:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
Additional detail on the study data parameters may be found at this URL: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

In summary, the Samsung study records acceleration and gyroscopic movement data obtained from a Samsung Galaxy S II device while subjects are requested to perform
various physical activity (such as walking, sitting, standing).  Acceleration and position are thus measured in space and recorded in XYZ coordinates.

For detailed information on the primary data methodology and study design, the interested reader is referred to the URL above.

This analysis examines key features of the Samsung data, specifically identifying mean and standard deviation observations associated with the Samsung spatial measurements.
The analysis output reports the mean values of these key feature measurements, aggregated by-subject and by-activity in the tidy_output.txt file.
This file is space-delimited and adheres to format expectations for tidy data with one observation per row and one variable per column.  
Total data table dimensions are 180 rows by 68 columns.

Specific steps to perform this analysis are completed using the run_analysis.R script, which is further discussed below

#################################################################
###Script: run_analysis.R
#################################################################
The script defines 4 functions:
(1) setup_files() : Retrieves .zip archive, saves to disk and extracts
(2) load_data() : Reads extracted data sets from disk into a named list of data.frames
(3) combine_data() : Combines the individual data.frames of interest into a unified, named, labeled data.frame 
(4) extract_data() : Subsets the combined data.frame with columns of interest and creates a summary table of means
(5) run() : Calls the above functions in their sequential order and writes the summary table to disk

Specific actions performed in detail, by script line number are as follows:
(1) setup_files()
	* Line 21-22: Defines directory names and .zip file
	* Line 23-33: Downloads .zip file using specified URL and extracts to disk
	* Line 36-38: Generates a directory structure from .zip extract folder, from which generates vectors of file names and their associated file path
	* Line 41-43: Generates and returns a list() of filename::pathname pairs

(2) load_data()
	* Line 57-61: Retrieves file names and paths from setup_files() and defines the specific data sets of interest (by file name)
	* Line 66-79: For each data set of interest, data file is read-in using read.table() according to file path obtained via list defined by setup_files()
	* Line 75:    The data.frame read is saved to a name::value list object according to dataset_name::data.frame
	* Line 77-78: Time status report is printed for read-in of dataset
	* Line 81-83: Total load time is reported and returns the dataset_name::data.frame list

(3) combine_data()
	* Line 98-99: Column names for unified dataset are defined (combining subject_id,activity_id and defined values from features dataset and a variable to distinguish training/test data)
	* Line 102-103: The test datasets and rain datasets are respectively combined by column using cbind according to: subject-data + x-data + y-data + custom is_train variable
	* Line 107-108: The respective combined datasets' column names are defined according to the previously created col_name vector
	* Line 111    : The two test and train datasets are merged using rbind
	* Line 114    : Using the activity_id column read from the y-data present in the merged dataset, the labels are associated with the dataset by adding a new activity_label column
	* Line 116    : The combined, named, labelled data.frame is returned.

(4) extract_data()
	* Line 129    : a subset of the combined data.frame is defined to include columns "subject_id","activity_label" and all column titles partially matching "mean()" or "std()"
	* Line 130    : a summary dataset is defined by taking the column-wise mean of all numeric columns and grouping by the columns "subject_id","activity_label"
	* Line 131    : the summary dataset is returned

(5) run()
	* Line 144    : extracted data is obtained from extract_data()
	* Line 147    : to make data more readable, they're rounded to 6 decimal places and saved to a "tidy_data" data.frame
	* Line 145-164: I played around with writing the output text file padded by 31 spaces (max length of longest column name) to make it more readable...Didn't do it, but left in commented-out lines...
	* Line 149    : File "tidy_output.txt" writes out "tidy_data" data.frame to disk using write.table
	* Line 150    : Function completes.

#################################################################
Data Dictionary For: tidy_output.txt
#################################################################

The data file tidy_output.txt defines a space-delimited data table of 180 rows by 68 columns.  

Input data for this analysis comes from the Samsung activity study:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
Additional detail on the study data parameters may be found at this URL: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

In summary, the Samsung study records acceleration and gyroscopic movement data obtained from a Samsung Galaxy S II device while subjects are requested to perform
various physical activity (such as walking, sitting, standing).  Acceleration and position are thus measured in space and recorded in XYZ coordinates.

This study calculates the mean of variables specified in the Human Activity Recognition Using Smartphones study as specified below.

The data dictionary for this table is as follows.

Col	Variable Name					Type 	Values				Units				 				Description
===============================================================================================================
1	subject_id						numeric	0..30				Activity Participant 				ID	A unique ID number corresponding to the subject engaging in the activity measurements
2	activity_label					string	Defined Category:	Activity Category	 				The categories of activities subjects engaged during activity measurement
											LAYING				Catigorical Unit	
											SITTING				Catigorical Unit	
											STANDING			Catigorical Unit	
											WALKING				Catigorical Unit	
											WALKING_UPSTAIRS	Catigorical Unit	
											WALKING_DOWNSTAIRS	Catigorical Unit	
3	1-tBodyAcc-mean()-X				numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAcc-mean()-X" in the Human Activity Recognition Using Smartphones Dataset
4	2-tBodyAcc-mean()-Y				numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAcc-mean()-Y" in the Human Activity Recognition Using Smartphones Dataset
5	3-tBodyAcc-mean()-Z				numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAcc-mean()-Z" in the Human Activity Recognition Using Smartphones Dataset
6	4-tBodyAcc-std()-X				numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAcc-std()-X" in the Human Activity Recognition Using Smartphones Dataset
7	5-tBodyAcc-std()-Y				numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAcc-std()-Y" in the Human Activity Recognition Using Smartphones Dataset
8	6-tBodyAcc-std()-Z				numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAcc-std()-Z" in the Human Activity Recognition Using Smartphones Dataset
9	41-tGravityAcc-mean()-X			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tGravityAcc-mean()-X" in the Human Activity Recognition Using Smartphones Dataset
10	42-tGravityAcc-mean()-Y			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tGravityAcc-mean()-Y" in the Human Activity Recognition Using Smartphones Dataset
11	43-tGravityAcc-mean()-Z			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tGravityAcc-mean()-Z" in the Human Activity Recognition Using Smartphones Dataset
12	44-tGravityAcc-std()-X			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tGravityAcc-std()-X" in the Human Activity Recognition Using Smartphones Dataset
13	45-tGravityAcc-std()-Y			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tGravityAcc-std()-Y" in the Human Activity Recognition Using Smartphones Dataset
14	46-tGravityAcc-std()-Z			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tGravityAcc-std()-Z" in the Human Activity Recognition Using Smartphones Dataset
15	81-tBodyAccJerk-mean()-X		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAccJerk-mean()-X" in the Human Activity Recognition Using Smartphones Dataset
16	82-tBodyAccJerk-mean()-Y		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAccJerk-mean()-Y" in the Human Activity Recognition Using Smartphones Dataset
17	83-tBodyAccJerk-mean()-Z		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAccJerk-mean()-Z" in the Human Activity Recognition Using Smartphones Dataset
18	84-tBodyAccJerk-std()-X			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAccJerk-std()-X" in the Human Activity Recognition Using Smartphones Dataset
19	85-tBodyAccJerk-std()-Y			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAccJerk-std()-Y" in the Human Activity Recognition Using Smartphones Dataset
20	86-tBodyAccJerk-std()-Z			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAccJerk-std()-Z" in the Human Activity Recognition Using Smartphones Dataset
21	121-tBodyGyro-mean()-X			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyro-mean()-X" in the Human Activity Recognition Using Smartphones Dataset
22	122-tBodyGyro-mean()-Y			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyro-mean()-Y" in the Human Activity Recognition Using Smartphones Dataset
23	123-tBodyGyro-mean()-Z			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyro-mean()-Z" in the Human Activity Recognition Using Smartphones Dataset
24	124-tBodyGyro-std()-X			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyro-std()-X" in the Human Activity Recognition Using Smartphones Dataset
25	125-tBodyGyro-std()-Y			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyro-std()-Y" in the Human Activity Recognition Using Smartphones Dataset
26	126-tBodyGyro-std()-Z			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyro-std()-Z" in the Human Activity Recognition Using Smartphones Dataset
27	161-tBodyGyroJerk-mean()-X		numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyroJerk-mean()-X" in the Human Activity Recognition Using Smartphones Dataset
28	162-tBodyGyroJerk-mean()-Y		numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyroJerk-mean()-Y" in the Human Activity Recognition Using Smartphones Dataset
29	163-tBodyGyroJerk-mean()-Z		numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyroJerk-mean()-Z" in the Human Activity Recognition Using Smartphones Dataset
30	164-tBodyGyroJerk-std()-X		numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyroJerk-std()-X" in the Human Activity Recognition Using Smartphones Dataset
31	165-tBodyGyroJerk-std()-Y		numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyroJerk-std()-Y" in the Human Activity Recognition Using Smartphones Dataset
32	166-tBodyGyroJerk-std()-Z		numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyroJerk-std()-Z" in the Human Activity Recognition Using Smartphones Dataset
33	201-tBodyAccMag-mean()			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAccMag-mean()" in the Human Activity Recognition Using Smartphones Dataset
34	202-tBodyAccMag-std()			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAccMag-std()" in the Human Activity Recognition Using Smartphones Dataset
35	214-tGravityAccMag-mean()		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tGravityAccMag-mean()" in the Human Activity Recognition Using Smartphones Dataset
36	215-tGravityAccMag-std()		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tGravityAccMag-std()" in the Human Activity Recognition Using Smartphones Dataset
37	227-tBodyAccJerkMag-mean()		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAccJerkMag-mean()" in the Human Activity Recognition Using Smartphones Dataset
38	228-tBodyAccJerkMag-std()		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "tBodyAccJerkMag-std()" in the Human Activity Recognition Using Smartphones Dataset
39	240-tBodyGyroMag-mean()			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyroMag-mean()" in the Human Activity Recognition Using Smartphones Dataset
40	241-tBodyGyroMag-std()			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyroMag-std()" in the Human Activity Recognition Using Smartphones Dataset
41	253-tBodyGyroJerkMag-mean()		numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyroJerkMag-mean()" in the Human Activity Recognition Using Smartphones Dataset
42	254-tBodyGyroJerkMag-std()		numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "tBodyGyroJerkMag-std()" in the Human Activity Recognition Using Smartphones Dataset
43	266-fBodyAcc-mean()-X			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAcc-mean()-X" in the Human Activity Recognition Using Smartphones Dataset
44	267-fBodyAcc-mean()-Y			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAcc-mean()-Y" in the Human Activity Recognition Using Smartphones Dataset
45	268-fBodyAcc-mean()-Z			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAcc-mean()-Z" in the Human Activity Recognition Using Smartphones Dataset
46	269-fBodyAcc-std()-X			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAcc-std()-X" in the Human Activity Recognition Using Smartphones Dataset
47	270-fBodyAcc-std()-Y			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAcc-std()-Y" in the Human Activity Recognition Using Smartphones Dataset
48	271-fBodyAcc-std()-Z			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAcc-std()-Z" in the Human Activity Recognition Using Smartphones Dataset
49	345-fBodyAccJerk-mean()-X		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAccJerk-mean()-X" in the Human Activity Recognition Using Smartphones Dataset
50	346-fBodyAccJerk-mean()-Y		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAccJerk-mean()-Y" in the Human Activity Recognition Using Smartphones Dataset
51	347-fBodyAccJerk-mean()-Z		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAccJerk-mean()-Z" in the Human Activity Recognition Using Smartphones Dataset
52	348-fBodyAccJerk-std()-X		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAccJerk-std()-X" in the Human Activity Recognition Using Smartphones Dataset
53	349-fBodyAccJerk-std()-Y		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAccJerk-std()-Y" in the Human Activity Recognition Using Smartphones Dataset
54	350-fBodyAccJerk-std()-Z		numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAccJerk-std()-Z" in the Human Activity Recognition Using Smartphones Dataset
55	424-fBodyGyro-mean()-X			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "fBodyGyro-mean()-X" in the Human Activity Recognition Using Smartphones Dataset
56	425-fBodyGyro-mean()-Y			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "fBodyGyro-mean()-Y" in the Human Activity Recognition Using Smartphones Dataset
57	426-fBodyGyro-mean()-Z			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "fBodyGyro-mean()-Z" in the Human Activity Recognition Using Smartphones Dataset
58	427-fBodyGyro-std()-X			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "fBodyGyro-std()-X" in the Human Activity Recognition Using Smartphones Dataset
59	428-fBodyGyro-std()-Y			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "fBodyGyro-std()-Y" in the Human Activity Recognition Using Smartphones Dataset
60	429-fBodyGyro-std()-Z			numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "fBodyGyro-std()-Z" in the Human Activity Recognition Using Smartphones Dataset
61	503-fBodyAccMag-mean()			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAccMag-mean()" in the Human Activity Recognition Using Smartphones Dataset
62	504-fBodyAccMag-std()			numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyAccMag-std()" in the Human Activity Recognition Using Smartphones Dataset
63	516-fBodyBodyAccJerkMag-mean()	numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyBodyAccJerkMag-mean()" in the Human Activity Recognition Using Smartphones Dataset
64	517-fBodyBodyAccJerkMag-std()	numeric	-1.000000..1.000000	Gravitational Units (g)				The calculated mean for given subject and activity of variable "fBodyBodyAccJerkMag-std()" in the Human Activity Recognition Using Smartphones Dataset
65	529-fBodyBodyGyroMag-mean()		numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "fBodyBodyGyroMag-mean()" in the Human Activity Recognition Using Smartphones Dataset
66	530-fBodyBodyGyroMag-std()		numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "fBodyBodyGyroMag-std()" in the Human Activity Recognition Using Smartphones Dataset
67	542-fBodyBodyGyroJerkMag-mean()	numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "fBodyBodyGyroJerkMag-mean()" in the Human Activity Recognition Using Smartphones Dataset
68	543-fBodyBodyGyroJerkMag-std()	numeric	-1.000000..1.000000	Angular Velocity (radians/second)	The calculated mean for given subject and activity of variable "fBodyBodyGyroJerkMag-std()" in the Human Activity Recognition Using Smartphones Dataset
