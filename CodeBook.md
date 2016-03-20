Assignment Getting & Cleaning Data Week 4 - CodeBook
=================

Dataset: X_all
=================

This tidy dataset is a combination of the test and training dataset of the "UCI HAR Dataset" containing the activity and the subject inside the dataset.

observations: 813621
columns: 6 (activity (chr), subject (int), measurement (chr), calculation (chr), direction (chr), value (dbl))

activity: the activity of the participant he was doing
	
	walking
	walking_upstairs
	walking_downstairs
	sitting
	standing
	laying

subject: the participant from whom the measurements were observed

	30 participants have been observed with the levels 1:30

measurement: the measurement which is observed

	altogether, 17 measurements are possible
	
	tBodyAcc
	tGravityAcc
	tBodyAccJerk
	tBodyGyro
	tBodyGyroJerk
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
  tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc
	fBodyAccJerk
	fBodyGyro
	fBodyAccMag
	fBodyBodyAccJerkMag
	fBodyBodyGyroMag    
	fBodyBodyGyroJerkMag

calculation: the calculation/function which represents the value

	two calcualtions

	mean: mean/average
	std: standard deviation

direction: for the measurements (tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, fBodyAcc, fBodyAccJerk, fBodyGyro) the direction (XYZ) is used to denote 3-axial signals in the X, Y and Z directions. All other measurements do not have a direction.

So there are four values possile for direction:

	X
	Y
	Z
	NULL

value: the value which was observed from the smartphone (Samsung Galaxy S II), related to the activity , subject, measurement, calculation and direction)

Dataset: X_all_mean
=================

This tidy dataset is a summarized dataset from X_all which represents the meanvalue of all equal observations.

observations: 14220
columns: 6 (activity (chr), subject (int), measurement (chr), calculation (chr), direction (chr), meanvalue (dbl))

All columns of "X_all_mean" are the same as X_all except the 6th column. So you can look up any of those under X_all.

meanvalue: represents the mean of all values summarized from the dataset "X_all_mean", by grouping over the columns 1:5.



