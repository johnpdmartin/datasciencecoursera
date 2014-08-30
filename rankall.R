
rankall <- function(outcome, num = "best") {
## Read outcome data
long_out <- read.csv("./hospitaldata/short_hospital_list2.csv")
#str(long_out)

## Check that outcome is valid



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

## For each state, find the hospital of the given rank

statelist <- sort(as.character(unique(long_out$state)))

#print(statelist)
num_states <- length(statelist)


headerlist <- as.character(c("heart.attack","heart.failure","pneumonia"))


	for( k in 1:3) {
		if( outcomelist[k] == outcome ) {
							
#			print(outcomelist[k])
			
			fn <- headerlist[k]	

			maybe <- long_out
			
			m2 <- maybe[order(maybe[,3],maybe[,k+3],maybe[,2]),]
#print(m2)
			ind <- k
						
				}

							
}

for ( j in 1:num_states) {



df <- m2[m2$state == statelist[j],]
#print(df)

df1 <- df[,3+ind]
df3 <- is.na(df1)

ef <- df[,2]

df2 <- ef[df3 == FALSE]
#print(df2)

# converting best and worst  to rank

if ( num == "best") {

rank = 1
}
else if ( num == "worst") {

rank = length(df2)
}
else {

rank = as.numeric(num)
}

ans <- as.character(df2[rank])
 
print(paste(rank,",",ans,",",statelist[j]))
}


}
