Getting And Cleaning Data Project - README
====

This is the repo for the Getting and Cleaning Data Project. Which includes:  
  
1. The tidy data set, avgDATA.txt  
2. The code book, CodeBook.md  
3. The read me file, README.md  
  
as the primary components of the repo.  
  
The repo also contains the execution script, run_analysis.R, that converts the
raw data, the data found in the folder "UCI HAR Dataset" folder, into the 
finished tidy data set, the "avgDATA .txt", file. These are the secondary 
components of the repo. It should be noted that the term - secondary - does not
symbolise importance, as these files are all neccessary for the proper function
of the run_analysis.R script.  
  
Finally, the repo contains the folder, helper_functions, that contains 
home-grown functions that facilitated completing the project initially. However,
the run_analysis.R script was re-written to use only basic functions (found in
all R) and the libraries: dplyr and tidyr. This is to allow cross compatibility.  
  
To use the run_analysis script, simply have the "UCI HAR Dataset" folder in the
same directory as the script (which should be the working directory), and run
(source) the script. It is designed to:  
  
1. Load the required libraries; dplyr and tidyr
2. input the raw data sets.
3. Merge the data sets.
4. Label the data sets.
5. Extract information from the merged data set.
6. Output a tidy data set.
  
There will be two data frame objects in the Global Environment. The avgDATA and
the DATA object. The DATA object is the "unprocessed", merged training and test
data set. While the avgDATA object is the processed data set. If you do not wish
to see the "unprocessed"" data set, simply uncomment the rm(DATA) instruction  
from the Cleaning the environment section fo the run_analysis.R script.  
