CodeBook.md

'datatrain',  'datatest' variables contain the training and testing data respectively. 
'subjectTrain' lay out the subject number for each training measurement "activityTrain" lay out the activity number for each training measurement "test", "subjectTrain", "activityTrain" variables does the same thing for test data

'datatrain', 'datatest', 'activityTrain', 'activityTest', 'subjectTrain', 
'subjectTest' are the objects containing data.


Data is merged using rbind(). join() function in "plyr" library is for assigning activity name.