complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

# obtain the list of files

files_full <- list.files(directory,full.names=TRUE)

head(files_full)

# initialize data frame

dat <- data.frame()

# add each dataset to the data frame with loop

	for( j in id)	{

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
}	

