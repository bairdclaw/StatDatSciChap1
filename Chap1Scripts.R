state<-read.csv(file="C:/Dev/GitWorkspace/StatDatSciChap1/StatDatSciChap1/data/state.csv")
mean(state[["Population"]])
mean(state[["Population"]], trim=0.1)
median(state[["Population"]])

weighted.mean(state[["Murder.Rate"]], w=state[["Population"]])
library(matrixStats)
weightedMedian(state[["Murder.Rate"]], w=state[["Population"]])

#standard Deviation - subject to outliers
sd(state[["Population"]])
#interquartile range - helps against outliers by putting the range of values in percentiles
#IQR is the span from 25th percentile or P and the 75th percentile
IQR(state[["Population"]])
#median absolute deviation from the median
#Robust estimate of variability
mad(state[["Population"]])

quantile(state[["Murder.Rate"]], p=c(.05, .25, .5, .75, .95))

#boxplot - top of the box is 75th P and the bottom is 25th.  The whiskers are the range for the bulk of the data
#the items that are beyond 1.5 times the IQR are shown as single points
boxplot(state[["Population"]]/1000000, ylab="Population (millions)")

breaks <- seq(from=min(state[["Population"]]),
              to=max(state[["Population"]]), length = 11)

pop_freq <- cut(state[["Population"]],breaks=breaks,
                right=TRUE, include.lowest = TRUE)
table(pop_freq)

              
hist(state[["Population"]], breaks=breaks)

hist(state[["Population"]], freq = FALSE)
lines(density(state[["Murder.Rate"]]), lwd = 3, col="blue")

