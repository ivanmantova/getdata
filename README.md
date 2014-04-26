getdata
=======

GitHub repository for the **Getting and Cleaning Data** course on Coursera

Script Dependencies:
- reshape

### Instructions:

Extract the data from the URL (zip) provided by the instructions page on Coursera on the same directory/path as the R script. You do not need to modify or configure any parameter.

The script will output 2 data sets as requested by the course:
- Tidy data with select variables, unchanged
- Tidy data with average of select variables grouped by `subject` and `activity`

### Transformations on the original data:

The original data comes in separate files for `subject`, `activity` and the actual measurements (variables):

`Subject` data files:
- `test/subject_test.txt` and
- `train/subject_train.txt`

`Activity` data files:
- `test/y_test.txt` and
- `train/y_train.txt`

Additionally, the labels for the activities are available in the data file `activity_labels.txt` in the root directory.

The variables are available in the following data files:
- `test/X_test.txt` and
- `train/X_train.txt`

Again with descriptors available in another file called `features.txt`.

The original data is partitioned by `test` and `train` data sets for use with machine learning algorithms, but for our use we just merge both partitions of the same data every time, as requested by the instructions for this assignment.

We then choose the columns that correspond to `mean` and `standard deviation` measurements and filter out the remaining measurement columns.

The last steps are to save the tidy data set we just created and create and save another one containing the same data, but grouped by `subject` and `activity`.
