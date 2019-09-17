
* ==================================================================== PREAMBLE =========================================================================

* Clean existing objects. Otherwise code is seriously prone to error.  
clear all


* Set working directory 
cd "~/Library/Mobile Documents/com~apple~CloudDocs/Teaching/EUI/Intro to Stata/Class 2/"


* Open dataset
use "ESS8_subset.dta"


* What to know where you are working? Print working directory

pwd


* ============================================================== BROWSE THE DATA ========================================================================



browse // visualize dataset but can't edit information. We can see that we have different types of data in this dataset. 

* black indicates that the variable is numerical 
* red indicate that the varible is a "string", that is, text. 
* blue indicates that the variable is numerical but each value of it has been given a label


browse, nolab // // visualize dataset without labels



* ==================================================== BASIC COMMANDS FOR DATA EXPLORATION ===============================================================

* Display variable type, format, and any value/variable labels

describe // or simply "des"
des 

* Overview of variable type, stats, number of missing/unique values

codebook  
codebook eisced


* Quick exploration of the data 
inspect yrbrn



* ========================================================= BASIC COMMANDS FOR DESCRIPTION ===============================================================

* Print summary statistics for numeric data: N, mean, sd, minimum, maximum 

sum yrbrn


* Print detailed summary statistics for numeric data

sum yrbrn, d


* One way table including frequency, % of observation in each category and cummulative %


tab gndr // discreate variable

tab yrbrn // continuous variable 



* ====================================================== BASIC COMMANDS FOR VARIABLES MANIPULATION =========================================================


* The basic command for creating new variables


gen constant = 1
list constant in 1/20
sum constant
drop constant 

* Alternatively you can do: keep idno cntry gndr yrbrn eisced hinctnta


* generate a variable based on existing variables

gen age = 2018 - yrbrn
sum age
inspect age

* You can do all type of arithmetic operations 

gen age_duplicate = (age^2)/age 
drop age_duplicate

* There an extended version of generate that allows for more complex operations. Just one example


egen mean_age_bycounty = mean(age), by(cntry)
list age cntry mean_age_bycounty in 1/20

tab mean_age_bycounty




* =========================================================== LOGIC OPERATIONS ========================================================================


* AND : &
* OR : |
* EQUAL: ==
* NOT EQUAL: !=
* LESS THAN: <
* GREATER THAN: >
* LESS OR EQUAL TO:  <= 
* GREATER OR EQUAL TO:  >= 


* Display some data using conditionals: Italian women, younger than 20 or older than 90 


list age if cntry=="IT" & gndr==2 & (age<20 | age>90) // carefull with parentheses 

list age if cntry=="IT" & gndr==2 & (age<20 | age>90) & age!=. // Stata treats missing values as possitive infites. VERY DANGEROUS


* You can use logic operations to redefine variables


gen age_ranges = . // good practice: start with an empty variable and then build up
replace age_ranges = 1 if age<20
replace age_ranges = 2 if age>=20 & age<=90
replace age_ranges = 3 if age>90 

tab age_ranges, missing     // no missings! but we just saw some. Problem , condition "age>90" gave missings a number 3
tab age, missing


* Drop variable and start over. Even better: do the change you want I run your code again from the begining.

drop age_ranges
gen age_ranges = . // good practice: start with an empty variable and then build up
replace age_ranges = 1 if age<20
replace age_ranges = 2 if age>=20 & age<=90
replace age_ranges = 3 if age>90 & age!=.

tab age_ranges, missing  // now it works


* More on this

gen italy = .
replace italy = 1 if cntry=="IT"
replace italy = 0 if cntry!="IT"


* ======================================================= LABEL VARIABLES AND VALUES =====================================================================


* Label the entire dataset 

label data "European Social Survey, Wave 8, subset" 


* Label a variable

label variable age "Age (continuous)"
label variable age_ranges "Age (ranges)"
label variable mean_age_bycounty "Average age by country"
label variable italy "Italy"


* Label values of a variable


label define age_ranges_lab 1 "Young" 2 "Mid" 3 "Old"
label define italy_lab 0 "Not Italy" 1 "Italy" 


label values age_ranges age_ranges_lab
label values italy italy_lab

