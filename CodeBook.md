Getting And Cleaning Data Course - Project
====

# Variables

For this project, the variables have been differentiated under two major cate-
gories:
1. "Basic" variables - from the original data creators
2. "Added" variables - from the transformative processing

## "Basic" variables
These are the variables that are inherent in the raw data. They are included in
the raw data set. We have excluded the Inertial Signals as they do not
contribute to the overall completeness of this project. Although information
about them can be found in the README.txt file that accompanied the raw data.

### Subject
This is a unique numeric identifier to the participant that performed the 
activity. It ranges from 1 to 30.

### Activity
This is a unique numeric identifier for the activity that the participant is
performing. It ranges from 1 to 6.

### 561 Feature vector
The information that came with the raw data set explains the basic structure of
the data sets. So you will be directed to the original data set README.txt file
which adequately explains both the 561 feature vector variables, as well as the
Inertial signals.

## "Added"" variables
These are variables that were added during the transformative steps in order to
preserve the intergrity (and information) of the raw data sets. There is only
one such variable; Set.

### Set
This is a character variable that tags an observation as either of the test
set or the training set of data. It's values are "TRAIN" and "TEST"

# Data

## "Raw" data set
The data consist of the row binding of the raw data sets (subject, activity, 
and 561 feature vectors) for both the test case (containing 2947 observations)
and that of the train case (containing 7352 observations).

## "Merged" data set
These "raw" data set was merged into a single data set with the addition of,
yet, another variable "Set" to indicate that a specific observation was from
either the test case or the train case. Hence the "merged" data set was a
single data set (with variables subject, activity, set, and 561 feature 
vectors) forming a 10299 by 564 data frame.

# Post Processing

## Script writing (methodology)
In order to facilitate ease of understanding, the script was written with the
intermediate variable methodology as opposed to the nested functions or the 
chaining methodology. That way, it can be highly commented to show the flow
of the script.

## Transformation Flow
For a simplistic version of the post processing transformations, please see the
comments in the script. The transformation that converted the data from it's 
raw unprocessed (and messy) state to the finished tidy state is as follows:

1. Load the dplyr and tidyr libraries.
2. Read the data (test case and train case) into R objects.
3. Label (manually) the Subject and Activity variables
4. Remove "()" and "-" from the labeling of the 561 feature vector. This step
   cleans the variables name, making them easier to access in the future.
5. Label the 561 feature variable.
6. Column bind the Subject, Activity, and Set vectors.
7. Column bind with the respective 561 feature vectors for two sets of data
   resulting in a 7352 by 564 vector for training case and a 2947 by 564 vector
   for test case.
8. Rbind the test case, TEST, and train caes, TRAIN, data sets to create a
   single data set, DATA.
9. Update the Activity variable from numeric value to descriptive "factors".
10. Removing duplicate columns from the data set. This step aids the functioning
   of the selection process.
11. Select only the Subject, Activity, Set columns, along with any column 
    containing either "mean" or "std".
12. Grouped the data by Subject, Activity and Set.
13. Summarized the data by "mean", creating a matrix of means grouped by both
    Subject and Activity.
14. Write tidy data set to avgDATA.txt file.
15. Remove all the other created objects in the Global Environment
