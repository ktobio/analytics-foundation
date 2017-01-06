/********************************************************************************************
File        : analytics-foundcation.do  <--- this should be the exact name of THIS document
Author      : Kristina Tobio 
Created     : 06 Jan 2016
Modified    : 06 Jan 2016
Description : .do file for analytics foundation slide deck
********************************************************************************************/

// these commands prepare your computer for the data and analysis
// this finds and closes open log files
capture log close        
// this clears Stata's data memory so new data can be loaded
clear       
// this makes it so you don't have to keep pressing return/enter to scroll through results
set more off          
// this sets memory size
set mem 100m       
// this keeps everything visible on a normal monitor or laptop screen
set linesize 200    

// cd means "change directory"
// you need to change this to the location on your computer where you are storing the .do and data files
*cd "/Users/ktobio/Desktop/Jeff/Course/Statistics Slide Deck/analytics-foundation" 
    
// this creates a log file, which will record all of the commands and outputs from this .do file 
// log files should be placed in a folder named "logs" in your directory 
log using "logs/analytics-foundation", replace

// data should be placed in a folder named "data" in your directory 

// Calculating the Standard Deviation of House Sales
// this command reads the data into Stata
import excel using "data/HouseSales.xlsx", firstrow

// save the data as a Stata dataset
save "data/HouseSales.dta", replace

// These are the steps needed to calculate the SD
egen Mean=mean(SellingPrice)
g Deviation=SellingPrice-Mean
g SqDeviation=Deviation*Deviation
egen Sum=sum(SqDeviation)
g Count=_N
g SD=sqrt(Sum/(Count-1))
tab SD

clear

// Calculations using the Height-Weight data
// this command reads the data into Stata
import excel using "data/In-Class Data Sets.xls", sheet(HtWt) firstrow

// save the data as a Stata dataset
save "data/HtWt.dta", replace

// calculating the correlation
corr Height Weight

// running a simple regression
regress Weight Height

clear

// Calculations using the math scores data
// this command reads the data into Stata
import excel using "data/In-Class Data Sets.xls", sheet("Math Scores") firstrow 

// save the data as a Stata dataset
save "data/MathScores.dta", replace

// running a simple regression
regress MathScore Height

// adding missing variable age
regress MathScore Height Age

clear

// closes your log
log close

// drops all data from Stata's memory
clear
