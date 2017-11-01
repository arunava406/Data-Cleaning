This file gives and overview of what the code does 

Assumptions:

It assumes that the data has been downloaded and unzipped and the folder "UCI HAR Dataset" is in the working directory 


Function:

It downloads the 3 test files and 3 train files
it merges the data sets into three different dataframes of x_tot, y_tot and sub_tot

The activity_labels file and features file is converted into dafa frames namely "act" and "feat". 

Partial string matching using grep is used to indentify columns containing "mean" or "std"

A new data frame called "x_stdmean" is created containing "mean" and "std".

Using library plyr, corresponding activity found in the file activity_labels.txt is identified and updated to the data frame "x_stdmeanf"

The mean for each activity and subject is found using the "reshape2 library and"group_by" and "summarize_all" function.

This is populated in another data frame called "tidydata.txt"

