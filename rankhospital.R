
rankhospital <- function(state, outcome, num = "best") {
## Read outcome data
long_out <- read.csv("./hospitaldata/short_hospital_list2.csv")
#str(long_out)

## Check that state and outcome are valid

statelist <- as.character(unique(long_out$state))
#print(statelist)
num_states <- length(statelist)

#print(num_states)
j1 <- 0

checkstate <- for( j in 1:num_states) {
	if( statelist[j] == state) {
		j1 = 1
	}
}


if( j1 != 1) {
stop("state name is invalid, rerun program with eligible state")
}



k1 <- 0
outcomelist <- c("heart attack","heart failure","pneumonia")
checkoutcome <- for( k in 1:3) {
	if( outcomelist[k] == outcome) {
		k1 = 1
	}
}


if( k1 != 1) {
stop("health condition name is invalid, rerun program with eligible name
\"heart attack\", \"heart failure\" or \"pneumonia\" (all in lower case)")
}


## Return hospital name in that state with the given rank
## 30-day death rate


headerlist <- as.character(c("heart.attack","heart.failure","pneumonia"))
for( j in 1:num_states) {
	for( k in 1:3) {
		if( outcomelist[k] == outcome && statelist[j] == state) {
							
#			print(statelist[j])
#			print(outcomelist[k])
			
			fn <- headerlist[k]	

			maybe <- long_out[ long_out$state == state,]
			
			m2 <- maybe[order(maybe[,k+3],maybe[,2]),]
						
							}

							
						}
}
df <- m2[,2][rm.na = TRUE]
#print(df)

# converting best and worst  to rank

if ( num == "best") {

rank = 1
}
else if ( num == "worst") {

rank = length(df)
}
else {

rank = as.numeric(num)
}

ans <- as.character(df[rank])
paste(rank,",",ans)
}
