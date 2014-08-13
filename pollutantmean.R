pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

# obtain the list of files

files_full <- list.files(directory,full.names=TRUE)

head(files_full)

# initialize data frame

dat <- data.frame()

# add each dataset to the data frame with loop

	for( j in id)	{

		dat <- rbind(dat,read.csv(files_full[j]))
}
str(dat)

z3 <- mean(dat[[pollutant]],na.rm=TRUE)
print(z3)
}	


	
