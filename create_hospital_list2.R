
## Read outcome data
outcome <- read.csv("./hospitaldata/outcome-of-care-measures.csv",colClasses = "character")

outcome2 <- cbind(outcome[,2],outcome[,7],as.numeric(outcome[,11]),as.numeric(outcome[,17]),as.numeric(outcome[,23]))

#outcome3 <- subset(outcome2,complete.cases(outcome2))
colnames(outcome2) <- c("hospital name","state","heart attack","heart failure","pneumonia")

print(head(outcome2))

write.csv(outcome2,"./hospitaldata/short_hospital_list2.csv")
