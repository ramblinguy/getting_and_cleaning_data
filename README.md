# Getting and Cleaning Data- End of Course Project
The code exists in the file named "run_analysis.R". It does the following:
  1. Loads required libraries
  2. Downloads the data in case the data does not exist and unzips it.
  3. Reads the activity labels and features
  4. Reads the training and testing datasets and assigns the activity and data to the subject
  5. Merges the training and testing datasets
  6. Renames the columns based on the names given in the "features" data.
  7. Changes the activities to factors and renames them based on the activity labels dataset.
  8. Subsets the columns that pertain to the mean and standard deviation.
  9. Melts and then creates the means of the variables for each subject and activity combination.
  10. Creates a file called "tidy.txt" for the result of the previous step. 
