
* ==================================================================== PREAMBLE =========================================================================

* Clean all existing objects. Otherwise code is seriously prone to error.  
clear all


* Set working directory 

cd "~/Library/Mobile Documents/com~apple~CloudDocs/Teaching/EUI/Intro to Stata/Class 1/"

* Open dataset
use "Coin_toss.dta"


* ================================================================ EXPLORE DATA ========================================================================


browse // visualize dataset but can't edit information
edit   // visualize dataset and can edit information. DO NOT DO THIS. EVER.

browse coins_string gender // browse a subset of variables 
browse coins_string in 10/20 // browse a subset of variables and observations


* =================================================================== EDIT DATA ========================================================================


// Here I create a new numeric variable that indicates wether the person is 
// female (1) or male (0)

generate female = .
replace female = 1 if gender == "Female"
replace female = 0 if gender == "Male"


// Now could could save the data to retained the new variables we have created.

// We first set the directory where we want to save the data
cd "~/Library/Mobile Documents/com~apple~CloudDocs/Teaching/EUI/Intro to Stata/Class 1/"

// Save
*save "Coin_toss.dta" 
*save "Coin_toss.dta", replace

// Important note: As long as we have the code that execute the actions we want to, 
// most of the time there are no good reasons to save the changes in the original dataset.
// Much better: open original data and run your code on it. 


* ========================================================= BASIC DATA ANALYSIS ========================================================================

// Always make sure you are working on the right directory

cd "~/Library/Mobile Documents/com~apple~CloudDocs/Teaching/EUI/Intro to Stata/Class 1/"

// We can run all our analyses from a separate do-file. 
// It's equivalent to have the it wrote down here, but make code more easy to keep track of. 

do "Class1_1.do"


// Finally: Good code should be:

// - Clearly anotated 
// - Should automatize all tasks that can be automatized 
// - It should be replicable: If if run the code independently it should give me 
// exactly the same results in just one click. 

