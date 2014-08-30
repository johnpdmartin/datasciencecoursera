# attempting to toothgrow dataset

tg_exp <- function() {

library(datasets)
data(ToothGrowth)
str(ToothGrowth)

print(head(ToothGrowth))

sapply(ToothGrowth,class)

hist(ToothGrowth$len)

plot(ToothGrowth$supp,ToothGrowth$len)

plot(ToothGrowth$dose,ToothGrowth$len)

summary(ToothGrowth)
} 