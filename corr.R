corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

# obtain the list of files

files_full <- list.files(directory,full.names=TRUE)

head(files_full)

# initialize data frame

dat <- data.frame()

# add each dataset to the data frame with loop

#	for( j in 1:length(files_full))	{
	for( j in 1:20)	{

		dat <- rbind(dat,read.csv(files_full[j]))
}
#str(dat)

z3 <- complete.cases(dat)
#print(head(z3))
z4 <- dat[z3 == TRUE,]
z4$dummy_count <- 1

z8 <- aggregate(z4$dummy_count,by=list(z4$ID),FUN=sum)
colnames(z8) <- c("id","nobs")
print(z8)
z9 <- z8[z8$nobs >= threshold,]

print(z9)
print(list(z9$id))

z11 <- data.frame()
  
for ( k in z9$id) { 
z10 <- z4[z4$ID == k,]
#print(z10)
newrow <- c(k,cor(z10$sulfate,z10$nitrate,method="pearson")) 
z11 <- rbind(z11,newrow)
colnames(z11) <- c("id","corr_pearson")
}
return(z11)
}