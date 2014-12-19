#################################################################
#Data Dictionary For: tidy_output.txt
#################################################################

The data file tidy_output.txt defines a space-delimited data table of 180 rows by 68 columns.  

###Input data for this analysis comes from the Samsung activity study:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Additional detail on the study data parameters may be found at this URL: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

In summary, the Samsung study records acceleration and gyroscopic movement data obtained from a Samsung Galaxy S II device while subjects are requested to perform
various physical activity (such as walking, sitting, standing).  Acceleration and position are thus measured in space and recorded in XYZ coordinates.

This study calculates the mean of variables specified in the Human Activity Recognition Using Smartphones study as specified below.

The data dictionary for this table is as follows.


###Variables 3-68 are the calculated mean for given variable as defined in the Human Activity Recognition Using Smartphones Dataset grouped by subject id, by activity label

##DATA DICTIONARY
	Col	Variable Name					Type 	Values				Units
	=====================================================================
	1	subject_id						numeric	0..30				Activity Participant ID
	2	activity_label					string	Defined Category:	Activity Category
	.									LAYING						Catigorical Unit
	.									SITTING						Catigorical Unit
	.									STANDING					Catigorical Unit
	.									WALKING						Catigorical Unit
	.									WALKING_UPSTAIRS			Catigorical Unit
	.									WALKING_DOWNSTAIRS			Catigorical Unit
	3	1-tBodyAcc-mean()-X				numeric	-1.000000..1.000000	Gravitational Units (g)
	4	2-tBodyAcc-mean()-Y				numeric	-1.000000..1.000000	Gravitational Units (g)
	5	3-tBodyAcc-mean()-Z				numeric	-1.000000..1.000000	Gravitational Units (g)
	6	4-tBodyAcc-std()-X				numeric	-1.000000..1.000000	Gravitational Units (g)
	7	5-tBodyAcc-std()-Y				numeric	-1.000000..1.000000	Gravitational Units (g)
	8	6-tBodyAcc-std()-Z				numeric	-1.000000..1.000000	Gravitational Units (g)
	9	41-tGravityAcc-mean()-X			numeric	-1.000000..1.000000	Gravitational Units (g)
	10	42-tGravityAcc-mean()-Y			numeric	-1.000000..1.000000	Gravitational Units (g)
	11	43-tGravityAcc-mean()-Z			numeric	-1.000000..1.000000	Gravitational Units (g)
	12	44-tGravityAcc-std()-X			numeric	-1.000000..1.000000	Gravitational Units (g)
	13	45-tGravityAcc-std()-Y			numeric	-1.000000..1.000000	Gravitational Units (g)
	14	46-tGravityAcc-std()-Z			numeric	-1.000000..1.000000	Gravitational Units (g)
	15	81-tBodyAccJerk-mean()-X		numeric	-1.000000..1.000000	Gravitational Units (g)
	16	82-tBodyAccJerk-mean()-Y		numeric	-1.000000..1.000000	Gravitational Units (g)
	17	83-tBodyAccJerk-mean()-Z		numeric	-1.000000..1.000000	Gravitational Units (g)
	18	84-tBodyAccJerk-std()-X			numeric	-1.000000..1.000000	Gravitational Units (g)
	19	85-tBodyAccJerk-std()-Y			numeric	-1.000000..1.000000	Gravitational Units (g)
	20	86-tBodyAccJerk-std()-Z			numeric	-1.000000..1.000000	Gravitational Units (g)
	21	121-tBodyGyro-mean()-X			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	22	122-tBodyGyro-mean()-Y			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	23	123-tBodyGyro-mean()-Z			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	24	124-tBodyGyro-std()-X			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	25	125-tBodyGyro-std()-Y			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	26	126-tBodyGyro-std()-Z			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	27	161-tBodyGyroJerk-mean()-X		numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	28	162-tBodyGyroJerk-mean()-Y		numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	29	163-tBodyGyroJerk-mean()-Z		numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	30	164-tBodyGyroJerk-std()-X		numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	31	165-tBodyGyroJerk-std()-Y		numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	32	166-tBodyGyroJerk-std()-Z		numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	33	201-tBodyAccMag-mean()			numeric	-1.000000..1.000000	Gravitational Units (g)
	34	202-tBodyAccMag-std()			numeric	-1.000000..1.000000	Gravitational Units (g)
	35	214-tGravityAccMag-mean()		numeric	-1.000000..1.000000	Gravitational Units (g)
	36	215-tGravityAccMag-std()		numeric	-1.000000..1.000000	Gravitational Units (g)
	37	227-tBodyAccJerkMag-mean()		numeric	-1.000000..1.000000	Gravitational Units (g)
	38	228-tBodyAccJerkMag-std()		numeric	-1.000000..1.000000	Gravitational Units (g)
	39	240-tBodyGyroMag-mean()			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	40	241-tBodyGyroMag-std()			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	41	253-tBodyGyroJerkMag-mean()		numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	42	254-tBodyGyroJerkMag-std()		numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	43	266-fBodyAcc-mean()-X			numeric	-1.000000..1.000000	Gravitational Units (g)
	44	267-fBodyAcc-mean()-Y			numeric	-1.000000..1.000000	Gravitational Units (g)
	45	268-fBodyAcc-mean()-Z			numeric	-1.000000..1.000000	Gravitational Units (g)
	46	269-fBodyAcc-std()-X			numeric	-1.000000..1.000000	Gravitational Units (g)
	47	270-fBodyAcc-std()-Y			numeric	-1.000000..1.000000	Gravitational Units (g)
	48	271-fBodyAcc-std()-Z			numeric	-1.000000..1.000000	Gravitational Units (g)
	49	345-fBodyAccJerk-mean()-X		numeric	-1.000000..1.000000	Gravitational Units (g)
	50	346-fBodyAccJerk-mean()-Y		numeric	-1.000000..1.000000	Gravitational Units (g)
	51	347-fBodyAccJerk-mean()-Z		numeric	-1.000000..1.000000	Gravitational Units (g)
	52	348-fBodyAccJerk-std()-X		numeric	-1.000000..1.000000	Gravitational Units (g)
	53	349-fBodyAccJerk-std()-Y		numeric	-1.000000..1.000000	Gravitational Units (g)
	54	350-fBodyAccJerk-std()-Z		numeric	-1.000000..1.000000	Gravitational Units (g)
	55	424-fBodyGyro-mean()-X			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	56	425-fBodyGyro-mean()-Y			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	57	426-fBodyGyro-mean()-Z			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	58	427-fBodyGyro-std()-X			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	59	428-fBodyGyro-std()-Y			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	60	429-fBodyGyro-std()-Z			numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	61	503-fBodyAccMag-mean()			numeric	-1.000000..1.000000	Gravitational Units (g)
	62	504-fBodyAccMag-std()			numeric	-1.000000..1.000000	Gravitational Units (g)
	63	516-fBodyBodyAccJerkMag-mean()	numeric	-1.000000..1.000000	Gravitational Units (g)
	64	517-fBodyBodyAccJerkMag-std()	numeric	-1.000000..1.000000	Gravitational Units (g)
	65	529-fBodyBodyGyroMag-mean()		numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	66	530-fBodyBodyGyroMag-std()		numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	67	542-fBodyBodyGyroJerkMag-mean()	numeric	-1.000000..1.000000	Angular Velocity (radians/second)
	68	543-fBodyBodyGyroJerkMag-std()	numeric	-1.000000..1.000000	Angular Velocity (radians/second)

