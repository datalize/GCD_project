
## Raw Data

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## Data Dictionary

- participant - the participant number (1-30) 
- activity - the activity description

The vector information contains 81 rows that are compromised of many elements for each measurement. 
For example "tBodyAcc-mean-X" denotes a measurement of the mean of a person's acceleration along the x axis as calculated using time. 
Below are the list of parameters that appear in the tidy data set:  

- t prefix - measurement was calculated using the time domain  
- f prefix- measurement was calculated using the frequency domain
- Body - the person's own movement  
- Gravity - movement due to gravity  
- Acc - acceleration - m/s^2  
- Jerk - jerk - m/s^3  
- Gyro - angular velocity - radians/s  
- Mag - magnitude using the Euclidean norm
- std - standard deviation  
- mean - average  
- x, y, z - which axis the measurement corresponds to  
