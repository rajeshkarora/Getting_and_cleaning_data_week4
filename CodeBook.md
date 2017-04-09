File with R code "run_analysis.R" performs the following steps:

1. Merging the train and the test sets to create one data set.
 a. Read train tables
 b. Read test tables
 c. Read feature vector
 d. Read activity labels
 e. Assign column names
 f. Merge all data in one set


2. Extracting measurement columns on the mean and standard deviation
 a. Read column names
 b. Create vector for defining ID, mean and standard deviation
 c. Create subset 


3. Use descriptive activity names to name the activities in the data set
4. Label the data set

5. Creating a tidy data set with the average of each variable for each activity and each subject
 a  create tidy data set
 b  Write tidy data set in txt file


The variables in the tidy data

Each row has averaged variables for each subject and each activity.
Only all the variables estimated from mean and standard deviation in the tidy set were kept.

mean(): Mean value
std(): Standard deviation
The data were averaged based on subject and activity group.

Subject column is numbered sequentially from 1 to 30. Activity column has 6 types as listed below.
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING