
* ==================================================================== PREAMBLE =========================================================================

* Clean existing objects. Otherwise code is seriously prone to error.  
clear all


* Set working directory 
cd "~/Library/Mobile Documents/com~apple~CloudDocs/Teaching/EUI/Intro to Stata/Class 2/"


* Open dataset
do "Class2.do"


* What to know where you are working? Print working directory

pwd


* =========================================================== TAKE A LOOK TO THE DATA =====================================================================


describe

* summary for a continuous variables

sum age
sum age, d

* Let's compute the variance manually

*return list

gen dev2 = (age - r(mean))^2

sum dev2

sum age

return list

dis r(sd)^2


* plot 

hist age



* Frequency table for a discrete variable

tab italy
tab italy, nolab

sum italy

* check proportion and sd 

dis  (0.0592*(1- 0.0592))^(1/2)  

