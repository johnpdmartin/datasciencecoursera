# use bootstrap to estimate variance of exponential distribution


proj_3 <- function(lamda,n,reps) {

# set seed for input dataset of exponential distribution

#set.seed(1278)
set.seed(78)


# create large data set of the distribution

x <- rexp(2000,lamda)

hist(x,breaks=20)

repeat_averages <- matrix(sample(x,n*reps,replace=TRUE),reps,n)

y <- as.numeric()

for (i in 1:reps) {

y[i] <- mean(repeat_averages[i,])

}

y

hist(y,21)

print(summary(y))

xfit<-seq(min(y),max(y),length=40) 
yfit1 <- dnorm(xfit,mean=mean(y),sd=sd(y))
  yfit2 <-dnorm(xfit,mean=1/lamda,sd=1/lamda/sqrt(n))
#   yfit1 <- yfit1*220
#   yfit2 <- yfit2*220
   yfit1 <- yfit1*215
   yfit2 <- yfit2*210
    lines(xfit, yfit1, col="black", lwd=2)
lines(xfit, yfit2, col="red", lwd=2)

return(y)
}