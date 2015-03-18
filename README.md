Getting And Cleaning Data Course Project
----------------------------------------

The purpose of the following file is to explain how all the sources in this repository are put together in order to fulfil the purpose of the course project. The first thing to know is where all the files can be found and how to load and check them.

##Components of the Project

### Readme file
This is the file which you are reading which explains how the different parts of this project can be put together

### Raw data file information
A detailed information of the raw data can be found in the Code Book file. But what you will need in order to run the R script is its destination:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The url points to a .zip file which contains several folders and many files which represent the raw data used in the project.

### R script for manipulating data
The R script is called "run_analysis.R" and can be found in this repository. The script assumes that you already have downloaded the raw data .zip file from the url mentioned above, and extracted it into your working directory. Then runnning the script is just opening the "run_analysis.R" file into R studio and click on the "Source" button.

#### R script algorithm
* load the needed R packages (dplyr, plyr, reshape2)
* define the function "manipulateData" which is used both for "train"" and "test"" data sets (see the Code book for more details on the structure of the raw data)
    - arguments of "manipulateData":
        1. filesDirName - directory either to the test or to the train subdirectories
        2. subjectFile - the filename for the subjects
        3. activityFile - the filename for the activities
        4. measurementsFile - the filename for the measurements
        5. activityLabels - the filename for the activity labels
        6. searchedCols - these are the needed columns for the mean and standard deviation measurements
    - "manipulateData" algorithm
        1. Read the subjects file, depending on the given directory and file parameters
        2. Read the activities file, depending on the given directory and file parameters
        3. Join the activities codes and their labels and select only the labels column
        4. Give readable names to both activities and subject columns
        5. Read the measurements data and select only the desired columns
        6. Set to those columns with measurements more readable names
        7. Bind the subjects, activities and the measurements together into one table
* Read the variable names and transform them into shorter, more readable column names, which correspond to many wide accepted coding standards
    - leave only the variable names which contain in their name "mean()" and "std()". I remove the columns which contain MeanFreq and "angle." as the first one is the mean frequency and the second is about the angle between two vectors, which I think are of no interest according to the project's instructions.
    - remove all the punctuation characters from the variable names and make all the abbreviated words begin with capital letters (in this case only the "mean" and "std" had to be corrected). Leave only the first letter to be small (*CamelCase*).
    **Example:** tBodyAcc-mean()-X will become tBodyAccMeanX.

* Read the activity labels and remove the "_" from their names
* Call the manipulate data for both test and train data
* Bind the result test and train data sets
* Transform the result data set into the its final look, showing the mean of every variable measurements by each subject and each activity.
* Write the result tidy data set into a file into the working directory


### Tidy data file
The tidy data file can be found in the coursera evaluation page for the project. There's a link pointing to it. The file is called tidyDataSet.txt and can be opened in any text editor program. In order to view the file in R studio, which will display it in much clearer and fit way you should run the following command from your console (assumes the file is already downloaded to your working directory):
    **tidyDataSet <- read.table("tidyDataSet.txt", header = T)**

#### Is it really a tidy data set?
Here are the reasons why I consider the final data set that the R script produces as a tidy one:
* Each variable is in one column
* Each observation is in one row (unique combination of Subject and Activity)
* Column headers are variable names and not values
* No variables are stored in rows
* Only one type of observation is stored in that data set (file) - the mean of each variable by subject and activity
* There are no other data sets (files) in which the same observational type is stored

*For reference I used an article of Hadley Wickham called "Tidy Data": http://vita.had.co.nz/papers/tidy-data.pdf*

### Code Book file
The Code Book file is called CODEBOOK.md and is provided in the repository. It contains detailed information about several things
* The raw data (url), the purpose of its collection, its structure, source location, and what question we are interested in, based on this data.
* Actions taken to transform the data in a form which allows us to find the answer we are looking for.
* The tidy data set, its dimensions
* Detailed description of each variable and units




