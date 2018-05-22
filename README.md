# PredictSeizures
This is a project done as a part of Data Science[EECS 731] course in Fall 2016, during my graduation from University of Kansas.

The aim of the project is to predict the epilepsy seizures by observing the iEEG readings of 3 different patients.

iEEG Data is in the analog form, the signal is processed and cleaned with transformations and thresholds

Hypothesis for the project:

  1: NULL: Prediction needs one just 10 min data.
  
  2: Alternate: Prediction needs more than 10 min data (used one hour data blocks)
  
  
Software used: Matlab 2016b

Files:
icode.m: For hypothesis 1, Which uses the 10 min data.

hcode.m: For hypothesis 2, Which uses 1 hour data blocks

Prerocessing.m: Preparing the data with transformations, filters...

Time_and Frequency_series: trying out the data differently.


keywords: Analog Data, Feature Extraction, Tranformations, Classification Learner, Confuision Matrix
