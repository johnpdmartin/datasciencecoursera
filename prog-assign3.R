outcome <- read.csv("./hospitaldata/outcome-of-care-measures.csv",colClasses = "character")
#print(head(outcome))
#print(str(outcome))
#print(ncol(outcome))
#print(names(outcome))


# plotting histogram
outcome[,11] <- as.numeric(outcome[,11])
## expect a warning about NAs being present
hist(outcome[,11])

best <- function(state, outcome) {
## Read outcome data
outcome <- read.csv("./hospitaldata/outcome-of-care-measures.csv",colClasses = "character")

outcome2 <- complete 
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death
## rate
}
