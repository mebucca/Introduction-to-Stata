
* ==================================================================== PREAMBLE =========================================================================

* Clean existing objects. Otherwise code is seriously prone to error.  
clear all


* Run code from class 2

cd "~/Library/Mobile Documents/com~apple~CloudDocs/Teaching/EUI/Intro to Stata/Class 2/"
quietly do "Class2.do"



* Run code from class 3

cd "~/Library/Mobile Documents/com~apple~CloudDocs/Teaching/EUI/Intro to Stata/Class 3/"
quietly do "Class3.do"



* =========================================================== TAKE A LOOK TO THE DATA =====================================================================


* association between continuous variables


* Perfect association


scatter yrbrn age // scatterplot
cor yrbrn age 

h cor // Help for cor command

cor yrbrn age, m cov


* A more realistic case

scatter hinctnta eisced

tab eisced, nolab


// replace eisced = . if eisced==55

scatter hinctnta eisced if eisced!=55

cor hinctnta eisced if eisced!=55

lowess hinctnta eisced if eisced!=55


* association between discreate variables

tab hinctnta eisced if eisced!=55 // Frequencies 

tab hinctnta eisced if eisced!=55, cell nofreq // Joint distribution


dis 2.17/8.55
tab hinctnta eisced if eisced!=55, col nofreq // Conditional distribution: P( hinctnta | eisced )


dis 2.17/ 10.09
tab hinctnta eisced if eisced!=55, row nofreq // Conditional distribution: P( eisced | hinctnta )


* Another look at the assocation in the table. If hinctnta and eisced are independent, then P(hinctnta,eisced) = P(hinctnta)*(eisced)
* Therefore, under independence the expected frequencies in the table are given by: P(hinctnta)*(eisced)*N

tab hinctnta eisced if eisced!=55, expected nofreq

tab hinctnta eisced if eisced!=55


* association between continuos and discrete: means by groups

tabulate italy, summarize(age)

