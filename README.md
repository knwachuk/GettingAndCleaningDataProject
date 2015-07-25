# Getting And Cleaning Data Course Project - README.md

## About README.md

<p>This is a simple introduction to the contents of the repo. In order to 
fully understand the data, it needs to be used in conjunction with the information
provided with the data, as well as the CodeBook.md file. Finally, there is a
data dictionary, DataDicitoinary.txt, for the DATA object that explains in more
detail the variables and their units.</p>

## About the Repo

This is the repo for the Getting and Cleaning Data Project, and includes:  
  
1. The tidy data set, avgDATA.txt  
2. The code book, CodeBook.md  
3. The read me file, README.md  
  
as the primary components of the repo.

### Contents of the Repo
<p>The repo also contains the execution script, run_analysis.R, that converts the
raw data, the data found in the folder "UCI HAR Dataset" folder, into the 
finished tidy data set, the "avgDATA .txt", file. These are the secondary 
components of the repo. It should be noted that the term - secondary - does not
symbolise importance, as these files are all necessary for the proper function
of the run_analysis.R script.</p>

<p>Finally, the repo contains the folder, helper_functions, that contains 
home-grown functions that facilitated initially completing the project. However,
the run_analysis.R script has since been re-written to use only basic functions 
(found in all R) and the libraries: dplyr and tidyr. This is to allow cross 
compatibility with all base R downloads.</p>

## Using the run_analysis.R Script

<p>To use the run_analysis script, simply have the "UCI HAR Dataset" folder in the
same directory as the script (which should be the working directory), and run
(source) the script. The script is designed to:</p>

1. Load the required libraries; dplyr and tidyr
2. input the raw data sets
3. Merge the data sets
4. Label the data sets
5. Extract information from the merged data set
6. Output a tidy data set

## Output of the run_analysis.R Script

<p>There will be two data frame objects in the Global Environment. The avgDATA
and DATA object. *NOTE* If you do not wish to see the DATA object, simply 
uncomment the rm(DATA) instruction from the Cleaning the environment section of
the run_analysis.R script.</p>

### DATA Object
<p>The DATA object is the "unprocessed" (raw) data. It is a consist of a merger
between the training data set and test data set.</p>

### avgDATA Object
<p>The avgDATA object is the processed data set. Consisting of the training data
set and the test data set, but sub-setted. Showing only the Subject, Activity, Set
and any of the feature variables that contains either "mean" or "std".</p>

