# ProgrammingAssignment3
Data Science Coursera - R programming

1 Plot the 30-day mortality rates for heart attack

Read the outcome data into R via the read.csv function and look at the rst few rows.
> outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
> head(outcome)
There are many columns in this dataset. You can see how many by typing ncol(outcome) (you can see
the number of rows with the nrow function). In addition, you can see the names of each column by typing
names(outcome) (the names are also in the PDF document.


2 Finding the best hospital in a state

Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
outcome name. The function reads the outcome-of-care-measures.csv le and returns a character vector
with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specied outcome
in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
be one of \heart attack", \heart failure", or \pneumonia". Hospitals that do not have


3 Ranking hospitals by outcome in a state


Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a
state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num).
The function reads the outcome-of-care-measures.csv le and returns a character vector with the name
of the hospital that has the ranking specied by the num argument. For example, the call
rankhospital("MD", "heart failure", 5)
would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate
for heart failure. The num argument can take values \best", \worst", or an integer indicating the ranking
(smaller numbers are better). If the number given by num is larger than the number of hospitals in that
state, then the function should return NA. Hospitals that do not have data on a particular outcome should
be excluded from the set of hospitals when deciding the rankings.
