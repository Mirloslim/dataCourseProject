# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* Step 1: merging all the similar datasets using `rbind()` based on the Subject, Activity and Features.
* Step 2: Subsetting the mean and standard deviation measurements from the dataset. After extracting the data, names are assigned based on the dataset `features.txt`.
* Step 3: As activity data is addressed with values 1:6, we take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.
* Step 4: On the whole dataset, those columns with vague column names are corrected.
* Step 5: Generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file `averages_data.txt`is generated.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `dataFeatures`, `dataActivity` and `dataSubject` merge the previous datasets to further analysis.
* `features` contains the correct names for the `dataFeatures` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `all_data` merges `dataFeatures`, `dataActivity` and `dataSubject` in a big dataset.
* Finally, `averages_data` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development
